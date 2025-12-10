import 'package:flutter/material.dart';
import 'package:runway/core/widgets/custom_text.dart';
import 'package:runway/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen2()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
              text: 'Runway',
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
              text: 'Runway',
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          Center(child: Image.asset('assets/images/splash.png')),
        ],
      ),
    );
  }
}
