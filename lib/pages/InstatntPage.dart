import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/CurrentAdd.dart';
import 'package:instantloanapp/pages/KYC/AdharFrontPage.dart';
import 'package:instantloanapp/pages/UploadSelfiePage.dart';
import 'package:sizer/sizer.dart';

class InstatntPage extends StatefulWidget {
  const InstatntPage({Key? key}) : super(key: key);

  @override
  State<InstatntPage> createState() => _InstatntPageState();
}

class _InstatntPageState extends State<InstatntPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTile("Upload Selfie", "Upload Selfie", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadSelfiePage(),
                  ));
            }),
            getTile("Upload KYC Documents", "Upload Selfie", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdharFrontPage(),
                  ));
            }),
            getTile("Current Address", "Enter the address where your currently living.", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurrentAdd(),
                  ));
            }),
            getTile("Give Salary Details", "Provide your monthly salary amount abd salary date.", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurrentAdd(),
                  ));
            }),
            //getTile("Upload Selfie", "Upload Selfie"),
          ],
        ),
      ),
    );
  }

  Widget getTile(String title, String subTitle, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 10.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textScaleFactor: 1.2,
            ),
            Text(
              subTitle,
              textScaleFactor: 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
