import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/pages/poli_gigi/observasi_antastesi_lokal/intra_operasi_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/observasi_antastesi_lokal/pasca_operasi_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/observasi_antastesi_lokal/pelaksana_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/observasi_antastesi_lokal/pra_operasi_widget.dart';

class ObservasiAnastesiLokalWidget extends StatefulWidget {
  final List<String> menu;
  const ObservasiAnastesiLokalWidget({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  State<ObservasiAnastesiLokalWidget> createState() =>
      _ObservasiAnastesiLokalWidgetState();
}

class _ObservasiAnastesiLokalWidgetState
    extends State<ObservasiAnastesiLokalWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: widget.menu.length,
        child: Scaffold(
          backgroundColor: ThemeColor.bgColor,
          appBar: AppBar(
            foregroundColor: Colors.black,
            surfaceTintColor: Colors.black,
            backgroundColor: Colors.blue.withOpacity(0.5),
            flexibleSpace: SafeArea(
                child: TabBar(
              labelColor: ThemeColor.primaryColor,
              unselectedLabelColor: Colors.black,
              dividerColor: Colors.white,
              indicatorColor: ThemeColor.primaryColor,
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
              children: widget.menu.asMap().entries.map((e) {
            if (e.key == 0) {
              return const PelaksanaWidget();
            }
            if (e.key == 1) {
              return const PraOperasiWidget();
            }

            if (e.key == 2) {
              return const IntraOperasiWidget();
            }

            if (e.key == 3) {
              return const PascaOperasiWidget();
            }
            return Container(
              color: Colors.red,
            );
          }).toList()),
        ),
      ),
    );
  }
}
