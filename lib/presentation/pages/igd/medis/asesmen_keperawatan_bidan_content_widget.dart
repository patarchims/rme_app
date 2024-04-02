import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/medis/asesmen_keperawatan_bidan_widget.dart';
import 'package:hms_app/presentation/pages/igd/medis/asuhan_keperawatan_widget.dart';
import 'package:hms_app/presentation/pages/igd/medis/asuhan_widget_content.dart';

class AsesmenKeperawatanBidanContentWidget extends StatelessWidget {
  final List<String> menu;
  const AsesmenKeperawatanBidanContentWidget({
    Key? key,
    required this.menu,
  }) : super(key: key);

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
              if (index == 0) {
                context.read<AsesmenKeperawatanBidanBloc>().add(
                    AsesmenKeperawatanBidanEvent.getAsesmenKeperawatan(
                        noReg: singlePasien.first.noreg));
              }

              if (index == 1) {
                context.read<AsesmenKeperawatanBidanBloc>().add(
                    AsesmenKeperawatanBidanEvent.getAsuhanKeperawatanNew(
                        noReg: singlePasien.first.noreg));
              }

              // JIKA INDEX ASUHAN // TAMPILKAN KODE BERIKUT
              if (index == 2) {
                context.read<AsesmenKeperawatanBidanBloc>().add(
                    const AsesmenKeperawatanBidanEvent.getDeskripsiAsuhan(
                        siki: "I.14537\nI.05178"));
              }
            },
            tabs: menu
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
            children: menu.map((e) {
          // TAMPILKAN ISI
          if (e == menu.first) {
            return const AsesmenKeperawatanBidanWidget();
          }

          if (e == menu[2]) {
            return const AsuhanWidgetContentValue();
          }

          if (e == menu[1]) {
            return const AsuhanKeperawatanWidget();
          }

          return Container();
        }).toList()),
      ),
    ));
  }
}
