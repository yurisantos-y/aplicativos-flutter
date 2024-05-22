import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyBgepkDqOBISocKqKnaZrHhcSyw6AQCpwc";
const ID_CANAL = "UCB_qr75-ydFVKSF9Dmo6izg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<void> pesquisa(String pesquisar) async {
    final response = await http.get(
      Uri.parse(URL_BASE + "search").replace(queryParameters: {
        'part': 'snippet',
        'type': 'video',
        'maxResults': '20',
        'order': 'date',
        'key': CHAVE_YOUTUBE_API,
        'channelId': ID_CANAL,
        'q': pesquisar,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      if (dadosJson["items"] != null && dadosJson["items"].isNotEmpty) {
        print("Resultado: " + dadosJson["items"][0]["snippet"]["title"]);
      } else {
        print("Nenhum resultado encontrado.");
      }
    } else {
      print("Falha na busca: ${response.statusCode}");
    }
  }
}
