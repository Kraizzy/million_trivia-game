import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String questionNumber;
  final double screenWidth;
  final double screenHeight;

  const QuestionCard({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Main question box
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            height: screenHeight * 0.2,
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          // Floating question number
          Positioned(
            top: -20,
            child: Container(
              alignment: Alignment.center,
              height: screenHeight * 0.06,
              width: screenWidth * 0.7,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 1, 68),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                questionNumber,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontFamily: GoogleFonts.ultra().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
