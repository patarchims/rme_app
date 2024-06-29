import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_cppt_methodist_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_perkembangan_pasien_cppt_page_widget.dart';
// import 'package:hms_app/presentation/component/color/color_helper.dart';
// import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
// import 'package:hms_app/presentation/pages/modul/cppt_page/pelaksanaa_page_widget.dart';

class CPPTWidgetPage extends StatelessWidget {
  const CPPTWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CatatanKeperawatan();
    // return TabbarHeaderContentWidget(
    //   backgroundColor: ThemeColor.bgColor,
    //   menu: menu,
    //   children: menu.asMap().entries.map(
    //     (e) {
    //       if (e.key == 0) {
    //         return const CatatanKeperawatan();
    //       }

    //       if (e.key == 1) {
    //         return const PelakanaanPageWidget();
    //       }

    //       return Container();
    //     },
    //   ).toList(),
    // );
  }
}

class CatatanKeperawatan extends StatelessWidget {
  const CatatanKeperawatan({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppConstant.appSetup == AppSetup.methodist) {
      return const Expanded(child: ReportCpttMethodistPageWidget());
    } else {
      return const Expanded(child: ReportPerkembanganPasienCPTTPageWidget());
    }
  }
}

List<String> menu = ["CPPT", "PELAKSANAAN"];
