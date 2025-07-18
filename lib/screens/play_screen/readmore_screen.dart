import 'package:flutter/material.dart';

class ReadmoreScreen extends StatefulWidget {
  const ReadmoreScreen({super.key});

  @override
  State<ReadmoreScreen> createState() => _ReadmoreScreenState();
}

class _ReadmoreScreenState extends State<ReadmoreScreen> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Read More',
          style: TextStyle(
            color: Colors.white,
            
          )
          

          ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(100, 0, 0, 0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.blueGrey,
        child: Column(),
      ),
    );
  }
}
