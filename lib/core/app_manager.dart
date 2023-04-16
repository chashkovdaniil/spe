import 'dart:async';

import '../models/professional_member.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import 'navigator_provider.dart';
import 'state/app_state_holder.dart';

class AppManager {
  final AppStateHolder _appStateHolder;
  final NavigatorProvider _navigatorProvider;
  final AuthService _authService;
  final StorageService _storageService;
  StreamSubscription<bool>? _hasUserSub;
  StreamSubscription<ProfessionalMember?>? _memberSub;

  AppManager(
    this._appStateHolder,
    this._navigatorProvider,
    this._authService,
    this._storageService,
  );

  Future<void> init() async {
    await _storageService.init();
    await _authService.init();
    _hasUserSub = _authService.hasUser.listen((hasUser) {
      if (!hasUser) {
        _navigatorProvider.openSignIn();
      }
    });

    _memberSub = _authService.member.listen((member) {
      setProfessionalMember(member);
    });
  }

  void setProfessionalMember(ProfessionalMember? member) =>
      _appStateHolder.setProfessionalMember(member);

  Future<void> dispose() async {
    _hasUserSub?.cancel();
    _memberSub?.cancel();
    await _authService.dispose();
  }
}
