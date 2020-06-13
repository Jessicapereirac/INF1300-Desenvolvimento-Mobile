import 'dart:math';

import 'package:com/login.dart';
import 'package:com/pagInicial.dart';
import 'package:com/resgisterCliente.dart';
import 'package:com/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: {
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      },
/*      localeListResolutionCallback: (Locale locale, supportedLocales){
        return Locale('en');
      },*/
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Roboto"
      ),

      home: login(),

    )
);


