import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_providers.dart';

enum NavigationTabs { profile, members, chats, logout }

class NaviPage extends HookConsumerWidget {
  const NaviPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorProvider = ref.watch(AppProvider.navigatorProvider);
    final selectedTab = ref.watch(AppProvider.appStateHolder
        .select((state) => state.selectedNavigationTab));
    final currentUserIsAdmin = ref.watch(AppProvider.appStateHolder
        .select((value) => value.professionalMember?.role.isAdmin ?? false));

    final panels = [
      {
        'id': NavigationTabs.profile,
        'icon': Icons.person,
        'title': 'Мой профиль',
      },
      if (currentUserIsAdmin)
        {
          'id': NavigationTabs.members,
          'icon': Icons.people,
          'title': 'Участники',
        },
      {
        'id': NavigationTabs.chats,
        'icon': Icons.messenger_outline_rounded,
        'title': 'Чаты',
      },
      {
        'id': NavigationTabs.logout,
        'icon': Icons.logout_outlined,
        'title': 'Выйти',
      },
    ];

    return Container(
      margin: const EdgeInsets.only(right: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(10, 0),
            blurRadius: 10,
            color: Colors.black12.withOpacity(0.05),
          ),
        ],
      ),
      child: NavigationRail(
        extended: true,
        leading: Text(
          "SPE",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        destinations: [
          ...panels.map((panel) {
            return NavigationRailDestination(
              icon: Icon(panel['icon'] as IconData),
              label: Text(panel['title'] as String),
              padding: EdgeInsets.all(10),
            );
          }),
          // NavigationRailDestination(
          //   icon: Icon(Icons.person),
          //   label: Text('Мой профиль'),
          //   padding: EdgeInsets.all(10),
          // ),
          // if (currentUserIsAdmin)
          //   NavigationRailDestination(
          //     icon: Icon(Icons.people),
          //     label: Text('Участники'),
          //   ),
          // NavigationRailDestination(
          //   icon: Icon(Icons.messenger_outline_rounded),
          //   label: Text('Чаты'),
          // ),
          // NavigationRailDestination(
          //   icon: Icon(Icons.logout),
          //   label: Text('Выход'),
          //   padding: EdgeInsets.all(10),
          // ),
        ],
        selectedIndex: panels
            .indexWhere((element) => element['id'] == selectedTab)
            .clamp(0, panels.length - 1),
        onDestinationSelected: (index) {
          final selectedTab = panels[index]['id'];

          switch (selectedTab) {
            case NavigationTabs.profile:
              navigatorProvider.openProfile();
            case NavigationTabs.members:
              if (currentUserIsAdmin) {
                navigatorProvider.openProfessionalMembers();
              } else {
                continue chats;
              }
            chats:
            case NavigationTabs.chats:
              navigatorProvider.openChats();
            case NavigationTabs.logout:
              navigatorProvider.logout();
          }
        },
      ),
    );
  }
}
