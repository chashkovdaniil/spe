import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_providers.dart';
import '../../../core/widgets/animated_fade_size.dart';
import '../../../core/widgets/component_body.dart';
import '../../../models/professional_member.dart';
import '../../professional_members/api/professional_members_api.dart';
import '../../professional_members/professiona_members_providers.dart';

class AnimatedSearchBar extends ConsumerStatefulWidget {
  const AnimatedSearchBar({super.key});

  @override
  ConsumerState<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends ConsumerState<AnimatedSearchBar> {
  late final SearchController _searchController;
  List<ProfessionalMember> searchedMembers = [];

  @override
  void initState() {
    super.initState();
    _searchController = SearchController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showSearchBar = ref.watch(
      AppProvider.appStateHolder.select((value) => value.showSearchBar),
    );

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
              child: SearchAnchor.bar(
                searchController: _searchController,
                barBackgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                barOverlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                barHintText: 'Введите для поиска ФИО участника',
                // side: MaterialStatePropertyAll(BorderSide()),
                barElevation: const MaterialStatePropertyAll(0),
                barShape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                viewBackgroundColor: Colors.white,
                // barTrailing: [
                //   IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.filter_list_alt,
                //     ),
                //   ),
                // ],
                suggestionsBuilder: (
                  BuildContext context,
                  SearchController controller,
                ) {
                  if (controller.text.isNotEmpty) {
                    Future(() async {
                      final list = await ref
                          .read(ProfessionalMemberProviders.api)
                          .membersByFullname(controller.text);
                      searchedMembers = list;
                    });
                  } else {
                    searchedMembers = [];
                  }

                  return searchedMembers.map(
                    (member) => ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(member.fullname),
                      onTap: () {
                        controller.closeView(null);
                        controller.clear();
                        ref
                            .read(AppProvider.navigatorProvider)
                            .openProfessionalMember(member);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionsBuilder extends StatelessWidget {
  const _SuggestionsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
