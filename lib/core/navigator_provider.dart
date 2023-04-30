import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../models/professional_member.dart';
import '../modules/chats/view/chat_page.dart';
import '../modules/chats/view/chats_page.dart';
import '../modules/professional_members/view/professional_member_page.dart';
import '../modules/professional_members/view/professional_members_page.dart';
import '../modules/profile/view/profile_page.dart';

typedef RouteBuilder = Widget Function(BuildContext context);

enum NavigatorRouteNames {
  signIn('sign-in');

  String get name => '/$_name';
  final String _name;

  const NavigatorRouteNames(this._name);
}

class NavigatorProvider {
  final key = GlobalKey<NavigatorState>();

  NavigatorState get _state => key.currentState as NavigatorState;

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
        ProfilePage.routeName: (_) => const ProfilePage(),
        ChatPage.routeName: (_) => const ChatPage(),
        // '/profile': (context) {
        //   return ProfileScreen(
        //     actions: [
        //       SignedOutAction((context) {
        //         Navigator.pushNamedAndRemoveUntil(
        //           context,
        //           '/sign-in',
        //           (route) => false,
        //         );
        //       }),
        //     ],
        //   );
        // }
        ChatsPage.routeName: (_) => const ChatsPage(),
      };

  final initialRoute = ProfessionalMembersPage.pageName;

  void openSignIn() => _state.pushNamedAndRemoveUntil('/sign-in', (_) => false);

  void openProfessionalMember(ProfessionalMember member) => _state.pushNamed(
        ProfessionalMemberPage.pageName,
        arguments: ProfessionalMemberArguments(member),
      );

  void openProfile() =>
      _state.pushNamedAndRemoveUntil(ProfilePage.routeName, (_) => false);

  void openChats() =>
      _state.pushNamedAndRemoveUntil(ChatsPage.routeName, (_) => false);

  void openProfessionalMembers() => _state.pushNamedAndRemoveUntil(
        ProfessionalMembersPage.pageName,
        (_) => false,
      );

  void openChat() => _state.pushNamed(ChatPage.routeName);
}
