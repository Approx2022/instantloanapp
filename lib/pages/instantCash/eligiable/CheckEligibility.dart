import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/instantCash/eligiable/WithdrawAmountPage.dart';
import 'package:instantloanapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class CheckEligibility extends StatefulWidget {
  const CheckEligibility({Key? key}) : super(key: key);

  @override
  State<CheckEligibility> createState() => _CheckEligibilityState();
}

class _CheckEligibilityState extends State<CheckEligibility> {
  bool goodToGo = false;
  String userName = "";

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
      Duration(seconds: 4),
      () {
        setState(() {
          goodToGo = true;
        });
      },
    );
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_USER_NAME) != null) {
      userName = prefs.getString(Utils.PREF_USER_NAME)!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: goodToGo
          ? Container(
              width: 100.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Icon(
                    Icons.security_rounded,
                    size: 100,
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    "Rs.3,50,000",
                    textScaleFactor: 2,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Congratulatulation $userName you're eligible for\nRs.3,50,000 from Rs.5,00,000 FastCash : Instant\nLoan Online Credit.",
                    textScaleFactor: 1.1,
                    style: TextStyle(color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>WithdrawAmountPage(),));
                    },
                    child: Container(
                      height: 50,
                      width: 100.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(7)),
                      child: Text(
                        "Process",
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 1.2,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              width: 100.w,
              color: Colors.black26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please Wait...",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Initiallzing your credit score for loan eligibility.",
                    textScaleFactor: .95,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
    );
  }
}
