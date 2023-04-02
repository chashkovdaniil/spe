import 'dart:async';

import '../services/auth_service.dart';
import 'navigator_provider.dart';

class AppManager {
  final NavigatorProvider _navigatorProvider;
  final AuthService _authService;
  late final StreamSubscription<bool> _hasUserSub;

  AppManager(this._navigatorProvider, this._authService);

  void init() {
    _hasUserSub = _authService.hasUser.listen((hasUser) {
      if (!hasUser) {
        _navigatorProvider.openSignIn();
      }
    });
  }

  void dispose() {
    _hasUserSub.cancel();
  }
}
