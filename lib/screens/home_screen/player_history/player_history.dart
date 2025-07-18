import 'package:flutter/material.dart';

class PlayerHistory extends StatefulWidget {
  const PlayerHistory({super.key});

  @override
  State<PlayerHistory> createState() => _PlayerHistoryState();
}

class _PlayerHistoryState extends State<PlayerHistory> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.pop(context),
          
        ),
        title: Text(
          'Play History',
          style: TextStyle(
            color: Colors.white,
            fontSize: screenHeight * 0.025,
            fontWeight: FontWeight.bold,

          )
          ),
        actions: [
          IconButton(onPressed: onPressed, icon: Icon(Icons.close, color: Colors.white, ))
        ],
        backgroundColor: const Color.fromARGB(255, 133, 2, 255)
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 103, 2, 192),
              Color.fromARGB(255, 45, 18, 87),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  void onPressed() {
    Navigator.pop(context, true);
  }
}