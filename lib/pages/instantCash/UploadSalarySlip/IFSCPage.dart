import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'UploadSalaryProof.dart';

class IFSCPage extends StatefulWidget {
  String s;

  IFSCPage(this.s);

  @override
  State<IFSCPage> createState() => _IFSCPageState();
}

class _IFSCPageState extends State<IFSCPage> {
  TextEditingController ifscController = TextEditingController();
  var key  = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Form(
          key: key,
          child: Column(
            children: [
              Text(
                "IFSC Code",
                textScaleFactor: 1.3,
              ),
              Container(
                width: 100.w,
                alignment: Alignment.center,
                child: Text("My Bank Account IFSC Code"),
              ),
              SizedBox(
                height: .8.h,
              ),
              Container(
                width: 95.w,
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(7)),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: ifscController,
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.bottom,
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Please enter your IFSC code here.";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  if(key.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadSalaryProofPage(widget.s),
                      ));
                  }
                },
                child: Container(
                  height: 7.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    "Next",
                    textScaleFactor: 1.3,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
