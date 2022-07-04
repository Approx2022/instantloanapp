
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';

class ImageCroperPage extends StatefulWidget {
 File file;

 ImageCroperPage(this.file);

 @override
  State<ImageCroperPage> createState() => _ImageCroperPageState();
}

class _ImageCroperPageState extends State<ImageCroperPage> {

  final cropKey = GlobalKey<CropState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Crop(
          key: cropKey,
          image: FileImage(widget.file),
          aspectRatio: 4.0 / 3.0,
        ),
      );
    );
  }
}
