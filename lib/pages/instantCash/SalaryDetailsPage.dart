import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/instantCash/InstatntPage.dart';
import 'package:instantloanapp/pages/instantCash/UploadSalarySlip/SelectSalaryProof.dart';
import 'package:instantloanapp/utils.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SalaryDetailsPage extends StatefulWidget {
  bool isBack;

  SalaryDetailsPage(this.isBack);

  @override
  State<SalaryDetailsPage> createState() => _SalaryDetailsPageState();
}

class _SalaryDetailsPageState extends State<SalaryDetailsPage> {
  TextEditingController dateController = TextEditingController();
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    iniData();
  }

  iniData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_SALARY_DATE) != null)
      dateController.text = prefs.getString(Utils.PREF_SALARY_DATE)!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Select last Salary credit date",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: .8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  "Last salary credite date should be within last 31 days",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
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
                  controller: dateController,
                  onTap: () => getDate(),
                  readOnly: true,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString(
                      Utils.PREF_SALARY_DATE, "${dateController.text}");
                  prefs.setBool(Utils.PREF_SALARY_SKIP, true);
                  if (widget.isBack) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InstatntPage(),
                        ));
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectSlalaryProof(),
                        ));
                  }
                },
                child: Container(
                  width: 100.w,
                  height: 8.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool(Utils.PREF_SALARY_SKIP, true);

                  if (widget.isBack) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InstatntPage(),
                        ));
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectSlalaryProof(),
                        ));
                  }
                },
                child: Container(
                  width: 100.w,
                  height: 8.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getDate() async {
    showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime.now().subtract(Duration(days: 31)),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        date = pickedDate;
        dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      }
      setState(() {});
    });
  }
}
