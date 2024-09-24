import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chakra/Widgets/scrollabel_widget.dart';
import 'package:chakra/Widgets/theCRA.dart';
import 'dart:ui';
import 'package:chakra/Widgets/BLurwidget.dart';

class Recordscreen extends StatefulWidget {
  const Recordscreen({super.key});

  @override
  _RecordscreenState createState() => _RecordscreenState();
}

class _RecordscreenState extends State<Recordscreen> {
  List<dynamic> healthData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHealthData();
  }

  Future<void> fetchHealthData() async {
    try {
      final response =
          await http.get(Uri.parse('http://172.24.45.29:5000/health-data'));
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        setState(() {
          healthData = json.decode(response.body);
          isLoading = false;
        });
        print('Fetched data: $healthData');
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final widthScale = screenWidth / 430;
    final heightScale = screenHeight / 932;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            Container(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: healthData.length,
                      itemBuilder: (context, index) {
                        final record = healthData[index];

                        // Calculate the opacity for each item
                        double opacity = 1.0 - (index * 0.2);
                        opacity = opacity.clamp(
                            0.2, 1.0); // Ensure minimum opacity is 0.2

                        // Wrap the widget with padding if it's the first item
                        Widget listItem = ScrollableList(
                          heightScale: heightScale,
                          widthScale: widthScale,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          containerOpacity: opacity,
                          record: record ?? {},
                        );

                        if (index == 0) {
                          listItem = Padding(
                            padding: EdgeInsets.only(top: 100 * heightScale),
                            child: listItem,
                          );
                        }

                        return listItem;
                      },
                    ),
            ),
            Column(
              children: [
                DistortedBlurBox(
                  width: screenWidth,
                  height: 125 * heightScale,
                  blurIntensity: 30.0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 70 * heightScale, left: 33 * widthScale),
                      child: Text(
                        'RECORDS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40 * widthScale,
                          fontFamily: 'Roboto Condensed',
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                          letterSpacing: 10.80 * widthScale,
                        ),
                      ),
                    ),
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
