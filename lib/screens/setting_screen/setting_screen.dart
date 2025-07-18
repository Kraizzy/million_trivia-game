// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/setting_screen/credits_modal.dart';
import 'package:millionaire_trivia/screens/setting_screen/language_modal.dart';
import 'package:millionaire_trivia/screens/setting_screen/theme_modal.dart';
import 'package:millionaire_trivia/widgets/custom_setting_button.dart';
import 'package:provider/provider.dart';
import 'package:millionaire_trivia/models/app_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettings>(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      backgroundColor: const Color.fromARGB(
        255,
        47,
        2,
        71,
      ),
       // Purple background
      body: SafeArea(
        
        child: Stack(
          children: [
            // Close button (top right)
            Positioned(
              top: 20,
              right: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.close),
                ),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Sound
                  CustomSettingButton(
                    title: "Sound",
                    subtitle: settings.soundOn ? "ON" : "OFF",
                    icon: settings.soundOn ? Icons.volume_up : Icons.volume_off,
                    onTap: () {
                      settings.toggleSound(); // Toggle sound setting
                    }, // TODO: add toggle logic
                  ),

                  // Language
                  CustomSettingButton(
                    title: "Language",
                    subtitle: "English",
                    icon: Icons.language,
                    leadingImage: Image.asset(
                      "assets/flags/uk.jpg",
                      width: 30,
                      height: 30,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false, // allows background to be visible
                          fullscreenDialog:
                              true, // gives modal-style animation (optional)
                          pageBuilder: (_, __, ___) => const LanguageModal(),
                          transitionsBuilder: (_, anim, __, child) {
                            return FadeTransition(opacity: anim, child: child);
                          },
                        ),
                      );
                    }, // TODO: open language modal
                  ),

                  // Theme
                  CustomSettingButton(
                    title: "Select a theme",
                    subtitle: "Default",
                    icon: Icons.color_lens,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false, // allows background to be visible
                          fullscreenDialog:
                              true, // gives modal-style animation (optional)
                          pageBuilder: (_, __, ___) => const ThemeModal(),
                          transitionsBuilder: (_, anim, __, child) {
                            return FadeTransition(opacity: anim, child: child);
                          },
                        ),
                      );
                    },
                  ),

                  // Game mode
                  CustomSettingButton(
                    title: "Game mode",
                    subtitle: settings.gameMode == GameMode.simple ? "Simple" : "Timed",
                    icon: Icons.sports_esports,
                    onTap: () {
                      settings.toggleGameMode(); // Toggle game mode
                    },
                  ),

                  // Vibration
                  CustomSettingButton(
                    title: "Vibration",
                    subtitle: settings.vibrationOn ? "ON" : "OFF",
                    icon: settings.vibrationOn ?  Icons.vibration : Icons.mobile_off_outlined,
                    onTap: () {
                      settings.toggleVibration(); // Toggle vibration setting
                    },
                  ),

                  // Credits
                  CustomSettingButton(
                    title: "Credits",
                    subtitle: "v1.0",
                    icon: Icons.info,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false, // allows background to be visible
                          fullscreenDialog:
                              true, // gives modal-style animation (optional)
                          pageBuilder: (_, __, ___) => const CreditsModal(),
                          transitionsBuilder: (_, anim, __, child) {
                            return FadeTransition(opacity: anim, child: child);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
