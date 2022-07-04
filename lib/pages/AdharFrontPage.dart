import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/ImageCroperPage.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

class AdharFrontPage extends StatefulWidget {
  const AdharFrontPage({Key? key}) : super(key: key);

  @override
  State<AdharFrontPage> createState() => _AdharFrontPageState();
}

class _AdharFrontPageState extends State<AdharFrontPage> {
  late File imageFile = File("");
  ImagePicker _picker = ImagePicker();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        child: Column(
          children: [
            SizedBox(height: 2.h,),
            InkWell(
              onTap: () async {
                final XFile? image =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  imageFile = File(image.path);
                  await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ImageCroperPage(imageFile)));

                }
                setState(() {});
              },
              child: imageFile != null && imageFile.existsSync()
                  ? Image.file(
                      imageFile,
                      width: 95.w,
                      height: 30.h,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 95.w,
                      height: 30.h,
                      color: Colors.grey.shade300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo_camera,
                            color: Colors.grey.shade700,
                          ),
                          Text(
                            "Click On Upload Aadhaar Card Front",
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
            ),
            TextButton(onPressed: () {}, child: Text("Upload Document")),
          ],
        ),
      ),
    );
  }
}
