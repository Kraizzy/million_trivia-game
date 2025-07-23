class LifelineUsageTracker {
  final Map<String, bool> used = {
    '-2': false,
    'ask': false,
    'poll': false,
    'reset': false,
  };

  bool isUsed(String key) => used[key] ?? true;

  void markUsed(String key) {
    used[key] = true;
  }

  void reset() {
    used.updateAll((key, value) => false);
  }
}
