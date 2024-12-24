import 'package:flutter/material.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Custom arrangement of numbers
    final List<int?> gridItems = [
      0, 1, 2,      // First row
      3, 4, 5,      // Second row
      6, 7, 8,      // Third row
      null, 9, null // Fourth row (9 is in the middle of the 2nd column)
    ];

    // Define images for each number
    final Map<int, String> imagePaths = {
      0: 'assests/zeroSign.png',
      1: 'assests/firstSign.png',
      2: 'assests/twoSign.png',
      3: 'assests/threeSign.png',
      4: 'assests/fourSign.png',
      5: 'assests/fiveSign.png',
      6: 'assests/sixSign.png',
      7: 'assests/sevenSign.png',
      8: 'assests/eightSign.png',
      9: 'assests/nineSign.png',
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set back button color to white
        ),
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
                      "Numbers",
                      style: TextStyle(
                        fontSize: 36, // Increased font size
                        fontWeight: FontWeight.w900, // Extra bold text
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Grid of boxes
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 boxes per row
                      crossAxisSpacing: 16.0, // Space between columns
                      mainAxisSpacing: 16.0, // Space between rows
                      childAspectRatio: 1, // Make the boxes square-shaped
                    ),
                    itemCount: gridItems.length,
                    itemBuilder: (context, index) {
                      final number = gridItems[index];

                      if (number == null) {
                        // Render an empty placeholder for null items
                        return const SizedBox.shrink();
                      }

                      // Get the image path for the number
                      final imagePath = imagePaths[number];

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3), // Transparent gray for all boxes
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            // Number in the upper-left corner
                            Positioned(
                              top: 8.0,
                              left: 8.0,
                              child: Text(
                                '$number', // Display the number (0 to 9)
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // Add the image to the corresponding box
                            if (imagePath != null)
                              Positioned(
                                bottom: 8.0,
                                right: 6.0,
                                child: Image.asset(
                                  imagePath, // Correct path for the image
                                  width: 80, // Adjust the width of the image as needed
                                  height: 80, // Adjust the height of the image as needed
                                  fit: BoxFit.contain, // Maintain the aspect ratio
                                ),
                              ),
                          ],
                        ),
                      );
                    },
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
