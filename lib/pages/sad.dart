import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart'; // Import video_player package

class SadPage extends StatefulWidget {
  const SadPage({super.key});

  @override
  _SadPageState createState() => _SadPageState();
}

class _SadPageState extends State<SadPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller
    _controller = VideoPlayerController.asset('assets/sad.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the video is initialized before displaying
        _controller.play(); // Start playing the video
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller when the page is removed
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
          // Centered video player
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller), // Play the video
            )
                : const CircularProgressIndicator(), // Show loading until video is ready
          ),
        ],
      ),
    );
  }
}
