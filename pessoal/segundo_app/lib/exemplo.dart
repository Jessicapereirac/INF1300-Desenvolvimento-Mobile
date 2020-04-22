import 'package:flutter/material.dart';

class exemplo extends StatefulWidget {
  @override
  _exemploState createState() => _exemploState();
}

class _exemploState extends State<exemplo> {

  TextEditingController _ControllerAlcool = TextEditingController();
  TextEditingController _ControllerGasolina = TextEditingController();

  var resultado = " ";

  void limpar(){

    _ControllerGasolina.text = " ";
    _ControllerAlcool.text = " ";

  }

  void calcular (){

    double alcool = double.tryParse(_ControllerAlcool.text);
    double gasolina = double.tryParse(_ControllerGasolina.text);
    var result;

    if (alcool == null || gasolina == null)
      result = "Número invalido";

    else if (alcool/gasolina >= 0.7)
      result = "Melhor abastecer com gasolina";

    else
      result = "Melhor abastecer com alcool";

    setState(() {
        resultado = result;
      });

    limpar();



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Entrada de Dados"
        ),
      ),
      body: Container(

        child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top:15, bottom: 32),
            child: Image.asset("images/logo.png")
        ),
        Padding(padding: EdgeInsets.only(bottom: 10),
            child: Text("Saiba qual a melhor opção para abastecimento do seu carro",
              style: TextStyle( fontSize: 30), textAlign: TextAlign.center,)
        ),
        TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 25,),
          decoration: InputDecoration(labelText: "Preço Alcool, ex: 1.59 "),
          onChanged: ( String text){},
          controller: _ControllerAlcool ,
        ),
        TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 25),
          decoration: InputDecoration(labelText: "Preço Gasolina, ex: 3.15 "),
          onChanged: ( String text){},
          controller: _ControllerGasolina ,
        ),
        Padding(padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
                child:Text("Calcular",
                  style: TextStyle(
                      fontSize: 20
                  ),),
                color: Colors.blue,
                onPressed: calcular
            )
        ),
        Padding(padding: EdgeInsets.only(top: 20),
          child: Text(resultado,
            style: TextStyle(
                fontSize: 20
            ), textAlign: TextAlign.center,),
        )

      ],
    )),
    )
    );
  }
}
