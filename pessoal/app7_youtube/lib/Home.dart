import 'package:app7_youtube/CustomSearchDelegate.dart';
import 'package:app7_youtube/telas/biblioteca.dart';
import 'package:app7_youtube/telas/emAlta.dart';
import 'package:app7_youtube/telas/inicio.dart';
import 'package:app7_youtube/telas/inscricao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> tela = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()

    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset("imagens/youtube.png", width: 98, height: 22),
        actions: <Widget>[

          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String res = await showSearch(context: context, delegate: CustomSearchDelegate()); //resultado do que o usuario pesquisou
                setState(() {
                  _resultado = res;
                });
              }
          ),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
                print("conta");
              }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: tela[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: "Ínicio",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "Em Alta",
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              label: "Biblioteca ",
              icon: Icon(Icons.folder)
          )
        ],
      ),
    );
  }
}
