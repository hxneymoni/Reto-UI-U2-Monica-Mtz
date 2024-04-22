import 'dart:math';
import 'package:flutter/material.dart';
import 'package:anime_ui/challenge_silver/custom_bottom_description.dart';

//  widget que muestra los datos del rectangulo cortado
class DataCutRectangle extends StatelessWidget {
  const DataCutRectangle({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size; // tamaño disponible para el widget
  final double percent; // porcentaje de visualzacion

  // construye la interfaz de usuario para este widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding para colocar el contenido a la derecha y arriba
      padding: EdgeInsets.only(left: size.width * 0.34, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding para ajustar la posición del texto según el porcentaje de desplazamiento
          Padding(
            padding: EdgeInsets.only(
              // Ajuste de la posición horizontal del texto en función del porcentaje
              left: percent > 0.13
                  ? size.width * pow(percent, 5.5).clamp(0.0, 0.2)
                  : 0,
              // Ajuste de la posición vertical del texto en función del porcentaje
              top: size.height *
                  (percent > 0.48 ? pow(percent, 10.5).clamp(0.0, 0.06) : 0.0),
            ),
            child: const Text(
              'Summer Camp Island',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
          ),
          // widget que muestra una descripción personalizada
          if (percent < 0.50) ...[
            const SizedBox(
              height: 2,
            ),
            // Opacidad animada para ocultar la descripción cuando se desplaza hacia abajo
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: 1 - percent.clamp(0.0, 1.0),
              child: const CustomBottomDescription(),
            )
          ]
        ],
      ),
    );
  }
}
