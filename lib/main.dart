import 'package:flutter/material.dart';
import 'package:image_video/config/theme/app_theme.dart';
import 'package:image_video/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme.themeData,
      home: const HomeScreen(),
    );
  }
}
