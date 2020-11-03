import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';

class Numeros extends StatefulWidget {
  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {

  AudioCache audioCache = AudioCache();

  _executar(String num) async {

    audioCache.play("audios/${num}.mp3");

  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,
      children: [
        GestureDetector(
          onTap: (){
            _executar("1");
          },
          child: Padding(padding: EdgeInsets.all(12),
            child: Image.asset("assets/imagens/1.png"),),
        ),
        GestureDetector(
          onTap: (){
            _executar("2");
          },
          child: Padding(padding: EdgeInsets.all(12),
            child: Image.asset("assets/imagens/2.png"),),
        ),
        GestureDetector(
          onTap: (){
            _executar("3");
          },
          child: Padding(padding: EdgeInsets.all(12),
            child: Image.asset("assets/imagens/3.png"),),
        ),
        GestureDetector(
          onTap: (){
            _executar("4");
          },
          child: Padding(padding: EdgeInsets.all(12),
            child: Image.asset("assets/imagens/4.png"),),
        ),
        GestureDetector(
          onTap: (){
            _executar("5");
          },
          child: Padding(padding: EdgeInsets.all(12),
            child: Image.asset("assets/imagens/5.png"),),
        ),
        GestureDetector(
          onTap: (){
            _executar("6");
          },
          child: Padding(padding: EdgeInsets.all(12),
            child: Image.asset("assets/imagens/6.png"),),
        )
      ],);
  }
}
