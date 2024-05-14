import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({super.key});

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double valor = 0;
  String label = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[

            Slider(
                value: valor,
                min: 0,
                max: 10,
                label: label,
                divisions: 10,
                onChanged: (double novoValor) {
                  if(novoValor != null){
                    setState(() {
                      valor = novoValor;
                      label = novoValor.toString();
                    });
                  }
                  //print("Valor selecionado: " + novoValor.toString() );
                }
            ),

           TextButton(
               onPressed: () {
                 print("Valor selecionado: " + valor.toString() );

               },
               child: Text(
                 "Salvar",
                 style: TextStyle(
                   fontSize: 20
                 ),
               ),
           )

          ],
        ),
      ),
    );
  }
}
