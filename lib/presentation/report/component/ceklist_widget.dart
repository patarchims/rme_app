import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/component.dart';

class ChecklistWidget extends StatelessWidget {
  final bool isEnable;
  final bool? isBool;
  final String title;
  const ChecklistWidget({
    super.key,
    required this.isEnable,
    this.isBool,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 10.sp,
        width: 10.sp,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(
          child: Text(
            (isEnable) ? "✓" : "",
            style: blackTextStyle,
          ),
        ),
      ),
      title: Text(
        title,
        style: blackTextStyle.copyWith(
            fontSize: 6.sp,
            fontWeight: (isBool != null && isBool!)
                ? FontWeight.bold
                : FontWeight.normal),
      ),
    );
  }
}
