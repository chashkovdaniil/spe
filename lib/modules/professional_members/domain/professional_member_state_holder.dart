import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/professional_member.dart';
import 'models/professional_member_state.dart';
import 'models/professional_members_state.dart';

class ProfessionalMemberStateHolder
    extends StateNotifier<ProfessionalMemberState> {
  ProfessionalMemberStateHolder([
    super.state = const ProfessionalMemberState(),
  ]);

  ProfessionalMember? get member => state.member;
  bool get isEditing => state.isEditing;
  bool get isSaving => state.isSaving;

  void setMember(ProfessionalMember member) => state = state.copyWith(
        member: member,
      );

  void editing() => state = state.copyWith(
        isEditing: true,
        isSaving: false,
      );

  void saving() => state = state.copyWith(isSaving: true, isEditing: true);

  void saved() => state = state.copyWith(isSaving: false, isEditing: false);

  void setAuthorizedMember(ProfessionalMember? autherizedMember) =>
      state = state.copyWith(authorizedMember: autherizedMember);

  void clear() => state = const ProfessionalMemberState();
}
