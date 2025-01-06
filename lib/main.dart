import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:tourist_guide_app/screens/login_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist Guide App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lora',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: LoginPage(),
    );
  }
}

///
