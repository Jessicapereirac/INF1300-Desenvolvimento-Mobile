import 'package:flutter/material.dart';
import 'package:com/professional_list.dart';

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
                        child: Text("editar perfil",
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
                        Text("Fisioterapia",
                            style: TextStyle(
                                color: Colors.black45,
                                fontFamily: "Roboto",
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    onTap: () {
                      this.push_professionalListPage("Fisioterapia");
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
                                this.push_professionalListPage("Quiropraxia");
                              },
                            )),
                        Text("Quiropraxia",
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
