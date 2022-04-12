import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Campo extends StatelessWidget {

  String dica;

  final _controle = TextEditingController();

  Campo({this.dica = ''});

  @override
  Widget build(BuildContext context) {

    return TextField(controller: _controle,
      decoration: 
      InputDecoration(border: const OutlineInputBorder(), 
      hintText: dica),
      );

  }

  String obterTexto() {
    return _controle.text; // texto informado pelo usuario no campo TextField
  }
  
}