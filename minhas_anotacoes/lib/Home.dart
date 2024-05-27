import 'package:flutter/material.dart';
import 'package:minhas_anotacoes/helper/AnotacaoHelper.dart';
import 'package:minhas_anotacoes/model/Anotacao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _tituloControlle = TextEditingController();
  TextEditingController _descricaoControlle = TextEditingController();
  var _db = AnotacaoHelper();

  _exibirTelaCadastro(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Adicionar anotação"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloControlle,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Titulo",
                    hintText: "Digite título..."
                  ),
                ),
                TextField(
                  controller: _descricaoControlle,
                  decoration: InputDecoration(
                      labelText: "Descrição",
                      hintText: "Digite descrição..."
                  ),
                )
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")
              ),
              ElevatedButton(
                  onPressed: (){
                    _salvarAnotacao();
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")
              )
            ],
          );
        });
  }

  _salvarAnotacao() {
    String titulo = _tituloControlle.text;
    String descricao = _descricaoControlle.text;

    print( "data atual: "+ DateTime.now().toString() );
    Anotacao anotacao = Anotacao(titulo, descricao, "teste");
    //_db.salvarAnotacao(anotacao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas anotações",
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: (){
          _exibirTelaCadastro();
        },
      ),
    );
  }
}
