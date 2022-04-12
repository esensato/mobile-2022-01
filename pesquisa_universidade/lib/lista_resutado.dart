import 'package:flutter/material.dart';

class ListaResultado extends StatefulWidget {

  var itensLista = [];

  ListaResultado(this.itensLista);

  @override
  State<ListaResultado> createState() => _ListaResultadoState();

}

class _ListaResultadoState extends State<ListaResultado> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemCount: widget.itensLista.length, 
    itemBuilder: (contexto, indice) {
        return ListTile(
          leading: CircleAvatar(child: Text("${widget.itensLista[indice]['alpha_two_code']}")),
          title: Text('${widget.itensLista[indice]['country']}'),
        subtitle: Text('${widget.itensLista[indice]['name']}'));
    });

  }
  
}