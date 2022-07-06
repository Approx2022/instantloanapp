import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/instantCash/UploadSalarySlip/IFSCPage.dart';
import 'package:sizer/sizer.dart';

class SelectSlalaryProof extends StatefulWidget {
  const SelectSlalaryProof({Key? key}) : super(key: key);

  @override
  State<SelectSlalaryProof> createState() => _SelectSlalaryProofState();
}

class _SelectSlalaryProofState extends State<SelectSlalaryProof> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                "Select Salary Account Proof",
                textScaleFactor: 1.5,
              ),
            ),
            Container(
              width: 100.w,
              alignment: Alignment.center,
              child: Text(
                "I can provide",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            getTile(0, "First Page of Passbook", selected == 0),
            getTile(1, "First Page of Bank Statement", selected == 1),
            getTile(2, "Cancelled Cheque", selected == 2),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IFSCPage(selected == 0 ? "First Page of Passbook" : selected == 1 ? "First Page of Bank Statement" : "Cancelled Cheque"),
                    ));
              },
              child: Container(
                height: 7.h,
                width: 100.w,
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(7)),
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
    );
  }

  Widget getTile(int pos, String title, bool isSelected) {
    return InkWell(
      onTap: () {
        selected = pos;
        setState(() {});
      },
      child: Container(
        height: 5.h,
        width: 100.w,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isSelected ? Colors.green : Colors.white,
          border: Border.all(color: isSelected ? Colors.green : Colors.black),
        ),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
