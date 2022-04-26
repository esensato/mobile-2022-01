import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ven_carro/lista_veiculo.dart';

var camera;

Future<void> main() async {
  // flutter run --no-sound-null-safety
  runApp(VenCarro());

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  camera = cameras.first;

}

class VenCarro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(seconds: 5, 
    title: const Text('VenCarro', 
      style: TextStyle(color: Colors.blue, 
      fontWeight: FontWeight.bold, 
      fontSize: 20)
      ), 
    navigateAfterSeconds: ListaVeiculo(),
    image: Image.network('https://cdn.pixabay.com/photo/2012/04/12/19/39/volga-30332_1280.png'),
    photoSize: 100,
    backgroundColor: Colors.yellow,)
    );
  }
  
}

