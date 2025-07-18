import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/play_screen/congratulation_screen.dart';
import 'package:millionaire_trivia/screens/play_screen/price_list.dart';
import 'package:millionaire_trivia/screens/replay_screen/failed_modal.dart';
import 'game_exit_modal.dart';

class PlayScreen extends StatefulWidget {
   const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  void _showExitModal(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Exit Modal',
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => GameExitModal(
      onContinue: () {
        Navigator.pop(context); // close the modal
        // Handle continue logic here
      },
      onShare: () {
        Navigator.pop(context);
        // Handle share logic here
      },
      onExit: () {
        Navigator.pop(context);
        // Handle exit game logic here
      },
    ),
    transitionBuilder: (_, animation, __, child) {
      return Transform.scale(
        scale: animation.value,
        child: Opacity(
          opacity: animation.value,
          child: child,
        ),
      );
    },
  );
}
  void _showFailedModal(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Exit Modal',
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => FailedModal(
      onContinue: () {
        Navigator.pop(context); // close the modal
        // Handle continue logic here
      },
      onGiveup: () {
        Navigator.pop(context);
        // Handle exit game logic here
      },
    ),
    transitionBuilder: (_, animation, __, child) {
      return Transform.scale(
        scale: animation.value,
        child: Opacity(
          opacity: animation.value,
          child: child,
        ),
      );
    },
  );
}

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
              Color.fromARGB(255, 74, 1, 170),
              Color.fromARGB(255, 39, 1, 82),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          SizedBox(height: 60),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _showExitModal(context),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.close, color: Colors.white, size: 30),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => PriceList()),
                      );
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '\$100 000',
                          style: TextStyle(
                            color: const Color.fromARGB(178, 255, 255, 255),
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20), // Make space above
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none, // Allow overflow
                  children: [
                    // Question box
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 10,
                      ),
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'What is the name of the Flutter developer of Millionaire Trivia?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    // Floating label
                    Positioned(
                      top: -20, // Float above
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight * 0.06,
                        width: screenWidth * 0.7,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 27, 1, 68),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '5/15',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.exposure_minus_2,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.question_mark_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CongratulationScreen()),
                    ),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.leaderboard_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showFailedModal(context),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.restart_alt_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),

              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 50,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(133, 27, 1, 68),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        child: Text(
                          'A',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth * 0.036,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 50,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(133, 27, 1, 68),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        child: Text(
                          'B',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth * 0.036,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 50,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(133, 27, 1, 68),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        child: Text(
                          'C',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth * 0.036,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 50,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(133, 27, 1, 68),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        child: Text(
                          'D',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth * 0.036,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
