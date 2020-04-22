import 'package:flutter/material.dart';

class telasecundario extends StatefulWidget {

  int valor = 0;
  telasecundario(this.valor);

  @override
  _telasecundarioState createState() => _telasecundarioState();
}

class _telasecundarioState extends State<telasecundario> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda tela",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black
          ),),

      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Segunda tela ${widget.valor}", //recuperar valor da classe acima
              style: TextStyle(
                fontSize: 25,
              ),),
            RaisedButton(
                child: Text("ir para a primeira tela"),
                padding: EdgeInsets.all(15),
                onPressed: (){
                  Navigator.pop(context, "/");

                })

          ],
        ),
      ),
    );
  }
}
