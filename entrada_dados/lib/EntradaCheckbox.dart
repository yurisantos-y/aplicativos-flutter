import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({super.key});

  @override
  State<EntradaCheckbox> createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _comidaBrasileira = false;
  bool _comidaMexicana   = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            CheckboxListTile(
              title: Text("Comida Brasileira"),
                subtitle: Text("A melhor comida do mundo!!!"),
                activeColor: Colors.red,
                selected: true,
                value: _comidaBrasileira,
                onChanged: (bool? valor) {
                if (valor != null) {
                  setState(() {
                    _comidaBrasileira = valor;
                  });
                }
                }),

            CheckboxListTile(
                title: Text("Comida Mexicana"),
                subtitle: Text("A melhor comida do mundo!!!"),
                activeColor: Colors.red,
                selected: true,
                value: _comidaMexicana,
                onChanged: (bool? valor) {
                  if (valor != null) {
                    setState(() {
                      _comidaMexicana = valor;
                    });
                  }
                }),
            
            TextButton(
                onPressed: (){
                  print("Comida Brasileira: " + _comidaBrasileira.toString() +
                  " Comida Mexicana: " + _comidaMexicana.toString() );
                },
                child: Text("Salvar",
                  style: TextStyle(
                    fontSize: 20
                ),
              ),
            )


            /*
            Text("Comida Brasileira"),
            Checkbox(
              value: _estaSelecionado,
              onChanged: (bool){
                setState(() {
                  _estaSelecionado =
                });

            },)             */
          ],
        ),
      ),
    );
  }
}
