import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  Future scanDevices() async {
    // Start scanning
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));

// Listen to scan results
    var subscription = FlutterBluePlus.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.platformName} found! rssi: ${r.rssi}');
        print("Thank You");
      }
    });
    print('subscription: $subscription');
    // Stop scanning
    await Future.delayed(Duration(seconds: 15));
    FlutterBluePlus.stopScan();
  }

  // scan result stream
  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;

  // connect to device
  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
  }

}