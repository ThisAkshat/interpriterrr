import 'package:flutter/material.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({super.key});

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
                      'Common Words',
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

                // Content for the page (5 transparent gray boxes vertically)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding from left and right
                    child: ListView.builder(
                      itemCount: 5, // We want 5 boxes
                      itemBuilder: (context, index) {
                        // List of names for each box
                        List<String> boxNames = [
                          'Greetings',
                          'Food',
                          'Transport',
                          'Daily Life',
                          'Relation'
                        ];

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10), // Space between boxes
                          height: 100, // Height of each box
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3), // Transparent gray background
                            borderRadius: BorderRadius.circular(15), // Rounded corners
                          ),
                          child: Center(
                            child: Text(
                              boxNames[index], // Display the corresponding name
                              style: const TextStyle(
                                fontSize: 30, // Font size for the label
                                fontWeight: FontWeight.bold, // Bold font
                                color: Colors.white, // Text color
                              ),
                            ),
                          ),
                        );
                      },
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
