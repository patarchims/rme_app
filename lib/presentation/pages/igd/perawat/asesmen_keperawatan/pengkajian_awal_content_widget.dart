import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PengkajianAwalKeperawatanContentWidget extends StatefulWidget {
  const PengkajianAwalKeperawatanContentWidget({super.key});

  @override
  State<PengkajianAwalKeperawatanContentWidget> createState() =>
      _PengkajianAwalKeperawatanContentWidgetState();
}

class _PengkajianAwalKeperawatanContentWidgetState
    extends State<PengkajianAwalKeperawatanContentWidget> {
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
              controller: _scrollController,
              child: const Column(
                children: [
                  // ==== //
                ],
              ),
            )));
  }
}
