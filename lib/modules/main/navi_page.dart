import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_providers.dart';

class NaviPage extends HookConsumerWidget {
  const NaviPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(1);
    final navigatorProvider = ref.watch(AppProvider.navigatorProvider);

    return Container(
      margin: const EdgeInsets.only(right: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        // shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 10,
            color: Colors.black12.withOpacity(0.05),
          ),
          BoxShadow(
            offset: const Offset(10, 5),
            blurRadius: 10,
            color: Colors.black12.withOpacity(0.05),
          ),
          BoxShadow(
            offset: const Offset(-10, 5),
            blurRadius: 10,
            color: Colors.black12.withOpacity(0.05),
          ),
        ],
      ),
      child: NavigationRail(
        extended: true,
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
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (index) {
          if (index == 0) {
            navigatorProvider.openProfile();
          } else if (index == 1) {
            navigatorProvider.openProfessionalMembers();
          } else if (index == 2) {
            navigatorProvider.openChats();
          } else if (index == 3) {
            navigatorProvider.logout();
          }
          selectedIndex.value = index;
        },
      ),
    );
  }
}
