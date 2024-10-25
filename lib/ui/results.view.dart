import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/ui/components/questions_summary.component.dart';

class ResultsView extends StatelessWidget {
  final Function() onRetryPress;

  final List<String> selectedAnswers;

  const ResultsView(
      {super.key, required this.onRetryPress, this.selectedAnswers = const []});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> result = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      result.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i]
      });
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final summaryData = getSummaryData();
    final numTotalQuestions = summaryData.length.toString();
    final numCorrectAnswers = summaryData
        .where((question) {
          return question["correct_answer"] == question["user_answer"];
        })
        .length
        .toString();

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You've answered $numCorrectAnswers out of $numTotalQuestions questions right!",
              style: GoogleFonts.lato(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            TextButton(
                onPressed: onRetryPress,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.refresh,
                      color: theme.colorScheme.onPrimary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Retry this quiz?",
                      style: GoogleFonts.lato(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
