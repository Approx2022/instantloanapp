import 'package:flutter/material.dart';
import 'package:instantloanapp/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PanCardData extends StatefulWidget {
  @override
  State<PanCardData> createState() => _PanCardDataState();
}

class _PanCardDataState extends State<PanCardData> {
  TextEditingController numController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    iniData();
  }

  iniData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_KYC_PANCARD_BDATE) != null)
      dateController.text =
          prefs.getString(Utils.PREF_KYC_PANCARD_BDATE)!;
    if (prefs.getString(Utils.PREF_KYC_PANCARD_NUM) != null)
      numController.text = prefs.getString(Utils.PREF_KYC_PANCARD_NUM)!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dateController.text = DateFormat('dd-MM-yyyy').format(date);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text("Pan Number :"),
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
                  controller: numController,
                  maxLines: 1,
                  maxLength: 10,
                  textAlignVertical: TextAlignVertical.bottom,
                  validator: (value) {
                    RegExp expression = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
                    if (value == null || value == "") {
                      return "Please enter your PanCard number somethings.";
                    } else if (!expression.hasMatch(value)) {
                      return "Please enter PanCard number properly.";
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
              Text("Date of Birth :"),
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
                  if (formKey.currentState!.validate()) {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString(
                        Utils.PREF_KYC_PANCARD_NUM, numController.text);
                    await prefs.setString(Utils.PREF_KYC_PANCARD_BDATE,
                        dateController.text);
                    Navigator.pop(context);
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
    );
  }

  getDate() async {
    showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        date = pickedDate;
        dateController.text =
            DateFormat('dd-MM-yyyy').format(pickedDate);
      }
      setState(() {});
    });
  }
}
