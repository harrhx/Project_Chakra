# Project Chakra

## Overview

**Project Chakra** is an IoT-based health monitoring Flutter app that integrates with a Raspberry Pi Pico W. It collects vital health data like SpO2 (oxygen saturation), body temperature, and heart rate and stores it locally on the device using SQLite for offline access. 

## Features
- **Real-time Health Monitoring**: Gathers vital signs such as SpO2, body temperature, and heart rate.
- **Local Data Storage**: Data is stored locally on the device using SQLite.
- **Bluetooth Connectivity**: Communicates with the Raspberry Pi Pico W over Bluetooth.

## Dependencies

The following dependencies are required for the project:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_blue_plus: ^2.0.0
  provider: ^6.0.0
  sqflite: ^2.0.0
  get: ^4.6.5
```

### Flutter Packages

1. **`flutter_blue_plus`**: For Bluetooth communication with Raspberry Pi Pico W.
   - Installation: 
     ```bash
     flutter pub add flutter_blue_plus
     ```

2. **`provider`**: For state management.
   - Installation: 
     ```bash
     flutter pub add provider
     ```

3. **`sqflite`**: For local storage using SQLite.
   - Installation: 
     ```bash
     flutter pub add sqflite
     ```

4. **`get`**: For routing and state management.
   - Installation: 
     ```bash
     flutter pub add get
     ```

### Raspberry Pi Pico W Setup
- Flash the necessary firmware on the Raspberry Pi Pico W to enable BLE communication.
- Connect sensors to monitor SpO2, body temperature, and heart rate.
- Ensure the Pico W is ready to pair with the app over Bluetooth.

## Installation Guide

### 1. Clone the Repository
To start with the project, clone the GitHub repository to your local machine:
```bash
git clone https://github.com/harrhx/project-chakra.git
cd project-chakra
```

### 2. Install Flutter
Make sure you have Flutter installed. You can install it by following the instructions on the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

Check the Flutter installation with:
```bash
flutter doctor
```

### 3. Install Project Dependencies
After cloning the repo, navigate to the project directory and install all required dependencies:
```bash
flutter pub get
```

### 4. Run the App
Connect your mobile device or emulator and run the app:
```bash
flutter run
```

### 5. Set Up SQLite Database
SQLite is used for storing the user's health data locally. The database will be created automatically when the app is first launched.

### 6. Raspberry Pi Pico W Setup
- Connect the Raspberry Pi Pico W and its sensors to gather real-time health data.
- Pair the app with the Pico W using Bluetooth, and start monitoring.

### 7. Connect and Monitor
After pairing the Raspberry Pi Pico W with the app, you will be able to view SpO2, body temperature, and heart rate data directly within the app.

## Future Enhancements
- **Cloud Sync**: Add functionality to sync the data with a cloud database like Firebase or AWS.
- **Health Alerts**: Implement notifications based on critical health thresholds.
- **Graphs and Analytics**: Add graphical visualization to monitor trends in health data.

## License
This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

