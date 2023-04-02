// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Volunteer _$$_VolunteerFromJson(Map<String, dynamic> json) => _$_Volunteer(
      name: json['name'] as String,
      committee: json['committee'] as String,
      position: json['position'] as String,
      termBeginDate: DateTime.parse(json['termBeginDate'] as String),
      termEndDate: DateTime.parse(json['termEndDate'] as String),
    );

Map<String, dynamic> _$$_VolunteerToJson(_$_Volunteer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'committee': instance.committee,
      'position': instance.position,
      'termBeginDate': instance.termBeginDate.toIso8601String(),
      'termEndDate': instance.termEndDate.toIso8601String(),
    };
