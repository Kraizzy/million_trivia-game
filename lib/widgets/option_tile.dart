import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OptionTile extends StatefulWidget {
  final String label;
  final String text;
  final VoidCallback onTap;
  final double screenWidth;
  final bool isSelected;
  final bool isCorrect;
  final bool answered;
  final bool disabled;

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    required this.onTap,
    required this.screenWidth,
    this.isSelected = false,
    this.isCorrect = false,
    this.answered = false,
    this.disabled = false,
  });

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> with SingleTickerProviderStateMixin {
  bool isExiting = false;

  String capitalizeEachWord(String input) {
    return input
        .split(' ')
        .map((str) => str.isNotEmpty ? str[0].toUpperCase() + str.substring(1) : str)
        .join(' ');
  }

  void handleTap() {
    if (widget.disabled || isExiting) return;

    setState(() {
      isExiting = true;
    });

    Future.delayed(500.ms, () {
      widget.onTap(); // Triggers answer checking + next logic
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = const Color.fromARGB(133, 27, 1, 68);
    Color textColor = Colors.white;
    Color labelColor = Colors.black;

    if (widget.answered) {
      if (widget.isSelected && widget.isCorrect) {
        bgColor = const Color.fromARGB(255, 63, 207, 67);
      } else if (widget.isSelected && !widget.isCorrect) {
        bgColor = Colors.red;
      } else if (!widget.isSelected && widget.isCorrect) {
        bgColor = const Color.fromARGB(255, 67, 228, 73);
      }
    }

    if (widget.disabled) {
      bgColor = Colors.white10;
      textColor = Colors.grey;
      labelColor = Colors.grey[700]!;
    }

    final tile = GestureDetector(
      onTap: handleTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 50,
        width: widget.screenWidth * 0.9,
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
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: widget.screenWidth * 0.036,
                  color: labelColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                capitalizeEachWord(widget.text),
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
      ),
    );

    return tile
        .animate(
          onPlay: (controller) => isExiting
              ? controller.reverse() // slide out
              : controller.forward(), // slide in
        )
        .slide(
          duration: 8.seconds,
          begin: const Offset(1, 0),
          end: Offset.zero,
          curve: Curves.easeOut,
        )
        .fadeIn(duration: 8.seconds);
  }
}
