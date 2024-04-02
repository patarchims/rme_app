import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/hemodialisis/asuhan_keperawatan/diagnosa_hd_widget.dart';
import 'package:hms_app/presentation/hemodialisis/asuhan_keperawatan/intervensi_dh_widget.dart';
import 'package:hms_app/presentation/hemodialisis/asuhan_keperawatan/tujuan_hd_widget.dart';

class FormulirAsuhanKeperawatanWidgetPage extends StatelessWidget {
  const FormulirAsuhanKeperawatanWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarHeaderContentWidget(
      onTap: (index) {},
      menu: menu,
      children: menu.asMap().entries.map((e) {
        if (e.key == 0) {
          return const DiagnosaHDWidget();
        }

        if (e.key == 1) {
          return const TujuanHDContentWidget();
        }

        if (e.key == 2) {
          return const IntervensiHDWidget();
        }
        return Container();
      }).toList(),
    );
  }
}

List<String> menu = ["DIAGNOSA", "TUJUAN", "INTERVENSI"];
