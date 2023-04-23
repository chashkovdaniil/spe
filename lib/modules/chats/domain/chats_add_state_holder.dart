import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/professional_member.dart';
import 'chats_add_state.dart';

class ChatsAddStateHolder extends StateNotifier<ChatsAddState> {
  ChatsAddStateHolder() : super(ChatsAddState.empty());

  ChatsAddState get data => state;

  void setName(String name) => state = state.copyWith(name: name);

  void addMember(ProfessionalMember member) => state = state.copyWith(
        selectedMembers: [...state.selectedMembers, member],
      );

  void setProfessionalMemberName(String name) => state = state.copyWith(
        name: name,
      );

  void setFilteredMembers(List<ProfessionalMember> members) =>
      state = state.copyWith(filteredMembers: members);

  void clear() => state = ChatsAddState.empty();
}
