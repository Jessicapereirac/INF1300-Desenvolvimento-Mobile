

import 'package:flutter/material.dart';

class pagInicial extends StatefulWidget {
  @override
  _pagInicialState createState() => _pagInicialState();
}

class _pagInicialState extends State<pagInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira tela",
          style: TextStyle(
            fontSize: 25,
            color: Colors.red,
          ),),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("ir para a segunda tela"),
                padding: EdgeInsets.all(15),
                onPressed: (){
                  Navigator.pushNamed(context, "/secundaria");

                })
          ],
        ),
      ),
    );
  }
}
