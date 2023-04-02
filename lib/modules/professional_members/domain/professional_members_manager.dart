import '../api/professional_members_api.dart';
import 'professional_members_state_holder.dart';

class ProfessionalMembersManager {
  final ProfessionalMembersApi _api;
  final ProfessionalMembersStateHolder _stateHolder;
  const ProfessionalMembersManager(this._api, this._stateHolder);

  Future<void> init() async {
    final members = await _api.members();
    _stateHolder.setMembers(members);
  }

  Future<void> load() async {
    final members = await _api.members();
    _stateHolder.addMembers(members);
  }

  Future<void> dispose() async {
    _stateHolder.clear();
  }
}
