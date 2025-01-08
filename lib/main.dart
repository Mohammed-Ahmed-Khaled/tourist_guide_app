import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tourguid_app/Sign_up.dart';
import 'package:tourguid_app/generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Tourist Guide App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Lora',
          primaryColor: const Color.fromARGB(255, 111, 66, 50),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(fontWeight: FontWeight.bold),
          )),
      home: const SignUp(title: 'Sign UP Page'),
    );
  }
}
