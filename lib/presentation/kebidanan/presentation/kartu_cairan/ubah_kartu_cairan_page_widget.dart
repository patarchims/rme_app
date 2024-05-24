import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/repository/kartu_cairan_model_repository.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class UbahKartuCairanPageWidget extends StatefulWidget {
  final KartuCairanRepository kartuRepository;
  const UbahKartuCairanPageWidget({super.key, required this.kartuRepository});

  @override
  State<UbahKartuCairanPageWidget> createState() =>
      _UbahKartuCairanPageWidgetState();
}

class _UbahKartuCairanPageWidgetState extends State<UbahKartuCairanPageWidget> {
  late TextEditingController _cairanmasuk1;
  late TextEditingController _cairanmasuk2;
  late TextEditingController _cairanmasuk3;
  late TextEditingController _cairanmasukNgt;
  late TextEditingController _namaCairan;
  late TextEditingController _cairanKeluar;
  late TextEditingController _cairanKeluarNgt;
  late TextEditingController _cairanMasuk;
  late TextEditingController _keterangan;
  late TextEditingController _drainDLL;
  late TextEditingController _cairanKeluarUrine;

  @override
  void initState() {
    _cairanmasuk1 = TextEditingController();
    _cairanmasuk2 = TextEditingController();
    _cairanmasuk3 = TextEditingController();
    _cairanmasukNgt = TextEditingController();
    _namaCairan = TextEditingController();
    _cairanKeluar = TextEditingController();
    _cairanMasuk = TextEditingController();
    _keterangan = TextEditingController();
    _drainDLL = TextEditingController();
    _cairanKeluarNgt = TextEditingController();
    _cairanKeluarUrine = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _cairanmasuk1.clear();
    _cairanmasuk2.clear();
    _cairanmasuk3.clear();
    _cairanmasukNgt.clear();
    _namaCairan.clear();
    _cairanKeluar.clear();
    _cairanMasuk.clear();
    _keterangan.clear();
    _drainDLL.clear();
    _cairanKeluarNgt.clear();
    _cairanKeluarUrine.clear();

    _cairanmasuk1.dispose();
    _cairanmasuk2.dispose();
    _cairanmasuk3.dispose();
    _cairanmasukNgt.dispose();
    _namaCairan.dispose();
    _cairanKeluar.dispose();
    _cairanMasuk.dispose();
    _keterangan.dispose();
    _drainDLL.dispose();
    _cairanKeluarNgt.dispose();
    _cairanKeluarUrine.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // PasienState pasienState = context.watch<PasienBloc>().state;
    // final singlePasien = pasienState.listPasienModel
    //     .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<KartuObservasiBloc, KartuObservasiState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return HeaderContentWidget(
          backgroundColor: ThemeColor.bgColor,
          isENableAdd: true,
          onPressed: () {
            // ON UPDATE DATA //
            // on update kartu carian
          },
          title: "UPDATE",
          widget: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "UBAH KARTU CAIRAN",
                style: whiteTextStyle,
              ),
            ),
            body: SingleChildScrollView(
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
                  Container(
                      padding:
                          EdgeInsets.only(bottom: 0, right: 5.sp, left: 5.sp),
                      child:
                          Table(border: TableBorder.all(), columnWidths: const {
                        // 0: FlexColumnWidth(0.4),
                      }, children: [
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _cairanmasuk1
                                ..text = widget.kartuRepository.cairanMasuk1,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _cairanmasuk2
                                ..text = widget.kartuRepository.cairanMasuk2,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _cairanmasuk3
                                ..text = widget.kartuRepository.cairanMasuk3,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _cairanMasuk
                                ..text = widget.kartuRepository.cairanMasukNgt,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _namaCairan
                                ..text = widget.kartuRepository.namaCairan,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _cairanKeluarUrine
                                ..text =
                                    widget.kartuRepository.cairanKeluarUrine,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _cairanKeluarNgt
                                ..text = widget.kartuRepository.cairanKeluarNgt,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _drainDLL
                                ..text = widget.kartuRepository.drainDll,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              controller: _keterangan
                                ..text = widget.kartuRepository.keterangan,
                              maxLines: 3,
                              enabled: true,
                            ),
                          ),
                        ]),
                      ])),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
