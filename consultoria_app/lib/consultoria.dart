import 'package:flutter/material.dart';

class Consultoria extends StatefulWidget {
  @override
  _ConsultoriaState createState() => _ConsultoriaState();
}

class _ConsultoriaState extends State<Consultoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira tela",
        style: TextStyle(
            fontSize: 25,
        ),),

      ),
    );
  }
}
