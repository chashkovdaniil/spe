import '../../../models/professional_member.dart';

abstract class ProfessionalMembersApi {
  Future<List<ProfessionalMember>> members({
    ProfessionalMemberApiParams? params,
    int page = 1,
    int limit = 25,
  });

  Future<ProfessionalMember> member({ProfessionalMemberApiParams? params});

  Future<bool> addMember(ProfessionalMember member);

  Future<bool> updateMember(ProfessionalMember member);

  Future<bool> removeMember(ProfessionalMember member);
}

class ProfessionalMemberApiParams {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? patronymic;
  final String? primaryTechinalDiscipline;

  ProfessionalMemberApiParams({
    this.id,
    this.firstName,
    this.lastName,
    this.patronymic,
    this.primaryTechinalDiscipline,
  });
}
