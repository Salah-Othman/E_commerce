import 'package:flutter/material.dart';
import 'package:runway/core/theme/theme_data.dart';
import 'package:runway/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      
    );
  }
}
