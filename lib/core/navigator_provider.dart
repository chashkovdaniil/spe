import 'dart:io';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/professional_member.dart';
import '../modules/chats/view/chat_page.dart';
import '../modules/chats/view/chats_page.dart';
import '../modules/main/main_page.dart';
import '../modules/main/navi_page.dart';
import '../modules/professional_members/view/professional_member_page.dart';
import '../modules/professional_members/view/professional_members_page.dart';
import '../services/auth_service.dart';
import 'state/app_state_holder.dart';

typedef RouteBuilder = Widget Function(BuildContext context);

enum NavigatorRouteNames {
  signIn('sign-in');

  String get name => '/$_name';
  final String _name;

  const NavigatorRouteNames(this._name);
}

final _key = GlobalKey<NavigatorState>();
final _internalKey = GlobalKey<NavigatorState>(debugLabel: 'internal');

class NavigatorProvider {
  final AppStateHolder _appStateHolder;
  final AuthService _authService;

  NavigatorProvider(this._appStateHolder, this._authService);

  Key get key => _key;
  BuildContext? get context => _key.currentContext;

  final initialRoute = ProfessionalMembersPage.pageName;

  void push(String location, {bool isTab = false, bool isExternal = false}) {
    if (kIsWeb) {
      context?.go(location);
    } else {
      if (isTab) {
        context?.go(location);
      } else {
        context?.push(location);
      }
    }
  }

  void openSignIn() => context?.pushReplacement(
        NavigatorRouteNames.signIn.name,
      );

  void openProfessionalMember(ProfessionalMember member) {
    push('/members/${member.id}');
  }

  void openProfile() {
    final currentMember = _appStateHolder.member;
    if (currentMember != null) {
      push('/members/${currentMember.id}', isTab: true);
    }
  }

  void openChats() => push(ChatsPage.routeName, isTab: true);

  void openProfessionalMembers() =>
      push(ProfessionalMembersPage.pageName, isTab: true);

  void openChat(String chatId) => push('/chats/$chatId');

  void logout() {
    context?.pushReplacement(NavigatorRouteNames.signIn.name);
    _authService.logout();
  }

  GoRouter get routerConfig => GoRouter(
        navigatorKey: _key,
        initialLocation: '/',
        redirect: (context, state) async {
          if (!_authService.hasUser) {
            return NavigatorRouteNames.signIn.name;
          }
          final currentUserIsAdmin =
              _appStateHolder.member?.role.isAdmin ?? false;
          final currentMemberId = _appStateHolder.member?.id ?? '';
          final isMyProfile =
              state.location.contains(currentMemberId) == true &&
                  currentMemberId.isNotEmpty;
          final isChats = state.location.contains('chat') == true;
          final isMembers = (state.location == '/' ||
                  state.location.contains('members') == true) &&
              currentUserIsAdmin;

          var result = await Future.delayed(Duration.zero, () {
            if (isMyProfile) {
              _appStateHolder.setNavigationTab(NavigationTabs.profile);
            } else if (isChats) {
              _appStateHolder.setNavigationTab(NavigationTabs.chats);
            } else if (isMembers) {
              _appStateHolder.setNavigationTab(NavigationTabs.members);
            } else {
              return ChatsPage.routeName;
            }
          });
          return result;
        },
        routes: [
          GoRoute(
            path: NavigatorRouteNames.signIn.name,
            builder: (context, state) {
              return SignInScreen(
                actions: [
                  AuthStateChangeAction<SignedIn>(
                    (_, __) => openProfessionalMembers(),
                  ),
                  AuthStateChangeAction<UserCreated>(
                    (_, __) => openProfessionalMembers(),
                  ),
                ],
              );
            },
          ),
          ShellRoute(
            pageBuilder: (context, state, child) =>
                PageTransition(child: NavigationPage(child)),
            builder: (context, state, child) {
              return NavigationPage(child);
            },
            routes: [
              GoRoute(
                path: ChatsPage.routeName,
                pageBuilder: (context, state) =>
                    PageTransition(child: const ChatsPage()),
              ),
              GoRoute(
                path: ChatPage.routeName,
                pageBuilder: (context, state) {
                  final chatId = state.pathParameters['chatId'];

                  if (chatId == null) {
                    return PageTransition(child: const SizedBox());
                  }

                  return PageTransition(child: ChatPage(chatId));
                },
              ),
              GoRoute(
                path: ProfessionalMembersPage.pageName,
                pageBuilder: (_, state) =>
                    PageTransition(child: const ProfessionalMembersPage()),
              ),
              GoRoute(
                path: ProfessionalMemberPage.pageName,
                pageBuilder: (_, state) {
                  final memberId = state.pathParameters['memberId'];

                  if (memberId == null) {
                    return PageTransition(child: const SizedBox());
                  }

                  return PageTransition(
                      child: ProfessionalMemberPage(memberId));
                },
              ),
            ],
          ),
        ],
      );
}

class PageTransition extends CustomTransitionPage {
  PageTransition({
    required super.child,
  }) : super(transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        });
}
