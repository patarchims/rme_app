// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/hasil_penunjang/hasil_penunjang_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/pages/poli_dalam/hasil_penunjang_medik/hasil_pemeriksaan_fisioterapi_widget.dart';
import 'package:hms_app/presentation/pages/poli_dalam/hasil_penunjang_medik/hasil_pemeriksaan_gizi_widget.dart';
import 'package:hms_app/presentation/pages/poli_dalam/hasil_penunjang_medik/riwayat_hasil_labor_widget.dart';
import 'package:hms_app/presentation/pages/poli_dalam/hasil_penunjang_medik/riwayat_radiologi_widget.dart';

class HasilPenunjangContentWidget extends StatefulWidget {
  final List<String> menu;
  const HasilPenunjangContentWidget({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  State<HasilPenunjangContentWidget> createState() =>
      _HasilPenunjangContentWidgetState();
}

class _HasilPenunjangContentWidgetState
    extends State<HasilPenunjangContentWidget> {
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
                      context.read<HasilPenunjangBloc>().add(
                          HasilPenunjangEvent.getHasilLabor(
                              noReg: singlePasien.first.noreg));
                    }

                    if (index == 1) {
                      context.read<HasilPenunjangBloc>().add(
                          HasilPenunjangEvent.getHasilRadiologi(
                              noReg: singlePasien.first.noreg));
                    }

                    if (index == 2) {
                      context.read<HasilPenunjangBloc>().add(
                          HasilPenunjangEvent.getHasilFisioterapi(
                              noReg: singlePasien.first.noreg));
                    }
                    if (index == 3) {
                      context.read<HasilPenunjangBloc>().add(
                          HasilPenunjangEvent.getHasilPemeriksaanGizi(
                              noReg: singlePasien.first.noreg));
                    }
                  },
                  tabs: widget.menu.map((e) => Tab(text: e)).toList(),
                )),
                leading: null,
                elevation: 0,
                automaticallyImplyLeading: false,
              ),
              body: TabBarView(
                children: widget.menu.asMap().entries.map(
                  (e) {
                    if (e.key == 0) {
                      return const RiwayatHasilLaborWidget();
                    }

                    if (e.key == 1) {
                      return const RiwayatRadiologiPenmedikWidget();
                    }

                    if (e.key == 2) {
                      return const HasilPemeriksaanFisioterapiWidget();
                    }

                    if (e.key == 3) {
                      return const HasilPemeriksaanGiziWidget();
                    }
                    return Container();
                  },
                ).toList(),
              ),
            )));
  }
}
