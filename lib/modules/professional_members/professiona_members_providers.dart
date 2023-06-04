import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_providers.dart';
import 'api/professional_members_api.dart';
import 'api/professional_members_api_firestore.dart';
import 'domain/models/professional_member_state.dart';
import 'domain/models/professional_members_state.dart';
import 'domain/photo_manager.dart';
import 'domain/professional_member_manager.dart';
import 'domain/professional_member_state_holder.dart';
import 'domain/professional_members_manager.dart';
import 'domain/professional_members_state_holder.dart';

class ProfessionalMemberProviders {
  const ProfessionalMemberProviders._();

  static final api = Provider<ProfessionalMembersApi>(
    (ref) {
      // return ProfessionalMembersApiMock();
      return ProfessionalMembersApiFirebase(
        ref.watch(AppProvider.firbaseService),
        ref.watch(AppProvider.appStateHolder),
      );
    },
  );

  static final stateHolder = StateNotifierProvider<
      ProfessionalMembersStateHolder, ProfessionalMembersState>(
    (_) => ProfessionalMembersStateHolder(),
  );

  static final memberStateHolder = StateNotifierProvider<
      ProfessionalMemberStateHolder, ProfessionalMemberState>(
    (_) => ProfessionalMemberStateHolder(),
  );
  static final memberManager = Provider<ProfessionalMemberManager>(
    (ref) {
      final manager = ProfessionalMemberManager(
        ref.watch(api),
        ref.watch(memberStateHolder.notifier),
        ref.watch(AppProvider.appStateHolder.notifier),
      );
      ref.onDispose(manager.dispose);
      return manager;
    },
  );

  static final manager = Provider<ProfessionalMembersManager>(
    (ref) {
      final manager = ProfessionalMembersManager(
        ref.watch(api),
        ref.watch(stateHolder.notifier),
      );

      ref.onDispose(manager.dispose);
      return manager;
    },
  );

  static final photoManager = Provider<PhotoManager>((ref) {
    return PhotoManager(
      ref.watch(AppProvider.storageService),
      ref.watch(AppProvider.appStateHolder.notifier),
      ref.watch(ProfessionalMemberProviders.memberManager),
    );
  });
}
