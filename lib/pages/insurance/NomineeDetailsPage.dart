import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instantloanapp/pages/instantCash/InstatntPage.dart';
import 'package:instantloanapp/utils.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class NomineeDetailsPage extends StatefulWidget {
  const NomineeDetailsPage({Key? key}) : super(key: key);

  @override
  State<NomineeDetailsPage> createState() => _NomineeDetailsPageState();
}

class _NomineeDetailsPageState extends State<NomineeDetailsPage> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController contactControler = TextEditingController();
  String dropdownvalue = "-Select-";
  var items = [
    '-Select-',
    'Husband',
    'Wife',
    'Mother',
    'Father',
    'Son',
    'Daughter',
    'Sister',
    'Brother',
  ];
  late DateTime date;
  var key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    date = DateTime.now();

    setData();
  }

  setData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_MOMINEE_NAME) != null) {
      nameControler.text = prefs.getString(Utils.PREF_MOMINEE_NAME)!;
    }
    if (prefs.getString(Utils.PREF_MOMINEE_NUMBER) != null) {
      contactControler.text = prefs.getString(Utils.PREF_MOMINEE_NUMBER)!;
    }
    if (prefs.getString(Utils.PREF_MOMINEE_BIRTH) != null) {
      dateController.text = prefs.getString(Utils.PREF_MOMINEE_BIRTH)!;
    }
    if (prefs.getString(Utils.PREF_MOMINEE_RELATION) != null) {
      dropdownvalue = prefs.getString(Utils.PREF_MOMINEE_RELATION)!;
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
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text("Nominee Full Name :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: nameControler,
                    validator: (value) {
                      if (value == null || value.length <= 1) {
                        return "Please enter Nominees name here.";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Nominee Contact Number :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: contactControler,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (value) {
                      if (value == null || value.length <= 1) {
                        return "Please enter Nominees Contact number here.";
                      } else if (value.length != 10) {
                        return "Please  enter the mobile number properly with valid length.";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Text("Nominee Date of Birth :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: TextFormField(
                    onTap: () => getDate(),
                    decoration: InputDecoration(border: InputBorder.none),
                    controller: dateController,
                    validator: (value) {
                      if (value == null || value.length <= 1) {
                        return "Please enter Select date of Nominees Birth";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Relation with Nominee :"),
                SizedBox(
                  height: .8.h,
                ),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(7)),
                  child: DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () async {
                    if (key.currentState!.validate() &&
                        dropdownvalue != "-Select-") {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString(
                          Utils.PREF_MOMINEE_NAME, nameControler.text);
                      prefs.setString(
                          Utils.PREF_MOMINEE_NUMBER, contactControler.text);
                      prefs.setString(
                          Utils.PREF_MOMINEE_BIRTH, dateController.text);
                      prefs.setString(
                          Utils.PREF_MOMINEE_RELATION, dropdownvalue);

                      showCustomDialog();
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CurrentAdd(false),
                          ));*/
                    } else if (dropdownvalue == "-Select-") {
                      Fluttertoast.showToast(msg: "Please select Relation.");
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

  showCustomDialog() {
    return showDialog(
        context: context,
        builder: (contaxt) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
            backgroundColor: Colors.transparent,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.done_outline_sharp),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Congratulation",
                        textScaleFactor: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You are insured.\nPersonal Accidental Insurance.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InstatntPage(),
                              ));
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(7)),
                          child: Text(
                            "Great",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
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
