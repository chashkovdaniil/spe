import 'package:flutter/material.dart';

import '../../../models/professional_member.dart';

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
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final member = arguments.member;

    return Scaffold(
      appBar: AppBar(
        title: Text(member.fullname),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _String(field: 'Имя', value: member.firstName),
            _String(field: 'Фамилия', value: member.lastName),
            _String(field: 'Отчество', value: member.patronymic),
            _String(field: 'Город', value: member.city),
            _String(field: 'Работа', value: member.jobClassification),
            _String(field: 'Является автором', value: member.author),
            _String(
              field: 'Волонетер (или был им)',
              value: member.currentOrPastVolunteer,
            ),
            _String(field: 'Получал награды', value: member.awardRecipient),
            _String(field: 'Имя', value: member.firstName),
            _String(field: 'Имя', value: member.firstName),
            Text(member.lastName),
          ],
        ),
      ),
    );
  }
}

class _String extends StatelessWidget {
  final String field;
  final Object value;
  const _String({
    Key? key,
    required this.field,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final String resultValue;

    if (value is String) {
      resultValue = value as String;
    } else if (value is bool) {
      resultValue = value as bool ? 'Да' : 'Нет';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$field: $resultValue',
        textAlign: TextAlign.start,
      ),
    );
  }
}
