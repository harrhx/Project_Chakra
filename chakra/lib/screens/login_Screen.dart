import 'package:chakra/mainscreen.dart';
import 'package:chakra/screens/chakra.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            Positioned(
              left: screenWidth * 0.24, // 104 / 430
              top: screenHeight * 0.38, // 355 / 932
              child: Opacity(
                opacity: 0.20,
                child: Container(
                  width: screenWidth * 0.52, // 223 / 430
                  height: screenWidth * 0.52, // Maintain square aspect ratio
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05, // 104 / 430
                right: screenWidth * 0.05, // 103 / 430
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.05,
                          ),
                          child: Container(
                            child: Text(
                              'NAMASTE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xCC0050FF),
                                fontSize:
                                    screenHeight * 0.06, // Scale font size
                                fontFamily: 'Roboto Condensed',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 9.60,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'WELCOME',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0x990050FF),
                            fontSize: 32,
                            fontFamily: 'Roboto Condensed',
                            fontWeight: FontWeight.w900,
                            height: 0,
                            letterSpacing: 6.40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          //width: screenWidth * 0.86, // 369 / 430
                          height: screenHeight * 0.06, // 58
                          decoration: BoxDecoration(
                            color: Color(0x33D9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Your Mail ID',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(122, 255, 255, 255),
                                    fontSize: screenHeight *
                                        0.025), // Scale font size
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: Container(
                            //width: screenWidth * 0.86, // 369 / 430
                            height: screenHeight * 0.06, // 58
                            decoration: BoxDecoration(
                              color: Color(0x33D9D9D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: 'Enter Your Password',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(122, 255, 255, 255),
                                      fontSize: screenHeight *
                                          0.025), // Scale font size
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'FORGOT PASSWORD?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.800000011920929),
                                  fontSize: screenHeight * 0.018,
                                  fontFamily: 'Roboto Condensed',
                                  fontWeight: FontWeight.w900,
                                  height: 0,
                                  letterSpacing: 2.80,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.04),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    screenHeight * 0.018, // Scale font size
                                fontFamily: 'Roboto Condensed',
                                fontWeight: FontWeight.w900,
                                letterSpacing: 3.20,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xCC0050FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Create your Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize:
                                    screenHeight * 0.02, // Scale font size
                                fontFamily: 'Roboto Condensed',
                                fontWeight: FontWeight.w900,
                                letterSpacing: 3.20,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.01),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Mainscreen()),
                                  );
                                },
                                child: Text(
                                  'Proceed Without Logging in',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(194, 128, 155, 212),
                                    fontSize:
                                        screenHeight * 0.02, // Scale font size
                                    fontFamily: 'Roboto Condensed',
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3.20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.01),
                              child: Text(
                                'Terms & Conditions',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize:
                                      screenHeight * 0.02, // Scale font size
                                  fontFamily: 'Roboto Condensed',
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 3.20,
                                ),
                              ),
                            ),
                            //
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
