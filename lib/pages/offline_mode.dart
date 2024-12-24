import 'package:flutter/material.dart';
import 'Alphabet.dart'; // Import AlphabetPage
import 'Number.dart'; // Import NumberPage
import 'Common.dart'; // Import CommonPage
import 'Emotions.dart'; // Import EmotionsPage

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

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
                      'Dictionary and\nVideo Lessons',
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

                const SizedBox(height: 20),

                // Search bar with gradient background
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF00796B), // Top color
                        Color(0xFF004D40),
                      ],
                      stops: [0.15, 0.85],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.white),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search category',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Categories grid with spacing and labels inside the boxes
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding from left and right
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 66,
                      crossAxisSpacing: 26,
                      childAspectRatio: 1, // Adjusted ratio to accommodate increased height
                      children: [
                        _buildCategoryCardWithGradient(
                            context, "The ISL Alphabet", "assests/ABC.png"),
                        _buildCategoryCardWithGradient(
                            context, "Numbers", "assests/Numbers.png"),
                        _buildCategoryCardWithGradient(
                            context, "Emotions", "assests/Smiling_Face.png"),
                        _buildCategoryCardWithGradient(
                            context, "Common words", "assests/images/Three_People.png"),
                      ],
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

  // Card with text and gradient background
  Widget _buildCategoryCardWithGradient(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate based on title
        if (title == "The ISL Alphabet") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AlphabetPage()),
          );
        } else if (title == "Numbers") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NumberPage()),
          );
        } else if (title == "Common words") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CommonPage()),
          );
        } else if (title == "Emotions") { // Add this condition for Emotions
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EmotionsPage()), // Navigate to EmotionsPage
          );
        }
      },
      child: Container(
        height: 150, // Increased height for the box
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00796B), // Top color
              Color(0xFF004D40), // Gradient transition color
            ],
            stops: [0.15, 0.67], // Adjust stops to match the background
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align content to the top
          children: [
            // Text inside the box with padding from the top
            Padding(
              padding: const EdgeInsets.only(top: 5), // 5 dp padding from top inside the box
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            // PNG image in the center of the remaining space
            Padding(
              padding: const EdgeInsets.all(22.0), // Padding for better placement
              child: Image.asset(
                imagePath,
                height: 80, // Adjusted the height to make it smaller
                fit: BoxFit.contain, // Ensure the image fits properly
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
