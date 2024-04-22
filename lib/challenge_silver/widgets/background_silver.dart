import 'package:flutter/material.dart';

// Clase que representa un fondo para un sliver.
class BackgroundSliver extends StatelessWidget {
  const BackgroundSliver({super.key});

//Construir interfaz de usuario para este widget
  @override
  Widget build(BuildContext context) {
    //Hace la imagen cubra todo el área disponible.
    return const Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      // Muestra una imagen como fondo
      child: Image(
        image: AssetImage(
          'assets/silver/cover.jpg',
        ),
        fit: BoxFit
            .cover, // Ajusta la imagen para cubrir todo el espacio disponible
      ),
    );
  }
}
