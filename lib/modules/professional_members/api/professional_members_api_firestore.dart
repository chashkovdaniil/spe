import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/state/app_state_holder.dart';
import '../../../models/app_state.dart';
import '../../../models/professional_member.dart';
import '../../../services/firstore_service.dart';
import 'professional_members_api.dart';

class ProfessionalMembersApiFirebase implements ProfessionalMembersApi {
  final FirestoreService _firestoreService;
  final AppStateHolder _appStateHolder;

  ProfessionalMembersApiFirebase(
    this._firestoreService,
    this._appStateHolder,
  );

  @override
  Future<bool> addMember(ProfessionalMember member) async {
    await _firestoreService.add(
      CollectionPaths.users.path,
      member.toJson(),
      id: member.id,
    );
    return true;
  }

  @override
  Future<ProfessionalMember?> member({
    required ProfessionalMemberApiParams params,
  }) async {
    final memberId = params.id;
    if (memberId == null) {
      throw MissingRequiredKeysException(['id'], params.toJson());
    }
    final docPath = '${CollectionPaths.users.path}/$memberId';
    final doc = await _firestoreService.get(docPath);

    if (doc == null) {
      return null;
    }

    return ProfessionalMember.fromDocument(doc);
  }

  @override
  Future<List<ProfessionalMember>> membersByFullname(
      String textForSearch) async {
    final textForSpeechSplitted = textForSearch.split(' ');
    var query = _firestoreService.db
        .collection(CollectionPaths.users.name)
        .where('lastName', isGreaterThan: textForSpeechSplitted[0])
        .where('lastName', isLessThan: '${textForSpeechSplitted[0]}\uf8ff');

    if (textForSpeechSplitted.length >= 2) {
      query = query
          .where('firstName', isGreaterThan: textForSpeechSplitted[1])
          .where('firstName', isLessThan: '${textForSpeechSplitted[1]}\uf8ff');
    }
    if (textForSpeechSplitted.length >= 3) {
      query = query
          .where('patronymic', isGreaterThan: textForSpeechSplitted[2])
          .where('patronymic', isLessThan: '${textForSpeechSplitted[2]}\uf8ff');
    }

    final querySnapshot = await query
        .withConverter(
          fromFirestore: (documentSnapshot, options) {
            final document = Document(
              data: documentSnapshot.data(),
              ref: documentSnapshot.reference,
            );

            return ProfessionalMember.fromDocument(document);
          },
          toFirestore: (_, __) => {},
        )
        .get();

    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  @override
  Future<List<ProfessionalMember>> members({
    ProfessionalMemberApiParams? params,
    int page = 1,
    int limit = 25,
  }) async {
    final docs = await _firestoreService.getAll(CollectionPaths.users);

    return docs
        .whereType<Document>()
        .map((doc) => ProfessionalMember.fromDocument(doc))
        .where((element) => element.id != _appStateHolder.member?.id)
        .toList();
  }

  @override
  Stream<List<ProfessionalMember>> membersStream({
    ProfessionalMemberApiParams? params,
    int page = 1,
    int limit = 25,
  }) {
    final docs = _firestoreService.documentsStream(CollectionPaths.users.path);

    return docs.map(
      (docs) => docs
          .map((doc) => ProfessionalMember.fromDocument(doc))
          .where((element) => element.id != _appStateHolder.member?.id)
          .toList(),
    );
  }

  @override
  Future<bool> removeMember(ProfessionalMember member) {
    final docPath = '${CollectionPaths.users.path}/${member.id}';
    return _firestoreService.delete(docPath);
  }

  @override
  Future<bool> updateMember(ProfessionalMember member) async {
    print('asd');
    final docPath = '${CollectionPaths.users.path}/${member.id}';
    return _firestoreService.update(docPath, member.toJson());
  }

  @override
  Stream<ProfessionalMember?> memberStream(
      {required ProfessionalMemberApiParams params}) {
    final docs = _firestoreService
        .documentStream('${CollectionPaths.users.path}/${params.id}');
    return docs.map(
      (doc) {
        final data = doc?.data;
        return data == null ? null : ProfessionalMember.fromDocument(doc!);
      },
    );
  }
}
