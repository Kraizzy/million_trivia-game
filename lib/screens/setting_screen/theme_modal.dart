import 'package:flutter/material.dart';

class ThemeModal extends StatefulWidget {
  const ThemeModal({super.key});

  @override
  State<ThemeModal> createState() => _ThemeModalState();
}

class _ThemeModalState extends State<ThemeModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8), // semi-transparent overlay
      body: SafeArea(
        child: Stack(
          children: [
            /// ❌ Close button (top-right)
            Positioned(
              bottom: 25,
              right: 0,
              left: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.close, size: 28, color: Colors.black),
                ),
              ),
            ),

            /// Centered content panel
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E0A2F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Choose Your Theme',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      // Add theme options here
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}