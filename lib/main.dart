
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
      home: const  QuizPage(),
    );
  }
}
