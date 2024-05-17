import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<Map> _recuperarPreco() async {
    Uri url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(url);
    return json.decode( response.body );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: _recuperarPreco(),
        builder: (context, snapshot){
          String resultado;
          switch(snapshot.connectionState){
            case ConnectionState.none :
              print("conexao none");
              break;
            case ConnectionState.waiting :
              print("conexao waiting");
              resultado = "Carregando...";
              break;
            case ConnectionState.active :
              print("conexao active");
              break;
            case ConnectionState.done :
              if (snapshot.hasData) {
                double valor = snapshot.data?["BRL"] ["buy"];
                return Text("Preço Bitcoin: ${valor.toString()}");

              }else {
                return Text("Carregando...");
              }
          }
          return Container();
        }
    );
  }
}
