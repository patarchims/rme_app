import 'package:flutter/material.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class BacaDanBahasaWidget extends StatelessWidget {
  final String title;
  const BacaDanBahasaWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.sp),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: ThemeColor.primaryColor),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: whiteTextStyle,
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.red,
        ))
      ],
    ));
  }
}
