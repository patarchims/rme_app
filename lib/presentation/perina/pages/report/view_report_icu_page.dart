import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/icu/report/asesmen_ulang_perawatan_intensive_report_page_widget.dart';

class ViewReportICUPage extends StatelessWidget {
  const ViewReportICUPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarHeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      menu: menu,
      children: menu.asMap().entries.map((e) {
        if (e.key == 0) {
          return const ReportAsesmenUlangPerawatIntensivePageWidget();
        }

        return Container();
      }).toList(),
    );
  }
}

List<String> menu = ["Asesmen Ulang\nPerawatan Intensive", "KARTU CAIRAN"];
