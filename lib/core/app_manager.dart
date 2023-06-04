import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/professional_member.dart';
import '../modules/professional_members/api/professional_members_api.dart';
import '../services/auth_service.dart';
import '../services/firstore_service.dart';
import 'navigator_provider.dart';
import 'state/app_state_holder.dart';

class AppManager {
  final AppStateHolder _appStateHolder;
  final NavigatorProvider _navigatorProvider;
  final AuthService _authService;
  final FirestoreService _storageService;
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
    startListening();
  }

  void startListening() {
    _hasUserSub = _authService.userStream.listen((user) {
      if (user == null) {
        _appStateHolder.loaded();
        Future.delayed(Duration.zero, () {
          _navigatorProvider.openSignIn();
        });
      } else {
        _memberSub?.cancel();
        _memberSub = _api
            .memberStream(params: ProfessionalMemberApiParams(id: user.uid))
            .listen((member) {
          setProfessionalMember(member);
          _appStateHolder.loaded();
        });
      }
    });
  }

  void setProfessionalMember(ProfessionalMember? member) =>
      _appStateHolder.setProfessionalMember(member);

  void toggleSearchBar() => _appStateHolder.toggleSearchBar();

  Future<void> dispose() async {
    _hasUserSub?.cancel();
    _memberSub?.cancel();
    await _authService.dispose();
  }
}
