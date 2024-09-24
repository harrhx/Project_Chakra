import 'package:flutter/material.dart';

import 'package:chakra/Widgets/pairingModeWidget.dart';


class PairingModeScreen extends StatefulWidget {
  const PairingModeScreen({super.key});

  @override
  _PairingModeScreenState createState() => _PairingModeScreenState();
}

class _PairingModeScreenState extends State<PairingModeScreen> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PairingModeWidget() // Show the pairing widget while scanning  
      ),
    );
  }
}
