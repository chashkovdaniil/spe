import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/professional_member.dart';

part 'professional_member_state.freezed.dart';

@freezed
class ProfessionalMemberState with _$ProfessionalMemberState {
  const ProfessionalMemberState._();

  const factory ProfessionalMemberState({
    @Default(null) ProfessionalMember? authorizedMember,
    @Default(null) ProfessionalMember? member,
    @Default(false) bool isEditing,
    @Default(false) bool isSaving,
  }) = _ProfessionalMemberState;

  bool get _hasPermissionForEdit =>
      (authorizedMember?.id == member?.id ||
          authorizedMember?.role.isAdmin == true) &&
      !isSaving;

  bool get canEdit => _hasPermissionForEdit && !isEditing;

  bool get canSave => _hasPermissionForEdit && isEditing;
}
