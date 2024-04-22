import 'package:flutter/material.dart';
import 'package:anime_ui/challenge_silver/theme.dart';
import 'package:anime_ui/challenge_silver/home_challenge_silver.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silver Tarjetas Animadas',
      theme: theme,
      home: const HomeSliverChallenge(),
    );
  }
}
