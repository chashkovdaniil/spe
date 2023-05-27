import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/loading_widget.dart';
import '../../../models/professional_member.dart';
import '../professiona_members_providers.dart';

class ProfessionalMemberArguments {
  final ProfessionalMember member;

  ProfessionalMemberArguments(this.member);
}

class ProfessionalMemberPage extends StatelessWidget {
  static const pageName = '/member';
  const ProfessionalMemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments
        as ProfessionalMemberArguments?;

    if (arguments == null) {
      return const LoadingWidget();
    }
    return _Body(member: arguments.member);
  }
}

class _Body extends ConsumerStatefulWidget {
  final ProfessionalMember member;
  const _Body({Key? key, required this.member}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends ConsumerState<_Body> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(ProfessionalMemberProviders.memberManager)
        ..init()
        ..setMember(
          widget.member,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateHolder = ref.watch(
      ProfessionalMemberProviders.memberStateHolder,
    );

    final canEdit = stateHolder.canEdit;
    final canSave = stateHolder.canSave;
    final isSaving = stateHolder.isSaving;
    final isEditing = stateHolder.isEditing;
    final member = stateHolder.member;

    void updateMember(ProfessionalMember member) => ref
        .read(ProfessionalMemberProviders.memberManager)
        .updateMember(member);

    if (member == null) {
      return const LoadingWidget();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(member.fullname),
      ),
      floatingActionButton: canEdit || canSave
          ? FloatingActionButton.extended(
              onPressed: () {
                if (canSave) {
                  ref.read(ProfessionalMemberProviders.memberManager).save();
                } else {
                  ref.read(ProfessionalMemberProviders.memberManager).edit();
                }
              },
              icon: Icon(canSave ? Icons.save : Icons.edit),
              label: Text(canSave ? 'Сохранить' : 'Редактировать'),
            )
          : null,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: isSaving
          ? const LoadingWidget()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Field<String>(
                    field: 'Имя',
                    value: member.firstName,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(firstName: val));
                    },
                  ),
                  _Field<String>(
                    field: 'Фамилия',
                    value: member.lastName,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(lastName: val));
                    },
                  ),
                  _Field<String>(
                    field: 'Отчество',
                    value: member.patronymic,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(patronymic: val));
                    },
                  ),
                  _Field<String>(
                    field: 'Город',
                    value: member.city,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(city: val));
                    },
                  ),
                  _Field<String>(
                    field: 'Работа',
                    value: member.jobClassification,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(jobClassification: val));
                    },
                  ),
                  _Field<String>(
                    field: 'Компания',
                    value: member.companyCategory,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(companyCategory: val));
                    },
                  ),
                  _Field<String>(
                    field: 'Основной работодатель',
                    value: member.primaryEmployer,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(primaryEmployer: val));
                    },
                  ),
                  _Field<bool>(
                    field: 'Является автором',
                    value: member.author,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(author: val));
                    },
                  ),
                  _Field<bool>(
                      field: 'Аффилированный участник',
                      value: member.affiliateMember,
                      isEdit: isEditing,
                      onChanged: (val) {
                        updateMember(member.copyWith(affiliateMember: val));
                      }),
                  _Field<bool>(
                    field: 'Волонетер (или был им)',
                    value: member.currentOrPastVolunteer,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(
                          member.copyWith(currentOrPastVolunteer: val));
                    },
                  ),
                  _Field<bool>(
                    field: 'Получал награды',
                    value: member.awardRecipient,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(awardRecipient: val));
                    },
                  ),
                  _Field<bool>(
                    field: 'Является ли сейчас участником сообщества',
                    value: member.currentMember,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(currentMember: val));
                    },
                  ),
                  _Field<DateTime>(
                    field: 'Вступил в сообщество',
                    value: member.memberSince,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(memberSince: val));
                    },
                  ),
                  _Field<bool>(
                    field: 'Новый участник',
                    value: member.newMember,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(newMember: val));
                    },
                  ),
                  _Field<bool>(
                    field: 'Сеньор',
                    value: member.seniorProfessional,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(seniorProfessional: val));
                    },
                  ),
                  _Field<String>(
                    field: 'Дисциплина',
                    value: member.primaryTechinalDiscipline,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(
                          member.copyWith(primaryTechinalDiscipline: val));
                    },
                  ),
                  _Field<DateTime>(
                    field: 'Участие оплачено',
                    value: member.paidThrough,
                    isEdit: isEditing,
                    onChanged: (val) {
                      updateMember(member.copyWith(paidThrough: val));
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

class _Field<T> extends StatelessWidget {
  final String field;
  final T value;
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
              child: _FieldEditable<T>(
                value: value,
                onChanged: onChanged,
              ),
            )
          else
            _FieldReadable<T>(value: value),
        ],
      ),
    );
  }
}

class _FieldReadable<T> extends StatelessWidget {
  final T value;
  const _FieldReadable({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final String resultValue;

    if (value is String) {
      resultValue = value as String;
    } else if (value is bool) {
      resultValue = value as bool ? 'Да' : 'Нет';
    } else if (value is DateTime) {
      resultValue = DateFormat.yMMMd('ru_RU').format(value as DateTime);
    }

    return Text(resultValue);
  }
}

class _FieldEditable<T> extends HookWidget {
  final T value;
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
    } else if (value is bool) {
      final valueState = useState(value as bool);
      resultWidget = Row(
        children: [
          Text(valueState.value ? 'Да' : 'Нет'),
          Checkbox(
            value: valueState.value,
            tristate: false,
            onChanged: (val) {
              val ??= false;

              valueState.value = val;
              (onChanged as ValueChanged<bool>)(val);
            },
          ),
        ],
      );
    } else if (value is DateTime) {
      final valueState = useState(value as DateTime);
      resultWidget = Row(
        children: [
          Text(DateFormat.yMMMd('ru_RU').format(valueState.value.toLocal())),
          OutlinedButton(
            onPressed: () async {
              final newDate = await showDatePicker(
                context: context,
                initialDate: valueState.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              valueState.value = newDate ?? valueState.value;
              (onChanged as ValueChanged<DateTime>)(valueState.value);
            },
            child: Text('Изменить дату'),
          ),
        ],
      );
    } else {
      resultWidget = SizedBox();
    }
    return resultWidget;
  }
}
