import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../models/professional_member.dart';
import '../modules/chats/domain/models/chat.dart';
import '../modules/chats/view/chat_page.dart';
import '../modules/chats/view/chats_page.dart';
import '../modules/professional_members/view/professional_member_page.dart';
import '../modules/professional_members/view/professional_members_page.dart';
import '../services/auth_service.dart';

typedef RouteBuilder = Widget Function(BuildContext context);

enum NavigatorRouteNames {
  signIn('sign-in');

  String get name => '/$_name';
  final String _name;

  const NavigatorRouteNames(this._name);
}

final _key = GlobalKey<NavigatorState>();

class NavigatorProvider {
  final ProfessionalMember? _currentMember;
  final AuthService _authService;

  NavigatorProvider(this._currentMember, this._authService);

  Key get key => _key;
  NavigatorState get _state => _key.currentState as NavigatorState;

  Map<String, RouteBuilder> get routes => {
        ProfessionalMembersPage.pageName: (_) =>
            const ProfessionalMembersPage(),
        ProfessionalMemberPage.pageName: (_) => const ProfessionalMemberPage(),
        NavigatorRouteNames.signIn.name: (_) => SignInScreen(
              actions: [
                AuthStateChangeAction<SignedIn>(
                  (_, __) => openProfessionalMembers(),
                ),
                AuthStateChangeAction<UserCreated>(
                  (_, __) => openProfessionalMembers(),
                ),
              ],
            ),
        ChatPage.routeName: (_) => const ChatPage(),
        ChatsPage.routeName: (_) => const ChatsPage(),
      };

  final initialRoute = ProfessionalMembersPage.pageName;

  void openSignIn() => _state.pushNamedAndRemoveUntil('/sign-in', (_) => false);

  void openProfessionalMember(ProfessionalMember member) => _state.pushNamed(
        ProfessionalMemberPage.pageName,
        arguments: ProfessionalMemberArguments(member),
      );

  void openProfile() {
    if (_currentMember != null) {
      _state.pushNamedAndRemoveUntil(
        ProfessionalMemberPage.pageName,
        (_) => false,
        arguments: ProfessionalMemberArguments(_currentMember!),
      );
    }
  }
  // _state.pushNamedAndRemoveUntil(ProfilePage.routeName, (_) => false);

  void openChats() =>
      _state.pushNamedAndRemoveUntil(ChatsPage.routeName, (_) => false);

  void openProfessionalMembers() => _state.pushNamedAndRemoveUntil(
        ProfessionalMembersPage.pageName,
        (_) => false,
      );

  void openChat(Chat chat) => _state.pushNamed(
        ChatPage.routeName,
        arguments: chat,
      );

  void logout() => _authService.logout();
}
