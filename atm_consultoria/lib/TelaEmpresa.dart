import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({super.key});

  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Image.asset("images/detalhe_empresa.png"),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a empresa",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                    ),)
                  ]
              ),
              Padding(
                  padding: EdgeInsets.only(top: 16),
              child: Text(
                " Lorem ipsum dolor sit amet, consectetur adipiscing elit. In viverra velit non molestie ultricies. Nunc massa magna, pulvinar sit amet metus nec, lacinia convallis ligula. Quisque commodo est eu quam pellentesque, malesuada molestie purus pharetra. Fusce purus neque, vulputate nec turpis ac, tempor imperdiet eros. Proin mattis accumsan lectus at vestibulum. Duis dapibus dui nec mauris bibendum tristique. Nulla vestibulum posuere pharetra. Integer a dapibus sapien."
                  "Morbi vestibulum justo tellus, sit amet tempor odio scelerisque id. Pellentesque tincidunt neque in gravida laoreet. Praesent rhoncus venenatis commodo. Fusce volutpat auctor vehicula. Ut posuere magna vitae orci laoreet vulputate. In hac habitasse platea dictumst. Vivamus suscipit nunc eu tellus pellentesque consectetur. Quisque ut justo vehicula, blandit purus eu, mollis ligula. Praesent sodales mollis neque non accumsan. Proin vel dui cursus, imperdiet nisl malesuada, convallis ex. Suspendisse et tincidunt dui."
                  "Nunc velit turpis, euismod id massa at, iaculis dapibus enim. Fusce mattis tristique justo vitae imperdiet. Integer at turpis et mi sollicitudin egestas. Aenean nisi tortor, laoreet in ante et, tincidunt sollicitudin dui. Maecenas dignissim suscipit augue. Nam venenatis augue id placerat congue. Donec imperdiet laoreet elementum. Etiam sagittis pretium nunc sed maximus. "
                    "Nunc velit turpis, euismod id massa at, iaculis dapibus enim. Fusce mattis tristique justo vitae imperdiet. Integer at turpis et mi sollicitudin egestas. Aenean nisi tortor, laoreet in ante et, tincidunt sollicitudin dui. Maecenas dignissim suscipit augue. Nam venenatis augue id placerat congue. Donec imperdiet laoreet elementum. Etiam sagittis pretium nunc sed maximus. "
                    "Nunc velit turpis, euismod id massa at, iaculis dapibus enim. Fusce mattis tristique justo vitae imperdiet. Integer at turpis et mi sollicitudin egestas. Aenean nisi tortor, laoreet in ante et, tincidunt sollicitudin dui. Maecenas dignissim suscipit augue. Nam venenatis augue id placerat congue. Donec imperdiet laoreet elementum. Etiam sagittis pretium nunc sed maximus. "
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
