import 'package:app7_youtube/model/Video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const CHAVE_API_YOUTUBE = "AIzaSyB4Yy02jzdMzIGCZW3jrWiyuT0-VwQBik4";
const ID_CANAL = "UCFxjZDrLCOCHkUCu632AmMQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{
  Future<List<Video>> pesquisar (String pesquisa) async{


    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_API_YOUTUBE"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );

    if(response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode(response.body);


      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      return videos;

    }else{
      print("deu ruim!" );
    }

  }
}