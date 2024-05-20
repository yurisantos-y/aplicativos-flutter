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

        List<Post> postagens = [];
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

  _post() async {
    var corpo = json.encode({
      "userID": 120,
      "id": null, // Usually servers generate IDs automatically
      "title": "Titulo",
      "body": "Corpo da postagem"
    });

    http.Response response = await http.post(
      Uri.parse(_urlBase + "/posts"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

  _put() async {
    var corpo = json.encode({
      "userID": 120,
      "id": null, // Usually servers generate IDs automatically
      "title": "Titulo alterado",
      "body": "Corpo da postagem alterada"
    });

    http.Response response = await http.patch(
      Uri.parse(_urlBase + "/posts/2"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

  _patch() async {
    var corpo = json.encode({
      "userID": 120,
      "id": null, // Usually servers generate IDs automatically
      "title": "Titulo",
      "body": "Corpo da postagem"
    });

    http.Response response = await http.post(
      Uri.parse(_urlBase + "/posts"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }

  _delete() async {
    var corpo = json.encode({
      "userID": 120,
      "id": null, // Usually servers generate IDs automatically
      "title": "Titulo",
      "body": "Corpo da postagem"
    });

    http.Response response = await http.delete(
      Uri.parse(_urlBase + "/posts/2"),
    );

    if( response.statusCode == 200 ) {
      //sucesso

    }else {

    }

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: (){
                      _post();
                    },
                    child: Text("Salvar")
                ),
                ElevatedButton(
                    onPressed: (){
                      //_put(); -> Precisa enviar o método inteiro para atualizar
                      // patch -> não precisa enviar tudo, bom para fazer troca de senha, usuário...
                      _patch();
                    },
                    child: Text("Atualizar")
                ),
                ElevatedButton(
                    onPressed: (){
                      _delete();
                    },
                    child: Text("Remover")
                ),
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Post>>(
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
            ))
          ],
        ),
      ),
    );
  }
}
