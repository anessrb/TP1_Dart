import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import de la page de profil
import 'quiz_page.dart'; // Import de la page du quiz

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileHomePage(), // Page par défaut
      routes: {
        '/profile': (context) =>
            const ProfileHomePage(), // Route vers la page de profil
        '/quiz': (context) =>
            const QuizPage(title: 'Quiz Flutter'), // Route vers la page du quiz
      },
    );
  }
}
