import 'package:flutter/material.dart';

class maisDetalhes extends StatefulWidget {

  int valor = 0;
  String nome = "";
  maisDetalhes(this.valor,this.nome);


  @override
  _maisDetalhesState createState() => _maisDetalhesState();
}

class _maisDetalhesState extends State<maisDetalhes> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "at home",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Roboto', fontSize: 25),
            )),
        body: Container(


          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("images/med" + widget.valor.toString() + ".jpg",
                        height: 180,
                        width: 180,
                      ),
                      Expanded(

                          child: Text("Mais detalhes sobre o medico: " + widget.nome,

                            style: TextStyle(

                                fontSize: 20,
                                color: Colors.black
                            ),)
                      ),
                    ],
                  ),),

                Text("CPF",
                  //TODO http request
                  style: TextStyle(
                    fontSize: 15,
                  ),),
              ],

            ),
          ),
        )
    );
  }
}

