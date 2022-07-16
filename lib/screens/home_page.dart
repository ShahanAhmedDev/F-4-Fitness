
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pose_detection_teachable/constants/Theme.dart';
import 'package:tflite/tflite.dart';

class PoseDetection extends StatefulWidget {
  late final List<CameraDescription> cameras;

  PoseDetection(this.cameras);
  @override
  _PoseDetectionState createState() => _PoseDetectionState();
}

class _PoseDetectionState extends State<PoseDetection> {
  String predOne = '';
  double confidence = 0;
  double index = 0;

  @override
  void initState() {
    super.initState();
    loadTfliteModel();
  }

  loadTfliteModel() async {
    String? res;
    res = await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
    print(res);
  }

  setRecognitions(outputs) {
    print(outputs);

    if (outputs[0]['index'] == 0) {
      index = 0;
    }
    else if(outputs[0]['index'] == 1)
      {
      index = 1;
    }
    else if(outputs[0]['index'] == 2)
    {
      index = 2;
    }
    else if(outputs[0]['index'] == 3)
    {
      index = 3;
    }
    else if(outputs[0]['index'] == 4)
    {
      index = 4;
    }
    // else{
    //   var rng = Random();
    //   var index = rng.nextInt(4);
    //
    // }
    confidence = outputs[0]['confidence'];

    setState(() {
      predOne = outputs[0]['label'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pose Detection F4F",
        ),
        backgroundColor: Themes.appBarTheme,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Camera(widget.cameras, setRecognitions),
            // SizedBox(height:50,),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'DownDog',
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.redAccent),
                                          value: index == 0 ? confidence : 0.0,
                                          backgroundColor:
                                          Colors.redAccent.withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 0 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Goddess',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.orangeAccent),
                                          value: index == 1 ? confidence : 0.0,
                                          backgroundColor: Colors.orangeAccent
                                              .withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 1 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Plank',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.blue),
                                          value: index == 2 ? confidence : 0.0,
                                          backgroundColor: Colors.blueAccent
                                              .withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 2 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ////////////
                              ],
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Tree',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.green),
                                          value: index == 3 ? confidence : 0.0,
                                          backgroundColor: Colors.greenAccent
                                              .withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 3 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Warrior',
                                    style: TextStyle(
                                        color: Colors.purpleAccent,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: SizedBox(
                                    height: 32.0,
                                    child: Stack(
                                      children: [
                                        LinearProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              Colors.purple),
                                          value: index == 4 ? confidence : 0.0,
                                          backgroundColor: Colors.purpleAccent
                                              .withOpacity(0.2),
                                          minHeight: 50.0,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '${index == 4 ? (confidence * 100).toStringAsFixed(0) : 0} %',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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

typedef void Callback(List<dynamic> list);

class Camera extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Callback setRecognitions;

  Camera(this.cameras, this.setRecognitions);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController cameraController;
  bool isDetecting = false;

  @override
  void initState() {
    super.initState();
    cameraController =
        CameraController(widget.cameras.first, ResolutionPreset.high);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});

      cameraController.startImageStream((image) {
        if (!isDetecting) {
          isDetecting = true;
          Tflite.runModelOnFrame(
            bytesList: image.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            imageHeight: image.height,
            imageWidth: image.width,
            numResults: 1,
          ).then((value) {
            if (value!.isNotEmpty) {
              widget.setRecognitions(value);
              isDetecting = false;
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container();
    }

    return Transform.scale(
      scale: 4/ cameraController.value.aspectRatio,
      child: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
            // cameraController.value.aspectRatio :
            child: CameraPreview(cameraController),
        ),
      ),
    );
  }
}