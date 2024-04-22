import 'package:flutter/material.dart';

//representa un boton de retroceso
class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size; // indica tamaño del área disponible
  final double percent; // porcentaje de opacidad para el color del la flechita

// construye la interfaz de usuario para este widget
  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Posiciona el botón en la parte superior izquierda
      top: size.height * 0.15,
      left: 15,
      // widget de icono que representa un boton de retroceso
      child: Icon(
        Icons.arrow_back, //icono de flecha
        size: 30, //tamaño del icono
        color: percent < .56 //condicon para determinar opacidad del icono
            ? Colors.white.withOpacity(
                1 - percent) //se ajusta opacidad para el color blanco
            : Colors.black,
      ),
    );
  }
}
