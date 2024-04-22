import 'package:anime_ui/challenge_silver/theme.dart';
import 'package:flutter/material.dart';

// Clase para dibujar un rectángulo cortado
class CutRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define un objeto de pintura para dibujar el rectángulo cortado
    final paint = Paint();
    paint.color = backgroundcolor; //color de fondo del rectángulo
    paint.style =
        PaintingStyle.fill; // establece el estilo de pintura como relleno
    paint.strokeWidth = 10; //tamaño del pincel
    final path = Path(); //Define un "camino" para el rectangulo
    path.moveTo(0,
        size.height); // mueve el punto de inicio del camino al extremo inferior izquierdo
    path.lineTo(size.width,
        size.height); // agrega una línea desde el extremo inferior izquierdo hasta el extremo inferior derecho
    path.lineTo(size.width,
        0); // agrega una línea desde el extremo inferior derecho hasta el extremo superior derecho
    path.lineTo(size.width * 0.27,
        0); // agrega una línea desde el extremo superior derecho hasta un punto específico para cortar el rectángulo

    canvas.drawPath(path, paint); //dibuja
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
