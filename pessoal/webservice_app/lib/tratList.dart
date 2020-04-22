import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {

  List itens = [];



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("Lista av"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, indice){

            return ListTile(
              onTap: (){
                showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text(itens[indice]["titulo"]),
                    titlePadding: EdgeInsets.all(12),
                    titleTextStyle: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,

                    ),
                    content: Text(itens[indice]["descricao"]) ,
                    actions: <Widget>[
                      FlatButton(
                        onPressed: (){
                          Navigator.pop(context);

                          setState(() {
                            itens.removeAt(indice);
                            print(itens);
                          });



                        },
                        child: Text("sim"),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.pop(context);

                        },
                        child: Text("nao",style: TextStyle(
                          color: Colors.red
                        ),),
                      )
                    ],
                  );
                });
              },
              title: Text( itens[indice]["titulo"]),
              subtitle: Text(itens[indice]["descricao"]),
            );

          },


        )
        ),
      );
  }
}
