import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/instantCash/InstatntPage.dart';
import 'package:instantloanapp/pages/insurance/InsurancePage.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InstatntPage(),)),
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Instant Cash"),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InsurancePage(),)),
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Insurance"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text("Save & Grow"),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text("Support"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
