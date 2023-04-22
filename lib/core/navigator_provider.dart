import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../models/professional_member.dart';
import '../modules/chats/view/chats_page.dart';
import '../modules/professional_members/view/professional_member_page.dart';
import '../modules/professional_members/view/professional_members_page.dart';
import '../modules/profile/view/profile_page.dart';

class NavigatorProvider {
  final key = GlobalKey<NavigatorState>();

  NavigatorState get _state => key.currentState as NavigatorState;

  final routes = {
    ProfessionalMembersPage.pageName: (_) => const ProfessionalMembersPage(),
    ProfessionalMemberPage.pageName: (_) => const ProfessionalMemberPage(),
    '/sign-in': (context) {
      return SignInScreen(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            Navigator.pushReplacementNamed(
                context, ProfessionalMembersPage.pageName);
          }),
        ],
      );
    },
    ProfilePage.routeName: (context) {
      return const ProfilePage();
    },
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

  void openSignIn() {
    _state.pushNamedAndRemoveUntil('/sign-in', (_) => false);
  }

  void openProfessionalMember(ProfessionalMember member) {
    _state.pushNamed(
      ProfessionalMemberPage.pageName,
      arguments: ProfessionalMemberArguments(member),
    );
  }

  void openProfile() {
    _state.pushNamedAndRemoveUntil(ProfilePage.routeName, (_) => false);
  }

  void openChats() {
    _state.pushNamedAndRemoveUntil(ChatsPage.routeName, (_) => false);
  }

  void openProfessionalMembers() {
    _state.pushNamedAndRemoveUntil(
      ProfessionalMembersPage.pageName,
      (_) => false,
    );
  }
}