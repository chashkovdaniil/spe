import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/professional_member.dart';
import 'models/professional_members_state.dart';

class ProfessionalMembersStateHolder
    extends StateNotifier<ProfessionalMembersState> {
  ProfessionalMembersStateHolder([
    super.state = const ProfessionalMembersState.empty(),
  ]);

  void setMembers(List<ProfessionalMember> members) {
    state = ProfessionalMembersState(
      members: members,
    );
  }

  void addMembers(List<ProfessionalMember> members) => state = state.map(
        (value) => value.copyWith(members: [
          ...value.members,
          ...members,
        ]),
        empty: (empty) => ProfessionalMembersState(
          members: members,
        ),
      );

  void clear() => state = const ProfessionalMembersState.empty();
}
