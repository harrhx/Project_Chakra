import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final VoidCallback onPressedChakra;
  final VoidCallback onPressedRecords;
  final VoidCallback onPressedAnalysis;
  final double screenHeight;
  final double screenWidth;

  ButtonRow({
    required this.onPressedChakra,
    required this.onPressedRecords,
    required this.onPressedAnalysis,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      //left: screenWidth * 0.03,
      //top: screenHeight * 0.88,
      child: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
        child: Container(
          width: screenWidth * 0.94,
          height: screenHeight * 0.08,
          child: Stack(
            children: [
              Container(
                width: screenWidth * 0.94,
                height: screenHeight * 0.08,
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 233, 169, 230).withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: screenHeight * 0.018),
                  child: Container(
                    width: screenWidth * 0.28,
                    height: screenHeight * 0.05,
                    decoration: ShapeDecoration(
                      color: Color.fromARGB(126, 255, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Chakra',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontFamily: 'Faustina',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: screenWidth * 0.28,
                  height: screenHeight * 0.05,
                  decoration: ShapeDecoration(
                    color: Color.fromARGB(126, 255, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Records',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontFamily: 'Faustina',
                        fontWeight: FontWeight.w600,
                        height: 0.06,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: screenHeight * 0.018),
                  child: Container(
                    width: screenWidth * 0.28,
                    height: screenHeight * 0.05,
                    decoration: ShapeDecoration(
                      color: Color.fromARGB(126, 255, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Analysis',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontFamily: 'Faustina',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
