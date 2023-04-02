// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Education _$$_EducationFromJson(Map<String, dynamic> json) => _$_Education(
      member:
          ProfessionalMember.fromJson(json['member'] as Map<String, dynamic>),
      degree: json['degree'] as String,
      fieldOfStudy: json['fieldOfStudy'] as String,
      university: json['university'] as String,
      graduationDate: DateTime.parse(json['graduationDate'] as String),
    );

Map<String, dynamic> _$$_EducationToJson(_$_Education instance) =>
    <String, dynamic>{
      'member': instance.member,
      'degree': instance.degree,
      'fieldOfStudy': instance.fieldOfStudy,
      'university': instance.university,
      'graduationDate': instance.graduationDate.toIso8601String(),
    };
