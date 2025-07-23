import 'dart:math';
import '../../models/question_model.dart';
import 'lifeline_usage_tracker.dart';

class LifelineManager {
  final Question question;
  final LifelineUsageTracker usageTracker;

  List<int> removedOptionIndices = [];
  int? suggestedOptionIndex;
  Map<int, int>? pollResults;

  LifelineManager(this.question, this.usageTracker);

  Map<String, bool> get used => usageTracker.used;

  void useMinus2() {
    if (usageTracker.isUsed('-2')) return;

    final correct = question.correctAnswer.trim().toLowerCase();
    final incorrectIndices = List.generate(4, (i) => i)
        .where((i) => question.options[i].trim().toLowerCase() != correct)
        .toList();

    incorrectIndices.shuffle();
    removedOptionIndices = incorrectIndices.take(2).toList();
    usageTracker.markUsed('-2');
  }

  void useAskComputer() {
    if (usageTracker.isUsed('ask')) return;

    suggestedOptionIndex = question.options.indexWhere(
      (opt) => opt.trim().toLowerCase() ==
          question.correctAnswer.trim().toLowerCase(),
    );
    usageTracker.markUsed('ask');
  }

  void usePoll() {
    if (usageTracker.isUsed('poll')) return;

    final correctIndex = question.options.indexWhere(
      (opt) => opt.trim().toLowerCase() ==
          question.correctAnswer.trim().toLowerCase(),
    );

    pollResults = {
      for (int i = 0; i < 4; i++)
        i: i == correctIndex ? 60 : Random().nextInt(20) + 5,
    };
    usageTracker.markUsed('poll');
  }

  void useResetQuestion() {
    if (usageTracker.isUsed('reset')) return;
    usageTracker.markUsed('reset');
  }

  void resetVisualsOnly() {
    removedOptionIndices = [];
    suggestedOptionIndex = null;
    pollResults = null;
  }
}
