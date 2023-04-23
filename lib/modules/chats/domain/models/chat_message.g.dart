// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      id: json['id'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
      message: json['message'] as String,
      sender:
          ProfessionalMember.fromJson(json['sender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatMessageToJson(_$_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sentAt': instance.sentAt.toIso8601String(),
      'message': instance.message,
      'sender': instance.sender,
    };
