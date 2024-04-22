import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ARCameraScreen extends StatefulWidget {
  @override
  _ARCameraScreenState createState() => _ARCameraScreenState();
}

class _ARCameraScreenState extends State<ARCameraScreen> {
  late CameraController cameraController;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.veryHigh);
    await cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Container();
    }
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // Camera Preview
            Positioned.fill(
              child: CameraPreview(cameraController),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Container(
                height: 20,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(
                      0.5), // Adjust the color and opacity as needed
                  borderRadius:
                      BorderRadius.circular(20), // Adjust the radius as needed
                ),
                child: Text(
                  'Your Content Here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
