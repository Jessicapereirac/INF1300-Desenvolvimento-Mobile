import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class bitcoin extends StatefulWidget {
  @override
  _bitcoinState createState() => _bitcoinState();
}

class _bitcoinState extends State<bitcoin> {

  String url = "https://blockchain.info/ticker";

  String resultado = "R\$ 0";

  recuperarPreco() async {

    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> resp = json.decode(response.body);
    
    setState(() {
      resultado = resp["BRL"]["symbol"] + " " + resp["BRL"]["sell"].toString() ;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("imagens/logo.png", height: 140,),
            Padding(padding: EdgeInsets.only(bottom: 20),
            child: Text(resultado,
              style: TextStyle(
                  fontSize: 40),),),
            RaisedButton(child:
            Text("atualizar",
              style: TextStyle(
                  fontSize: 35),),
                color: Colors.orange,


                onPressed: recuperarPreco)
          ],
        ),
      ),
    );
  }
}
