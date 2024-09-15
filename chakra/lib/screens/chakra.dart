import 'package:chakra/Widgets/theCRA.dart';
import 'package:chakra/screens/records.dart';
import 'package:flutter/material.dart';
import 'package:chakra/screens/Pairingmode.dart';
import 'package:chakra/screens/Records.dart';
import 'package:chakra/screens/Analysis.dart';


class Chakra extends StatefulWidget {
  const Chakra({super.key});

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
        decoration: BoxDecoration(color: Colors.black),
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
                  decoration: BoxDecoration(
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
              child: Container(
                width: screenWidth * 0.73,
                height: screenHeight * 0.08,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: screenWidth * 0.73,
                        height: screenHeight * 0.08,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 5,
                                color: Color.fromARGB(255, 240, 190, 190)),
                            borderRadius: BorderRadius.circular(53),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      //left: screenWidth * 0.1,
                      //top: screenHeight * 0.02,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pairingmode()),
                          );
                        },
                        child: SizedBox(
                          width: screenWidth * 0.53,
                          height: screenHeight * 0.05,
                          child: Text(
                            'Pair your Chakra',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.065,
                              fontFamily: 'Esteban',
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonRow(onPressedChakra: (){}, onPressedRecords: (){}, onPressedAnalysis: (){}, screenHeight: screenHeight, screenWidth: screenWidth)
          ],
        ),
      ),
    );
  }
}
