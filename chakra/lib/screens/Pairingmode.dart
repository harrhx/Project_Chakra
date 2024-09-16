import 'package:flutter/material.dart';
import 'package:chakra/Widgets/theCRA.dart';
import 'package:chakra/screens/records.dart';
import 'package:chakra/screens/chakra.dart';
import 'package:chakra/screens/Analysis.dart';

class Pairingmode extends StatefulWidget {
  @override
  _PairingmodeState createState() => _PairingmodeState();
}

class _PairingmodeState extends State<Pairingmode>
    with TickerProviderStateMixin {
  late AnimationController _bigCircleController;
  late AnimationController _smallCircleController;
  late Animation<double> _bigCircleAnimation;
  late Animation<double> _smallCircleAnimation;
  


  @override
  void initState() {
    super.initState();

    // Controller for the big circle animation
    _bigCircleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _smallCircleController.forward();
        } else if (status == AnimationStatus.dismissed) {
          _bigCircleController.forward();
        }
      });

    // Controller for the small circle animation
    _smallCircleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(milliseconds: 200), () {
            _bigCircleController.reverse();
            _smallCircleController.reverse();
          });
        }
      });

    _bigCircleAnimation = Tween<double>(begin: 0.5, end: 0.85).animate(
      CurvedAnimation(
        parent: _bigCircleController,
        curve: Curves.easeInOut,
      ),
    );

    // Set the small circle animation size to begin at 0.4
    _smallCircleAnimation = Tween<double>(begin: 0.43, end: 0.7).animate(
      CurvedAnimation(
        parent: _smallCircleController,
        curve: Curves.easeInOut,
      ),
    );

    _bigCircleController.forward();
  }

  @override
  void dispose() {
    _bigCircleController.dispose();
    _smallCircleController.dispose();
    super.dispose();
  }

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
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _bigCircleAnimation,
                builder: (context, child) {
                  return Container(
                    width: screenWidth * _bigCircleAnimation.value,
                    height: screenWidth * _bigCircleAnimation.value,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF6F0043),
                      shape: OvalBorder(),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _smallCircleAnimation,
                builder: (context, child) {
                  return Container(
                    width: screenWidth * _smallCircleAnimation.value,
                    height: screenWidth * _smallCircleAnimation.value,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFED0003),
                      shape: OvalBorder(),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: screenWidth * 0.4, // Adjust text size proportionally
                height: screenHeight * 0.8,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Finding your Chakra!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Esteban',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 10,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            ButtonRow(screenHeight: screenHeight, screenWidth: screenWidth)
          ],
        ),
      ),
    );
  }
}
