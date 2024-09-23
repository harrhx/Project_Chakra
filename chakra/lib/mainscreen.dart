import 'package:flutter/material.dart';
import 'package:chakra/screens/splash_screen.dart';
import 'package:chakra/screens/chakra.dart';
import 'package:chakra/Widgets/theCRA.dart';
import 'package:chakra/screens/records.dart';
import 'package:chakra/screens/Analysis.dart';
import 'package:chakra/screens/Pairingmode.dart';


class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Mainscreen> {
  String mainscreen = "Chakra";
  void onPressedChakra() {
    setState(() {
      mainscreen = "Chakra";
    });
  }
  void onPressedRecords() {
    setState(() {
      mainscreen = "Records";
    });
  }
  void onPressedAnalysis() {
    setState(() {
      mainscreen = "Analysis";
    });
  }
  void onPressedPairingmode() {
    setState(() {
      mainscreen = "Pairingmode";
    });
  }

  @override
  Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          if (mainscreen == "Chakra") 
            Chakra(onPressedPairingmode: onPressedPairingmode),
          if (mainscreen == "Records") 
            const Recordscreen(),
          if (mainscreen == "Analysis") 
            const Analysis(),
          if (mainscreen == "Pairingmode") 
            const PairingModeScreen(),
          ButtonRow(screenHeight: screenHeight, screenWidth: screenWidth, onPressedChakra: onPressedChakra, onPressedRecords: onPressedRecords, onPressedAnalysis: onPressedAnalysis)
        ],
      ),
    );
  }
}