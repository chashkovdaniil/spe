// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award_recipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AwardRecipient _$$_AwardRecipientFromJson(Map<String, dynamic> json) =>
    _$_AwardRecipient(
      member:
          ProfessionalMember.fromJson(json['member'] as Map<String, dynamic>),
      year: json['year'] as int,
      award: json['award'] as String,
    );

Map<String, dynamic> _$$_AwardRecipientToJson(_$_AwardRecipient instance) =>
    <String, dynamic>{
      'member': instance.member,
      'year': instance.year,
      'award': instance.award,
    };
