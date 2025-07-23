import 'package:flutter/material.dart';

class LifelineOverlay extends StatelessWidget {
  final Map<int, int>? pollResults;
  final int? suggestedIndex;

  const LifelineOverlay({
    super.key,
    this.pollResults,
    this.suggestedIndex,
  });

  @override
  Widget build(BuildContext context) {
    if (pollResults != null) {
      return Column(
        children: List.generate(4, (index) {
          final percent = pollResults![index] ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Text(
                  ['A', 'B', 'C', 'D'][index],
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 18,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 18,
                        width: (percent.toDouble() / 100) *
                            MediaQuery.of(context).size.width *
                            0.6,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '$percent%',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }),
      );
    }

    if (suggestedIndex != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          '💡 Computer suggests: ${['A', 'B', 'C', 'D'][suggestedIndex!]}',
          style: const TextStyle(
            color: Colors.orangeAccent,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
