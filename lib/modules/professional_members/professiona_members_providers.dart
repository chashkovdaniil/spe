import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api/professional_members_api_mock.dart';
import 'api/professional_members_api.dart';
import 'domain/models/professional_members_state.dart';
import 'domain/professional_members_manager.dart';
import 'domain/professional_members_state_holder.dart';

class ProfessionalMemberProviders {
  const ProfessionalMemberProviders._();

  static final api = Provider<ProfessionalMembersApi>(
    (_) => ProfessionalMembersApiMock(),
  );

  static final stateHolder = StateNotifierProvider<
      ProfessionalMembersStateHolder, ProfessionalMembersState>(
    (_) => ProfessionalMembersStateHolder(),
  );

  static final manager = Provider<ProfessionalMembersManager>(
    (ref) => ProfessionalMembersManager(
      ref.watch(api),
      ref.watch(stateHolder.notifier),
    ),
  );
}
