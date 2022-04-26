import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ven_carro/camera.dart';

class Resumo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResumoState();

}

class _ResumoState extends State<Resumo> {

  String marca = "";
  String modelo = "";
  String ano = "";
  String preco = "";
  String caminhoImagem = "";

 @override
  void didChangeDependencies() {

    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    marca = arg['marca'];
    modelo = arg['modelo'];
    ano = arg['ano'];
    preco = arg['preco'];

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {"/camera": (context) => Camera()},
      home: Scaffold(
      appBar: AppBar(title: const Text('Resumo')),
      body: Column(
        children: [criaCampo(label: "Marca:", valor: marca),
        criaCampo(label: "Modelo:", valor: modelo),
        criaCampo(label: "Ano:", valor: ano),
        criaCampo(label: "Preço:", valor: preco),
        Flexible(child: Image.network(caminhoImagem))
        ]
        ),
    persistentFooterButtons: [IconButton(onPressed: () {

      setState(() async {

      caminhoImagem = await Navigator.of(context).pushNamed("/camera") as String;
      print(caminhoImagem);

      });

    }, icon: const Icon(Icons.camera))],)
    );

  }

  Widget criaCampo({String label = "", String valor = ""}) {

    return Row(children: [
      Container(padding: const EdgeInsets.all(10.0), child: Text(label), width: 100.0, color: Colors.blueAccent,),
      Expanded(child: Container(padding: const EdgeInsets.all(10.0), child: Text(valor), color: Colors.blue[100],))
      
    ],
    );

  }
  
}