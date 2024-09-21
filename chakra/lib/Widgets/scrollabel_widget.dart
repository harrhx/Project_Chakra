import 'dart:math';

import 'package:flutter/material.dart';

class ScrollableList extends StatefulWidget {
  final double heightScale;
  final double widthScale;
  final double screenHeight;
  final double screenWidth;
  final double containerOpacity;
  const ScrollableList(
      {Key? key,
      required this.heightScale,
      required this.widthScale,
      required this.screenHeight,
      required this.screenWidth,
      required this.containerOpacity})
      : super(key: key);

  @override
  _ScrollableListState createState() => _ScrollableListState();
}

class _ScrollableListState extends State<ScrollableList> {
  @override
  Widget build(BuildContext context) {
    double heightScale = widget.heightScale;
    double widthScale = widget.widthScale;
    double screenHeight = widget.screenHeight;
    double screenWidth = widget.screenWidth;
    double containerOpacity = widget.containerOpacity;
    return Opacity(
      opacity: containerOpacity,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 5 * widthScale, vertical: 10 * heightScale),
        width: screenWidth, // Adjust container width based on screen size
        height:
            95 * heightScale, // Adjust container height based on screen height
        decoration: ShapeDecoration(
          color: const Color(0xCCBAE2B8),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(70 * widthScale), // Adjust border radius
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 30 * widthScale,
                    top: 15 * heightScale,
                  ),
                  child: Text(
                    '21-09-2024',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24 * widthScale,
                      fontFamily: 'Roboto Condensed',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.40 * widthScale,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10 * widthScale,
                    top: 20 * heightScale,
                  ),
                  child: Text(
                    '12:46:35',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15 * widthScale,
                      fontFamily: 'Roboto Condensed',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.20 * widthScale,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 30 * widthScale,
                        top: 20 * heightScale,
                      ),
                      child: Text(
                        'NORMAL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF006E0C),
                          fontSize: 15 * widthScale,
                          fontFamily: 'Roboto Condensed',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 3.96 * widthScale,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 28 * widthScale,
                    top: 2 * heightScale,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' °F - ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18 * widthScale,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: '98',
                          style: TextStyle(
                            color: const Color(0xFF00728C),
                            fontSize: 20 * widthScale,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'SpO2 - ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20 * widthScale,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: '99',
                          style: TextStyle(
                            color: const Color(0xFF009C17),
                            fontSize: 20 * widthScale,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: '%',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20 * widthScale,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    right: 28 * widthScale,
                    top: 2 * heightScale,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'BPM - ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20 * widthScale,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: '74',
                          style: TextStyle(
                            color: const Color(0xFF009C17),
                            fontSize: 20 * widthScale,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
