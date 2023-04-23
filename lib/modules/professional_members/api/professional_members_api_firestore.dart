import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/app_state.dart';
import '../../../models/professional_member.dart';
import '../../../services/storage_service.dart';
import 'professional_members_api.dart';

class ProfessionalMembersApiFirebase extends ProfessionalMembersApi {
  final StorageService _storageService;
  final AppState _appState;

  ProfessionalMembersApiFirebase(
    this._storageService,
    this._appState,
  );

  @override
  Future<bool> addMember(ProfessionalMember member) async {
    await _storageService.add(
      CollectionPaths.users,
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
    final doc = await _storageService.get(docPath);

    if (doc == null) {
      return null;
    }

    return ProfessionalMember.fromDocument(doc);
  }

  @override
  Future<List<ProfessionalMember>> members({
    ProfessionalMemberApiParams? params,
    int page = 1,
    int limit = 25,
  }) async {
    final docs = await _storageService.getAll(CollectionPaths.users);

    return docs
        .whereType<Document>()
        .map((doc) => ProfessionalMember.fromDocument(doc))
        .where((element) => element.id != _appState.professionalMember?.id)
        .toList();
  }

  @override
  Future<bool> removeMember(ProfessionalMember member) {
    final docPath = '${CollectionPaths.users.path}/${member.id}';
    return _storageService.delete(docPath);
  }

  @override
  Future<bool> updateMember(ProfessionalMember member) async {
    final docPath = '${CollectionPaths.users.path}/${member.id}';
    return _storageService.update(docPath, member.toJson());
  }
}
