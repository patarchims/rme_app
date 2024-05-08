import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/asesmen_awal_dokter/anamnesa_rawat_inap_dokter_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/rencana_penunjang/rencana_penunjang_ranap_dokter_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/terapi/terapi_widget_rawat_inap_dokter.dart';
import 'package:hms_app/presentation/pages/bangsal/dokter/vital_sign/vital_sign_dokter_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/input_diagnosa_igd_widget.dart';
import 'package:hms_app/presentation/pages/igd/dokter/pemeriksaan_fisik/pemeriksaan_fisik_ranap_widget.dart';

class AsesmenAwalDokterRawatInap extends StatefulWidget {
  final List<String> menu;
  const AsesmenAwalDokterRawatInap({
    super.key,
    required this.menu,
  });

  @override
  State<AsesmenAwalDokterRawatInap> createState() =>
      _AsesmenAwalDokterRawatInapState();
}

class _AsesmenAwalDokterRawatInapState
    extends State<AsesmenAwalDokterRawatInap> {
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return Expanded(
        child: DefaultTabController(
      length: widget.menu.length, // Added
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: ThemeColor.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.5),
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          flexibleSpace: SafeArea(
              child: TabBar(
            labelColor: ThemeColor.primaryColor,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.white,
            indicatorColor: ThemeColor.primaryColor,
            onTap: (index) {
              if (index == 0) {
                // LAKUKAN GET INFOMRASI MEDIS
                // log("Pemeriksasan Fisik");
                // context.read<AsesmenIgdBloc>().add(
                //     AsesmenIgdEvent.getPemeriksaanFisik(
                //         noReg: singlePasien.first.noreg));
              }
              if (index == 1) {
                // LAKUKAN GET INFOMRASI MEDIS
                log("Pemeriksasan Fisik");
                context.read<PemeriksaanFisikBloc>().add(
                    PemeriksaanFisikEvent.getPemeriksaanFisikBangsal(
                        noReg: singlePasien.first.noreg));
              }
              if (index == 5) {
                //
              }
            },
            tabs: widget.menu
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
          )),
          leading: null,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: widget.menu.asMap().entries.map(
            (e) {
              if (e.key == 0) {
                return const AnamnesaRawatInapDokterWidget(enableEdit: true);
              }
              if (e.key == 1) {
                return const PemeriksaanFisikRanapWidget();
              }
              if (e.key == 2) {
                return const VitalSignDokterRawatInapWidget();
              }
              if (e.key == 3) {
                return const InputDiagnosaIgdWidget(enableEdit: true);
              }
              if (e.key == 4) {
                return const TerapiRawatInapWidgetDokter();
              }

              if (e.key == 5) {
                return const RencanaPenunangRawatInapDokterWidget();
              }

              return Container();
            },
          ).toList(),
        ),
      ),
    ));
  }
}
