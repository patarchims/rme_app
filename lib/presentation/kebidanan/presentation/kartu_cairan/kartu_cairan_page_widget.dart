import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/kartu_cairan/tambah_kartu_cairan_page_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class KartuCairanPageWidget extends StatefulWidget {
  const KartuCairanPageWidget({super.key});

  @override
  State<KartuCairanPageWidget> createState() => _KartuCairanPageWidgetState();
}

class _KartuCairanPageWidgetState extends State<KartuCairanPageWidget> {
  late TextEditingController _cairanMasuk1;
  late TextEditingController _cairanMasuk2;
  late TextEditingController _cairanMasuk3;
  late TextEditingController _cairanNgt;
  late TextEditingController _namaCairan;
  late TextEditingController _cairanKeluarUrine;
  late TextEditingController _cairanKeluarNgt;
  late TextEditingController _keterangan;

  @override
  void initState() {
    _cairanMasuk1 = TextEditingController();
    _cairanMasuk2 = TextEditingController();
    _cairanMasuk3 = TextEditingController();
    _cairanNgt = TextEditingController();
    _namaCairan = TextEditingController();
    _cairanKeluarUrine = TextEditingController();
    _cairanKeluarNgt = TextEditingController();
    _keterangan = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cairanMasuk1.clear();
    _cairanMasuk2.clear();
    _cairanMasuk3.clear();
    _cairanNgt.clear();
    _namaCairan.clear();
    _cairanKeluarUrine.clear();
    _cairanKeluarNgt.clear();
    _keterangan.clear();

    _cairanMasuk1.dispose();
    _cairanMasuk2.dispose();
    _cairanMasuk3.dispose();
    _cairanNgt.dispose();
    _namaCairan.dispose();
    _cairanKeluarUrine.dispose();
    _cairanKeluarNgt.dispose();
    _keterangan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KartuObservasiBloc, KartuObservasiState>(
      builder: (context, state) {
        if (state.status == KartuObservasiStaus.isLoadingGetKartuCairan) {
          return Expanded(
              child: HeaderContentWidget(widget: Loading.expandedLoading()));
        }

        return Expanded(
            child: HeaderContentWidget(
          widget: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                        top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                    child:
                        Table(border: TableBorder.all(), columnWidths: const {
                      // 0: FlexColumnWidth(0.4),
                    }, children: [
                      TableRow(children: [
                        TitleWidget.headerCenterTitle2(title: "JAM"),
                        TitleWidget.headerCenterTitle2(
                            title: "CAIRAN\nMASUK\nI"),
                        TitleWidget.headerCenterTitle2(
                            title: "CAIRAN\nMASUK\nII"),
                        TitleWidget.headerCenterTitle2(
                            title: "CAIRAN\nMASUK\nIII"),
                        TitleWidget.headerCenterTitle2(
                            title: "CAIRAN\nMASUK\nNGT"),
                        TitleWidget.headerCenterTitle2(
                            title: "NAMA CAIRAN\nDAN OBAT OBATAN"),
                        TitleWidget.headerCenterTitle2(
                            title: "CAIRAN\nKELUAR URINE"),
                        TitleWidget.headerCenterTitle2(
                            title: "CAIRAN\nKELUAR NGT"),
                        TitleWidget.headerCenterTitle2(title: "DRAIN, DLL"),
                        TitleWidget.headerCenterTitle2(title: "KETERANGAN"),
                      ]),
                    ])),
                if (state.kartuCairan.isEmpty) ...[
                  Container(
                    height: 200.sp,
                    margin: EdgeInsets.only(right: 5.sp, left: 5.sp),
                    decoration: BoxDecoration(
                        color: ThemeColor.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(0.sp)),
                    child: EmtyScren(
                      subTitle: "Data Kosong",
                      textStyle: blackTextStyle,
                    ),
                  ),
                ],
                if (state.kartuCairan.isNotEmpty) ...[
                  Container(
                      padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                      child: Table(
                          border: TableBorder.all(),
                          columnWidths: const {},
                          children: state.kartuCairan.map((e) {
                            return TableRow(children: [
                              // TitleWidget.contentTitle(
                              //     title: e.jam.substring(11, 19)),
                              TitleWidget.contentTitle(title: e.cairanMasuk1),
                              TitleWidget.contentTitle(title: e.cairanMasuk2),
                              TitleWidget.contentTitle(title: e.cairanMasuk3),
                              TitleWidget.contentTitle(title: e.cairanMasukNgt),
                              TitleWidget.contentTitle(title: e.cairanMasukNgt),
                              TitleWidget.contentTitle(title: e.drainDll),
                              TitleWidget.contentTitle(title: e.drainDll),
                              TitleWidget.contentTitle(title: e.drainDll),
                              TitleWidget.contentTitle(
                                  title: e.cairanKeluarNgt),
                              TitleWidget.contentTitle(title: e.keterangan),
                            ]);
                          }).toList())),
                ],
              ],
            ),
          ),
          backgroundColor: ThemeColor.bgColor,
          isENableAdd: true,
          title: "TAMBAH",
          onPressed: () {
            // TAMBAH CAIRAN
            CustomDialogWidget.getDialog(
                widget: SizedBox(
                    height: Get.height - 150.sp,
                    width: Get.width,
                    child: const TambahKartuCairanPage()),
                color: ThemeColor.blueColor);
          },
        ));
      },
    );
  }
}
