

import 'package:flutter/material.dart';

void main() {

  runApp(HelloFlutter());

}

class HelloFlutter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ContadorStateful());
  }

}

class ContadorStateful extends StatefulWidget{
  @override
  State<ContadorStateful> createState() => ContadorState();

}

class ContadorState extends State<ContadorStateful> {

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
          title: Text(contador.toString()),
        ),
        body: Center(child: Text(contador.toString())),
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            contador++;
          });
        }, child: const Icon(Icons.accessibility),
        ),
        bottomNavigationBar: BottomAppBar(child: Row(children: [Icon(Icons.star), Text("Alo Android")],)),
        persistentFooterButtons: [IconButton(onPressed: (){
          setState(() {
            contador--;
          });

        }, icon: Icon(Icons.star))],
        );
      }
}


