import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../component/title/title_component.dart';

class CPPTSimpleTableWidget extends StatelessWidget {
  const CPPTSimpleTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 5.sp, right: 5.sp),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(children: [
                TitleWidget.headerTitle(title: "Situation"),
                TitleWidget.headerTitle(title: "Background"),
                TitleWidget.headerTitle(title: "Asesmen"),
                TitleWidget.headerTitle(title: "Recomendation"),
                TitleWidget.headerTitle(title: "Action")
              ])
            ],
          ),
        ),
      ],
    );
  }
}
