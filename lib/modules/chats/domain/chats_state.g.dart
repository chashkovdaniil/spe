// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatsState _$$_ChatsStateFromJson(Map<String, dynamic> json) =>
    _$_ChatsState(
      chats: (json['chats'] as List<dynamic>)
          .map((e) => Chat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatsStateToJson(_$_ChatsState instance) =>
    <String, dynamic>{
      'chats': instance.chats,
    };
