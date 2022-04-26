import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ven_carro/main.dart';

class Camera extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraState();

}

class _CameraState extends State<Camera> {

late CameraController _controller;
late Future<void> _initializeControllerFuture;

@override
void initState() {
  super.initState();
  _controller = CameraController(camera, ResolutionPreset.medium);
  _initializeControllerFuture = _controller.initialize();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
                              body: FutureBuilder<void>(
                                future: _initializeControllerFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    return CameraPreview(_controller);
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                              floatingActionButton: FloatingActionButton(
                                  child: const Icon(Icons.camera_alt),
                                  onPressed: () async {
                                  // aguarda até que o controle da câmera seja iniciado
                                  await _initializeControllerFuture;
                                  // aguarda até que a imagem seja obtida...
                                  final image = await _controller.takePicture();
                                  // retorna para a tela de resumo com o caminho da imagem obtida
                                  Navigator.of(context).pop(image.path);
}
)

    ),
    );
  }

  
}