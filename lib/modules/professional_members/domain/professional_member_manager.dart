import '../../../core/state/app_state_holder.dart';
import '../../../core/utils.dart';
import '../../../models/professional_member.dart';
import '../../../services/auth_service.dart';
import '../api/professional_members_api.dart';
import 'professional_member_state_holder.dart';

class ProfessionalMemberManager {
  final ProfessionalMembersApi _api;
  final ProfessionalMemberStateHolder _stateHolder;
  final AppStateHolder _appStateHolder;

  ProfessionalMemberManager(
    this._api,
    this._stateHolder,
    this._appStateHolder,
  );

  Future<void> init() async {
    _stateHolder.setAuthorizedMember(_appStateHolder.member);
  }

  void setMember(ProfessionalMember member) => _stateHolder.setMember(member);

  Future<void> edit() async {
    if (_stateHolder.isSaving) {
      throw UnsupportedError('isSaving');
    }
    _stateHolder.editing();
  }

  Future<void> save() async {
    if (!_stateHolder.isEditing) {
      throw UnsupportedError('State is not isEditing');
    }
    _stateHolder.saving();
    ProfessionalMember? member = _stateHolder.member;

    if (member == null) {
      throw TypeError();
    }

    await _api.updateMember(member);
    _stateHolder.saved();
  }

  void updateMember(ProfessionalMember member) {
    if (_stateHolder.isSaving) {
      throw UnsupportedError('State is saving');
    }
    setMember(member);
  }

  Future<void> dispose() async {}
}
