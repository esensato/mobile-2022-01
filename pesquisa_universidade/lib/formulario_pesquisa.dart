import 'package:flutter/material.dart';
import 'package:pesquisa_universidade/campo.dart';

import 'package:http/http.dart' as http;

class FormularioPesquisa extends StatelessWidget {

  var campoPais = Campo(dica: 'Informe o país');
  var campoUniversidade = Campo(dica: 'Informe a univeridade');

  final Function processaResultado;

  FormularioPesquisa(this.processaResultado);

  @override
  Widget build(BuildContext context) {

      return Container(margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(children: [
        campoPais,
        const SizedBox(height: 5.0),
        campoUniversidade,
        ElevatedButton(onPressed: (){

          final String url = 'http://universities.hipolabs.com/search?name=' + campoUniversidade.obterTexto() + '&country=' + campoPais.obterTexto();
          http.get(Uri.parse(url)).then((resp){
            processaResultado(resp.body);
          });

        }, child: const Text('Pesquisar'))
      ])
      );
  }
  
}