import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:millionaire_trivia/screens/home_screen/home.dart';
import 'package:millionaire_trivia/screens/leaderboard_sceen/leaderboard_screen.dart';
import 'package:millionaire_trivia/screens/ready_screen/ready_screen.dart';

class ReplayScreen extends StatefulWidget {
  const ReplayScreen({super.key});

  @override
  State<ReplayScreen> createState() => _ReplayScreenState();
}

class _ReplayScreenState extends State<ReplayScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
          children: [
            SizedBox(height: 100),
            SizedBox(
              height: 180, 
              width: 300,
              child: Image.asset(
                'assets/img/game_logo.png',
                height: 100,
              ), 
            ),
            SizedBox(height: 20),
            
            Container(
              height: screenHeight * 0.13,
              width: 300,
              decoration: BoxDecoration(
               color: const Color.fromARGB(108, 0, 0, 0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.orange[400], fontSize: screenHeight * 0.014, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Score',
                    style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.03, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '\$0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.027,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),
            Text(
              'You can beat this score!',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

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
                              fontFamily: GoogleFonts.arimo().fontFamily,
                            ),
                          ),
                          Text(
                            'New Game',
                            style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ),
            Spacer(flex: 1),
            Row(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.home, color: Colors.black, size: 40),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  height: 50,
                  width: 120,
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.share, color: Colors.black, size: 30),
                        SizedBox(width: 8),
                        Text('Share', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaderboardScreen()),
                );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(Icons.leaderboard, color: Colors.black, size: 40),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
