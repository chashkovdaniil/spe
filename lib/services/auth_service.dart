import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:rxdart/rxdart.dart';

import '../models/professional_member.dart';
import '../modules/professional_members/api/professional_members_api.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final ProfessionalMembersApi _professionalMembersApi;
  StreamSubscription<User?>? _userSub;
  final _memberSubject = BehaviorSubject<ProfessionalMember?>();

  AuthService(
    this._professionalMembersApi,
  );

  Stream<User?> get userStream => _auth.userChanges();
  Stream<bool> get hasUser => _auth.userChanges().map((user) => user != null);

  Future<void> init() async {
    _userSub = _auth.userChanges().listen((user) async {
      if (user == null) {
        return;
      }

      var member = await _professionalMembersApi.member(
        params: ProfessionalMemberApiParams(id: user.uid),
      );

      if (member == null) {
        member = ProfessionalMember.fromUser(user);
        _professionalMembersApi.addMember(member);
      }
    });
  }

  Future<void> logout() => _auth.signOut();

  Future<void> dispose() async {
    _memberSubject.close();
    await _userSub?.cancel();
  }
}

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'Введите email';

  @override
  String get passwordInputLabel => 'Введите пароль';

  @override
  String get registerHintText => 'Нет аккаунта?';

  @override
  String get registerText => 'Создайте аккаунт';

  @override
  String get registerActionText => 'Создать аккаунт';

  @override
  String get signInActionText => 'Войти';

  @override
  String get signInText => 'Войдите';

  @override
  String get signInHintText => 'Уже есть аккаунт?';

  @override
  String get confirmPasswordInputLabel => 'Повторите пароль';

  @override
  String get forgotPasswordButtonLabel => 'Забыли пароль?';

  @override
  String get signInWithGoogleButtonText => 'Войти с помощью Google';

  @override
  String get emailIsRequiredErrorText => 'Email обязательно';

  @override
  String get passwordIsRequiredErrorText => 'Пароль обязателн';

  @override
  String get confirmPasswordIsRequiredErrorText => 'Повторите пароль!';
}
