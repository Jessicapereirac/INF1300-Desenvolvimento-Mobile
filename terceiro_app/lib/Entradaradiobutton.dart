import 'package:flutter/material.dart';

class entradarb extends StatefulWidget {
  @override
  _entradarbState createState() => _entradarbState();
}

class _entradarbState extends State<entradarb> {

  String escolha ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Text("Masculino"),
            Radio(value: "m",
                groupValue: escolha, // groupValue é do mesmo tipo do value
                onChanged: (String es){
              setState(() {
                escolha = es;
              });
                }),
            Text("Feminimo"),
            Radio(value: "f", groupValue: escolha, onChanged: (String es){
              setState(() {
                escolha = es;
              });
            } ),
          ],

        ),
      ),
    );
  }
}
