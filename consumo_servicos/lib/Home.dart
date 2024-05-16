import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  _recuperarCep() async {
    Uri url = Uri.parse("https://viacep.com.br/ws/01001000/json/");
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode( response.body );
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    print(
        "Resposta logradouro: ${logradouro} complemento: ${complemento} bairro: ${bairro} localidade: ${localidade}"
    );


    //print("resposta: " + response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: _recuperarCep,
                child: Text("Clique aqui"))
          ],
        ),
      ),
    );
  }
}
