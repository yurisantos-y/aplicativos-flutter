import 'package:flutter/material.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/youtube.png",
        width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print("acao: videocam");
              },
              icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              print("acao: pesquisa");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("acao: conta");
            },
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot),
              label: 'Em alta'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: 'Inscrições'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Biblioteca'
          ),
        ],
      ),
    );
  }
}
