import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class bichos extends StatefulWidget {
  @override
  _bichosState createState() => _bichosState();
}

class _bichosState extends State<bichos> {

  AudioCache audioCache = AudioCache();

  _executar(String bicho) async {

    audioCache.play("audios/${bicho}.mp3");

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioCache.loadAll(["cao.mp3","leao.mp3","vaca.mp3","ovelha.mp3","gato.mp3","macaco.mp3",]);
  }



  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,
    //childAspectRatio: MediaQuery.of(context).size.aspectRatio*1,
    children: [
      GestureDetector(
        onTap: (){

          _executar("cao");
        },
        child: Padding(padding: EdgeInsets.all(12),
          child: Image.asset("assets/imagens/cao.png"),),
      ),
      GestureDetector(
        onTap: (){

          _executar("leao");
        },
        child: Padding(padding: EdgeInsets.all(12),
          child: Image.asset("assets/imagens/leao.png"),),
      ),
      GestureDetector(
        onTap: (){

          _executar("macaco");
        },
        child: Padding(padding: EdgeInsets.all(12),
          child: Image.asset("assets/imagens/macaco.png"),),
      ),
      GestureDetector(
        onTap: (){

          _executar("vaca");
        },
        child: Padding(padding: EdgeInsets.all(12),
          child: Image.asset("assets/imagens/vaca.png"),),
      ),
      GestureDetector(
        onTap: (){

          _executar("ovelha");
        },
        child: Padding(padding: EdgeInsets.all(12),
          child: Image.asset("assets/imagens/ovelha.png"),),
      ),
      GestureDetector(
        onTap: (){

          _executar("gato");
        },
        child: Padding(padding: EdgeInsets.all(12),
          child: Image.asset("assets/imagens/gato.png"),),
      )
    ],);
  }
}
