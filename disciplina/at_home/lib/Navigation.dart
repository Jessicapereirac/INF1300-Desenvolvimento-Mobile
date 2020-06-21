import 'dart:io';
import 'package:com/helpers/client_helper.dart';
import 'package:camera/camera.dart';
import 'package:com/take_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com/professional_list.dart';
import 'package:image_picker/image_picker.dart';

import 'internacionalizacao/translate.dart';

class Navigation extends StatefulWidget {
  Client client;

  Navigation(this.client);
  @override
  _NavigationState createState() => _NavigationState(this.client);
}

class _NavigationState extends State<Navigation> {
  Client client;
  ClientHelper client_db = ClientHelper();

  _NavigationState(this.client);

  void push_professionalListPage(String service) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => professional_List(service)));
  }

  File imagemTemp;

  Future<void> pegar_imagemgaleria() async {
    imagemTemp = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      client.img = imagemTemp.path;
      client_db.updateClient(client);

    });
  }

  Future<void> pegar_imagemcamera() async {
    imagemTemp = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      client.img = imagemTemp.path;
      client_db.updateClient(client);
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
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.menu), onPressed: () {}, color: Colors.black),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 30.0),
                      child: GestureDetector(
                        child: Stack(
                          children: <Widget>[
                            ClipOval(
                                child: Material(
                              color: Colors.grey,
                              child: client.img != null
                                  ? Image.file(
                                      File(client.img),
                                      width: 105,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    )
                                  : Center(
                                      child: Icon(
                                        Icons.person_outline,
                                        color: Colors.white,
                                        size: 100.0,
                                      ),
                                    ),
                            )),
                          ],
                        ),
                        onTap: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoActionSheet(
                                      title: Text(
                                          AppTranslate(context)
                                              .text('edit_foto'),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontFamily: 'Roboto')),
                                      actions: <Widget>[
                                        CupertinoActionSheetAction(
                                          child: Text(AppTranslate(context)
                                              .text('camera')),
                                          onPressed: () async {
                                            pegar_imagemcamera();
                                          },
                                        ),
                                        CupertinoActionSheetAction(
                                          child: Text(AppTranslate(context)
                                              .text('galeria')),
                                          onPressed: () {
                                            pegar_imagemgaleria();
                                          },
                                        )
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        child: Text(AppTranslate(context)
                                            .text('cancelar')),
                                        isDefaultAction: true,
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      )));
                        },
                      )),
                  Column(
                    children: <Widget>[
                      Text(
                        client.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontSize: 20.0),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(AppTranslate(context).text('edit_profile'),
                            style: TextStyle(color: Colors.lightBlue)),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              'https://www.tuiuti.edu.br/hs-fs/hubfs/fisioterapia-utp-2.jpg?width=1000&name=fisioterapia-utp-2.jpg',
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        Text(AppTranslate(context).text('fisio'),
                            style: TextStyle(
                                color: Colors.black45,
                                fontFamily: "Roboto",
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    onTap: () {
                      this.push_professionalListPage('F');
                    },
                  ),
                  GestureDetector(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: GestureDetector(
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                'https://essenciayoga.com.br/resources/img/beneficios-do-shiatsu.jpg',
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                            onTap: () {
                              this.push_professionalListPage("S");
                            },
                          ),
                        ),
                        Text("Shiatsu",
                            style: TextStyle(
                                color: Colors.black45,
                                fontFamily: "Roboto",
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    onTap: () {
                      this.push_professionalListPage("S");
                    },
                  ),
                  GestureDetector(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: GestureDetector(
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                  'https://www.hipolabor.com.br/blog/wp-content/uploads/2018/01/153997-o-que-e-e-quais-sao-os-beneficios-da-quiropraxia-770x400.jpg',
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                margin: EdgeInsets.all(10),
                              ),
                              onTap: () {
                                this.push_professionalListPage('Q');
                              },
                            )),
                        Text(AppTranslate(context).text('quiro'),
                            style: TextStyle(
                                color: Colors.black45,
                                fontFamily: "Roboto",
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  cameras() async {
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();

    return cameras.first;
  }
}
