import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBgepkDqOBISocKqKnaZrHhcSyw6AQCpwc";
const ID_CANAL = "UCB_qr75-ydFVKSF9Dmo6izg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  FutureOr<List<Video>> pesquisar(String pesquisa) async {
    final response = await http.get(
      Uri.parse(URL_BASE + "search").replace(queryParameters: {
        'part': 'snippet',
        'type': 'video',
        'maxResults': '20',
        'order': 'date',
        'key': CHAVE_YOUTUBE_API,
        'channelId': ID_CANAL,
        'q': pesquisa,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      if (dadosJson["items"] != null && dadosJson["items"].isNotEmpty) {
        List<Video> videos = dadosJson["items"].map<Video>(
                (map) {
              return Video.fromJson(map);
            }
        ).toList();
        return videos;
      } else {
        print("Nenhum resultado encontrado.");
      }
    } else {
      print("Falha na busca: ${response.statusCode}");
    }

    // Added this line to ensure a return value
    return []; // Return an empty list if no results are found
  }
}
