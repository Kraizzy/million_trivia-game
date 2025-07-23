import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/question_model.dart';

class QuestionsLoader {
  static Future<List<Question>> loadStageQuestions(int stage) async {
    final String jsonString = await rootBundle.loadString('assets/millionaire.json');
    final List<dynamic> allData = json.decode(jsonString);

    final List<Question> stageQuestions = [];

    for (var item in allData) {
      try {
        // Check if this item belongs to the requested stage
        if (item is List && item.length >= 9 && item[2] == stage) {
          final question = Question.fromList(item);

          // Check if correctAnswer is one of the options
          if (question.options.contains(question.correctAnswer)) {
            stageQuestions.add(question);
          } else {
            debugPrint("❌ Skipped (answer not in options): $item");
          }
        }
      } catch (e) {
        debugPrint("⚠️ Skipped invalid question: $e");
        continue;
      }
    }

    stageQuestions.shuffle(); // Randomize

    return stageQuestions.take(15).toList(); // Return only 15 questions
  }
}
