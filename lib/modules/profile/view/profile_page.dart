import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/app_providers.dart';
import '../../../models/professional_member.dart';

class ProfilePage extends ConsumerWidget {
  static const routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(AppProvider.appStateHolder).professionalMember;
    if (member == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    var editedMember = member;

    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Field<String>(
              field: 'Имя',
              value: member.firstName,
              isEdit: member.role == ProfessionalMemberRoles.admin,
              onChanged: (val) {
                editedMember = editedMember.copyWith(firstName: val);
              },
            ),
            // _Field<String>(field: 'Фамилия', value: member.lastName),
            // _Field<String>(field: 'Отчество', value: member.patronymic),
            // _Field<String>(field: 'Город', value: member.city),
            // _Field<String>(field: 'Работа', value: member.jobClassification),
            // _Field(
            //   field: 'Компания',
            //   value: member.companyCategory,
            // ),
            // _Field(
            //   field: 'Основной работодатель',
            //   value: member.primaryEmployer,
            // ),
            // _Field(field: 'Является автором', value: member.author),
            // _Field(
            //   field: 'Аффилированный участник',
            //   value: member.affiliateMember,
            // ),
            // _Field(
            //   field: 'Волонетер (или был им)',
            //   value: member.currentOrPastVolunteer,
            // ),
            // _Field(field: 'Получал награды', value: member.awardRecipient),
            // _Field(
            //   field: 'Является ли сейчас участником сообщества',
            //   value: member.currentMember,
            // ),
            // _Field(
            //   field: 'Вступил в сообщество',
            //   value: DateFormat.yMMMd('ru_RU').format(member.memberSince),
            // ),
            // _Field(
            //   field: 'Новый участник',
            //   value: member.newMember,
            // ),

            // _Field(
            //   field: 'Сеньор',
            //   value: member.seniorProfessional,
            // ),
            // _Field(
            //   field: 'Дицсиплина',
            //   value: member.primaryTechinalDiscipline,
            // ),
            // _Field(
            //   field: 'Участие оплачено',
            //   value: DateFormat.yMMMd('ru_RU').format(member.paidThrough),
            // ),
            Text(member.lastName),
            Text(
              member.toJson().toString() ?? '',
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     ref.read(AppProvider).logout();
            //   },
            //   child: Text('Logout'),
            // ),
            ElevatedButton(
              onPressed: () {
                ref.read(AppProvider.authService).logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Field<T> extends StatelessWidget {
  final String field;
  final Object value;
  final bool isEdit;
  final ValueChanged<T> onChanged;
  const _Field({
    Key? key,
    required this.field,
    required this.value,
    required this.isEdit,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '$field:',
            textAlign: TextAlign.start,
          ),
          if (isEdit)
            Flexible(
              child: _FieldEditable(
                value: value,
                onChanged: onChanged,
              ),
            )
          else
            _FieldReadable(value: value),
        ],
      ),
    );
  }
}

class _FieldReadable extends StatelessWidget {
  final Object value;
  const _FieldReadable({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final String resultValue;

    if (value is String) {
      resultValue = value as String;
    } else if (value is bool) {
      resultValue = value as bool ? 'Да' : 'Нет';
    }

    return Text(resultValue);
  }
}

class _FieldEditable<T> extends HookWidget {
  final Object value;
  final ValueChanged<T> onChanged;
  const _FieldEditable({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget resultWidget;

    if (value is String) {
      final controller = useTextEditingController(text: value as String);
      resultWidget = TextField(
        controller: controller,
        onChanged: onChanged as ValueChanged<String>,
      );
      // } else if (value is bool) {
      //   resultWidget = value as bool ? 'Да' : 'Нет';
    } else {
      resultWidget = SizedBox();
    }
    return resultWidget;
  }
}
