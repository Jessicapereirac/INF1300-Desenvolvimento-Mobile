import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}



class _homeState extends State<home> {

  TextEditingController _Controller = TextEditingController();
  String resultado ="";

  recuperarCEP() async {

    int cep = int.tryParse(_Controller.text);

    String url = "https://viacep.com.br/ws/" + cep.toString() + "/json/"; // /cep/json/
    http.Response response;
    response = await http.get(url);
    Map<String, dynamic> resp = json.decode(response.body);

    setState(() {

      resultado = resp["logradouro"] + "- " + resp["complemento"] + "- " + resp["bairro"];

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acessar CEP"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 25,),
              decoration: InputDecoration(labelText: "ex 25120456 "),
              onChanged: ( String text){},
              controller: _Controller ,
            ),
            Text(resultado),
            RaisedButton(child:
            Text("Recuperar CEP"),
                onPressed: recuperarCEP)
          ],
        ),
      ),
    );
  }
}
