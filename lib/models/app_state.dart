import 'package:freezed_annotation/freezed_annotation.dart';

import '../modules/main/navi_page.dart';
import 'professional_member.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required ProfessionalMember? professionalMember,
    required bool isLoading,
    @Default(false) bool showSearchBar,
    @Default(NavigationTabs.members) NavigationTabs selectedNavigationTab,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
