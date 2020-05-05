import 'dart:math';

import 'package:com/login.dart';
import 'package:com/pagInicial.dart';
import 'package:com/resgisterCliente.dart';
import 'package:com/Navigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: "Roboto"
      ),

      home: login(),

    )
);


