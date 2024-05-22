import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos() {
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder<List<Video>>(
    future: _listarVideos(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
          return Center(
            child: CircularProgressIndicator(),
          );
          break;
        case ConnectionState.active:
        case ConnectionState.done:
          if (snapshot.hasData) {


            return Center(
              child: Text("Erro ao buscar vídeos!"),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  Video video = _listarVideos()[index];
                  return ListTile(
                    title: Text(video.title),
                    subtitle: Text(video.description),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 3,
                  color: Colors.red,
                ),
                itemCount: snapshot.data?.length ?? 0);
          } else {
            return Center(
              child: Text("Nenhum vídeo encontrado."),
            );
          }
      }
    });
}
}
