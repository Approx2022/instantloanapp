import 'package:flutter/material.dart';
import 'package:instantloanapp/utils.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class FinalOfferPage extends StatefulWidget {
  const FinalOfferPage({Key? key}) : super(key: key);

  @override
  State<FinalOfferPage> createState() => _FinalOfferPageState();
}

class _FinalOfferPageState extends State<FinalOfferPage> {
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
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "DEMAND PROMISSORY NOTE",
                  textScaleFactor: 1.5,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "On demand i g residing at,,severally promise to FASTCASH : INSTANT LOAN ONLINE a sun of payable amount togather with intrest !1.0% per year or at such as other rate as FAST CASH : INSTANT LOAN ONLINE may fix from time.",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Presentment for payment and protest of this note are hereby unconditional and irrevocabley waived.",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                  "The Processing fees charger include GST to FASTCASH : INSTANT LOAN ONLINE.",
                  style: TextStyle(fontSize: 12)),
              SizedBox(
                height: 1.h,
              ),
              Text("Agreed & accepted by the Borrower : ",
                  style: TextStyle(fontSize: 12)),
              Row(
                children: [
                  Text(
                    "Name : ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "name",
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Place : ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "name",
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Date : ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.now()),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool(Utils.PREF_AGREEACPT, true);
                },
                child: Container(
                  width: 100.w,
                  height: 8.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    "Agree & Accept",
                    style: TextStyle(color: Colors.white),
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
}
