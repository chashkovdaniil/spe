import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_providers.dart';
import '../../core/navigator_provider.dart';
import '../../core/utils.dart';
import '../search/widgets/animated_search_bar.dart';
import '../../core/widgets/component_body.dart';
import '../../core/widgets/custom_size_transition.dart';
import '../../core/widgets/loading_widget.dart';
import '../../models/app_state.dart';
import 'navi_page.dart';

class NavigationPage extends ConsumerWidget {
  static const pageName = '/';
  final Widget child;
  const NavigationPage(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref
        .watch(AppProvider.appStateHolder.select((state) => state.isLoading));
    if (isLoading) {
      return const LoadingWidget();
    }

    final showBottomNaviBar = context.isPhone;

    final authService = ref.watch(AppProvider.authService);

    return SelectionArea(
      child: Scaffold(
        bottomNavigationBar: showBottomNaviBar ? _BottomNavigationBar() : null,
        body: Row(
          children: [
            if (!showBottomNaviBar)
              StreamBuilder(
                initialData: false,
                stream: authService.hasUserStream,
                builder: (context, snapshot) {
                  final hasUser = snapshot.requireData;
                  if (!hasUser) {
                    return const SizedBox.shrink();
                  }
                  return const NaviPage();
                },
              ),
            if (!context.isPhone) const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(child: const AnimatedSearchBar()),
                    ],
                  ),
                  Expanded(
                    child: _MainBody(child: child),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(AppProvider.appStateHolder
        .select((state) => state.selectedNavigationTab));
    return BottomNavigationBar(
      currentIndex: selectedTab.index,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Мой профиль',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          label: 'Участники',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.messenger_outline_rounded),
          label: 'Чаты',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Выход',
        ),
      ],
      onTap: (index) {
        final navigatorProvider = ref.read(
          AppProvider.navigatorProvider,
        );
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
    );
  }
}

class _MainBody extends StatelessWidget {
  final Widget child;
  const _MainBody({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        top: 20,
        right: 20,
        bottom: 20,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: child,
    );
  }
}
