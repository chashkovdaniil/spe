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
      isLoading: json['isLoading'] as bool,
      showSearchBar: json['showSearchBar'] as bool? ?? false,
      selectedNavigationTab: $enumDecodeNullable(
              _$NavigationTabsEnumMap, json['selectedNavigationTab']) ??
          NavigationTabs.members,
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'professionalMember': instance.professionalMember,
      'isLoading': instance.isLoading,
      'showSearchBar': instance.showSearchBar,
      'selectedNavigationTab':
          _$NavigationTabsEnumMap[instance.selectedNavigationTab]!,
    };

const _$NavigationTabsEnumMap = {
  NavigationTabs.profile: 'profile',
  NavigationTabs.members: 'members',
  NavigationTabs.chats: 'chats',
  NavigationTabs.logout: 'logout',
};
