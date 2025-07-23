import 'package:flutter/material.dart';
import 'package:millionaire_trivia/screens/intro_screen/splash_screen.dart';
import 'package:millionaire_trivia/screens/home_screen/home.dart';
import 'package:millionaire_trivia/models/app_settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppSettings(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: 'Millionaire Trivia',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: settings.currentTheme.primaryColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: settings.currentTheme.primaryColor,
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: settings.currentTheme.primaryColor,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: settings.currentTheme.primaryColor,
            ),
            scaffoldBackgroundColor: const Color.fromARGB(255, 47, 2, 71),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
