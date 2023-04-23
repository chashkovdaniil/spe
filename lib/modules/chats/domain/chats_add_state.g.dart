// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_add_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatsAddState _$$_ChatsAddStateFromJson(Map<String, dynamic> json) =>
    _$_ChatsAddState(
      selectedMembers: (json['selectedMembers'] as List<dynamic>)
          .map((e) => ProfessionalMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      professionalMemberName: json['professionalMemberName'] as String,
      filteredMembers: (json['filteredMembers'] as List<dynamic>)
          .map((e) => ProfessionalMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatsAddStateToJson(_$_ChatsAddState instance) =>
    <String, dynamic>{
      'selectedMembers': instance.selectedMembers,
      'name': instance.name,
      'professionalMemberName': instance.professionalMemberName,
      'filteredMembers': instance.filteredMembers,
    };
