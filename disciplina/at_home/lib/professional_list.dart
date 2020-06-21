import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;
import 'dart:io';
import 'package:com/helpers/professional_helper.dart';
import 'internacionalizacao/translate.dart';
import 'maisDetalhes.dart';

class professional_List extends StatefulWidget {
  String _service;

  professional_List(this._service);

  @override
  _professional_listState createState() => _professional_listState(_service);
}

class _professional_listState extends State<professional_List> {
  _professionalListBiulder _professionalBiulder;
  String _service;

  _professional_listState(this._service);

  Future getProfessionals() async {
    ProfessionalHelper prof_db = ProfessionalHelper();
    List<Map> maps = await prof_db.getProfessionals(_service);
    List<Professional> professional_list = [];
    maps.forEach((map) => professional_list.add(Professional.fromMap(map)));
    debugPrint("$professional_list");
    _professionalBiulder = new _professionalListBiulder(professional_list);
    if (_service == "F")
      _service = AppTranslate(context).text('fisio');
    else if (_service == "S")
      _service = "Shiatsu";
    else
      _service = AppTranslate(context).text('quiro');
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
            child: FutureBuilder(
                future: getProfessionals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                        strokeWidth: 5.0,
                      ),
                    );
                  } else if (snapshot.hasError)
                    return Container();
                  else {
                    return Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                          child: Text(
                            _service,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 35),
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemBuilder:
                              _professionalBiulder.professional_builder,
                          itemCount: _professionalBiulder.length,
                        ))
                      ],
                    );
                  }
                })));
  }
}

class _professionalListBiulder {
  List<Professional> professionals;
  int length;

  _professionalListBiulder(List professionals) {
    this.professionals = professionals;
    this.length = professionals.length;
  }

  String gender(int index, BuildContext context) {
    if (this.professionals[index].sex == "F")
      return AppTranslate(context).text('fem');
    else if (this.professionals[index].sex == "M") return AppTranslate(context).text('mas');
    return AppTranslate(context).text('outro');
  }

  getImageRef(int index) {
    List arr = this.professionals[index].img.split("\\");
    return arr.last;
  }

  @override
  Widget professional_builder(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: GestureDetector(
          child: ClipOval(
              child: Image.asset(
            "images/" + getImageRef(index),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          )),
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                  title: Text(this.professionals[index].name),
                  message: GestureDetector(
                      child: Text(
                        AppTranslate(context).text('detalhes'),
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 18,
                            fontFamily: 'Roboto'),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => maisDetalhes(this.professionals[index])));
                      }),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                        child: Text(AppTranslate(context).text('ligar')),
                        onPressed: () {
                          launch("tel://" + this.professionals[index].phone);
                        }),
                    CupertinoActionSheetAction(
                      child: Text(AppTranslate(context).text('email')),
                      onPressed: () {
                        launch(this.professionals[index].email);
                      },
                    )
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text(AppTranslate(context).text('cancelar')),
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                  )),
            );
          },
        ),
        radius: 30,
      ),
      title: Text(
        this.professionals[index].name,
        style:
            TextStyle(color: Colors.black, fontFamily: 'Roboto', fontSize: 15),
      ),
      subtitle: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0.0, 0.0, 0.0),
            child: Text(
              gender(index, context),
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Roboto', fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 190),
            child: GestureDetector(
              child: Icon(Icons.share, color: Colors.black),
              onTap: () {
                Share.share(AppTranslate(context).text('share') +
                    this.professionals[index].phone);
              },
            ),
          )
        ],
      ),
    );
  }
}
