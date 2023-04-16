import '../../../models/professional_member.dart';

abstract class ProfessionalMembersApi {
  Future<List<ProfessionalMember>> members({
    ProfessionalMemberApiParams? params,
    int page = 1,
    int limit = 25,
  });

  Future<ProfessionalMember?> member({
    required ProfessionalMemberApiParams params,
  });

  Future<bool> addMember(ProfessionalMember member);

  Future<bool> updateMember(ProfessionalMember member);

  Future<bool> removeMember(ProfessionalMember member);
}

class ProfessionalMemberApiParams {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? patronymic;
  final String? primaryTechnicalDiscipline;

  ProfessionalMemberApiParams({
    this.id,
    this.firstName,
    this.lastName,
    this.patronymic,
    this.primaryTechnicalDiscipline,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'patronymic': this.patronymic,
      'primaryTechnicalDiscipline': this.primaryTechnicalDiscipline,
    };
  }

  factory ProfessionalMemberApiParams.fromJson(Map<String, dynamic> map) {
    return ProfessionalMemberApiParams(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      patronymic: map['patronymic'] as String,
      primaryTechnicalDiscipline: map['primaryTechnicalDiscipline'] as String,
    );
  }
}
