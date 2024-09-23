import 'package:flutter/material.dart';
import 'dart:ui'; // Import this for the blur effect

class Chakra extends StatefulWidget {
  final Function onPressedPairingmode;
  const Chakra({super.key, required this.onPressedPairingmode});

  @override
  _ChakraState createState() => _ChakraState();
}

class _ChakraState extends State<Chakra> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            Positioned(
              left:
                  screenWidth * 0.24, // Relative positioning for responsiveness
              top: screenHeight * 0.38,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  width:
                      screenWidth * 0.52, // Width adjusted relative to screen
                  height:
                      screenHeight * 0.24, // Height adjusted relative to screen
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.13,
              top: screenHeight * 0.45,
              child: SizedBox(
                width: screenWidth * 0.73,
                height: screenHeight * 0.08,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(53),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0, // Horizontal blur intensity
                            sigmaY: 10.0, // Vertical blur intensity
                          ),
                          child: Container(
                            width: screenWidth * 0.73,
                            height: screenHeight * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(53),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  widget.onPressedPairingmode();
                                },
                                child: Text(
                                  'Pair your Chakra',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.065,
                                    fontFamily: 'Esteban',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
