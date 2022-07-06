import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instantloanapp/pages/instantCash/SalaryDetailsPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

import '../KYC/ImageCroperPage.dart';

class UploadSalaryProofPage extends StatefulWidget {
  String s;

  UploadSalaryProofPage(this.s);

  @override
  State<UploadSalaryProofPage> createState() => _UploadSalaryProofPageState();
}

class _UploadSalaryProofPageState extends State<UploadSalaryProofPage> {
  late File? imageFile = null;
  ImagePicker _picker = ImagePicker();
  Directory? documentDirectory;

  @override
  void initState() {
    iniImage();
  }

  iniImage() async {
    documentDirectory = await getApplicationDocumentsDirectory();
    if (documentDirectory != null)
      imageFile = File("${documentDirectory!.path}/proof.png");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () async {
                showDialogForImage();
              },
              child: imageFile != null && imageFile!.existsSync()
                  ? Image.file(
                imageFile!,
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
                      widget.s,
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (imageFile != null && imageFile!.existsSync()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SalaryDetailsPage(false),
                      ),
                    );
                  }else{
                    showDialogForImage();
                  }
                },
                child: Text("Upload Document")),
           /* TextButton(
              onPressed: () {
                if (imageFile != null && imageFile!.existsSync()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SalaryDetailsPage(false),
                    ),
                  );
                }
              },
              child: Text("Skip"),
            ),*/
          ],
        ),
      ),
    );
  }

  pickCropedImage(bool fromCemera) async {
    Navigator.pop(context);
    final XFile? image = await _picker.pickImage(
        source: fromCemera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      var result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  ImageCroperPage(0, imageFile!, "/salaryslip.png")));
      if (result != null && result is File) {
        imageFile = result as File;
      }
    }
    setState(() {});
  }

  showDialogForImage() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  height: 170,
                  width: 95.w,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text("Select From"),
                          alignment: Alignment.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () => pickCropedImage(true),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Icon(
                                        Icons.photo_camera,
                                        size: 36,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Camera",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () => pickCropedImage(false),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Icon(
                                        Icons.photo_library_outlined,
                                        size: 36,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Gallery",
                                      style: TextStyle(fontSize: 12))
                                ],
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
