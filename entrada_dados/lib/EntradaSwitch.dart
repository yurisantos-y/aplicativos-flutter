import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({super.key});

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[

            /*Switch(
                value: _escolhaUsuario,
                onChanged: (bool? valor) {
                  if(valor != null) {
                    setState(() {
                      _escolhaUsuario = valor;
                    });
                  }
                }
            ),*/
            Text("Receber notificações?")
          ],
        ),
      ),
    );
  }
}
