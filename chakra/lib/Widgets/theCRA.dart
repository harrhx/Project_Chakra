import 'package:chakra/screens/Analysis.dart';
import 'package:flutter/material.dart';
import 'package:chakra/screens/Analysis.dart';
import 'package:chakra/screens/records.dart';
import 'package:chakra/screens/chakra.dart';

class ButtonRow extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;

  const ButtonRow({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  void onPressedChakra() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chakra(),
      ),
    );
  }

  void onPressedRecords() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Recordscreen(),
      ),
    );
  }
  
  void onPressedAnalysis() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Analysis(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.screenHeight * 0.03),
        child: SizedBox(
          width: widget.screenWidth * 0.94,
          height: widget.screenHeight * 0.08,
          child: Stack(
            children: [
              Container(
                width: widget.screenWidth * 0.94,
                height: widget.screenHeight * 0.08,
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 124, 123, 123).withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onPressedChakra,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: widget.screenHeight * 0.018),
                    child: Container(
                      width: widget.screenWidth * 0.28,
                      height: widget.screenHeight * 0.05,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(126, 255, 0, 0),
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
              ),
              GestureDetector(
                onTap: onPressedRecords,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: widget.screenWidth * 0.28,
                    height: widget.screenHeight * 0.05,
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(126, 255, 0, 0),
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
              ),
              GestureDetector(
                onTap: onPressedAnalysis,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: widget.screenHeight * 0.018),
                    child: Container(
                      width: widget.screenWidth * 0.28,
                      height: widget.screenHeight * 0.05,
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(126, 255, 0, 0),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}