import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';
import 'package:com/helpers/professional_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'internacionalizacao/translate.dart';

class descricao extends StatefulWidget {
  Professional professional;

  descricao(this.professional);

  @override
  _descricaoState createState() => _descricaoState(this.professional);

}

class _descricaoState extends State<descricao> {
  Professional professional;

  _descricaoState(this.professional);

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
        body: Container(),);
        /*para colocar imagem : Image.assets(professional.img)
          para colocar a descrição: professional.desc1 e professional.desc2
          para colocar nota: professional.grade */
  }
}
