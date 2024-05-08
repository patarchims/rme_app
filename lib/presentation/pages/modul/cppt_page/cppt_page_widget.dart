import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_cppt_methodist_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/report/view/report_perkembangan_pasien_cppt_page_widget.dart';

class CPPTWidgetPage extends StatelessWidget {
  const CPPTWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppConstant.appSetup == AppSetup.methodist) {
      return const Expanded(child: ReportCpttMethodistPageWidget());
    } else {
      return const Expanded(child: ReportPerkembanganPasienCPTTPageWidget());
    }
  }
}
