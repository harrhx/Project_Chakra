import 'package:flutter/material.dart';
import 'package:chakra/bluetooth/ble_controller.dart';
import 'package:chakra/Widgets/pairingModeWidget.dart';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart'; // Add this import

class PairingModeScreen extends StatefulWidget {
  const PairingModeScreen({super.key});

  @override
  _PairingModeScreenState createState() => _PairingModeScreenState();
}

class _PairingModeScreenState extends State<PairingModeScreen> {
  bool isScanning = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isScanning = true;
    });

    BluetoothController().scanDevices();
    Future.delayed(Duration(seconds: 15), () {
      setState(() {
        isScanning = false;
      });
    });
  }

  void Rescan() {
    setState(() {
      isScanning = true;
    });

    BluetoothController().scanDevices();
    Future.delayed(Duration(seconds: 15), () {
      setState(() {
        isScanning = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: isScanning
            ? Center(child: PairingModeWidget())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 40,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Rescan();
                          },
                          child: Container(
                            width: 150,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: Color.fromARGB(255, 53, 53, 53),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'RESCAN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Roboto Mono',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 6,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: const Opacity(
                      opacity: 0.8,
                      child: Text(
                        'CONNECTED DEVICES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto Mono',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      'AVAILABLE DEVICES',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF2F2F2),
                        fontSize: 20,
                        fontFamily: 'Roboto Mono',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Container(
                      height: 300,
                      child: GetBuilder<BluetoothController>(
                        init: BluetoothController(),
                        builder: (controller) {
                          return StreamBuilder<List<ScanResult>>(
                            stream: controller.scanResults,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.data!.isNotEmpty) {
                                // Remove SingleChildScrollView and use ListView.builder directly
                                return ListView.builder(
                                  shrinkWrap:
                                      true, // Allows the ListView to size itself
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    final device = snapshot.data![index].device;
                                    return Card(
                                      elevation: 2,
                                      child: ListTile(
                                        onTap: () {},
                                        title: Text(
                                            device.platformName ?? 'Unknown'),
                                        subtitle:
                                            Text(device.remoteId.toString()),
                                        trailing: TextButton(
                                          onPressed: () {
                                            controller.connectToDevice(device);
                                          },
                                          child: Text(
                                            BluetoothConnectionState
                                                        .connected ==
                                                    device.connectionState
                                                ? 'Connected'
                                                : 'Connect',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    'No devices found',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
