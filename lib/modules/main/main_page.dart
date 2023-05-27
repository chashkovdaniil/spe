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
          child: Container(
            margin: EdgeInsets.all(40),
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
              bottom: 20,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(60),
              ),
              // .only(
              //         topLeft: Radius.circular(60),
              //         bottomLeft: Radius.circular(60),
              //       ),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  color: Colors.black12.withOpacity(0.15),
                ),
                // BoxShadow(
                //   offset: Offset(10, 5),
                //   blurRadius: 10,
                //   color: Colors.black12.withOpacity(0.05),
                // ),
                // BoxShadow(
                //   offset: Offset(-10, 5),
                //   blurRadius: 10,
                //   color: Colors.black12.withOpacity(0.05),
                // ),
              ],
            ),
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

    return Container(
      margin: EdgeInsets.only(right: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        // shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: Colors.black12.withOpacity(0.05),
          ),
          BoxShadow(
            offset: Offset(10, 5),
            blurRadius: 10,
            color: Colors.black12.withOpacity(0.05),
          ),
          BoxShadow(
            offset: Offset(-10, 5),
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
