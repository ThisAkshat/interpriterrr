import 'package:flutter/material.dart';

class EmotionsPage extends StatelessWidget {
  const EmotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF00796B), // Bottom color now at the top
                  Color(0xFF004D40), // Gradient transition color
                  Colors.black, // Black color now at the bottom
                ],
                stops: [0.0, 0.3, 1.0], // Adjust stops as needed
              ),
            ),
          ),
          // Content
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 40), // Space for status bar

                // Back Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back to the previous page
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Title with gradient background
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF00796B), // Top color
                        Color(0xFF004D40), // Bottom color
                      ],
                      stops: [0.15, 0.85],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Emotions',
                      style: TextStyle(
                        fontSize: 24, // Increased font size
                        fontWeight: FontWeight.bold, // Made text bold
                        color: Colors.white,
                        height: 1.5, // Line height for better spacing
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Emotion buttons
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      // Happy
                      EmotionButton(
                        label: 'Happy',
                        emoji: '😊',
                      ),
                      const SizedBox(height: 20),

                      // Sad
                      EmotionButton(
                        label: 'Sad',
                        emoji: '😢',
                      ),
                      const SizedBox(height: 20),

                      // Tired
                      EmotionButton(
                        label: 'Tired',
                        emoji: '🥱',
                      ),
                      const SizedBox(height: 20),

                      // Laughing
                      EmotionButton(
                        label: 'Laughing',
                        emoji: '😂',
                      ),
                    ],
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

class EmotionButton extends StatelessWidget {
  final String label;
  final String emoji;

  const EmotionButton({required this.label, required this.emoji, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 40, // Increased label size
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          // Circle container for the emoji
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(20), // Increased size for the emoji circle
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 40), // Increased emoji size
            ),
          ),
        ],
      ),
    );
  }
}
