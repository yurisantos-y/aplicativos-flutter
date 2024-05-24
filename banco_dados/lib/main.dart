import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDeDados() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente){
        String sql = "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
        db.execute(sql);
      }
    );
    return bd;
    //print("aberto: " + retorno.isOpen.toString() );
  }

  _salvar() async {
    Database bd = await _recuperarBancoDeDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "Yuri Santos",
      "idade" : 23
    };
    int id = await bd.insert("usuarios", dadosUsuario);
    print("salvo:  $id ");
  }

  @override
  Widget build(BuildContext context) {

    _salvar();

    _recuperarBancoDeDados();
    return const Placeholder();
  }
}