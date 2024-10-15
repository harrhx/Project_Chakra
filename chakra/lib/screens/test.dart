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
      body: Container(
        child: isScanning
            ? Center(child: PairingModeWidget())
            : GetBuilder<BluetoothController>(
                init: BluetoothController(),
                builder: (controller) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 40, right: screenWidth * 0.05),
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
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: screenWidth * 0.05),
                          child: Opacity(
                            opacity: 0.8,
                            child: Text(
                              'CONNECTED DEVICES',
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
                        const SizedBox(height: 20),
                        StreamBuilder<List<ScanResult>>(
                          stream: controller.scanResults,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
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
                                        child: Text(BluetoothConnectionState
                                                    .connected ==
                                                device.connectionState
                                            ? 'Connected'
                                            : 'Connect'),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: Text('No devices found'),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                }), // Show the pairing widget while scanning
      ),
    );
  }
}
