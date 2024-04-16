import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_without_expanded_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/edukasi/tambah_data_edukasi_terintegrasi_pasien_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/ews_system/ews_system_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/kontrol_pasien/kontrol_istimewa_pasien_widget_page.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class KontrolPasienPageWidget extends StatelessWidget {
  const KontrolPasienPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HeaderContentWidget(
      backgroundColor: ThemeColor.bgColor,
      isENableAdd: true,
      onPressed: () {
        CustomDialogWidget.getDialog(
            widget: const TambahDataEdukasiTerintegrasiPasienWidget(),
            color: ThemeColor.blueColor);
      },
      title: "TAMBAH",
      widget: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: ThemeColor.bgColor,
            child: TabbarWithoutExpandexWidget(
                backgroundColor: ThemeColor.bgColor,
                menu: menu,
                children: menu.asMap().entries.map((e) {
                  if (e.key == 0) {
                    return const EwsSystemPageWidget();
                  }

                  if (e.key == 1) {
                    return const KontrolPasienIstimewaPageWidget();
                  }

                  return Container();
                }).toList()),
          )),
        ],
      ),
    ));
  }
}

List<String> menu = ["Early Warning System", "Kontrol Istimewa"];
