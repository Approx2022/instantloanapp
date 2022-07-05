import 'package:flutter/material.dart';
import 'package:instantloanapp/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalaryDetailsPage extends StatefulWidget {
  const SalaryDetailsPage({Key? key}) : super(key: key);

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
    return Container(
      width: 100.w,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
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
        dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      }
      setState(() {});
    });
  }
}
