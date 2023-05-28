import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import 'animated_fade_size.dart';
import 'component_body.dart';

class AnimatedSearchBar extends ConsumerWidget {
  const AnimatedSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSearchBar = ref.watch(
        AppProvider.appStateHolder.select((value) => value.showSearchBar));

    return AnimatedFadeSize(
      isVisible: showSearchBar,
      child: Row(
        children: [
          Expanded(
            child: ComponentBody(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                right: 40,
              ),
              child: SearchBar(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                surfaceTintColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                hintText: 'Введите для поиска',
                // side: MaterialStatePropertyAll(BorderSide()),
                elevation: const MaterialStatePropertyAll(0),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                trailing: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list_alt,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
