import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'backend_controller.dart';

class CCameraController extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController cameraController;

  final RxBool hasCameraPermission = false.obs;
  final isCameraInitialized = false.obs;

  Future<void> init() async {
    // Check and request camera permission
    hasCameraPermission.value = await _requestCameraPermission();

    if (hasCameraPermission.value) {
      // If permission granted, get available cameras
      _cameras = await availableCameras();

      // Initialize the CameraController with the first camera in the list
      cameraController = CameraController(
        _cameras[0],
        ResolutionPreset.high,
      );

      // Initialize the camera controller
      await cameraController.initialize();
      isCameraInitialized(true);
    } else {
      // Handle permission denied
      print('Camera permission denied.');
      isCameraInitialized(false);
    }
  }

  // Function to request camera permission
  Future<bool> _requestCameraPermission() async {
    bool hasPermission = false;
    final PermissionStatus status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      hasPermission = true;
    } else if (status == PermissionStatus.denied) {
      print('Camera permission denied.');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Camera permission permanently denied.');
    }

    return hasPermission;
  }

  Future<String?> captureImage(int reason) async {
    try {
      if (cameraController.value.isTakingPicture) {
        // If a picture is currently being taken, return null
        return null;
      }

      // Capture the image
      final XFile imageFile = await cameraController.takePicture();

      // Read the bytes from the image file
      final Uint8List imageBytes = await imageFile.readAsBytes();

      return getImgResponse(imageBytes, reason);

    } catch (e) {
      print('Error capturing image: $e');
      return null;
    }
  }
}
