import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaTarefas = ["Ir ao mercado", "estudar", "Academia"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas",
        style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Adicionar Tarefa"),
              content: TextField(
                decoration: InputDecoration(
                  labelText: "Digite sua tarefa"
                ),
                onChanged: (text){

                },
              ),
              actions: <Widget>[
                ElevatedButton(onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                ),
                ElevatedButton(onPressed: (){

                },
                  child: Text("Salvar"),
                )
              ],
            );
          });

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: ListView.builder(itemBuilder: (context, index){
            return ListTile(
              title: Text(_listaTarefas[index]),
            );
          },
            itemCount: _listaTarefas.length,
          ),
          )
        ],
      ),
    );
  }
}
