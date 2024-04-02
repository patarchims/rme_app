import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class RiwayatNatalPageWidget extends StatefulWidget {
  const RiwayatNatalPageWidget({super.key});

  @override
  State<RiwayatNatalPageWidget> createState() => _RiwayatNatalPageWidgetState();
}

class _RiwayatNatalPageWidgetState extends State<RiwayatNatalPageWidget> {
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
        child: Column(
          children: [
            // ==== TAMBAHKAN DATA
            TitleWidget.boxPemeriksaanFisikSugestion(
              widget: FormWidget.textArea(enabled: true, maxLines: 2),
              title: "Usia Kehamilan",
            ),
            TitleWidget.boxPemeriksaanFisikSugestion(
              widget: FormWidget.textArea(enabled: true, maxLines: 2),
              title: "HIS Mulai Sejak Tanggal",
            ),
            TitleWidget.boxPemeriksaanFisikSugestion(
              widget: FormWidget.textArea(enabled: true, maxLines: 2),
              title: "Ketuban",
            ),
            TitleWidget.boxPemeriksaanFisikSugestion(
              widget: FormWidget.textArea(enabled: true, maxLines: 2),
              title: "Pendaharan Antepartum sejak tanggal",
            ),
          ],
        ),
      ),
    ));
  }
}
