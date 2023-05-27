import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../models/professional_member.dart';
import '../modules/professional_members/api/professional_members_api.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import 'navigator_provider.dart';
import 'state/app_state_holder.dart';

class AppManager {
  final AppStateHolder _appStateHolder;
  final NavigatorProvider _navigatorProvider;
  final AuthService _authService;
  final StorageService _storageService;
  final ProfessionalMembersApi _api;

  StreamSubscription<User?>? _hasUserSub;
  StreamSubscription<ProfessionalMember?>? _memberSub;

  AppManager(
    this._appStateHolder,
    this._navigatorProvider,
    this._authService,
    this._storageService,
    this._api,
  );

  Future<void> init() async {
    await _storageService.init();
    await _authService.init();
    _hasUserSub = _authService.userStream.listen((user) {
      if (user == null) {
        _navigatorProvider.openSignIn();
      } else {
        _memberSub = _api
            .memberStream(params: ProfessionalMemberApiParams(id: user.uid))
            .listen((member) {
          setProfessionalMember(member);
        });
      }
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
