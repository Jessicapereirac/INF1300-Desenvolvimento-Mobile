import 'package:com/jogo.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class jogando extends StatefulWidget {


  String valor ;
  jogando(this.valor);


  @override
  _jogandoState createState() => _jogandoState();
}

class _jogandoState extends State<jogando> {

  @override
  Widget build(BuildContext context) {

    var aux = "imagens/moeda_" + widget.valor + ".png";

    print(widget.valor);
    var img = AssetImage(aux);

    return Scaffold(
        backgroundColor: Color(0xff61bd86),

        body: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: img,height: 230),
              GestureDetector(
                child: Image.asset("imagens/botao_voltar.png"),
                onTap: ()=>
                    Navigator.pop(context),

              )
            ],
          ),

        )
    );
  }
}
