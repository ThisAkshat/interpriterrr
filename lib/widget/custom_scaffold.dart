import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black, // Top color (matches the image's top)
                  Color(0xFF004D40), // Gradient transition color
                  Color(0xFF00796B), // Bottom color (matches the image's bottom)
                ],
                stops: [0.2, 0.7, 1.0], // Adjust stops to make black more prominent
              ),
            ),
          ),
          // The main content
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}
