import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import de la page de profil

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const QuizPage(title: 'Football Quiz'),
    );
  }
}

class Question {
  String questionText;
  bool isCorrect;
  String imagePath;

  Question(
      {required this.questionText,
      required this.isCorrect,
      required this.imagePath});
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuizPage> createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Question> _questions = [
    Question(
        questionText: "Kylian Mbappé a-t-il remporté la Coupe du Monde 2018 ?",
        isCorrect: true,
        imagePath: "assets/quiz1.jpg"),
    Question(
        questionText:
            "Lionel Messi a-t-il gagné la Ligue des Champions avec le PSG ?",
        isCorrect: false,
        imagePath: "assets/quiz2.jpg"),
    Question(
        questionText:
            "Le Real Madrid est-il le club le plus titré en Ligue des Champions ?",
        isCorrect: true,
        imagePath: "assets/quiz3.jpg"),
    Question(
        questionText: "L'équipe de France a-t-elle remporté l'Euro 2020 ?",
        isCorrect: false,
        imagePath: "assets/quiz4.jpg"),
    Question(
        questionText:
            "Erling Haaland a-t-il marqué plus de 30 buts en Premier League lors de sa première saison ?",
        isCorrect: true,
        imagePath: "assets/quiz5.jpg"),
  ];

  void _handleAnswer(bool userChoice) {
    setState(() {
      if (_questions[_currentQuestionIndex].isCorrect == userChoice) {
        _score++;
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResultPage();
      }
    });
  }

  void _showResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultPage(score: _score, total: _questions.length),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      height: 300,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // Arrière-plan pour éviter les espaces vides
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
          ),
          // Image principale
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              _questions[_currentQuestionIndex].imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 40,
                    color: Colors.red[300],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Question ${_currentQuestionIndex + 1}/${_questions.length}",
            style: TextStyle(
              color: Colors.blue[300],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            _questions[_currentQuestionIndex].questionText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(bool isTrue, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[100],
        foregroundColor: Colors.blue[900],
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      onPressed: () => _handleAnswer(isTrue),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[300],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Voir le profil',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileHomePage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildImageContainer(),
              const SizedBox(height: 20),
              _buildQuestionContainer(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAnswerButton(true, 'VRAI'),
                  _buildAnswerButton(false, 'FAUX'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final int total;

  const ResultPage({Key? key, required this.score, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultats'),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score final : $score / $total',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const QuizPage(title: 'Football Quiz')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                foregroundColor: Colors.blue[900],
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Recommencer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
