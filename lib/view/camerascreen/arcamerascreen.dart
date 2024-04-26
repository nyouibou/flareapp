import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ARCameraScreen extends StatefulWidget {
  @override
  _ARCameraScreenState createState() => _ARCameraScreenState();
}

class _ARCameraScreenState extends State<ARCameraScreen> {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  late Interpreter interpreter;
  late List<String> labels;
  String detectedObject = '';
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
    loadModel();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await cameraController.initialize();
    if (mounted) {
      setState(() {});
    }
    cameraController.startImageStream((CameraImage image) {
      if (!isProcessing) {
        isProcessing = true;
        detectObjects(image);
      }
    });
  }

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('images/model.tflite');
      interpreter.allocateTensors();
      // Load labels
      final labelsFile =
          await DefaultAssetBundle.of(context).loadString('images/labels.txt');
      labels = labelsFile.split('\n').map((label) => label.trim()).toList();
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<void> detectObjects(CameraImage image) async {
    // Preprocess image
    var input = image.planes.map<Uint8List>((plane) {
      return plane.bytes;
    }).toList();

    var output = List<double>.filled(labels.length, 0);
    interpreter.run(input, output);

    // Find the index of the highest confidence score
    var maxIndex = output
        .indexWhere((score) => score == output.reduce((a, b) => a > b ? a : b));

    detectedObject = labels[maxIndex];

    setState(() {
      isProcessing = false;
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    interpreter.close();
    cameraController.stopImageStream(); // Stop camera image stream
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
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
            // Detected Object Name Overlay
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Detected Object: $detectedObject',
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
