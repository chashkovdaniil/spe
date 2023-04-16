import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../services/storage_service.dart';

part 'professional_member.freezed.dart';
part 'professional_member.g.dart';

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
  }) = _ProfessionalMember;

  factory ProfessionalMember.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalMemberFromJson(json);

  factory ProfessionalMember.fromDocument(Document document) {
    final id = document.path.split('/').last;
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
    );
  }

  String get fullname => '$lastName $firstName $patronymic';
}
