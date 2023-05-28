import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_providers.dart';
import '../../core/navigator_provider.dart';
import '../../core/widgets/animated_search_bar.dart';
import '../../core/widgets/component_body.dart';
import '../../core/widgets/custom_size_transition.dart';
import '../../models/app_state.dart';
import 'navi_page.dart';

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
        const SizedBox(width: 20),
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
                child: _MainBody(navigatorProvider: navigatorProvider),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MainBody extends StatelessWidget {
  const _MainBody({
    super.key,
    required this.navigatorProvider,
  });

  final NavigatorProvider navigatorProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        right: 40,
        bottom: 40,
      ),
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
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 20,
            color: Colors.black12.withOpacity(0.15),
          ),
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
    );
  }
}
