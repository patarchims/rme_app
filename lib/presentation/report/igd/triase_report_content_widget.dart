import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/report/igd/view_asesmen_keperawatan_bidan_igd_widgget.dart';
import 'package:hms_app/presentation/report/igd/view_report_triase_content_widget.dart';

class TriaseReportContentWidget extends StatelessWidget {
  const TriaseReportContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarHeaderContentWidget(
        menu: menuReport,
        children: menuReport.asMap().entries.map((e) {
          if (e.key == 0) {
            // TAMPILKAN REPORT TRIASE
            return const ViewReportTriaseContentView();
          }
          if (e.key == 1) {
            return const ViewAsesmenKeperawatanBidanIGDWidget();
          }
          return Text(
            e.toString(),
            style: blackTextStyle,
          );
        }).toList());
  }
}

List<String> menuReport = ["TRIASE", "ASESMEN AWAL KEPERAWATAN / BIDAN DI IGD"];
