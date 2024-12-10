// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Classes
import 'package:metrok/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(const HomeScreen()); // Pressing the back button on the home page will close the app instead of returning to the splash page.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/img/metrok.png',
            width: 190,
            height: 190,
          ),
        ),
      ),
    );
  }
}
