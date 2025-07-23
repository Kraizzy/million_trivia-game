import 'package:flutter/material.dart';

enum GameMode { simple, timed }

enum AppTheme {
  defaultTheme,
  theme1,
  theme2,
  theme3,
}

extension AppThemeExtension on AppTheme {
  Color get primaryColor {
    switch (this) {
      case AppTheme.theme1:
        return Colors.pinkAccent;
      case AppTheme.theme2:
        return Colors.blueGrey;
      case AppTheme.theme3:
        return Colors.indigo;
      default:
        return Colors.purpleAccent;
    }
  }

  String get name {
    switch (this) {
      case AppTheme.theme1:
        return "Theme 1";
      case AppTheme.theme2:
        return "Theme 2";
      case AppTheme.theme3:
        return "Theme 3";
      default:
        return "Default";
    }
  }
}

class AppSettings extends ChangeNotifier {
  bool soundOn = true;
  bool vibrationOn = true;
  GameMode gameMode = GameMode.simple;

  AppTheme _currentTheme = AppTheme.defaultTheme;

  AppTheme get currentTheme => _currentTheme;

  void setTheme(AppTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void toggleSound() {
    soundOn = !soundOn;
    notifyListeners();
  }

  void toggleVibration() {
    vibrationOn = !vibrationOn;
    notifyListeners();
  }

  void toggleGameMode() {
    gameMode = gameMode == GameMode.simple ? GameMode.timed : GameMode.simple;
    notifyListeners();
  }
}
