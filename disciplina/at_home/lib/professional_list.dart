import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;


import 'internacionalizacao/translate.dart';
import 'maisDetalhes.dart';


class professional_List extends StatefulWidget {
  String _service;

  professional_List(this._service);

  @override
  _professional_listState createState() => _professional_listState(_service);
}

class _professional_listState extends State<professional_List> {
  String _service;
  List<String> _name = ["Daniele Lima de Souza", "Ricardo Heffer Matheus","Gabriel de Souza Heffer Matheus","Paulo Vitor Dias Linhares"];
  List<double> _grade = [4.7, 4.4,5.0,4.1];
  List<String> _imagens = ["med1.jpg", "med2.jpg", "med3.jpeg", "med1.jpg" ];
  _professionalListBiulder _professionalBiulder;

  _professional_listState(this._service) {
    _professionalBiulder = new _professionalListBiulder(_name, _grade, _imagens);
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
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
            child: Text(
              _service,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Roboto', fontSize: 35),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: _professionalBiulder.professional_builder,
            itemCount: this._name.length,
          ))
        ],
      ),
    );
  }
}

class _professionalListBiulder {
  List<String> name;
  List<double> grade;
  List<String> imagens;
  String number = "21981144225"; //TODO colocar numero do medico


  _professionalListBiulder(this.name, this.grade, this.imagens);



  @override
  Widget professional_builder(BuildContext context, int index) {
    double grade_index = this.grade[index];



    void abrirDetalhes(int v){

      if( v == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => maisDetalhes(1, name[v-1])));
      }
      else if ( v == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => maisDetalhes(2, name[v-1])));
      }
      else if ( v == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => maisDetalhes(3, name[v-1])));
      }
      else if ( v == 4) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => maisDetalhes(4, name[v-1])));
      }

      else
        print("erro");

    }
    _launchURL() async {
      // Replace 12345678 with your tel. no.

      android_intent.Intent()
        ..setAction(android_action.Action.ACTION_CALL)
        ..setData(Uri(scheme: "tel", path: "12345678"))
        ..startActivity().catchError((e) => print(e));
    }


    return ListTile(
        leading: CircleAvatar(
          child: GestureDetector(
            child: ClipOval(
                child: Image.asset("images/"+ imagens[index],

                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,)
            ),
            onTap: (){

              showCupertinoModalPopup(context: context,
                builder: (BuildContext context)  => CupertinoActionSheet (
                    title: Text(this.name[index]),
                    message: GestureDetector(
                      child: Text(AppTranslate(context).text('detalhes'),

                        style:
                        TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 14,
                            fontFamily: 'Roboto'
                        ),
                      ),
                        onDoubleTap: () => abrirDetalhes(index+1)
                    ),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: Text(AppTranslate(context).text('ligar')),

                        onPressed: () {
                          print("oii");
                          launch("tel://"+number);
                          //TODO alterar para telefone do banco

                        }

                      ),
                      CupertinoActionSheetAction(
                        child: Text(AppTranslate(context).text('email')),
                        onPressed: () {
                          print("oii");
                          launch("mailto:jessicapereiraa2@gmail.com");
                          //TODO alterar para email do banco do medico
                        },
                      )
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text(AppTranslate(context).text('cancelar')),
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                    )
                ),

              );

            },
          ),
          radius: 30,


        ),
        title: Text(
          this.name[index],
          style: TextStyle(
              color: Colors.black, fontFamily: 'Roboto', fontSize: 15),
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellowAccent),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0.0, 0.0, 0.0),
              child: Text(
                "$grade_index",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Roboto', fontSize: 10),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 190),
              child: GestureDetector(
                child: Icon(Icons.share, color: Colors.black),
                onTap: ()
                {
                  print("oii");
                  Share.share(AppTranslate(context).text('share')+ number);
                },
              ),
            )

          ],


        ),

        );
  }
}



