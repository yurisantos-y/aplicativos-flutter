import 'package:flutter/material.dart';


class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({super.key});

  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUsuario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            Text("Masculino"),
            Radio(
                value: "m",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha){
                  if(escolha!= null) {
                    setState(() {
                      _escolhaUsuario = escolha;
                    });
                    print("resultado: " + escolha);
                  }
                }),

            Text("Feminino"),
            Radio(
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  if(escolha!= null) {
                    setState(() {
                      _escolhaUsuario = escolha;
                    });
                    print("resultado: " + escolha);
                  }
                })
          ],
        ),
      ),
    );
  }
}
