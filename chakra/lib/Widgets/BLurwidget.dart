import 'dart:ui';
import 'package:flutter/material.dart';

class DistortedBlurBox extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double blurIntensity;
  final double borderRadius;

  const DistortedBlurBox({
    required this.width,
    required this.height,
    required this.child,
    this.blurIntensity = 30.0,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Apply a strong blur effect to the content behind this box
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurIntensity, sigmaY: blurIntensity),
              child: Container(
                color: Colors.transparent, // Must have a container here for the effect
              ),
            ),
            // Optional: Add a semi-transparent overlay color
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2), // Adjust opacity as needed
              ),
              child: child, // Your content goes here
            ),
          ],
        ),
      ),
    );
  }
}