import 'package:anime_ui/challenge_silver/theme.dart';
import 'package:flutter/material.dart';

// Clase para el cuerpo principal de la pantalla
class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.size,
  });

  final Size size;

// construye la interfaz de usuario para este widget
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        color: backgroundcolor, // Color del fondo del contenedor
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila que contiene iconos personalizados
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _CustomIcon(
                  icon: Icons.stars,
                  text: '90%',
                ),
                _CustomIcon(
                  icon: Icons.tv,
                  text: 'Netflix',
                ),
                _CustomIcon(
                  icon: Icons.wc,
                  text: 'Tv +10',
                ),
                _CustomIcon(icon: Icons.av_timer_rounded, text: '50m')
              ],
            ),
            // Texto principal
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Their camp counselors are witches.This will be no ordinary summer.',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 23),
              ),
            ),
            // Texto de titulo relacionados
            const Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 10),
              child: Text(
                'Related shows',
                style: TextStyle(fontSize: 23),
              ),
            ),
            //lista de imagenes para titulos relacionados
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      4,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                height: size.height * 0.18,
                                width: size.width * 0.23,
                                image: AssetImage(
                                  'assets/silver/img${index + 1}.jpg',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ))),
            ),
            const SizedBox(
              height: 15,
            ),
            // Títulos de temporadas y caracteristicas en cuestion de vista, barra roja o gris,etc
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Seasons',
                style: TextStyle(fontSize: 23),
              ),
            ),
            _Features(
              size: size,
              title: 'Season 1',
              subtitle: '8 watched',
              colorline: Colors.red,
            ),
            _Features(
              size: size,
              title: 'Season 2',
              subtitle: '9 watched',
              colorline: Colors.red,
            ),
            _Features(
              size: size,
              title: 'Season 3',
              subtitle: '1 to air',
              colorline: Colors.grey,
            ),
            _Features(
              size: size,
              title: 'Specials',
              subtitle: '7 to watch',
              colorline: Colors.grey,
            ),
          ],
        ));
  }
}

// Widget para iconos
class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    // ignore: unused_element
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 45,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}

// Widget para características
class _Features extends StatelessWidget {
  const _Features({
    // ignore: unused_element
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.colorline,
  });

  final Size size;
  final String title;
  final String subtitle;
  final Color colorline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width,
      color: backgroundcolor,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    height: 5,
                    color: colorline,
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.pending,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
}
