/*
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  bool play = true;

  double volume = 0.5;

  _executar() async {

    audioPlayer.setVolume(volume);

    if(play){
      audioPlayer = await audioCache.play("audios/musica.mp3");
      play = false;
    }else{
      audioPlayer.resume();
    }
  }

  _pausar() async {

    audioPlayer.pause();

  }

  _parar() async {

    audioPlayer.stop();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Aprendendo inglês"),
      backgroundColor: Colors.amber,),
      body: Column(
        children: [

          Slider(value: volume,
              min: 0,
              max: 1,
              divisions: 10,
              onChanged: (novovolume){

            setState(() {
              volume = novovolume;
            });
            audioPlayer.setVolume(novovolume);

              }),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: (){
                    _executar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: (){
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: (){
                    _parar();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

 */