import 'package:flutter/material.dart';

class GuessEntryForm extends StatefulWidget {
  const GuessEntryForm({required this.checkGuessFunction, super.key});

  final Function(String guess) checkGuessFunction;

  @override
  State<GuessEntryForm> createState() => _GuessEntryFormState();
}

class _GuessEntryFormState extends State<GuessEntryForm> {
  final guessController = TextEditingController();

  @override
  void initState() {
    super.initState();
    guessController.addListener(_checkGuess);
  }

  void _checkGuess() {
    final guess = guessController.text;
    if (widget.checkGuessFunction(guess)) {
      guessController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: guessController);
  }
}
