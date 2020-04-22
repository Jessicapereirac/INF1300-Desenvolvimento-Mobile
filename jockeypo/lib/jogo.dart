import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var escolhaApp = AssetImage("images/padrao.png");
  var result = 0;
  var resultado = [" ","Ganhou!! :D ", "Perdeu :( ", "Empate!!"];

  void escolhaJog(String opcao){

    var ops = ["pedra", "papel","tesoura"];

    var choiceApp = ops[Random().nextInt(3)];
    var resultado = 0;

    var aux = "images/" + choiceApp + ".png";

    if(opcao == choiceApp)
      resultado = 3;

    else if ((opcao == "tesoura" && choiceApp == "pedra") || (opcao == "pedra" && choiceApp == "papel") || (opcao == "papel" && choiceApp == "tesoura"))
      resultado = 2;

    else
      resultado = 1;

    setState(() {

      escolhaApp = AssetImage(aux);
      result = resultado;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child:  Text("Jogador 1",
            textAlign: TextAlign.center,
            style: TextStyle(
              //color: Colors.lightBlue,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          ),

          Image(image: this.escolhaApp,height: 130),

          Padding(padding: EdgeInsets.only(top: 40, bottom: 20),
            child:  Text(this.resultado[result],
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),),
          ),
          Padding(padding: EdgeInsets.only(top: 0, bottom: 20),
            child:  Text("Sua escolha: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () => escolhaJog("pedra"),
                  child: Image.asset("images/pedra.png", height: 110)
              ),
              GestureDetector(
                onTap: () => escolhaJog("papel"),
                child: Image.asset("images/papel.png", height: 110)
              ),
              GestureDetector(
                onTap: () => escolhaJog("tesoura"),
                child: Image.asset("images/tesoura.png", height: 110)
              ),

            ],
          )

        ],
      ),
    );
  }
}
