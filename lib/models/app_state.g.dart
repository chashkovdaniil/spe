// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      professionalMember: json['professionalMember'] == null
          ? null
          : ProfessionalMember.fromJson(
              json['professionalMember'] as Map<String, dynamic>),
      showSearchBar: json['showSearchBar'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'professionalMember': instance.professionalMember,
      'showSearchBar': instance.showSearchBar,
    };
