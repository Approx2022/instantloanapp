import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/instantCash/KYC/PanCardPage.dart';
import 'package:instantloanapp/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isMale = true;

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

  initState(){
    iniData();
  }

  iniData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_KYC_AADHAR_NAME) != null) {
      nameControler.text =
      prefs.getString(Utils.PREF_KYC_AADHAR_NAME)!;
    }
    if (prefs.getString(Utils.PREF_KYC_AADHAR_NO) != null) {
      aadharController.text = prefs.getString(Utils.PREF_KYC_AADHAR_NO)!;
    }
    if (prefs.getString(Utils.PREF_KYC_PIN) != null) {
      pinController.text = prefs.getString(Utils.PREF_KYC_PIN)!;
    }
    if (prefs.getBool(Utils.PREF_KYC_AADHAR_GENDER) != null) {
      isMale = prefs.getBool(Utils.PREF_KYC_AADHAR_GENDER)!;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                    validator: (value) {
                      if (value == null || value.length <= 1) {
                        return "Please enter your name here.";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Aadhaar Number :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: .3.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counter: Container(
                          height: 0,
                          width: 0,
                        )),
                    controller: aadharController,
                    maxLines: 1,
                    maxLength: 12,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      RegExp expression =
                          RegExp(r'(^[0-9]{4}[0-9]{4}[0-9]{12}$)');
                      if (value == null || value == "") {
                        return "Please enter your Aadhaar number somethings.";
                      } else if (value.length < 12 || value .length  < 0) {
                        return "Please enter Aadhaar card number properly.";
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
                GenderCheckBox(),
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        counter: Container(
                          height: 0,
                          width: 0,
                        )),
                    controller: pinController,
                    maxLines: 1,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
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
                      await prefs.setString(Utils.PREF_KYC_AADHAR_NAME, nameControler.text);
                      await prefs.setString(Utils.PREF_KYC_AADHAR_NO, aadharController.text);
                      await prefs.setString(Utils.PREF_KYC_PIN, pinController.text);
                      await prefs.setBool(Utils.PREF_KYC_AADHAR_GENDER, isMale);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PanCardPage(),
                          ));
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

class GenderCheckBox extends StatefulWidget {
  const GenderCheckBox({Key? key}) : super(key: key);

  @override
  State<GenderCheckBox> createState() => _GenderCheckBoxState();
}

class _GenderCheckBoxState extends State<GenderCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            radius: 8.5.w,
            onTap: () {
              isMale = true;
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 17.w,
                  width: 17.w,
                  child: Icon(
                    Icons.male,
                    size: 13.w,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isMale)
                  Container(
                    color: Colors.white54,
                    height: 10.h,
                    width: 17.w,
                  ),
              ],
            ),
          ),
          InkWell(
            radius: 8.5.w,
            onTap: () {
              isMale = false;
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 17.w,
                  width: 17.w,
                  child: Icon(
                    Icons.female,
                    size: 13.w,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.circle,
                  ),
                ),
                if (isMale)
                  Container(
                    color: Colors.white54,
                    height: 10.h,
                    width: 17.w,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
