import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/app_state.dart';
import '../../models/professional_member.dart';
import '../../modules/main/navi_page.dart';

class AppStateHolder extends StateNotifier<AppState> {
  AppStateHolder()
      : super(
          const AppState(
            professionalMember: null,
            isLoading: true,
          ),
        );

  ProfessionalMember? get member => state.professionalMember;

  void loaded() => state = state.copyWith(isLoading: false);

  void toggleSearchBar() => state = state.copyWith(
        showSearchBar: !state.showSearchBar,
      );

  void setProfessionalMember(ProfessionalMember? member) =>
      state = state.copyWith(
        professionalMember: member,
      );

  void setNavigationTab(NavigationTabs tab) =>
      state = state.copyWith(selectedNavigationTab: tab);
}
