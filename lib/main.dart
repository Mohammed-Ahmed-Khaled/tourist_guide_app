import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import '../screens/sign_up_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('en');

  void toggleLanguage() {
    setState(() {
      _currentLocale = _currentLocale.languageCode == 'en'
          ? const Locale('ar')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _currentLocale,
      theme: ThemeData(
          fontFamily: 'Lora',
          primaryColor: const Color.fromARGB(255, 111, 66, 50),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(fontWeight: FontWeight.bold),
          )),
      home: SignUp(title: 'Sign Up Page'),
    );
  }
}
