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
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.person),
            label: Text('Мой профиль'),
            padding: EdgeInsets.all(10),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.people),
            label: Text('Участники'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.messenger_outline_rounded),
            label: Text('Чаты'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.logout),
            label: Text('Выход'),
            padding: EdgeInsets.all(10),
          ),
        ],
        selectedIndex: selectedTab.index,
        onDestinationSelected: (index) {
          final selectedTab = NavigationTabs.values[index];

          switch (selectedTab) {
            case NavigationTabs.profile:
              navigatorProvider.openProfile();
            case NavigationTabs.members:
              navigatorProvider.openProfessionalMembers();
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
