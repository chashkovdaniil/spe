import '../../../core/utils.dart';
import '../api/professional_members_api.dart';
import 'professional_members_state_holder.dart';

class ProfessionalMembersManager with InitialDisposableMixin {
  final ProfessionalMembersApi _api;
  final ProfessionalMembersStateHolder _stateHolder;

  ProfessionalMembersManager(
    this._api,
    this._stateHolder,
  );

  @override
  Future<void> init() async {
    super.init();
    final sub = _api.membersStream().listen(_stateHolder.setMembers);
    addSubscription(sub);
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    _stateHolder.clear();
  }
}
