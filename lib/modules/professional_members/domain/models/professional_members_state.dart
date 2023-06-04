import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/professional_member.dart';

part 'professional_members_state.freezed.dart';

@freezed
class ProfessionalMembersState with _$ProfessionalMembersState {
  const factory ProfessionalMembersState({
    required List<ProfessionalMember> members,
  }) = _ProfessionalMembersState;
}
