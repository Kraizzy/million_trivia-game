import 'dart:async';
import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/play_screen/play_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadyScreen extends StatefulWidget {
  const ReadyScreen({super.key});

  @override
  State<ReadyScreen> createState() => _ReadyScreenState();
}

class _ReadyScreenState extends State<ReadyScreen> {
  //Assigning variables
  //_countdown and Timer
  int _countdown = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startCoundown();
  }

  void startCoundown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_countdown == 0) {
        timer.cancel();
        navigateToNextScreen();
      } else {
        setState(() {
          _countdown--;
        });
      }
    });
  }

  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PlayScreen()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 67, 2, 124),
              Color.fromARGB(255, 39, 9, 88),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90),
            Text(
              'Level 1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.normal,
                fontFamily: GoogleFonts.ultra().fontFamily,
              ),
            ),
            SizedBox(height: 25),
            Text(
              '\$1,000,000',
              style: TextStyle(color: Colors.orange, fontSize: 24, fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            SizedBox(height: 25),
            Text(
              'Get Ready!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                fontFamily: GoogleFonts.ultra().fontFamily,
              ),
            ),
            SizedBox(height: 50),
            // Ready Screen Content
            Container(
              width: screenWidth * 0.28,
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                color: const Color.fromARGB(40, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '$_countdown',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.044,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.fjallaOne().fontFamily,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
