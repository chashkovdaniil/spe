// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => ProfessionalMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'name': instance.name,
      'members': instance.members,
      'createdAt': instance.createdAt.toIso8601String(),
    };
