import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/replay_screen/exit_replay_sceen.dart';

class GameExitModal extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onShare;
  final VoidCallback onExit;

  const GameExitModal({
    super.key,
    required this.onContinue,
    required this.onShare,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 75, 32, 148), const Color.fromARGB(255, 53, 11, 92)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Logo
            Image.asset(
              'assets/img/game_logo.png', // Make sure to include your image asset
              height: 100,
            ),

            SizedBox(height: 20),

            // Take Button
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 0, 0, 0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text('Take', style: TextStyle(color: Colors.white)),
                  Text(
                    '\$0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Motivation Text
            Text(
              'Quitters never win. Do not quit, continue to win',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            // Continue Button
            GestureDetector(
              onTap: onContinue,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 0, 0, 0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),

            // Share Button
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ReplayScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Share',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Exit Game
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context) => const ReplayScreen()),
                );
              },
              child: Text(
                'Exit Game',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
