import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/app_state.dart';
import '../modules/professional_members/professiona_members_providers.dart';
import '../services/auth_service.dart';
import '../services/firstore_service.dart';
import '../services/storage_service.dart';
import 'app_manager.dart';
import 'navigator_provider.dart';
import 'state/app_state_holder.dart';

class AppProvider {
  static final navigatorProvider = Provider((ref) {
    return NavigatorProvider(
      ref.watch(appStateHolder.notifier),
      ref.watch(authService),
    );
  });
  static final authService = Provider(
    (ref) => AuthService(
      ref.watch(ProfessionalMemberProviders.api),
    ),
  );
  static final firbaseService = Provider(
    (ref) => FirestoreService(),
  );
  static final storageService = Provider((ref) => StorageService());
  static final appStateHolder = StateNotifierProvider<AppStateHolder, AppState>(
    (_) => AppStateHolder(),
  );
  static final appManager = Provider(
    (ref) {
      final manager = AppManager(
        ref.watch(appStateHolder.notifier),
        ref.watch(navigatorProvider),
        ref.watch(authService),
        ref.watch(firbaseService),
        ref.watch(ProfessionalMemberProviders.api),
      );

      return manager;
    },
  );
}
