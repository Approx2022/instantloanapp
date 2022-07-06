import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/instantCash/CurrentAdd.dart';
import 'package:instantloanapp/utils.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  late DateTime date;
  bool isMale = true;
  bool isChield = true;
  var key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    setData();
  }

  setData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_USER_NAME) != null) {
      nameControler.text = prefs.getString(Utils.PREF_USER_NAME)!;
    }
    if (prefs.getString(Utils.PREF_USER_EMAIL) != null) {
      emailControler.text = prefs.getString(Utils.PREF_USER_EMAIL)!;
    }
    if (prefs.getString(Utils.PREF_USER_BDATE) != null) {
      dateController.text = prefs.getString(Utils.PREF_USER_BDATE)!;
    }
    if (prefs.getBool(Utils.PREF_USER_GENDER) != null) {
      isMale = prefs.getBool(Utils.PREF_USER_GENDER)!;
    }
    if (prefs.getBool(Utils.PREF_USER_CHILD) != null) {
      isChield = prefs.getBool(Utils.PREF_USER_CHILD)!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Form(
          key: key,
          child: SingleChildScrollView(
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
                Text("Date of Birth :"),
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
                    controller: dateController,
                    onTap: () => getDate(),
                    readOnly: true,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Email Address :"),
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
                    controller: emailControler,
                    validator: (value) {
                      if (value == null || value.length <= 1) {
                        return "Please enter your email here.";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please enter email properly.";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Gender :"),
                SizedBox(
                  height: .8.h,
                ),
                genderSelection(),
                SizedBox(
                  height: 2.h,
                ),
                Text("Do you have a child :"),
                SizedBox(
                  height: .8.h,
                ),
                childreenSelection(),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () async {
                    if (key.currentState!.validate()) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString(Utils.PREF_USER_NAME, nameControler.text);
                      prefs.setString(
                          Utils.PREF_USER_BDATE, dateController.text);
                      prefs.setString(
                          Utils.PREF_USER_EMAIL, emailControler.text);
                      prefs.setBool(Utils.PREF_USER_GENDER, isMale);
                      prefs.setBool(Utils.PREF_USER_CHILD, isChield);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CurrentAdd(false),
                          ));
                    }
                  },
                  child: Container(
                    width: 100.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Theme.of(context).primaryColor),
                    alignment: Alignment.center,
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
      ),
    );
  }

  Widget genderSelection() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              isMale = true;
              setState(() {});
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isMale ? Colors.green : Colors.white,
                  border:
                      Border.all(color: isMale ? Colors.green : Colors.black),
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                "Male",
                style: TextStyle(color: isMale ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              isMale = false;
              setState(() {});
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: !isMale ? Colors.green : Colors.white,
                  border:
                      Border.all(color: !isMale ? Colors.green : Colors.black),
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                "Female",
                style: TextStyle(color: !isMale ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget childreenSelection() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              isChield = true;
              setState(() {});
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: isChield ? Colors.green : Colors.white,
                  border:
                      Border.all(color: isChield ? Colors.green : Colors.black),
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                "Yes",
                style: TextStyle(color: isChield ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              isChield = false;
              setState(() {});
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: !isChield ? Colors.green : Colors.white,
                  border: Border.all(
                      color: !isChield ? Colors.green : Colors.black),
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                "No",
                style:
                    TextStyle(color: !isChield ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      ],
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

/*
class GenderSelectionWidget extends StatefulWidget {
  const GenderSelectionWidget({Key? key}) : super(key: key);

  @override
  State<GenderSelectionWidget> createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: (){},
            child: Container(
              height: 6.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(color : isMale ? Colors.green : Colors.black  ,border: Border.all(color: isMale ? Colors.green : Colors.black)),
              child: Text("Male",style: TextStyle(color: isMale ? Colors.white : Colors.black ),),
            ),
          ),
        ),
        SizedBox(width: 3.w,),
        Expanded(
          child: InkWell(
            onTap: (){},
            child: Container(
              height: 6.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(color : !isMale ? Colors.green : Colors.white  ,border: Border.all(color: !isMale ? Colors.green : Colors.black)),
              child: Text("FeMale",style: TextStyle(color: !isMale ? Colors.white : Colors.black ),),
            ),
          ),
        ),
      ],
    );
  }
}
*/
