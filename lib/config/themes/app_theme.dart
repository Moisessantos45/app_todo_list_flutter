import 'package:flutter/material.dart';

const Color _themeColor = Color(0xFF2475E0);

const List<Color> _themeColors = [
  _themeColor,
  Color(0xFF2E7D32),
  Color(0xFFC2185B),
  Color(0xFF512DA8),
  Color(0xFFD32F2F),
  Color(0xFF1976D2),
  Color(0xFF388E3C),
  Color(0xFF7B1FA2),
  Color(0xFFC62828),
  Color(0xFF1E88E5),
  Color(0xFF43A047),
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0})
      : assert(selectColor >= 0 && selectColor < _themeColors.length);

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _themeColors[selectColor],
    );
  }
}