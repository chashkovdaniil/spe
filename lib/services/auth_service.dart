import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Stream<bool> get hasUser => _auth.userChanges().map((user) => user != null);
}
