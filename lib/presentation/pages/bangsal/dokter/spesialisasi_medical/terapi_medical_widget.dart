import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TerapiMedicalWidgetContentWidget extends StatelessWidget {
  const TerapiMedicalWidgetContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      title: "Simpan",
      onPressed: () async {},
      widget: SingleChildScrollView(
        child: Card(
          color: ThemeColor.bgColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.sp, color: ThemeColor.blackColor),
              borderRadius: BorderRadius.circular(2.sp)),
          child: Column(
            children: [
              TitleWidget.titleContainer(title: "TERAPI"),
              Padding(
                padding: EdgeInsets.all(5.sp),
                child: FormWidget.textArea(enabled: true, maxLines: 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
