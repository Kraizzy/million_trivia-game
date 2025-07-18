import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<Offset> _logoAnimation;

  late List<AnimationController> _itemControllers;
  late List<Animation<Offset>> _itemAnimations;

  final List<Map<String, dynamic>> trainingItems = [
    {'icon': Icons.language, 'text': 'Web Development'},
    {'icon': Icons.android_outlined, 'text': 'Mobile Development'},
    {'icon': Icons.campaign, 'text': 'Digital Marketing'},
    {'icon': Icons.cloud, 'text': 'Data Science'},
  ];

  @override
  void initState() {
    super.initState();

    // --- Logo Animation ---
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOutBack,
    ));

    _logoController.forward();

    // --- Items ---
    _itemControllers = List.generate(trainingItems.length, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      );
    });

    _itemAnimations = List.generate(trainingItems.length, (index) {
      final fromLeft = index % 2 == 0;
      return Tween<Offset>(
        begin: Offset(fromLeft ? -1.5 : 1.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _itemControllers[index],
        curve: Curves.easeOutBack,
      ));
    });

    _startSequence();
  }

  Future<void> _startSequence() async {
    // Wait for logo animation
    await Future.delayed(const Duration(milliseconds: 1300));

    // Slide in items one after another
    for (int i = 0; i < _itemControllers.length; i++) {
      _itemControllers[i].forward();
      await Future.delayed(const Duration(milliseconds: 400));
    }

    // Wait before starting exit
    await Future.delayed(const Duration(milliseconds: 2500));

    // Slide out all items simultaneously
    for (int i = 0; i < _itemControllers.length; i++) {
      final toRight = i % 2 == 0;
      _itemAnimations[i] = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(toRight ? 1.5 : -1.5, 0),
      ).animate(CurvedAnimation(
        parent: _itemControllers[i],
        curve: Curves.easeIn,
      ));
      _itemControllers[i].reset();
      _itemControllers[i].forward();
    }

    await Future.delayed(const Duration(milliseconds: 1000));
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    _logoController.dispose();
    for (final controller in _itemControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildTrainingItem(int index, IconData icon, String text) {
    return SlideTransition(
      position: _itemAnimations[index],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow.shade800,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),

              // Logo slide
              SlideTransition(
                position: _logoAnimation,
                child: Image.asset(
                  'assets/img/dd_logo.png',
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.9,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'We train you on:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 25, 36, 99),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Column(
                children: List.generate(
                  trainingItems.length,
                  (index) => _buildTrainingItem(
                    index,
                    trainingItems[index]['icon'],
                    trainingItems[index]['text'],
                  ),
                ),
              ),

              const SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}
