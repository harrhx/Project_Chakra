import "package:flutter/material.dart";
import "package:chakra/screens/chakra.dart";
import 'dart:async';


class Splash extends StatefulWidget {
  final double screenwidth;
  final double screenheight;
  const Splash({super.key,required this.screenwidth,required this.screenheight});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    // Start a timer for 3 seconds before transitioning to the home screen with a fade effect
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
  width: 430,
  height: 932,
  padding: const EdgeInsets.only(left: 104, right: 103),
  clipBehavior: Clip.antiAlias,
  decoration: const BoxDecoration(color: Colors.black),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Positioned(
              left: widget.screenwidth * 0.24, // Relative positioning for responsiveness
              top: widget.screenheight * 0.38,
              child: Container(
                width: widget.screenwidth * 0.52, // Width adjusted relative to screen
                height: widget.screenheight * 0.24, // Height adjusted relative to screen
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
    ],
  ),
)
    );
  }
}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Chakra(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}