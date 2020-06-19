
import 'dart:async';


import 'package:camera/camera.dart';
import 'package:com/login.dart';
import 'package:com/take_pic.dart';
import 'package:com/teste.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';


import 'autentificacao.dart';
import 'internacionalizacao/localizations.dart';
import 'locator.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  //setupLocator();

  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.white,
              fontFamily: "Roboto"
          ),
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

      )
  );
}

