import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 6,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        //mini: true,
        /*child: Icon(Icons.add),
        onPressed: (){
        print("Resultado: botao pressionado");
      },*/
        onPressed: (){

        },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      ),
      body: Text("Conteudo"),
      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}
