import 'dart:async'; // Import for Timer
import 'dart:math'; // Import for mathematical functions
import 'package:flutter/material.dart';
import 'package:pc_genius/FirebaseServices/splash_screen_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _displayedText = "";
  final String _fullText = "PC GENIUS";
  final Duration _typingSpeed = const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();

    // Initialize the rotation animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 5), // Slower rotation
      vsync: this,
    )..repeat(); // Continuous rotation

    // Trigger splash screen navigation
    SplashScreenServices().isLogin(context);

    // Start typing the text
    _startTyping();
  }

  // Function to simulate typing effect
  void _startTyping() {
    Timer.periodic(_typingSpeed, (timer) {
      if (_displayedText.length < _fullText.length) {
        setState(() {
          _displayedText += _fullText[_displayedText.length];
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image displayed above the rotating icons
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Image.asset(
              'assets/images/1.jpeg', // Replace with your image path
              height: 250, // Adjust the image height
              width: 250, // Adjust the image width
            ),
          ),
          const SizedBox(height: 120),
          // Rotating Icons forming a loading circle
          Stack(
            alignment: Alignment.center,
            children: [
              _buildRotatingIcon(Icons.memory, 0), // Icon 1
              _buildRotatingIcon(Icons.storage, 90), // Icon 2
              _buildRotatingIcon(Icons.computer, 180), // Icon 3
              _buildRotatingIcon(Icons.power, 270), // Icon 4
            ],
          ),
          const SizedBox(height: 150),
          // Displaying the typed text
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  _displayedText,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.green.withOpacity(0.5), // Border effect
                  ),
                ),
                Text(
                  _displayedText,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRotatingIcon(IconData icon, double angle) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double radians = (angle + _controller.value * 360) * (pi / 180); // Use pi from dart:math
        double radius = 100.0; // Distance from the center
        return Transform.translate(
          offset: Offset(
            radius * cos(radians),
            radius * sin(radians),
          ),
          child: child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.green, width: 2), // Border for the icon
        ),
        child: Icon(
          icon,
          size: 50, // Icon size
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the rotation animation
    super.dispose();
  }
}
