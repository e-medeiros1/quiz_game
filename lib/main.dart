import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:marimba/screens/quiz_app.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: AnimatedSplashScreen(
          duration: 1000,
          splash: 'assets/images/icon.png',
          nextScreen: const QuizPage(),
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Colors.white),
    );
  }
}
