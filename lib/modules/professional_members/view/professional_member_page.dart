import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/app_providers.dart';
import '../../../models/professional_member.dart';
import '../professiona_members_providers.dart';

class ProfessionalMemberArguments {
  final ProfessionalMember member;

  ProfessionalMemberArguments(this.member);
}

class ProfessionalMemberPage extends HookConsumerWidget {
  static const pageName = '/member';
  const ProfessionalMemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arguments = ModalRoute.of(context)?.settings.arguments
        as ProfessionalMemberArguments?;

    if (arguments == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final member = arguments.member;
    var editedMember = member;

    return _Body(editedMember);
  }
}

class _Body extends HookConsumerWidget {
  ProfessionalMember member;
  _Body(this.member, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMember =
        ref.watch(AppProvider.appStateHolder).professionalMember;

    var isEditToggle = useState(false);
    final canEdit = currentMember?.role == ProfessionalMemberRoles.admin;
    var isEdit = canEdit && isEditToggle.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(member.fullname),
      ),
      floatingActionButton: canEdit
          ? FloatingActionButton.extended(
              onPressed: () {
                if (isEdit) {
                  ref.read(ProfessionalMemberProviders.api).updateMember(
                        member,
                      );
                }
                isEditToggle.value = !isEditToggle.value;
              },
              icon: Icon(isEdit ? Icons.save : Icons.edit),
              label: Text(isEdit ? 'Сохранить' : 'Редактировать'),
            )
          : null,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Field<String>(
              field: 'Имя',
              value: member.firstName,
              isEdit: isEdit,
              onChanged: (val) {
                member = member.copyWith(firstName: val);
              },
            ),
            // _String(field: 'Имя', value: member.firstName),
            // _String(field: 'Фамилия', value: member.lastName),
            // _String(field: 'Отчество', value: member.patronymic),
            // _String(field: 'Город', value: member.city),
            // _String(field: 'Работа', value: member.jobClassification),
            // _String(
            //   field: 'Компания',
            //   value: member.companyCategory,
            // ),
            // _String(
            //   field: 'Основной работодатель',
            //   value: member.primaryEmployer,
            // ),
            // _String(field: 'Является автором', value: member.author),
            // _String(
            //   field: 'Аффилированный участник',
            //   value: member.affiliateMember,
            // ),
            // _String(
            //   field: 'Волонетер (или был им)',
            //   value: member.currentOrPastVolunteer,
            // ),
            // _String(field: 'Получал награды', value: member.awardRecipient),
            // _String(
            //   field: 'Является ли сейчас участником сообщества',
            //   value: member.currentMember,
            // ),
            // _String(
            //   field: 'Вступил в сообщество',
            //   value: DateFormat.yMMMd('ru_RU').format(member.memberSince),
            // ),
            // _String(
            //   field: 'Новый участник',
            //   value: member.newMember,
            // ),
            // _String(
            //   field: 'Сеньор',
            //   value: member.seniorProfessional,
            // ),
            // _String(
            //   field: 'Дицсиплина',
            //   value: member.primaryTechinalDiscipline,
            // ),
            // _String(
            //   field: 'Участие оплачено',
            //   value: DateFormat.yMMMd('ru_RU').format(member.paidThrough),
            // ),
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
