import 'package:flutter/material.dart';
import "package:chakra/mainscreen.dart";
import 'package:chakra/screens/splash_screen.dart';
import 'package:flutter/services.dart';



void main(){

    // Lock the orientation to portrait only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MaterialApp(
    home: Splash(),
  ));
  });

  
}