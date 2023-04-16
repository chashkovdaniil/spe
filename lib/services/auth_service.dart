import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
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

  Stream<bool> get hasUser => _auth.userChanges().map((user) => user != null);

  Stream<ProfessionalMember?> get member => _memberSubject.stream;

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
      } else {
        member = ProfessionalMember.fromUser(user);
        _professionalMembersApi.updateMember(member);
      }
      print(member);
      _memberSubject.add(member);
    });
  }

  Future<void> logout() => _auth.signOut();

  Future<void> dispose() async {
    _memberSubject.close();
    await _userSub?.cancel();
  }
}
