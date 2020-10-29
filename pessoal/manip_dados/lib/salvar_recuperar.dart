import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  String _texto = "Nada salvo";
  TextEditingController _textodigitado = TextEditingController();

  _salvar() async {
    String valor = _textodigitado.text;

    final pref = await SharedPreferences.getInstance();
    await pref.setString("nome", valor);

  }

  _recuperar() async {

    final pref = await SharedPreferences.getInstance();
    setState(() {
      _texto =  pref.getString("nome") ?? "Nada salvo";
    });

  }

  _remover() async {

    final pref = await SharedPreferences.getInstance();
    pref.remove("nome");
    setState(() {
      _texto =  "Nada salvo";
    });


  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(_texto,
              style: TextStyle(
                  fontSize: 20
              ),),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "digite algo"
              ),
              controller: _textodigitado,
            ),
            Row(

              children: [
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(9),
                    child: Text("Salvar",
                      style: TextStyle(
                          fontSize: 10
                      ),),
                    onPressed: _salvar),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(9),
                    child: Text("Recuperar",
                      style: TextStyle(
                          fontSize: 10
                      ),),
                    onPressed: _recuperar),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(9),
                    child: Text("Remover",
                      style: TextStyle(
                          fontSize: 10
                      ),),
                    onPressed: _remover)
              ],
            )
          ],
        ),
      ),

    );
  }
}
