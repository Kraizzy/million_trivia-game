import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/ready_screen/ready_screen.dart';
import 'package:millionaire_trivia/screens/replay_screen/exit_replay_sceen.dart';

class FailedScreen extends StatefulWidget {
  const FailedScreen({super.key});

  @override
  State<FailedScreen> createState() => _FailedScreenState();
}

class _FailedScreenState extends State<FailedScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Icons
          SizedBox(height: 100),
            Text(
              'Replay Level',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.032,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height:30),
            // Ready Screen Content
            Container(
              width: screenWidth * 0.2,
              height: screenHeight * 0.1,
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 0, 0, 0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.032,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            Text(
              'Failing does not mean you are a failure',
              style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.w900, color: Colors.white),
            ),
            SizedBox(height: 30),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FailedScreen()),
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
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.ondemand_video_outlined,
                        color: Colors.white,
                        size: screenHeight * 0.05,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.027,
                          ),
                        ),
                        Text(
                          'Retain your score',
                          style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.016),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadyScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(248, 2, 120, 184),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Play Again',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(builder: (context) => ReplayScreen()),
                );
              },
              child: InkWell(child: Text('No thanks', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)))),
            ),
          Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}
