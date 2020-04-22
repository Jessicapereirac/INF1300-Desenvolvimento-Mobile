import 'package:flutter/material.dart';

class testeswitch extends StatefulWidget {
  @override
  _testeswitchState createState() => _testeswitchState();
}

class _testeswitchState extends State<testeswitch> {

  bool escolha = false;
  double escolha1 = 0 ;
  String label = "valor selecionado: ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Switch(value: true, onChanged: (bool valor){}),
            SwitchListTile(title: Text("receber notificacoes ? "),
                value: escolha, onChanged: (bool valor){
                  setState(() {
                    escolha = valor;
                  });
                }),
            Slider(value: escolha1,
                min:0,
                max: 10,
                label: label,
                divisions: 10,
                onChanged: (double valor){
                  setState(() {
                    escolha1 = valor;
                    label = "valor selecionado " + escolha1.toInt().toString();
                    print(escolha1);
              });
            })
          ],

        ),
      ),
    );
  }
}
