import 'package:flutter/material.dart';

void _defaultFunc(){}

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, 
  this.answerText = "", 
  this.onPress = _defaultFunc
  });

  final String answerText;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPress, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 50
        ),
        backgroundColor: theme.primaryColorDark,
        foregroundColor: theme.secondaryHeaderColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),
      child: Text(answerText, textAlign: TextAlign.center,),
      );
  }
}