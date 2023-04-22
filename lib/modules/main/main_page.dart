import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_providers.dart';

class MainPage extends ConsumerWidget {
  static const pageName = '/';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorProvider = ref.watch(AppProvider.navigatorProvider);
    final authService = ref.watch(AppProvider.authService);
    return Row(
      children: [
        StreamBuilder(
          initialData: false,
          stream: authService.hasUser,
          builder: (context, snapshot) {
            final hasUser = snapshot.requireData;
            if (!hasUser) {
              return const SizedBox.shrink();
            }
            return const NaviPage();
          },
        ),
        Expanded(
          child: Navigator(
            key: navigatorProvider.key,
            initialRoute: navigatorProvider.initialRoute,
            onGenerateRoute: (settings) {
              if (navigatorProvider.routes.containsKey(settings.name)) {
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (context, _, __) {
                    return navigatorProvider.routes[settings.name]!(context);
                  },
                );
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}

class NaviPage extends HookConsumerWidget {
  const NaviPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(1);
    final navigatorProvider = ref.watch(AppProvider.navigatorProvider);

    return NavigationRail(
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.person),
          label: Text('Мой профиль'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.people),
          label: Text('Участники'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.messenger_outline_rounded),
          label: Text('Чаты'),
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
        }
        selectedIndex.value = index;
      },
    );
  }
}
