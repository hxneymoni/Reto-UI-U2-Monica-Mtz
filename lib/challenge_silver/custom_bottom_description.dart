import 'package:flutter/material.dart';

// clase para un widget personalizado para la descripción
class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({super.key});
  //construye la interfaz de usuario para este widget
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alineación del contenido a la izquierda
      children: [
        // Lista de widgets de texto que describen la serie
        Text(
          'Animation 🎬 Fantasy ✨ Adventure 🗺', // Texto de la descripción de géneros
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400), // estilo del texto
        ),
        SizedBox(
          height: 2, // Espacio entre los dos bloques de texto
        ),
        Text(
          'Camp 🏕',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400), // estilo del texto
        )
      ],
    );
  }
}
