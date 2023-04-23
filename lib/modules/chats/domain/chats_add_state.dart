import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/professional_member.dart';

part 'chats_add_state.freezed.dart';
part 'chats_add_state.g.dart';

@freezed
class ChatsAddState with _$ChatsAddState {
  const factory ChatsAddState({
    required List<ProfessionalMember> selectedMembers,
    required String name,
    required String professionalMemberName,
    required List<ProfessionalMember> filteredMembers,
  }) = _ChatsAddState;

  factory ChatsAddState.empty() => const ChatsAddState(
        selectedMembers: [],
        name: '',
        professionalMemberName: '',
        filteredMembers: [],
      );

  factory ChatsAddState.fromJson(Map<String, dynamic> json) =>
      _$ChatsAddStateFromJson(json);
}
