import 'dart:async';

import 'package:camera/camera.dart';
import 'package:com/login.dart';

import 'package:com/take_pic.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'internacionalizacao/localizations.dart';
<<<<<<< HEAD
=======

>>>>>>> c4ee832d49dcc191d6fb71bc3aeb15186dbe5cfd

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD
=======

>>>>>>> c4ee832d49dcc191d6fb71bc3aeb15186dbe5cfd

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.white, fontFamily: "Roboto"),
    supportedLocales: [
      Locale('pt', 'BR'),
      Locale('en', 'US'),
      Locale('es', 'US')
    ],
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    localeResolutionCallback: (locale, supportedLocales) {
      if (locale == null) {
        return supportedLocales.first;
      }

      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode &&
            supportedLocale.countryCode == locale.countryCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    },
    home: login(),
  ));
}
