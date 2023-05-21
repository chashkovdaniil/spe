import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../services/storage_service.dart';

part 'professional_member.freezed.dart';
part 'professional_member.g.dart';

enum ProfessionalMemberRoles { user, admin }

@freezed
class ProfessionalMember with _$ProfessionalMember {
  const ProfessionalMember._();

  const factory ProfessionalMember({
    required String id,
    required String firstName,
    required String lastName,
    required String patronymic,
    required bool currentMember,
    required int yearsOfMembership,
    required DateTime memberSince,
    required DateTime paidThrough,
    required String specialMembershipCategory,
    required bool newMember,
    required bool recentGrad,
    required bool youngProfessional,
    required bool seniorProfessional,
    required String transferFrom,
    required bool affiliateMember,
    required bool awardRecipient,
    required bool author,
    required bool currentOrPastVolunteer,
    required String city,
    required String state,
    required String country,
    required String primaryEmployer,
    required String primaryTechinalDiscipline,
    required String jobClassification,
    required String companyCategory,
    required String email,
    @Default(ProfessionalMemberRoles.user) ProfessionalMemberRoles role,
  }) = _ProfessionalMember;

  factory ProfessionalMember.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalMemberFromJson(json);

  factory ProfessionalMember.fromDocument(Document document) {
    final id = document.ref.path.split('/').last;
    final data = document.data;
    if (data == null) {
      throw TypeError();
    }
    data.update(
      'id',
      (_) => id,
      ifAbsent: () => id,
    );

    return ProfessionalMember.fromJson(data);
  }

  factory ProfessionalMember.fromUser(User user) {
    return ProfessionalMember(
      id: user.uid,
      firstName: user.displayName ?? 'MEMBER NAME',
      lastName: user.displayName ?? 'MEMBER NAME',
      patronymic: user.displayName ?? 'MEMBER NAME',
      currentMember: true,
      yearsOfMembership: 3,
      memberSince: DateTime.now(),
      paidThrough: DateTime.now(),
      specialMembershipCategory: 'specialMembershipCategory',
      newMember: true,
      recentGrad: true,
      youngProfessional: true,
      seniorProfessional: true,
      transferFrom: 'transferFrom',
      affiliateMember: true,
      awardRecipient: true,
      author: true,
      currentOrPastVolunteer: true,
      city: 'city',
      state: 'state',
      country: 'country',
      primaryEmployer: 'primaryEmployer',
      primaryTechinalDiscipline: 'primaryTechinalDiscipline',
      jobClassification: 'jobClassification',
      companyCategory: 'companyCategory',
      email: user.email ?? '',
    );
  }

  String get fullname => '$lastName $firstName $patronymic';

  DocumentReference get ref => FirebaseFirestore.instance.doc(
        '${CollectionPaths.users.path}/$id',
      );
}

extension ProfessionMemberX on List<Object?> {
  Future<List<Map<String, Object?>>> toProfessionalMembersJson() async {
    final members = <Map<String, Object?>>[];
    final membersRef = this;

    for (final ref in membersRef) {
      final memberRef = ref as DocumentReference<Map<String, Object?>>;
      final snapshot = await memberRef.get();
      final data = snapshot.data();

      if (data == null) {
        throw StateError('Member is null');
      }

      members.add(data);
    }

    return members;
  }
}
