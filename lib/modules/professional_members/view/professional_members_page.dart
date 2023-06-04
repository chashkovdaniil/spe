import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_providers.dart';
import '../../../core/widgets/appbar.dart';
import '../../../models/professional_member.dart';
import '../professiona_members_providers.dart';

class ProfessionalMembersPage extends ConsumerWidget {
  static const pageName = '/members';
  const ProfessionalMembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(ProfessionalMemberProviders.manager).init();

    return Scaffold(
      appBar: AppBar(
        title: TitleAppBar('Список участников'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(AppProvider.appManager).toggleSearchBar();
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const ProfessionalMemberListWidget(
        onTapLoadMore: null,
      ),
    );
  }
}

class ProfessionalMemberListWidget extends HookConsumerWidget {
  final VoidCallback? onTapLoadMore;
  const ProfessionalMemberListWidget({
    super.key,
    required this.onTapLoadMore,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final members = ref.watch(ProfessionalMemberProviders.stateHolder.select(
      (state) => state.members,
    ));

    if (members.isEmpty) {
      return const Center(
        child: Text('Других участников нет'),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: members.length,
      itemBuilder: (context, index) {
        final child = ProfessionalMemberTile(
          member: members[index],
        );
        if (index == members.length - 1) {
          return Column(
            children: [
              child,
              const SizedBox(height: 20),
              if (onTapLoadMore != null)
                ElevatedButton(
                  onPressed: onTapLoadMore,
                  child: const Text(
                    'Загрузить еще',
                  ),
                ),
            ],
          );
        }
        return child;
      },
    );
  }
}

class ProfessionalMemberTile extends ConsumerWidget {
  final ProfessionalMember member;
  const ProfessionalMemberTile({Key? key, required this.member})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(member.fullname),
      onTap: () {
        ref.read(AppProvider.navigatorProvider).openProfessionalMember(member);
      },
    );
  }
}
