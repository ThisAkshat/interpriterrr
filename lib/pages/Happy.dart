import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HappyPage extends StatefulWidget {
  const HappyPage({super.key});

  @override
  _HappyPageState createState() => _HappyPageState();
}

class _HappyPageState extends State<HappyPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player with the asset file
    _controller = VideoPlayerController.asset('assests/happy.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // Play video once initialized
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose of the controller to avoid memory leaks
  }

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
          // Back Button
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous page
              },
            ),
          ),
          // Center the video
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : const CircularProgressIndicator(), // Show a loading indicator until video is initialized
          ),
        ],
      ),
    );
  }
}
