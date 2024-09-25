import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_joy/views/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Get.off(
        () => HomeScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF014483),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
                top: 75,
                bottom: 55,
              ),
              child: Hero(
                tag: 'splashHero',
                child: Image.asset(
                  "assets/images/splash.jpeg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
