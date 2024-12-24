import 'package:flutter/material.dart';

class AlphabetPage extends StatelessWidget {
  const AlphabetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set back button color to white
        ),// Match gradient's starting color
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF00796B), // Top gradient color
                  Color(0xFF004D40), // Middle gradient color
                  Colors.black, // Bottom gradient color
                ],
                stops: [0.0, 0.3, 1.0],
              ),
            ),
          ),
          // Content
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Header Text inside a gradient box with padding
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF00796B), // Top color
                          Color(0xFF004D40), // Gradient transition color
                        ],
                        stops: [0.15, 0.67],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(36.0)),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                    child: const Text(
                      "The ISL Alphabet",
                      style: TextStyle(
                        fontSize: 36, // Increased font size
                        fontWeight: FontWeight.w900, // Extra bold text
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Alphabet Image
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 100.0),
                      child: Image.asset(
                        'assests/photo abc.png', // Path to your PNG image
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
