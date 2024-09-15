import 'package:flutter/material.dart';
import 'package:chakra/screens/splash_screen.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Splash(screenwidth: screenWidth, screenheight: screenHeight);
  }
}