import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


void main() {

  runApp(MaterialApp(
   title: "Frase do dia",
   home: Home()


  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var frase = [
    "Aconteça o que acontecer amanhã, ou para o resto da minha vida, agora estou feliz porque te amo.",
    "Amor, eu te amo cada vez mais e sempre irei amar.",

    "Eu não tenho tudo que amo, mas amo tudo que tenho.",
    "oi, thiago! Voce por aqui ? hahaha"
    "Quem tem luz própria jamais se perderá no seu caminho.",
  ];
  var inicio = "Clique abaixo para gerar uma frase";

  void gerarFrases(){
   
    var index = Random().nextInt(frase.length);
    
    setState(() {
      inicio = frase[index];
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FRASE DO DIA",
        style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 37, 10, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(inicio,
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontSize: 30,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              RaisedButton(
                  child: Text("Nova Frase",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  color: Colors.green,
                  onPressed: gerarFrases)

            ],
          ),
        ),
      ),
    );
  }
}


class exemplo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0,37,0,0),
      color: Colors.black,
      child: Scaffold(

        appBar: AppBar(
          title: Text("Frases do dia"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Text("aquiiii"),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.add_circle) , onPressed: (){
                  print("oi");
                },
                  iconSize: 60,
                )

              ],
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,

            ),

          ),
        ),
      ),
    );
  }
}


