import 'package:flutter/material.dart';
import 'dart:math';
import 'package:anime_ui/challenge_silver/widgets/body_silver.dart';
import 'package:anime_ui/challenge_silver/widgets/background_silver.dart';
import 'package:anime_ui/challenge_silver/widgets/button_back.dart';
import 'package:anime_ui/challenge_silver/widgets/cover_photo.dart';
import 'package:anime_ui/challenge_silver/widgets/cute_rectangle.dart';
import 'package:anime_ui/challenge_silver/widgets/data_cut_rectangle.dart';
import 'package:anime_ui/challenge_silver/widgets/favorite_circle.dart';

// Widget (con estado) principal de la pantalla de inicio
class HomeSliverChallenge extends StatefulWidget {
  const HomeSliverChallenge({super.key});

  @override
  State<HomeSliverChallenge> createState() =>
      _HomeSliverChallengeState(); //crea el estado del widget
}

//estado del widget
class _HomeSliverChallengeState extends State<HomeSliverChallenge> {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // obtiene el tamaño de la pantalla
    //estructura (basica) para la pantalla
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _AppBarNetflix(
              minExtended: kToolbarHeight,
              maxExtended: size.height * 0.35,
              size: size,
            ),
          ),
          SliverToBoxAdapter(
            child: Body(size: size), // contenido del cuerpo de la pantalla
          )
        ],
      ),
    );
  }
}

// clase que define la apariencia del header
class _AppBarNetflix extends SliverPersistentHeaderDelegate {
  _AppBarNetflix(
      {required this.maxExtended,
      required this.minExtended,
      required this.size});
  final double maxExtended;
  final double minExtended;
  final Size size;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent =
        shrinkOffset / maxExtended; // calcula el porcentaje de desplazamiento

    // ignore: prefer_const_declarations
    final uploadlimit =
        13 / 100; //Se valida el angulo en el que regresa la tarjeta
    //Retorna el valor de la tarjeta
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);
    final fixrotation = pow(percent, 1.5);

    // Widget que representa la portada de la serie
    final card = _CoverCard(
      size: size,
      percent: percent,
      uploadlimit: uploadlimit,
      valueback: valueback,
    );

    // Widget que representa la barra inferior
    final bottomsliverbar = _CustomBottomSliverBar(
      size: size,
      fixrotation: fixrotation,
      percent: percent,
    );

    // ignore: avoid_unnecessary_containers
    return Container(
      //contenedor principal
      child: Stack(
        children: [
          const BackgroundSliver(), //fondo header
          if (percent > uploadlimit) ...[
            card, // muestra la tarjeta si se supera un límite de desplazamiento
            bottomsliverbar, // muestra la barra inferior
          ] else ...[
            bottomsliverbar,
            card,
          ],
          ButtonBack(size: size, percent: percent), // Botón de retroceso
          FavoriteCircle(size: size, percent: percent), //icono de favorito
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtended; // Obtiene la altura máxima del header

  @override
  double get minExtent => minExtended; // Obtiene la altura minima del header

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

// Clase que representa la portada de la serie
class _CoverCard extends StatelessWidget {
  // ignore: unused_element
  const _CoverCard(
      {super.key,
      required this.size,
      required this.percent,
      required this.uploadlimit,
      required this.valueback});
  final Size size;
  final double percent;
  final double uploadlimit;
  final num valueback;

  final double angleForCard = 6.5; // ángulo para rotar la tarjeta

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.15,
      left: size.width / 24,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()
          ..rotateZ(
            percent > uploadlimit
                ? (valueback * angleForCard)
                : percent * angleForCard,
          ),
        child: CoverPhoto(size: size),
      ),
    );
  }
}

// clase que representa la barra inferior
class _CustomBottomSliverBar extends StatelessWidget {
  // ignore: unused_element
  const _CustomBottomSliverBar(
      {super.key,
      required this.size,
      required this.fixrotation,
      required this.percent});
  final Size size;
  final num fixrotation;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: -size.width * fixrotation.clamp(0, 0.35),
        right: 0,
        // ignore: sized_box_for_whitespace
        child: _CustomBottomSliver(
          size: size,
          percent: percent,
        ));
  }
}

class _CustomBottomSliver extends StatelessWidget {
  const _CustomBottomSliver({
    // ignore: unused_element
    super.key,
    required this.size,
    required this.percent,
  });

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: size.height * 0.12,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: CutRectangle(),
          ),
          DataCutRectangle(size: size, percent: percent),
        ],
      ),
    );
  }
}
