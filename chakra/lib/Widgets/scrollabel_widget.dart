import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ScrollableList extends StatelessWidget {
  final double heightScale;
  final double widthScale;
  final double screenHeight;
  final double screenWidth;
  final double containerOpacity;
  final dynamic record; // Accepting record as a parameter

  const ScrollableList({
    super.key,
    required this.heightScale,
    required this.widthScale,
    required this.screenHeight,
    required this.screenWidth,
    required this.containerOpacity,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.parse(record['data_date'].toString()));
    return Opacity(
      opacity: 1,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 5 * widthScale, vertical: 10 * heightScale),
        width: screenWidth,
        height: 95 * heightScale,
        decoration: ShapeDecoration(
          color: (record['status'] == 'normal')
              ? const Color.fromARGB(200, 226, 255, 242)
              : const Color.fromARGB(200, 255, 214, 214),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30 * widthScale),
          ),
        ),
        child: Column(
          children: [
            // Date, Time, and Status Row
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 30 * widthScale,
                    top: 15 * heightScale,
                  ),
                  child: Text(
                    date, // Accessing record data
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
                    left: 5 * widthScale,
                    top: 20 * heightScale,
                  ),
                  child: Text(
                    record['data_time'].toString(), // Accessing record data
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
                        right: 25 * widthScale,
                        top: 15 * heightScale,
                      ),
                      child: Text(
                        record['status'].toUpperCase().toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: record['status'] == 'normal'
                              ? const Color(0xFF006E0C)
                              : Colors.red,
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
            // Body Temperature, SpO2, and Heart Rate Row
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 25 * widthScale,
                    top: 2 * heightScale,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: ' °F - ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20 * widthScale,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: record['body_temperature'].toString(), // Accessing record data
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
                const Spacer(),
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
                          text: record['spo2'].toString(), // Accessing record data
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
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    right: 30 * widthScale,
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
                          text: record['heartrate'].toString(), // Accessing record data
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
