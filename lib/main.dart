import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'Screens/MyApp.dart';

void main() async{

  runApp(EasyLocalization(supportedLocales: [Locale('en'), Locale('ar')], fallbackLocale: Locale('en', 'US'), path: '/assets/translations', child: MyApp()));
}