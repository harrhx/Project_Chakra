import 'package:chakra/screens/Analysis.dart';
import 'package:flutter/material.dart';
import 'dart:ui'; // Import this to use BackdropFilter
import 'package:chakra/screens/records.dart';
import 'package:chakra/screens/chakra.dart';

class ButtonRow extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  final Function onPressedChakra;
  final Function onPressedRecords;
  final Function onPressedAnalysis;

  const ButtonRow({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onPressedChakra,
    required this.onPressedRecords,
    required this.onPressedAnalysis,
  });

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  

  @override
  Widget build(BuildContext context) {
    final widthScale = widget.screenWidth / 430; // iPhone 15 Pro Max width
    final heightScale = widget.screenHeight / 932; // iPhone 15 Pro Max height
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: widget.screenHeight * 0.02, top: widget.screenHeight * 0.02,left: widthScale * 5,right: widthScale * 5),
        child: SizedBox(
          width: widget.screenWidth * 0.94,
          height: widget.screenHeight * 0.08,
          child: Stack(
            children: [
              // BackdropFilter added to the bottom-most container
              ClipRRect(
                borderRadius: BorderRadius.circular(70), // Match container shape
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur intensity
                  child: Container(
                    width: widget.screenWidth * 0.94,
                    height: widget.screenHeight * 0.08,
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(255, 124, 123, 123).withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  widget.onPressedChakra();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: widget.screenHeight * 0.018),
                    child: Container(
                      width: widget.screenWidth * 0.28,
                      height: widget.screenHeight * 0.05,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(125, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Chakra',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w600,
                            height: 0.06,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  widget.onPressedRecords();
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: widget.screenWidth * 0.28,
                    height: widget.screenHeight * 0.05,
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(125, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Records',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontFamily: 'Roboto Condensed',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  widget.onPressedAnalysis();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: widget.screenHeight * 0.018),
                    child: Container(
                      width: widget.screenWidth * 0.28,
                      height: widget.screenHeight * 0.05,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(125, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Analysis',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w600,
                            height: 0.06,
                            letterSpacing: 2,
                          ),
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
