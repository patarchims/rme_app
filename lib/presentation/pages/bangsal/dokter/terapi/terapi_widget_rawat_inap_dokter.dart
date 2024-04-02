import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

class TerapiRawatInapWidgetDokter extends StatelessWidget {
  const TerapiRawatInapWidgetDokter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.bgColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColor.primaryColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 15.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
