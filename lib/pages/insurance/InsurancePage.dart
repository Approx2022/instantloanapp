import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/insurance/PersonalDetailsPage.dart';
import 'package:instantloanapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class InsurancePage extends StatefulWidget {
  @override
  State<InsurancePage> createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  double spaceHeight = 2.h;
  bool isHaveInsurence = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Utils.PREF_MOMINEE_NAME) != null) {
      isHaveInsurence = true;
    }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getSizedBox(),
              Text("Personal Accidental Insurance", textScaleFactor: 1.4),
              getSizedBox(),
              getDivider(),
              getSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Insurance Cover",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "₹ 3,00,000",
                          textScaleFactor: 1.1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Validate",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "2 Month",
                          textScaleFactor: 1.1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              getSizedBox(),
              getDivider(),
              getSizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Insurance Cover",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "₹ 3,00,000",
                          textScaleFactor: 1.1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Validate",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "2 Month",
                          textScaleFactor: 1.1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              getSizedBox(),
              getDivider(),
              getSizedBox(),
              Text(
                "Premium",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "₹ 0",
                textScaleFactor: 1.1,
              ),
              Text(
                "Zero Cost Offer",
                textScaleFactor: 1,
              ),
              getSizedBox(),
              isHaveInsurence
                  ? InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonalDetailsPage(),
                          )),
                      child: Container(
                        width: 100.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Theme.of(context).primaryColor),
                        alignment: Alignment.center,
                        child: Text(
                          "Get Insurance",
                          textScaleFactor: 1.3,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : Container(
                      height: 50,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            margin: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 7),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.done,
                              color: Colors.green.shade200,
                            ),
                          ),
                          Text(
                            "You have this insurence.",
                            textScaleFactor: 1.2,
                          ),
                        ],
                      ),
                    ),
              getSizedBox(),
              getDivider(),
              getSizedBox(),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text("160505"),
                ],
              ),
              Text(
                "People already insured with this insurence plan.",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              getSizedBox(),
              getDivider(),
              getSizedBox(),
              Text(
                "Our Policy : ",
                textScaleFactor: 1.1,
              ),
              getSizedBox(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getTableRows("Accidental Death", "Rs.3,00,000"),
                  SizedBox(
                    height: .8.h,
                  ),
                  getTableRows(
                      "Perment Total Disability (Two or more limbs impaired,Paralysis etc.)",
                      "Rs.3,00,000"),
                  SizedBox(
                    height: .8.h,
                  ),
                  getTableRows(
                      "Child Eduction Benefit (over and above the coverage amount) ",
                      "10% od principle some insured"),
                  SizedBox(
                    height: .8.h,
                  ),
                  getTableRows("Accidental Hospitalisation",
                      "1,00,000 whichever is lover"),
                ],
              ),
              getSizedBox(),
              getDivider(),
              getSizedBox(),
              Text(
                "Share this insurance plan with your friends",
                textScaleFactor: 1.3,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Help them secure the future of their loved onces.\nShare Via. : ",
                textScaleFactor: .9,
              ),
              getSizedBox(),
              Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getDivider() {
    return Container(
      width: 100.w,
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget getSizedBox() {
    return SizedBox(
      height: spaceHeight,
    );
  }

  Widget getTableRows(String s1, String s2) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              child: Text(
                s1,
                textScaleFactor: .9,
              ),
            )),
        SizedBox(
          width: 2.w,
        ),
        Expanded(
            flex: 2,
            child: Container(
              child: Text(
                s2,
                textScaleFactor: .9,
              ),
            )),
      ],
    );
  }
}
