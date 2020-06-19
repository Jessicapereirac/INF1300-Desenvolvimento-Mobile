//
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:get_it/get_it.dart';
//
//import 'autentificacao.dart';
//import 'locator.dart';
//import 'main.dart';
//
//class teste extends StatefulWidget {
//  @override
//  _testeState createState() => _testeState();
//}
//
//class _testeState extends State<teste> {
//  final LocalAuthenticationService _localAuth = locator<LocalAuthenticationService>();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        leading: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Image.asset('assets/dancamdev.png'),
//        ),
//        title: Text('Local Authentication'),
//      ),
//      body: Center(
//        child: RaisedButton(
//          child: Text('authenticate'),
//          onPressed: _localAuth.authenticate,
//        ),
//      ),
//    );
//  }
//}
//
