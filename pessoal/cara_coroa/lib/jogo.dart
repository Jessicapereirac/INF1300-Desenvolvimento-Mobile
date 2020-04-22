import 'dart:math';

import 'package:com/jogando.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  @override
  Widget build(BuildContext context) {


    var choiceApp = Random().nextInt(2);
    var ops = ["cara", "coroa"];

    return Scaffold(
      backgroundColor: Color(0xff61bd86),

      body: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("imagens/logo.png"),
            GestureDetector(
              child:Image.asset("imagens/botao_jogar.png"),
              onTap: ()=>
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => jogando(ops[choiceApp]))),

            )


          ],
        ),

      )
    );
  }
}
