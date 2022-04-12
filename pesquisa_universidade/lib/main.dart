import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pesquisa_universidade/formulario_pesquisa.dart';
import 'package:pesquisa_universidade/lista_resutado.dart';

void main() {
  runApp(_Principal());
}

class _Principal extends StatefulWidget {
  @override
  State<_Principal> createState() => _PrincipalState();

}

class _PrincipalState extends State<_Principal> {

  var itens = [];

  @override
  Widget build(BuildContext context) {

      return MaterialApp(home: Scaffold (appBar: AppBar(title: const Text('Pesquisa Universidades'),
      ),
      body: Column(children: [
        FormularioPesquisa((resultado) {
          jsonDecode(resultado).forEach((item) {
            itens.clear();
            setState(() {
              itens.add({"name": item['name'], "country": item['country'], "alpha_two_code" : item['alpha_two_code']});
            });
          });
        }),
        Expanded(child:  ListaResultado(itens))
      ]
      ),
      ),
      );
  }
  
}


