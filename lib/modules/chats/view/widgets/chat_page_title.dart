import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/widgets/appbar.dart';
import '../../../../core/widgets/shimmer_loading.dart';
import '../../chats_providers.dart';

class ChatPageTitle extends ConsumerWidget {
  const ChatPageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref
        .watch(ChatsProviders.stateHolder.select((value) => value.chat?.name));

    if (title == null) {
      return ShimmerLoading(
        isLoading: true,
        child: Container(
          width: 250,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
    }
    return TitleAppBar(title);
  }
}
