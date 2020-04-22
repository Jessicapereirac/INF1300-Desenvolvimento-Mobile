import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Empresa",
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
                      Image.asset("images/detalhe_contato.png"),
                      Text("Contatos",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green
                        ),),
                    ],
                  ),),

                Text("(21) 9 8283-0283",
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                Text("oiedonwfj e@ouu.com.br",
                  style: TextStyle(
                    fontSize: 20,
                  ),)
              ],

            ),
          ),
        )
    );
  }
}
