

import 'package:com/consultoria.dart';
import 'package:com/contato.dart';
import 'package:com/servico.dart';
import 'package:com/telasecundaria.dart';
import 'package:flutter/material.dart';

import 'cliente.dart';
import 'empresa.dart';

void main() => runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/secundaria" : (context) => telasecundario(1)
      },
     home: TelaPrincipal(),

    )
);


class ConsultoriaPrincipal extends StatefulWidget {
  @override
  _ConsultoriaPrincipalState createState() => _ConsultoriaPrincipalState();
}

class _ConsultoriaPrincipalState extends State<ConsultoriaPrincipal> {

  void abrirSegTela(String v){

    if( v == "empresa") {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaEmpresa()));
    }
    else if ( v == "servico") {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaServico()));
    }
    else if ( v == "cliente") {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaCliente()));
    }
    else if ( v == "contato") {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaContato()));
    }
    else
      print("erro");

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria",
          style: TextStyle(
            fontSize: 25,

          ),),
      ),
      body: Container(

        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 50, bottom: 0),
                    child: Image.asset("images/logo.png", height: 150,)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => abrirSegTela("empresa"),
                      child: Padding(padding: EdgeInsets.only(left: 0),
                          child: Image.asset("images/menu_empresa.png", height: 150,)),

                    ),
                    GestureDetector(
                      onTap: () => abrirSegTela("cliente"),
                      child: Image.asset("images/menu_cliente.png", height: 150,)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () => abrirSegTela("servico"),
                      child: Padding(padding: EdgeInsets.only(left: 0),
                          child: Image.asset("images/menu_servico.png", height: 150,)),

                    ),
                    GestureDetector(
                      onTap: () => abrirSegTela("contato"),
                      child: Image.asset("images/menu_contato.png", height: 150,)),



                  ],
                )



              ],
            ),),



          ],
        ),
      ),
    );
  }
}


class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
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

