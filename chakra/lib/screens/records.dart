import 'package:flutter/material.dart';
import 'package:chakra/Widgets/theCRA.dart';
import 'package:chakra/Widgets/scrollabel_widget.dart';

class Recordscreen extends StatelessWidget {
  const Recordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Use the scale factor based on the iPhone 15 Pro Max's screen size for reference
    final widthScale = screenWidth / 430; // iPhone 15 Pro Max width
    final heightScale = screenHeight / 932; // iPhone 15 Pro Max height

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            // Header Section
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 70 * heightScale, // Adjust padding based on screen height
                  left: 33 * widthScale, // Adjust padding based on screen width
                ),
                child: Text(
                  'RECORDS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40 * widthScale, // Adjust font size based on screen width
                    fontFamily: 'Roboto Condensed',
                    fontWeight: FontWeight.w800,
                    height: 1.2, // Adjust height to space letters evenly
                    letterSpacing: 10.80 * widthScale, // Scale letter spacing as well
                  ),
                ),
              ),
            ),

            // ListView.builder containing a single container
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Set to 1 to only have a single container
                itemBuilder: (context, index) {
                  // Dynamic opacity based on index (0 for a single container in this case)
                  double containerOpacity = 1.0 - (index * 0.2);

                  return ScrollableList(heightScale: heightScale, widthScale: widthScale, screenHeight: screenHeight, screenWidth: screenWidth, containerOpacity: containerOpacity);
                },
              ),
            ),
            // Button Row
            ButtonRow(screenHeight: screenHeight, screenWidth: screenWidth),
          ],
        ),
      ),
    );
  }
}
