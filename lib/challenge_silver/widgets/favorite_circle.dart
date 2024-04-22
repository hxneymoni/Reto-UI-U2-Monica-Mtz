import 'package:flutter/material.dart';

// Clase para el circulo de favoritos
class FavoriteCircle extends StatelessWidget {
  const FavoriteCircle({
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size; // tamaño disponible para el widget
  final double percent; // porcentaje de visualizacion

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Posiciona el círculo en la parte inferior derecha de la pantalla
      bottom: size.height * 0.10,
      right: 10,
      child: percent <
              0.2 // Si el porcentaje es menor que 0.2, muestra la animación del círculo
          ? TweenAnimationBuilder<double>(
              // Animación que cambia la escala del círculo para simular que aparece o desaparece
              tween: percent < 0.17
                  ? Tween(
                      begin: 1, end: 0) // Comienza la animación de desaparición
                  : Tween(
                      begin: 0, end: 1), // Comienza la animación de aparición
              duration: const Duration(milliseconds: 300),
              // Constructor de widgets que crea un widget en función del valor de la animación
              builder: (context, value, widget) {
                return Transform.scale(
                  // Transforma el widget para cambiar su escala
                  scale: 1.0 -
                      value, // Escala del widget (0 cuando desaparece, 1 cuando aparece)
                  child: CircleAvatar(
                    // circulo para mostrar el icono de favorito
                    minRadius: 20, // radio minimo para círculo
                    backgroundColor:
                        Colors.red[300], // color de fondo del circulo
                    child: Icon(
                      // Icono de corazón
                      Icons.favorite,
                      color: Colors.red[900], // Color del icono
                    ),
                  ),
                );
              })
          : Container(), // Si el porcentaje es mayor o igual a 0.2, muestra un contenedor vacío
    );
  }
}
