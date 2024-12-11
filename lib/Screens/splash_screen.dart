import 'package:flutter/material.dart';
import 'package:interpriter/Screens/welcome_screen.dart';
import 'dart:async';
import 'Screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Duration for one scale cycle
    );

    // Set up the animation to scale between 0.8 and 1.2
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    // Start the animation
    _animationController.forward();

    // Set a timer for 3 seconds to navigate to the WelcomeScreen
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color of the splash screen
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value, // Scale the image
              child: child,
            );
          },
            child: Image.asset(
              'assests/images/signbridgelogo.png',
              height: 200,
              width: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'Image not found!',
                  style: TextStyle(color: Colors.red),
                );
              },
            ),

        ),
      ),
    );
  }
}
