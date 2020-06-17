import 'package:camera/camera.dart';
import 'package:com/take_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:com/professional_list.dart';

import 'internacionalizacao/translate.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();

}

class _NavigationState extends State<Navigation> {
  void push_professionalListPage(String service) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => professional_List(service)));
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
                color: Colors.black, fontSize: 25),
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
                          CircleAvatar(

                            backgroundColor: Colors.grey,
                            backgroundImage: null,
                            radius: 50.0,
                          ),
                          Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 100.0,

                          )
                        ],
                      ),
                      onTap: (){

                        showCupertinoModalPopup(context: context, builder: (BuildContext context)  =>
                            CupertinoActionSheet (
                                title: Text(AppTranslate(context).text('edit_foto'),
                                  style:
                                  TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Roboto'
                                  )),

                                actions: <Widget>[
                                  CupertinoActionSheetAction(
                                    child: Text(AppTranslate(context).text('camera')),
                                    onPressed: () async {

                                      principal();

                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(AppTranslate(context).text('galeria')),
                                    onPressed: () {
                                      Navigator.pop(context, 'galeria');
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

                            ));

                      },
                    )
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Nome usuário",
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
                      this.push_professionalListPage(AppTranslate(context).text('fisio'));
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
                              this.push_professionalListPage("Shiatsu");
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
                      this.push_professionalListPage("Shiatsu");
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
                                this.push_professionalListPage(AppTranslate(context).text('quiro'));
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
}


Future<void> principal() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  return TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera
      );
}

