import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/medis/component/riwayat_alergi_content_widget.dart';
import 'package:hms_app/presentation/pages/igd/medis/triase_igd_dokter/skala_igd_widget.dart';
import 'package:hms_app/presentation/pages/igd/medis/triase_igd_dokter/tanda_vital_dan_gangguan_perilaku_igd.dart';

class TriaseIGDDokterWidgetContent extends StatefulWidget {
  final List<String> menu;
  const TriaseIGDDokterWidgetContent({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  State<TriaseIGDDokterWidgetContent> createState() =>
      _TriaseIGDDokterWidgetContentState();
}

class _TriaseIGDDokterWidgetContentState
    extends State<TriaseIGDDokterWidgetContent> {
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    return TabbarHeaderContentWidget(
        menu: menu,
        onTap: (index) {
          if (index == 0) {
            context.read<TriaseBloc>().add(
                TriaseEvent.getRiwayatAlergi(noReg: singlePasien.first.noreg));
          }
          if (index == 1) {
            context.read<PemeriksaanFisikBloc>().add(
                PemeriksaanFisikEvent.getGangguanPerilaku(
                    noReg: singlePasien.first.noreg));
          }

          if (index == 2) {
            context.read<TriaseBloc>().add(
                TriaseEvent.getTriaseSkala(noReg: singlePasien.first.noreg));
          }
        },
        children: menu.asMap().entries.map((e) {
          if (e.key == 0) {
            return const RiwayatAlergiWidgetContent();
          }

          if (e.key == 1) {
            return const TandaVitalDanGannguanPerilakuWidgetContent(
              isENableAdd: true,
            );
          }

          if (e.key == 2) {
            return const SkalaNyeriIGDWidget();
          }

          return SizedBox(
            child: Text(e.value.toString(), style: blackTextStyle),
          );
        }).toList());
  }
}

List<String> menu = [
  "Keluhan Utama",
  "Tanda Vital & Gangguan Perilaku",
  "Skala Nyeri"
];
