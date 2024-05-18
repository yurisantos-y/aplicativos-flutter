import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {
    try {
      http.Response response = await http.get(Uri.parse(_urlBase + "/posts"));

      if (response.statusCode == 200) {
        var dadosJson = json.decode(response.body);

        List<Post> postagens = List<Post>.empty();
        for (var post in dadosJson) {
          if (post["userId"] != null &&
              post["id"] != null &&
              post["title"] != null &&
              post["body"] != null) {
            Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
            postagens.add(p);
          } else {
            print("Erro: Post com dados incompletos");
          }
        }
        return postagens;
      } else {
        throw Exception("Falha ao carregar posts: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao carregar posts: $e");
      throw Exception("Erro ao carregar posts");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("Erro ao carregar posts");
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    if (snapshot.data == null) return Container();

                    final Post post = snapshot.data![index];

                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.id.toString()),
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}
