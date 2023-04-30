import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_providers.dart';
import 'api/chats_api.dart';
import 'api/chats_api_impl.dart';
import 'domain/chats_add_state.dart';
import 'domain/chats_add_state_holder.dart';
import 'domain/chats_manager.dart';
import 'domain/chats_state.dart';
import 'domain/chats_state_holder.dart';

class ChatsProviders {
  const ChatsProviders._();

  static final api = Provider<ChatsApi>(
    (ref) => ChatsApiImpl(
      ref.watch(AppProvider.storageService),
      ref.watch(AppProvider.appStateHolder),
    ),
  );

  static final addStateHolder =
      StateNotifierProvider<ChatsAddStateHolder, ChatsAddState>(
    (_) => ChatsAddStateHolder(),
  );

  static final stateHolder =
      StateNotifierProvider<ChatsStateHolder, ChatsState>(
    (_) => ChatsStateHolder(),
  );

  static final manager = Provider(
    (ref) {
      final manager = ChatsManager(
        ref.watch(api),
        ref.watch(addStateHolder.notifier),
        ref.watch(stateHolder.notifier),
        ref.watch(
          AppProvider.appStateHolder
              .select((state) => state.professionalMember),
        ),
      );
      ref.onDispose(() {
        manager.dispose();
      });
      return manager;
    },
  );
}
