import 'package:flutter/material.dart';
import 'package:pc_genius/FirebaseServices/splash_screen_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: Duration(seconds: 3), // Animation duration (3 seconds)
      vsync: this,
    );

    // Define the fade animation (fades from fully visible to invisible)
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    // Start the splash screen fade effect and then navigate
    SplashScreenServices().isLogin(context, _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FadeTransition(
        opacity: _fadeAnimation, // Apply the fade animation
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/1.jpeg'), // Your splash image
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }
}
