import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instantloanapp/pages/insurance/NomineeDetailsPage.dart';
import 'package:instantloanapp/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentAdd extends StatefulWidget {
  bool back;

  CurrentAdd(this.back);

  @override
  State<CurrentAdd> createState() => _CurrentAddState();
}

class _CurrentAddState extends State<CurrentAdd> {
  TextEditingController homeController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    iniData();
  }

  iniData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_ADDR_HOMENO) != null) {
      homeController.text = prefs.getString(Utils.PREF_ADDR_HOMENO)!;
    }
    if (prefs.getString(Utils.PREF_ADDR_STREET) != null) {
      streetController.text = prefs.getString(Utils.PREF_ADDR_STREET)!;
    }
    if (prefs.getString(Utils.PREF_ADDR_CITY) != null) {
      cityController.text = prefs.getString(Utils.PREF_ADDR_CITY)!;
    }
    if (prefs.getString(Utils.PREF_ADDR_STATE) != null) {
      stateController.text = prefs.getString(Utils.PREF_ADDR_STATE)!;
    }
    if (prefs.getString(Utils.PREF_KYC_PIN) != null) {
      pinController.text = prefs.getString(Utils.PREF_KYC_PIN)!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text("House Number :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: homeController,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter your House number here.";
                      } else if (value.contains(".") ||
                          value.contains(",") ||
                          value.contains("-") ||
                          value.contains(" ")) {
                        return "Please don't place any symbols not even space!";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Society/Street :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: streetController,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter your Street/Society name here.";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("City :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: cityController,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter your City name here.";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("State :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: stateController,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter your State name here.";
                      }
                    },
                  ),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: pinController,
                    maxLines: 1,
                    inputFormatters:[
                      LengthLimitingTextInputFormatter(6),
                    ],
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter your PinCode number here";
                      } else if (value.length > 6 || value.length < 0) {
                        return "Please enter Aadhaar card number properly.";
                      } else if (value.contains(".") ||
                          value.contains(",") ||
                          value.contains("-") ||
                          value.contains(" ")) {
                        return "Please don't place any symbols not even space.";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString(
                          Utils.PREF_ADDR_HOMENO, homeController.text);
                      await prefs.setString(
                          Utils.PREF_ADDR_STREET, streetController.text);
                      await prefs.setString(
                          Utils.PREF_ADDR_STATE, stateController.text);
                      await prefs.setString(
                          Utils.PREF_ADDR_CITY, cityController.text);
                      await prefs.setString(
                          Utils.PREF_KYC_PIN, pinController.text);
                      if (widget.back) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NomineeDetailsPage(),
                            ));
                      }
                    }
                  },
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 8.h,
                    alignment: Alignment.center,
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                      textScaleFactor: 1.5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
