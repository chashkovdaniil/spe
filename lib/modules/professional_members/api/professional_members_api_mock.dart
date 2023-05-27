import '../../../models/professional_member.dart';
import 'mock/professional_members.dart';
import 'professional_members_api.dart';

class ProfessionalMembersApiMock implements ProfessionalMembersApi {
  @override
  Future<bool> addMember(ProfessionalMember member) {
    // TODO: implement addMember
    throw UnimplementedError();
  }

  @override
  Future<ProfessionalMember> member({ProfessionalMemberApiParams? params}) {
    // TODO: implement member
    throw UnimplementedError();
  }

  @override
  Future<List<ProfessionalMember>> members({
    ProfessionalMemberApiParams? params,
    int page = 1,
    int limit = 25,
  }) {
    return Future.value(mockProfessionalMembers);
  }

  @override
  Stream<List<ProfessionalMember>> membersStream({
    ProfessionalMemberApiParams? params,
    int page = 1,
    int limit = 25,
  }) {
    return Stream.value(mockProfessionalMembers);
  }

  @override
  Future<bool> removeMember(ProfessionalMember member) {
    // TODO: implement removeMember
    throw UnimplementedError();
  }

  @override
  Future<bool> updateMember(ProfessionalMember member) {
    // TODO: implement updateMember
    throw UnimplementedError();
  }

  @override
  Stream<ProfessionalMember> memberStream(
      {required ProfessionalMemberApiParams params}) {
    // TODO: implement memberStream
    throw UnimplementedError();
  }
}
