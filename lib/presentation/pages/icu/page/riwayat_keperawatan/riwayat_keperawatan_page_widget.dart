import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class RiwayatKeperawatanIntensivePageWidget extends StatefulWidget {
  const RiwayatKeperawatanIntensivePageWidget({super.key});

  @override
  State<RiwayatKeperawatanIntensivePageWidget> createState() =>
      _RiwayatKeperawatanPageWidgetState();
}

class _RiwayatKeperawatanPageWidgetState
    extends State<RiwayatKeperawatanIntensivePageWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: RawScrollbar(
      thumbColor: ThemeColor.darkColor,
      thumbVisibility: true,
      interactive: true,
      thickness: 10.sp,
      controller: scrollController,
      trackVisibility: false,
      radius: Radius.circular(5.sp),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            //====//
            Text(
              "data",
              style: blackTextStyle,
            )
          ],
        ),
      ),
    ));
  }
}
