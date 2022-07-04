import 'package:flutter/material.dart';
import 'package:instantloanapp/pages/InstatntPage.dart';
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
              child: Container(
                alignment: Alignment.center,
                child: Text("Insurance"),
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