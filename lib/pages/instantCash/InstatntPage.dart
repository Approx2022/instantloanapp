import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/instantCash/BankDetailsPage.dart';
import 'package:instantloanapp/pages/instantCash/CurrentAdd.dart';
import 'package:instantloanapp/pages/instantCash/FinalOfferPage.dart';
import 'package:instantloanapp/pages/instantCash/KYC/AdharFrontPage.dart';
import 'package:instantloanapp/pages/instantCash/SalaryDetailsPage.dart';
import 'package:instantloanapp/pages/instantCash/UploadSalarySlip/UploadSalarySlipPage.dart';
import 'package:instantloanapp/pages/instantCash/UploadSelfiePage.dart';
import 'package:instantloanapp/pages/instantCash/eligiable/CheckEligibility.dart';
import 'package:instantloanapp/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class InstatntPage extends StatefulWidget {
  const InstatntPage({Key? key}) : super(key: key);

  @override
  State<InstatntPage> createState() => _InstatntPageState();
}

class _InstatntPageState extends State<InstatntPage> {
  bool salfie = false,
      KYC = false,
      selfi = true,
      address = false,
      salary = false,
      bank = false,
      slalryslip = false,
      afinal = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_KYC_PANCARD_NUM) != null) KYC = true;
    if (prefs.getString(Utils.PREF_ADDR_HOMENO) != null) address = true;
    if (prefs.getBool(Utils.PREF_SALARY_SKIP) != null) salary = true;
    if (prefs.getString(Utils.PREF_BANK_NAME) != null) bank = true;
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    if (documentDirectory != null) {
      if (await File("${documentDirectory!.path}/proof.png").exists()) {
        slalryslip = true;
      }
      if (await File("${documentDirectory!.path}/profile.png").exists()) {
        selfi = true;
      }
    }
    if (prefs.getBool(Utils.PREF_AGREEACPT) != null) afinal = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getTile("Upload Selfie", "Upload Selfie", selfi, () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadSelfiePage(),
                    ));
                getData();
              }),
              getTile("Upload KYC Documents", "Upload Selfie", KYC, () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdharFrontPage(),
                    ));
                getData();
              }),
              getTile(
                  "Current Address",
                  "Enter the address where your currently living.",
                  address, () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurrentAdd(true),
                    ));
                getData();
              }),
              getTile(
                  "Give Salary Details",
                  "Provide your monthly salary amount abd salary date.",
                  salary, () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SalaryDetailsPage(true),
                    ));
                getData();
              }),
              getTile(
                  "Give Bank Details", "Provide your bank information.", bank,
                  () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BankDetailsPage(),
                    ));
                getData();
              }),
              getTile(
                  "Upload Salary Slip", "To confirm your salary.", slalryslip,
                  () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadSalarySlipPage(),
                    ));
                getData();
              }),
              getTile(
                  "Accept Final Offer",
                  "Confirm our offer,case amount and agreement",
                  afinal, () async {
                await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalOfferPage(),
                    ));
                getData();
              }),
              InkWell(
                onTap: () {
                  if (getelig()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckEligibility(),
                        ));
                    getData();
                  }
                },
                child: Container(
                  height: 50,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  foregroundDecoration: BoxDecoration(
                      color: getelig() ? Colors.transparent : Colors.white38),
                  alignment: Alignment.center,
                  child: Text("Check Eligibility",
                      style: TextStyle(color: Colors.white),
                      textScaleFactor: 1.2),
                ),
              ),
              SizedBox(
                height: 3,
              )
              //getTile("Upload Selfie", "Upload Selfie"),
            ],
          ),
        ),
      ),
    );
  }

  bool getelig() {
    return selfi && afinal && slalryslip && bank && salary && address && KYC;
  }

  Widget getTile(
      String title, String subTitle, bool isDone, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 10.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            isDone
                ? Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                : Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
