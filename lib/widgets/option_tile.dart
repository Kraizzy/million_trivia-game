import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String label;
  final String text;
  final VoidCallback onTap;
  final double screenWidth;
  final bool isSelected;
  final bool isCorrect;
  final bool answered;
  final bool disabled; // ✅ NEW

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    required this.onTap,
    required this.screenWidth,
    this.isSelected = false,
    this.isCorrect = false,
    this.answered = false,
    this.disabled = false, // ✅ NEW
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = const Color.fromARGB(133, 27, 1, 68);
    Color textColor = Colors.white;
    Color labelColor = Colors.black;

    if (answered) {
      if (isSelected && isCorrect) {
        bgColor = const Color.fromARGB(255, 63, 207, 67);
      } else if (isSelected && !isCorrect) {
        bgColor = Colors.red;
      } else if (!isSelected && isCorrect) {
        bgColor = const Color.fromARGB(255, 67, 228, 73);
      }
    }

    if (disabled) {
      bgColor = Colors.white10;
      textColor = Colors.grey;
      labelColor = Colors.grey[700]!;
    }

    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 50,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: screenWidth * 0.036,
                  color: labelColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
