import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class maisDetalhes extends StatefulWidget {
  int valor = 0;
  String nome = "";
  maisDetalhes(this.valor, this.nome);

  @override
  _maisDetalhesState createState() => _maisDetalhesState(valor);
}

class _maisDetalhesState extends State<maisDetalhes> {
  String url = "https://swapi.dev/api/people/";
  int valor;
  String data = "";

  _maisDetalhesState(this.valor) {
    this.url = url + "$valor/";
    getSWData();
  }

  Future<String> getSWData() async {
    var res = await http.get(url);
    setState(() {
      var resBody = json.decode(res.body);
      String gender = resBody['gender'];
      String hair_color = resBody['hair_color'];
      String mass = resBody['mass'];
      String height = resBody['height'];
      data =
          "genero = $gender\ncor do cabelo = $hair_color\nmassa = $mass\naltura = $height";
    });
    return "Success!";
  }

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
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        "images/med" + widget.valor.toString() + ".jpg",
                        height: 180,
                        width: 180,
                      ),
                      Expanded(
                          child: Text(
                        "Mais detalhes sobre o medico: " + widget.nome,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                    ],
                  ),
                ),
                Text(
                  "mais informações do profissional:\n$data",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
