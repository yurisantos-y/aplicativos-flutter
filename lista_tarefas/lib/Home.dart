import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaTarefas = [];

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File( "${diretorio.path}/dados.json" );
  }

  _salvarArquivo() async {

    var arquivo = await _getFile();

    Map<String, dynamic> tarefa = Map();
    tarefa["Titulo"] = "Ir ao mercado";
    tarefa["realizada"] = false;
    _listaTarefas.add( tarefa );

    String dados = json.encode( _listaTarefas );
    arquivo.writeAsString(dados);
    
    //print("Caminho: " + diretorio.path );
  }

  _lerArquivo() async {
    try{
      final arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e){
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _lerArquivo().then((dados) {
      if (dados != null) {
        setState(() {
          _listaTarefas = json.decode(dados);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

   // _salvarArquivo();
    print("itens: " + _listaTarefas.toString());

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
              title: Text(_listaTarefas[index]['titulo']),
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
