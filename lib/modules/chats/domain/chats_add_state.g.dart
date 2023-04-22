// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_add_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatsAddState _$$_ChatsAddStateFromJson(Map<String, dynamic> json) =>
    _$_ChatsAddState(
      members: (json['members'] as List<dynamic>)
          .map((e) => ProfessionalMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_ChatsAddStateToJson(_$_ChatsAddState instance) =>
    <String, dynamic>{
      'members': instance.members,
      'name': instance.name,
    };
