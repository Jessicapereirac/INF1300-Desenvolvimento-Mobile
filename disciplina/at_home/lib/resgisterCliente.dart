import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'internacionalizacao/translate.dart';

class registerCliente extends StatefulWidget {
  @override
  _registerClienteState createState() => _registerClienteState();
}

class _registerClienteState extends State<registerCliente> {
  TextEditingController _ControllerNome = TextEditingController();
  TextEditingController _ControllerEmail = TextEditingController();
  TextEditingController _ControllerSenha = TextEditingController();
  TextEditingController _ControllerZipCode = TextEditingController();
  TextEditingController _ControllerNumero = TextEditingController();

  String escolha;
  bool termos = false;
  List<String> states = [
    "AC",
    "AL",
    "AP",
    "AM",
    "BA",
    "CE",
    "DF",
    "ES",
    "GO",
    "MA",
    "MT",
    "MS",
    "MG",
    "PA",
    "PB",
    "PR",
    "PE",
    "PI",
    "RJ",
    "RN",
    "RS",
    "RO",
    "RR",
    "SC",
    "SP",
    "SE",
    "TO"
  ];
  List<String> adminDistricts = ["Cidade"];
  String dropdownDistrictValue = "Cidade" ;
  String dropdownStateValue = "AC";

  Future<Map> getData(String uf) async {
    http.Response response = await http.get(
        "https://servicodados.ibge.gov.br/api/v1/localidades/estados/$uf/distritos");
    return json.decode("{\"data\": ${response.body}}");
  }

  Future dropdownStateChange(String newValue) async {
    Map resBody = await getData(newValue);
    adminDistricts = ["Cidade"];
    debugPrint("${resBody['data'].length}");
    setState(() {
      dropdownStateValue = newValue;
      for (Map m in resBody['data']) {
        adminDistricts.add(m['nome']);
      }
      dropdownDistrictValue = adminDistricts.first;
    });
    debugPrint("$adminDistricts");
  }

  dropdownDistrictChange(String newValue) {
    setState(() {
      dropdownDistrictValue = newValue;
    });
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
              fontSize: 25,
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          child: FutureBuilder(
              future: getData(dropdownStateValue),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      strokeWidth: 5.0,
                    ),
                  );
                } else if(snapshot.hasError) return Container();
                else {
                  return Container(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 60, bottom: 28),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 60,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1,
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "Nome Completo",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 3)),
                                        child: TextField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          onChanged: (String text) {},
                                          controller: _ControllerEmail,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 3)),
                                        child: TextField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          onChanged: (String text) {},
                                          controller: _ControllerEmail,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "Senha",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 3)),
                                        child: TextField(
                                          keyboardType: TextInputType.text,
                                          obscureText: true,
                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          onChanged: (String text) {},
                                          controller: _ControllerSenha,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "Endereço",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 0.0, 15.0, 0.0),
                                            child: buildDropdownButton(
                                                dropdownStateValue,
                                                states,
                                                dropdownStateChange),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 0.0, 10.0, 0.0),
                                            child: buildDropdownButton(
                                                dropdownDistrictValue,
                                                adminDistricts,
                                                dropdownDistrictChange),
                                          ),
                                          
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                                        child: TextField(
                                          keyboardType:
                                              TextInputType.number,
                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: "CEP",
                                            border: OutlineInputBorder(),
                                          ),
                                          onChanged: (String text) {},
                                          controller: _ControllerZipCode,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "Numero ( com DDD )",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 3)),
                                        child: TextField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          onChanged: (String text) {},
                                          controller: _ControllerEmail,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                          "Sexo:",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  value: "f",
                                                  activeColor: Colors.black,
                                                  groupValue:
                                                      escolha, // groupValue é do mesmo tipo do value
                                                  onChanged: (String es) {
                                                    setState(() {
                                                      escolha = es;
                                                    });
                                                  }),
                                              Text(
                                                "Feminino",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w300,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  value: "m",
                                                  activeColor: Colors.black,
                                                  groupValue:
                                                      escolha, // groupValue é do mesmo tipo do value
                                                  onChanged: (String es) {
                                                    setState(() {
                                                      escolha = es;
                                                    });
                                                  }),
                                              Text(
                                                "Masculino",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w300,
                                                  letterSpacing: 1,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                  value: "o",
                                                  activeColor: Colors.black,
                                                  groupValue:
                                                      escolha, // groupValue é do mesmo tipo do value
                                                  onChanged: (String es) {
                                                    setState(() {
                                                      escolha = es;
                                                    });
                                                  }),
                                              Text(
                                                "Outros",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w300,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Checkbox(
                                                  value: termos,
                                                  checkColor: Colors.white,
                                                  activeColor: Colors.black,
                                                  onChanged: (bool valor) {
                                                    setState(() {
                                                      termos = valor;
                                                    });
                                                  }),
                                              Expanded(
                                                  child: Text(
                                                "Aceito os termos e condições",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1,
                                                ),
                                              )),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 36),
                              child: GestureDetector(
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Register",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Roboto',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  //TODO
                                },
                              ),
                            )
                          ],
                        ),
                      ));
                }
              }),
        ));
  }
}

Widget buildDropdownButton(
    String dropdownValue, List<String> items, Function f) {
  return DropdownButton<String>(
    value: dropdownValue,
    icon: Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(color: Colors.black),
    underline: Container(
      height: 2,
      color: Colors.black,
    ),
    onChanged: (String newValue) {
      f(newValue);
    },
    items: items.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}
