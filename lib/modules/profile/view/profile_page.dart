import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/app_providers.dart';

class ProfilePage extends ConsumerWidget {
  static const routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(AppProvider.appStateHolder);

    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              member.toJson().toString(),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     ref.read(AppProvider).logout();
            //   },
            //   child: Text('Logout'),
            // ),
            ElevatedButton(
              onPressed: () {
                ref.read(AppProvider.authService).logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
