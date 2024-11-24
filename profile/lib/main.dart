import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
      ),
      home: const ProfileHomePage(),
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Card"),
        centerTitle: false,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _getCard(),
            Positioned(
              top: 0,
              child: _getAvatar(),
            ),
          ],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 300,
      height: 400,
      margin: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60), // Espace pour l'avatar
          const Text(
            "Aness RABIA",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Data Engineer",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoRow(Icons.email, "aness.rabia@gmail.com"),
          _buildInfoRow(Icons.phone, "+33 6 12 34 56 78"),
          _buildInfoRow(Icons.location_on, "Montpellier, France"),
          _buildInfoRow(Icons.link, "@anessrabia"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(FontAwesomeIcons.github), // GitHub
              _buildSocialIcon(FontAwesomeIcons.instagram), // Instagram
              _buildSocialIcon(FontAwesomeIcons.twitter), // X
              _buildSocialIcon(FontAwesomeIcons.facebook), // Facebook
            ],
          ),
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/aness.webp', // Image pour l'avatar
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue[300], size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.blue[400],
          size: 24,
        ),
      ),
    );
  }
}
