import 'package:flutter/material.dart';

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
  _professionalListBiulder _professionalBiulder;

  _professional_listState(this._service) {
    _professionalBiulder = new _professionalListBiulder(_name, _grade);
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

  _professionalListBiulder(this.name, this.grade);

  @override
  Widget professional_builder(BuildContext context, int index) {
    double grade_index = this.grade[index];
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("images/gatineo.jpg"),
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
            )
          ],
        ),
        onTap: (){print("tap");},
        );
  }
}
