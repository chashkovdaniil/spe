import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/app_providers.dart';
import 'firebase_options.dart';
import 'modules/main/main_page.dart';

void main() async {
  initializeDateFormatting('ru_RU');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    GoogleProvider(
      clientId:
          '91199716034-o39o3p2mag74m311j9l650feeoi5ks7p.apps.googleusercontent.com',
    ),
  ]);
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(const ProviderScope(child: SPEApp()));
}

class SPEApp extends HookConsumerWidget {
  const SPEApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final manager = ref.read(AppProvider.appManager);
      manager.init();

      return manager.dispose;
    }, const []);

    return MaterialApp(
      home: const MainPage(),
      theme: Theme.of(context).copyWith(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}

//Which port do you want to use for the auth emulator? 9099
// ? Which port do you want to use for the firestore emulator? 8080
// ? Which port do you want to use for the database emulator? 9000
// ? Which port do you want to use for the storage emulator? 9199
// ? Would you like to enable the Emulator UI? Yes
// ? Which port do you want to use for the Emulator UI (leave empty to use any available port)? 9299
