import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/professional_member.dart';
import 'models/professional_members_state.dart';

class ProfessionalMembersStateHolder
    extends StateNotifier<ProfessionalMembersState> {
  ProfessionalMembersStateHolder([
    super.state = const ProfessionalMembersState(members: []),
  ]);

  List<ProfessionalMember> get members => state.members;

  void setMembers(List<ProfessionalMember> members) {
    state = ProfessionalMembersState(
      members: members,
    );
  }

  void addMembers(List<ProfessionalMember> members) =>
      state = state.copyWith(members: [
        ...state.members,
        ...members,
      ]);

  void clear() => state = const ProfessionalMembersState(members: []);
}
