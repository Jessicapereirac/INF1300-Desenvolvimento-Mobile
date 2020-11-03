import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  
  VideoPlayerController _controller;
  
  @override
  void initState() {

    super.initState();
    _controller = VideoPlayerController.asset("asset/exemplo.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        //_controller.play();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Text("Pressione Play"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
          ),
          onPressed: (){
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play() ;
            });
          }
      ),
    );
  }
}
