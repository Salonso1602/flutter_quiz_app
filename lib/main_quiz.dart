import 'package:flutter/material.dart';
import 'package:quiz_app/ui/landing.view.dart';
import 'package:quiz_app/ui/quiz.view.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = LandingView(onStartPress: setActiveScreen);
    super.initState();
  }

  void setActiveScreen() {
    setState(() {
      activeScreen = const QuizView();
    });
  }

  final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 161, 5, 223)),
      primaryColorDark: const Color.fromARGB(255, 62, 3, 163));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.primaryColor,
                theme.primaryColorDark,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
