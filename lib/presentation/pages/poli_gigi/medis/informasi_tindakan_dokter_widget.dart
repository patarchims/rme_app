import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/input_diagnosa/input_diagnosa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/rincian_informasi/rincian_informasi_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/diagnosa_sesuai_icd/input_diagnosa.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/rincian_informasi_widget.dart';

class InformasiTindakanDokterWidget extends StatelessWidget {
  final List<String> menu;
  const InformasiTindakanDokterWidget({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    return Expanded(
        child: DefaultTabController(
      length: menu.length, // Added
      initialIndex: 0, //A
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
              if (index == 1) {
                log("INDEX TAB $index");
                context
                    .read<RincianInformasiBloc>()
                    .add(const RincianInformasiEvent.getModelDiagnosa());
              }

              if (index == 2) {
                if (singlePasien.isNotEmpty) {
                  context.read<InputDiagnosaBloc>().add(
                      InputDiagnosaEvent.getDiagnosa(
                          noreg: singlePasien.first.noreg));
                }
              }
            },
            tabs: menu
                .map(
                  (e) => Tab(
                    text: e,

                    // icon: Icon(Icons.cloud_outlined),
                  ),
                )
                .toList(),
          )),
          leading: null,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
            children: menu.asMap().entries.map((e) {
          if (e.key == 1) {
            return const RincianInformasiWidget();
          }
          if (e.key == 2) {
            return const InputDignosaWidget(
              enableEdit: false,
            );
          }
          return SizedBox(
            child: Center(
              child: Text(e.toString()),
            ),
          );
        }).toList()),
      ),
    ));
  }
}
