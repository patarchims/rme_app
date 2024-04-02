// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/hasil_penunjang/hasil_penunjang_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/modul/hasil_penunjang/hasil_fisioterapi_widget_content.dart';
import 'package:hms_app/presentation/pages/modul/hasil_penunjang/riwayat_gizi_content_widget.dart';
import 'package:hms_app/presentation/pages/modul/hasil_penunjang/riwayat_hasil_labor_widget.dart';
import 'package:hms_app/presentation/pages/modul/hasil_penunjang/riwayat_radiologi_widget.dart';

class HasilPenunjangOldDBWidgetContent extends StatefulWidget {
  final List<String> menu;
  const HasilPenunjangOldDBWidgetContent({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  State<HasilPenunjangOldDBWidgetContent> createState() =>
      _HasilPenunjangWidgetContentState();
}

class _HasilPenunjangWidgetContentState
    extends State<HasilPenunjangOldDBWidgetContent> {
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
                backgroundColor: ThemeColor.lightGreyColor2,
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
                          HasilPenunjangEvent.getHasilLaborOldDB(
                              noReg: singlePasien.first.noreg));
                    }

                    if (index == 1) {
                      context.read<HasilPenunjangBloc>().add(
                          HasilPenunjangEvent.getHasilRadiologiOldDB(
                              noReg: singlePasien.first.noreg));
                    }

                    if (index == 2) {
                      context.read<HasilPenunjangBloc>().add(
                          HasilPenunjangEvent.getHasilFisioterapiOldDB(
                              noReg: singlePasien.first.noreg));
                    }

                    if (index == 3) {
                      context.read<HasilPenunjangBloc>().add(
                          HasilPenunjangEvent.getHasilPemeriksaanGiziOldDB(
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
                      return const RiwayatHasilLaborOldDBWidget();
                    }

                    if (e.key == 1) {
                      return const RiwayatRadiologiPenmedikOldDBWidget();
                    }

                    if (e.key == 2) {
                      return const RiwayatHasilFisioterapiWidgetContent();
                    }

                    if (e.key == 3) {
                      return const RiwayatHasilGiziWidgetContent();
                    }
                    return Container();
                  },
                ).toList(),
              ),
            )));
  }
}
