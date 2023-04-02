import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/auth_service.dart';
import 'app_manager.dart';
import 'navigator_provider.dart';

class AppProvider {
  static final navigatorProvider = Provider((_) => NavigatorProvider());
  static final authService = Provider((_) => AuthService());
  static final appManager = Provider.autoDispose(
    (ref) {
      final manager = AppManager(
        ref.watch(navigatorProvider),
        ref.watch(authService),
      );
      ref.onDispose(manager.dispose);
      return manager;
    },
  );
}
