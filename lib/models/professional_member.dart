import 'package:freezed_annotation/freezed_annotation.dart';

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

  String get fullname => '$lastName $firstName $patronymic';
}
