import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    _checkAndNavigate(); // Check permissions when the screen is built

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/icons/LOGO.png"),
              SizedBox(height: 100),
              Text("Ecommerce", style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }

  void _checkAndNavigate() async {
    // Check necessary permissions
    final status = await _checkPermissions();

    if (status == PermissionStatus.granted) {
      // Permission already granted, navigate to login screen
      Get.offNamed('/login'); // Adjust the route based on your app's navigation setup
    } else if (status == PermissionStatus.permanentlyDenied) {
      // Permission permanently denied, consider navigating to settings
      // You can use Get.toNamed('/settings') for settings screen
      Get.snackbar(
        'Permission Required',
        'Please grant the required permission in the app settings.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Permission denied, do nothing (no need for additional interaction)
      // You can close the permission grant page
      Get.back();
    }
  }

  Future<PermissionStatus> _checkPermissions() async {
    final status = await Permission.storage.status;

    if (status == PermissionStatus.granted) {
      return status; // Permission already granted
    } else {
      // Request permission
      final newStatus = await Permission.storage.request();
      return newStatus;
    }
  }
}
