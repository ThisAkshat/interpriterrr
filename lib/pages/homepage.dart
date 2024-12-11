import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class HomePage extends StatelessWidget implements NavigationStates {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBFC4C4),
      body: Stack(
        children: [
          // Split background colors
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF00796B), // Bottom color now at the top
                  Color(0xFF004D40), // Gradient transition color
                  Colors.black,      // Black color now at the bottom
                ],
                stops: [0.0, 0.3, 1.0], // Adjust stops as needed
              ),
            ),
          ),



          // Main content
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40), // For top padding

                // Search Box
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 0),
                    Container(
                      height: 40,
                      width: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20), // Circular from both sides
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(height: 1.8),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Add space above the green box to move it down
                const SizedBox(height: 60), // Adjust this value for the desired distance

                // Sign Subtitle Box (Moved lower and made bigger)
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(40), // Increased padding for a bigger box
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // Adjust margin for more space
                    decoration: BoxDecoration(
                      color: const Color(0xFF417878), // Dark Green color
                      borderRadius: BorderRadius.circular(40), // Slightly increased border radius for a smoother look
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Sign subtitle',
                          style: TextStyle(
                            fontSize: 30, // Increased font size for the subtitle
                            fontWeight: FontWeight.bold, // Bold text
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12), // Increased space between title and description
                        Text(
                          'Try our special features with the sign subtitles',
                          style: TextStyle(
                            fontSize: 18, // Larger font for better readability
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Centered Circles with top padding (Moved Down)
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15), // Reduced top padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCircle(icon: Icons.pan_tool, label: 'Sign to Audio'),
                          const SizedBox(width: 16),
                          _buildCircle(icon: Icons.mic, label: 'Audio to Sign'),
                          const SizedBox(width: 16),
                          _buildCircle(icon: Icons.widgets_sharp, label: 'ABCI'),
                          const SizedBox(width: 16),
                          _buildCircle(icon: Icons.more_horiz, label: 'MORE'),
                        ],
                      ),
                    ),
                  ),
                ),

                // Advertisement Box
                const SizedBox(height: 10),
                Container(
                  height: 220, // Increased height for the advertisement box
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.only(bottom: 16), // Added bottom padding to move it up
                  decoration: BoxDecoration(
                    color: const Color(0xFF417878), // Dark gray advertisement box
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      'Advertisement',
                      style: TextStyle(
                        fontSize: 18, // Increased font size for better visibility
                        fontWeight: FontWeight.bold, // Made text bold
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(
                  color: Colors.white, // White color for the line
                  thickness: 3, // Line thickness
                  indent: 16, // Space before the line starts (same as container margin)
                  endIndent: 16, // Space after the line ends (same as container margin)
                ),

                // Bottom Buttons
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBottomButton(icon: Icons.wifi_off, label: 'Offline mode'),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Colors.black, // Black background color
                          shape: BoxShape.circle, // Circular shape
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.video_call, size: 30, color: Colors.white), // Video call icon in white
                          onPressed: () {
                            // Add your video call functionality here
                          },
                        ),
                      ),
                      _buildBottomButton(icon: Icons.chat_bubble, label: 'Chat support'),
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

  Widget _buildCircle({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36), // More circular shape
          ),
          child: Icon(icon, size: 32, color: const Color(0xFF66CDAA)),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.white),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
