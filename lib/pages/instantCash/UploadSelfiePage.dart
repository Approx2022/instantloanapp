import 'package:flutter/material.dart';
// import 'package:learning_face_detection/learning_face_detection.dart';
// import 'package:learning_input_image/learning_input_image.dart';

class UploadSelfiePage extends StatefulWidget {
  const UploadSelfiePage({Key? key}) : super(key: key);

  @override
  State<UploadSelfiePage> createState() => _UploadSelfiePageState();
}

class _UploadSelfiePageState extends State<UploadSelfiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*  child: InputCameraView(
        title: 'hii',
        onImage: (InputImage inputImage) async {
          FaceDetector detector = FaceDetector();
          List<Face> result = await detector.detect(inputImage);
          if(result.length > 0)
            {
              print("faceDetected");
            }
        },
      )*/),
    );
  }
}
