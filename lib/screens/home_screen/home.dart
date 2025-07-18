import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/home_screen/player_history/player_history.dart';
import 'package:millionaire_trivia/screens/leaderboard_sceen/leaderboard_screen.dart';
import 'package:millionaire_trivia/screens/ready_screen/ready_screen.dart';
import 'package:millionaire_trivia/screens/setting_screen/setting_screen.dart';
import 'package:millionaire_trivia/screens/profile_screen/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 59, 2, 124),
                Color.fromARGB(255, 50, 23, 94),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Header Icons
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  // spacing: screenWidth * 0.065,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateProfileScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(100, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.white60,
                          size: 30,
                        ),
                      ),
                    ),

                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayerHistory(),
                          ),
                        );
                      },
                      child: Container(
                        height: screenHeight * 0.036,
                        width: screenWidth * 0.27,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(100, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '\$1M',
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.normal,
                              fontSize: screenHeight * 0.017,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        // Show the settings screen as a modal
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                            fullscreenDialog:
                                true, // Optional: makes it slide up with "X" close button
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(100, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              //Millionaire Logo
              SizedBox(
                height: 250,
                width: 320,

                child: Image.asset(
                  'assets/img/game_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: screenHeight * 0.18),

              //Start Game Button
              // Navigate to Replay Screen
              // This button will take the user to the ReplayScreen when tapped.
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
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Play',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: screenHeight * 0.03,
                              fontFamily: GoogleFonts.arimo().fontFamily,
                            ),
                          ),
                          Text(
                            'New Game',
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
              SizedBox(height: 50),

              //Start Leadership Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LeaderboardScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 8),
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 249, 249),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50,
                          height: screenHeight * 0.045,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.leaderboard,
                            color: const Color.fromARGB(223, 6, 3, 53),
                            size: 45,
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          children: [
                            Text(
                              'Leaderboard',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 2, 29, 44),
                                fontWeight: FontWeight.bold,
                                fontSize: screenHeight * 0.022,
                              ),
                            ),
                            Text(
                              'See your Ranking',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 2, 29, 44),
                                fontSize: screenHeight * 0.015,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            
              ),
              SizedBox(height: 8),

              //Join Our Community Button
              GestureDetector(
                onTap: () {
                  // Handle learn digital skills action
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(209, 15, 59, 99),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Join Our Community',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              //Learn Digital Skills Button
              GestureDetector(
                onTap: () {
                  // Handle learn digital skills action
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(209, 15, 59, 99),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Learn Digital Skills',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
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
