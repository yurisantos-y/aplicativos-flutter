import 'package:flutter/material.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Inicio",
          style: TextStyle(
              fontSize: 25
          ),
        ),
      )
    );
  }
}
