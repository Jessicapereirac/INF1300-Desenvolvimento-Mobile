import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Clientes",
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

                    children: <Widget>[
                      Image.asset("images/detalhe_cliente.png"),
                      Text("Nossos clientes",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.lightGreen
                        ),),
                    ],
                  ),),
               Padding(padding: EdgeInsets.only(top: 16),
               child: Image.asset("images/cliente1.png"),
               ),
                Text("empresa de software",
                ),
                Padding(padding: EdgeInsets.only(top: 16),
                  child: Image.asset("images/cliente2.png"),
                ),
                Text("empresa de auditoria",
                ),

               
              ],

            ),
          ),
        )
    );
  }
}
