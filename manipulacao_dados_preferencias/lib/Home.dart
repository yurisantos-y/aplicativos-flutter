import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _textoSalvo = "Nada Salvo!";
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado );

    print("operacao (salvar): $valorDigitado");

  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString("nome")!;
    });

    print("operacao (recuperar): $_textoSalvo");

  }

  _remover() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");

    print("operacao (removeu)");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
             Text(_textoSalvo,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                    onPressed: _salvar,
                    child: Text("Salvar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
                    ),
                ),
                ElevatedButton(
                  onPressed: _recuperar,
                  child: Text("Recuperar",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
                  ),
                ),
                ElevatedButton(
                  onPressed: _remover,
                  child: Text("Remover",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
