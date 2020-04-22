import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Servicos",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white
            ),),

        ),
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
                      Image.asset("images/detalhe_servico.png"),
                      Text("Nossos Serviços",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.lightGreenAccent
                        ),),
                    ],
                  ),),

                Padding(padding: EdgeInsets.only(top: 16),
                child: Text("Consultoria",
                  style: TextStyle(
                    fontSize: 20,
                  ),),),
                Padding(padding: EdgeInsets.only(top: 16),
                  child: Text("Calculo de precos",
                    style: TextStyle(
                      fontSize: 20,
                    ),),),
                Padding(padding: EdgeInsets.only(top: 16),
                  child: Text("Cosntrucao de software",
                    style: TextStyle(
                      fontSize: 20,
                    ),),),

              ],

            ),
          ),
        )
    );
  }
}
