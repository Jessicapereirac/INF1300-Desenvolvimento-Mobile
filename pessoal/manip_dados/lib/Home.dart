import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  List _lista =[];
  TextEditingController _controllerTarefa = TextEditingController();
  Map<String, dynamic> _ultimaTarefa = Map();

  _salvarTarefa(){

    String textoDigitado = _controllerTarefa.text;

    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _lista.add(tarefa);
    });

    _salvarArquivo();
    _controllerTarefa.text = "";

  }


  _salvarArquivo() async {

    var arquivo = await _getArquivo();

    String dados = jsonEncode(_lista);
    arquivo.writeAsString(dados);

  }


  _lerArquivo() async {

    try{
      var arquivo = await _getArquivo();
      return arquivo.readAsString();

    }catch(e){
      return null;
    }

  }

  Future<File> _getArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");

  }

  Widget criarItem(context,index){

    return Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
            color: Colors.red,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete,
                    color: Colors.white),
              ],
            )
        ),
        onDismissed:(direction){

          _ultimaTarefa = _lista[index];

         setState(() {
           _lista.removeAt(index);
         });
         _salvarArquivo();

         final snackbar = SnackBar(
           //backgroundColor: Colors.grey,
           duration: Duration(seconds: 5),
           content: Text("Deseja desfazer a ação ?"),
         action: SnackBarAction(
           label: "Desfazer",
           onPressed: (){
            setState(() {
              _lista.insert(index,_ultimaTarefa);
            });

             _salvarArquivo();

           }
         ),);
         Scaffold.of(context).showSnackBar(snackbar);
        },
        key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
        child: CheckboxListTile(
          title: Text(_lista[index]["titulo"]),
          value: _lista[index]["realizada"],
          onChanged: (novovalor){
            setState(() {
              _lista[index]["realizada"] = novovalor;
            });
            _salvarArquivo();
          },
        ));
  }

  @override
  void initState(){
    super.initState();

    _lerArquivo().then((dados) {
      setState(() {
        _lista = json.decode(dados);
      });
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: _lista.length,
                    itemBuilder: criarItem
                    ))
          ],
        ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 15,
        icon: Icon(Icons.playlist_add),
        label: Text("adicionar"),
        onPressed: (){
          showDialog(context: context,
              builder:(context){
            return AlertDialog(
            title: Text("adicionar tarefa"),
            content: TextField(
              controller: _controllerTarefa,
              decoration: InputDecoration(
              labelText: "Digite sua tarefa"),
              onChanged: (Text){},),

            actions: [
               FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("cancelar")),

                FlatButton(
                 onPressed: (){
                   _salvarTarefa();
                   Navigator.pop(context);
                 },
                 child: Text("salvar"))

                ]

            );
    });
        }
        
      )
      
    );
  }
}
