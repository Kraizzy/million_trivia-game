import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/ready_screen/ready_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratulationScreen extends StatelessWidget {
  final String userName;
  final String amountWon;

  const CongratulationScreen({
    super.key,
    required this.userName,
    required this.amountWon,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 74, 1, 170),
                Color.fromARGB(255, 39, 1, 82),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text(
                "Congratulations!",
                style: TextStyle(
                  fontSize: screenHeight * 0.032,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Stage Completed",
                style: TextStyle(
                  fontSize: screenHeight * 0.0187,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.019,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Won',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.024,
                  fontFamily: GoogleFonts.arizonia().fontFamily,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                amountWon,
                style: TextStyle(
                  color: Colors.orange[400],
                  fontSize: screenHeight * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 210),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReadyScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.8,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 72, 196, 0),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: screenHeight * 0.065,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.sports_esports,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                      SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Play',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.03,
                            ),
                          ),
                          Text(
                            'Next Level',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // TODO: Implement share action
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(249, 2, 77, 143),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Share Your Achievement',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
