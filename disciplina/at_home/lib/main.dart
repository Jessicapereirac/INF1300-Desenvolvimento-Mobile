import 'dart:math';

import 'package:com/login.dart';
import 'package:com/pagInicial.dart';
import 'package:com/resgisterCliente.dart';
import 'package:com/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'internacionalizacao/localizations.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Roboto"
      ),
      supportedLocales: [
        Locale('pt', 'BR'),
        Locale('en', 'US')

      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {

        if (locale == null) { return supportedLocales.first; }

        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },

      home: registerCliente(),

    )
);


