import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/app_state.dart';
import '../../models/professional_member.dart';

class AppStateHolder extends StateNotifier<AppState> {
  AppStateHolder()
      : super(
          const AppState(professionalMember: null),
        );

  ProfessionalMember? get member => state.professionalMember;

  void toggleSearchBar() => state = state.copyWith(
        showSearchBar: !state.showSearchBar,
      );

  void setProfessionalMember(ProfessionalMember? member) =>
      state = state.copyWith(
        professionalMember: member,
      );
}
