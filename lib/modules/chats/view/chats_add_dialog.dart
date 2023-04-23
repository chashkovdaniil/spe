import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_providers.dart';
import '../../../models/professional_member.dart';
import '../../professional_members/api/professional_members_api.dart';
import '../../professional_members/professiona_members_providers.dart';
import '../chats_providers.dart';

class ChatsAddDialog extends HookConsumerWidget {
  const ChatsAddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(ChatsProviders.manager);
    final stateHolder = ref.watch(ChatsProviders.addStateHolder.notifier);
    final textController = useTextEditingController();

    useEffect(
      () {
        void nameListener() {
          stateHolder.setName(textController.text);
        }

        textController.addListener(nameListener);

        return () => textController.removeListener(nameListener);
      },
      const [],
    );

    return WillPopScope(
      onWillPop: () async {
        stateHolder.clear();

        return true;
      },
      child: AlertDialog(
        title: Text('Добавление чата'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Укажите название чата',
                border: OutlineInputBorder(),
              ),
            ),
            const _DropdownMembers(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              stateHolder.clear();
              Navigator.pop(context);
            },
            child: Text('Закрыть'),
          ),
          TextButton(
            onPressed: () {
              manager.createChat();
              Navigator.pop(context);
            },
            child: Text('Добавить'),
          ),
        ],
      ),
    );
  }
}

class _DropdownMembers extends ConsumerWidget {
  const _DropdownMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final stateHolder = ref.read(ChatsProviders.addStateHolder.notifier);
    final appState = ref.watch(AppProvider.appStateHolder);

    return DropdownSearch<ProfessionalMember>.multiSelection(
      asyncItems: (filter) async {
        final apiProvider = ref.read(ProfessionalMemberProviders.api);
        final members = await apiProvider.members(
          params: ProfessionalMemberApiParams(
            email: filter,
          ),
        );

        return members;
      },
      compareFn: (member, selectedMember) {
        return member.id == selectedMember.id;
      },
      itemAsString: (member) => '${member.fullname} (${member.email})',
      popupProps: PopupPropsMultiSelection.menu(
        showSelectedItems: true,
        showSearchBox: true,
        itemBuilder: (context, member, isSelected) {
          return ListTile(
            selected: isSelected,
            title: Text(
              '${member.fullname} (${member.email})',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w500,
              ),
            ),
          );
        },
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: 'Укажите email участника',
        ),
      ),
      onChanged: (selectedMembers) {
        selectedMembers.forEach(stateHolder.addMember);
      },
    );
  }
}
