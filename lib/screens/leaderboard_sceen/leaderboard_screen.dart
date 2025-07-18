import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/home_screen/home.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'All Time'),
    Tab(text: 'Weekly'),
    Tab(text: 'Daily'),
    Tab(text: 'Country'),
  ];

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  get myTabs => null;

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
            SizedBox(height: 65),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    //Handles on tap
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.share, color: Colors.white, size: 30),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 25,
                  width: 120,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      'Leaderboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.0182,
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
                        builder: (context) => const HomeScreen(),
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
                    child: Icon(Icons.close, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      tabAlignment: TabAlignment.center,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.white,
                      labelStyle: TextStyle(fontStyle: FontStyle.normal, color: Colors.white, fontSize: screenHeight * 0.0164),
                      indicatorColor: const Color.fromARGB(255, 0, 216, 245),
                      tabs: const [
                        Tab(text: 'All Time'),
                        Tab(text: 'Weekly'),
                        Tab(text: 'Daily'),
                        Tab(text: 'Country'),
                      ],
                    ),
                    Expanded(
                      child:  TabBarView(
                        children: [
                          
                            Container(
                          color:Colors.white,
                        ),
                      
                      Container(
                        color: Colors.blue,
                      ),
                      
                      Container(
                        color: Colors.greenAccent ,
                      ),
                      
                      Container(
                        color: Colors.red,
                      )

                        ],
                      
                    )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
