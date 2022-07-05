import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class KYCDataPage extends StatefulWidget {
  const KYCDataPage({Key? key}) : super(key: key);

  @override
  State<KYCDataPage> createState() => _KYCDataPageState();
}

class _KYCDataPageState extends State<KYCDataPage> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  InputDecoration? decoration = const InputDecoration();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text("Name :"),
              SizedBox(
                height: .8.h,
              ),
              Container(
                width: 95.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(7)),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: nameControler,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text("AsShaar Number :"),
              SizedBox(
                height: .8.h,
              ),
              Container(
                width: 95.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(7)),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: aadharController,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text("Pin Code :"),
              SizedBox(
                height: .8.h,
              ),
              Container(
                width: 95.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(7)),
                child: TextFormField(
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: pinController,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  height: 8.h,
                  alignment: Alignment.center,
                  child: Text("Next",
                      style: TextStyle(color: Colors.white),
                      textScaleFactor: 1.5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
