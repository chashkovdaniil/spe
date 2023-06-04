import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as UIAuth;
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/app_providers.dart';
import 'core/utils.dart';
import 'firebase_options.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('ru_RU');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  UIAuth.FirebaseUIAuth.configureProviders([
    UIAuth.EmailAuthProvider(),
    GoogleProvider(
      clientId:
          '91199716034-o39o3p2mag74m311j9l650feeoi5ks7p.apps.googleusercontent.com',
    ),
  ]);
  assert(() {
    // FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    return true;
  }());

  runApp(const ProviderScope(child: SPEApp()));
}

class SPEApp extends HookConsumerWidget {
  const SPEApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(AppProvider.appManager);
    useEffect(() {
      manager.init();

      return manager.dispose;
    }, const []);

    return MaterialApp.router(
      routerConfig: ref.read(AppProvider.navigatorProvider).routerConfig,
      // home: const MainPage(),
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(LabelOverrides()),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        navigationRailTheme: NavigationRailThemeData(
          selectedLabelTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          unselectedLabelTextStyle: TextStyle(
            fontSize: 18,
          ),
          selectedIconTheme: IconThemeData(
            size: 28,
            color: Colors.white,
          ),
          indicatorColor: Colors.blue.shade300,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          fillColor: Colors.black12.withOpacity(0.05),
          hoverColor: Colors.black12.withOpacity(0.05),
          focusColor: Colors.black12.withOpacity(0.05),
          border: null,
          outlineBorder: null,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent.shade100,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 3,
          selectedItemColor: Colors.blue,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Colors.blueAccent.shade100,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.black,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          primaryContainer: Colors.white,
          onPrimaryContainer: Colors.black,
          surfaceTint: Colors.white,
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
