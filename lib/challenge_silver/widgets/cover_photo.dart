import 'package:flutter/material.dart';

//clase para la foto de portada
class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    super.key,
    required this.size,
  });

  final Size size; // indica tamaño del area disponible

//construye interfaz para widget de portada
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), //redondea el borde
        ),
        width: size.width * 0.27, //ancho de la imagen
        height: size.height * 0.18, //alto de la imagen
        child: ClipRRect(
          // Recorta la imagen para que tenga bordes redondeados
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/silver/summer1.jpg',
            fit: BoxFit.fill, // Ajusta la imagen para llenar el contenedor
          ),
        ));
  }
}
