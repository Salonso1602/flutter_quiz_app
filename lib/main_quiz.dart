import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/ui/landing.view.dart';
import 'package:quiz_app/ui/quiz.view.dart';
import 'package:quiz_app/ui/results.view.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = LandingView(onStartPress: () {
      setActiveScreen("quiz-screen");
    });
    super.initState();
  }

  void setActiveScreen(String targetView) {
    setState(() {
      switch (targetView) {
        case "quiz-screen":
          activeScreen = QuizView(onSelectAnswer: selectAnswer);
          break;
        case "landing-screen":
          activeScreen = LandingView(onStartPress: () {
            setActiveScreen("quiz-screen");
          });
          break;
        case "result-screen":
          activeScreen = ResultsView(
            onRetryPress: () {
              selectedAnswers.clear();
              setActiveScreen("landing-screen");
            },
            selectedAnswers: selectedAnswers,
          );
          break;
        default:
      }
    });
  }

  List<String> selectedAnswers = [];

  selectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setActiveScreen("result-screen");
    }
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
