import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key, required this.onStartPress});

  final void Function() onStartPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Learn flutter the FUN way",
              style: GoogleFonts.lato(
                color: theme.buttonTheme.colorScheme?.onPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold
                ),
              ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: onStartPress,
            style: OutlinedButton.styleFrom(
                foregroundColor: theme.buttonTheme.colorScheme?.onPrimary),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
