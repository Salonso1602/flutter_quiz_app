import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: data["user_answer"] == data["correct_answer"]
                        ? Colors.green
                        : Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(((data["question_index"] as int) + 1).toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["question"].toString(),
                        style: GoogleFonts.lato(
                            color: theme.colorScheme.onPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      if (data["user_answer"] != data["correct_answer"]) Text(
                        data["user_answer"].toString(),
                        style: GoogleFonts.lato(
                          color: Colors.red,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        data["correct_answer"].toString(),
                        style: GoogleFonts.lato(
                          color: Colors.green,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
