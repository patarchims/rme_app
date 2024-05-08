import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class ReasesmenResikoJatuhAnakPageWidget extends StatefulWidget {
  const ReasesmenResikoJatuhAnakPageWidget({super.key});

  @override
  State<ReasesmenResikoJatuhAnakPageWidget> createState() =>
      _ReasesmenResikoJatuhAnakPageWidgetState();
}

class _ReasesmenResikoJatuhAnakPageWidgetState
    extends State<ReasesmenResikoJatuhAnakPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            controller: _scrollController,
            trackVisibility: false,
            radius: Radius.circular(5.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TitleWidget.titleContainer(
                      title: "RE-ASSESMEN RISIKO JATUH PADA ANAK"),
                ],
              ),
            )));
  }
}
