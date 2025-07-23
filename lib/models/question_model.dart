import 'package:flutter/material.dart';

class Question {
  final int id;
  final String question;
  final int stage;
  final String correctAnswer;
  final String explanation;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.stage,
    required this.correctAnswer,
    required this.explanation,
    required this.options,
  });

  factory Question.fromList(List<dynamic> data) {
    if (data.length < 9) {
      throw FormatException("Invalid question format: ${data.toString()}");
    }

    // Extract and normalize options
    final List<String> options = List.generate(
      4,
      (i) => data[5 + i].toString().trim().toLowerCase(),
    );

    // Normalize correctAnswer too
    final correct = data[3].toString().trim().toLowerCase();

    // Edge case: if correctAnswer not in options, log warning
    if (!options.contains(correct)) {
      debugPrint("⚠️ Warning: Correct answer '$correct' not in options: $options");
    }

    return Question(
      id: data[0],
      question: data[1].toString().trim(),
      stage: data[2] is int ? data[2] : int.tryParse(data[2].toString()) ?? 0,
      correctAnswer: correct,
      explanation: data[4].toString().trim(),
      options: options,
    );
  }
}
