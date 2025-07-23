import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:millionaire_trivia/models/app_settings.dart';

class ThemeModal extends StatefulWidget {
  const ThemeModal({super.key});

  @override
  State<ThemeModal> createState() => _ThemeModalState();
}

class _ThemeModalState extends State<ThemeModal> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: SafeArea(
        child: Stack(
          children: [
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
                      const SizedBox(height: 20),

                      buildThemeButton(
                        context: context,
                        title: 'Default',
                        color: Colors.purpleAccent,
                        theme: AppTheme.defaultTheme,
                      ),
                      buildThemeButton(
                        context: context,
                        title: 'Theme 1',
                        color: Colors.pinkAccent,
                        theme: AppTheme.theme1,
                      ),
                      buildThemeButton(
                        context: context,
                        title: 'Theme 2',
                        color: Colors.blueGrey,
                        theme: AppTheme.theme2,
                      ),
                      buildThemeButton(
                        context: context,
                        title: 'Theme 3',
                        color: Colors.indigo,
                        theme: AppTheme.theme3,
                      ),
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

  Widget buildThemeButton({
    required BuildContext context,
    required String title,
    required Color color,
    required AppTheme theme,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Provider.of<AppSettings>(context, listen: false).setTheme(theme);
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
