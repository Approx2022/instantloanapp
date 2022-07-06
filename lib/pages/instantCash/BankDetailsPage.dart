import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/instantCash/InstatntPage.dart';
import 'package:instantloanapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class BankDetailsPage extends StatefulWidget {
  @override
  State<BankDetailsPage> createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends State<BankDetailsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController accnoController = TextEditingController();
  TextEditingController conaccnoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    iniData();
  }

  iniData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_BANK_NAME) != null) {
      nameController.text = prefs.getString(Utils.PREF_BANK_NAME)!;
    }
    if (prefs.getString(Utils.PREF_BANK_ACCNO) != null) {
      accnoController.text = prefs.getString(Utils.PREF_BANK_ACCNO)!;
    }
    if (prefs.getString(Utils.PREF_BANK_IFSC) != null) {
      ifscController.text = prefs.getString(Utils.PREF_BANK_IFSC)!;
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
                Text("Bank Name :"),
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
                    controller: nameController,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter your Bank name here.";
                      } /*else if (value.contains(".") ||
                          value.contains(",") ||
                          value.contains("-") ||
                          value.contains(" ")) {
                        return "Please don't place any symbols not even space!";
                      }*/
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Bank Account Number :"),
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
                    controller: accnoController,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter your Bank account no. here.";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Confirm Bank Account Number :"),
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
                    controller: conaccnoController,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.bottom,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Confirm you Account no. here";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("IFSC Code :"),
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
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString(
                          Utils.PREF_BANK_NAME, nameController.text);
                      await prefs.setString(
                          Utils.PREF_BANK_ACCNO, accnoController.text);
                      await prefs.setString(
                          Utils.PREF_BANK_IFSC, ifscController.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstatntPage(),
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
