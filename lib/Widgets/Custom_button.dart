import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isLoading;
  final Color backgroundColor; // Added parameter for background color
  final Color textColor; // Added parameter for text color

  CustomButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.isLoading,
    this.backgroundColor = Colors.black, // Default to black
    this.textColor = Colors.white, // Default to white
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: isLoading ? null : onTap, // Disable tap when loading
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor, // Use dynamic background color
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.greenAccent.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(color: textColor) // Use dynamic text color
                : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: textColor, size: 24), // Use dynamic text color
                SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    color: textColor, // Use dynamic text color
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
