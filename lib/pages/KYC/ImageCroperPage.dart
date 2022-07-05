import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

class ImageCroperPage extends StatefulWidget {
  File file;
  int i;
  String name;

  ImageCroperPage(this.i, this.file, this.name);

  @override
  State<ImageCroperPage> createState() => _ImageCroperPageState();
}

class _ImageCroperPageState extends State<ImageCroperPage> {
  final cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(Icons.done),
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
              final crop = cropKey.currentState;

              if (crop != null && crop.area != null) {
                final area = crop.area;
                final scale = crop.scale;
                final sample = await ImageCrop.sampleImage(
                  file: widget.file,
                  preferredSize: (2000 / scale).round(),
                );
                final file = await ImageCrop.cropImage(
                  file: sample,
                  area: area!,
                );
                sample.delete();
                Directory documentDirectory =
                    await getApplicationDocumentsDirectory();
                imageCache!.clear();
                final File newImage = await file.copy(
                    '${documentDirectory.path}${widget.name}');

                Navigator.pop(context);
                Navigator.pop(context, newImage);
              }
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Crop(
          key: cropKey,
          image: FileImage(widget.file),
          aspectRatio: 95.w / 30.h,
        ),
      ),
    );
  }
}
