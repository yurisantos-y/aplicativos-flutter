import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _preco = "0";

  void _recuperarPreco() async {
    Uri url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(url);
    
    Map<String, dynamic> retorno = json.decode( response.body );
    setState(() {
      _preco = retorno["ARS"]["buy"].toString();
    });
    print("Resultado: " + retorno.toString() );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/bitcoin.png"),
              Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    "\$" + _preco,
                    style: TextStyle(
                      fontSize: 35
                    ),
                  ),
              ),
              ElevatedButton(
                  onPressed: _recuperarPreco,
                  child: Text(
                    "Atualizar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                  //padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  //padding: MaterialStateProperty<EdgeInsetsGeometry?>EdgeInsets.fromLTRB(30, 15, 30, 15);
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.fromLTRB(30, 15, 30, 15),
                  ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
