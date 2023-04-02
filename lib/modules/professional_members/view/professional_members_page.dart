import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_providers.dart';
import '../../../models/professional_member.dart';
import '../professiona_members_providers.dart';

class ProfessionalMembersPage extends HookConsumerWidget {
  static const pageName = '/members';
  const ProfessionalMembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(ProfessionalMemberProviders.manager);

    useEffect(() {
      manager.init();
      return manager.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список участников'),
      ),
      body: ProfessionalMemberListWidget(
        onTapLoadMore: () => manager.load(),
      ),
    );
  }
}

class ProfessionalMemberListWidget extends HookConsumerWidget {
  final VoidCallback onTapLoadMore;
  const ProfessionalMemberListWidget({
    super.key,
    required this.onTapLoadMore,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final members = ref.watch(ProfessionalMemberProviders.stateHolder.select(
      (value) => value.map(
        (value) => value.members,
        empty: (empty) => const <ProfessionalMember>[],
      ),
    ));

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
