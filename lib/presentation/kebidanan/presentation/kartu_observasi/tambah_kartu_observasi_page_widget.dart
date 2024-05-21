import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TambahKartuObservasiPageWidget extends StatefulWidget {
  const TambahKartuObservasiPageWidget({super.key});

  @override
  State<TambahKartuObservasiPageWidget> createState() =>
      _TambahKartuObservasiPageWidgetState();
}

class _TambahKartuObservasiPageWidgetState
    extends State<TambahKartuObservasiPageWidget> {
  late TextEditingController _tController;
  late TextEditingController _nController;
  late TextEditingController _pController;
  late TextEditingController _sController;
  late TextEditingController _cvpController;
  late TextEditingController _ekgController;
  late TextEditingController _ukurankiController;
  late TextEditingController _ukurankaController;
  late TextEditingController _redaksikiController;
  late TextEditingController _redaksikaController;
  late TextEditingController _gerakAnggotabadanController;
  late TextEditingController _kesadaranController;
  late TextEditingController _sputumWarnaController;
  late TextEditingController _isiCupController;
  late TextEditingController _keteranganController;

  @override
  void initState() {
    _tController = TextEditingController();
    _nController = TextEditingController();
    _pController = TextEditingController();
    _sController = TextEditingController();
    _cvpController = TextEditingController();
    _ekgController = TextEditingController();
    _ukurankiController = TextEditingController();
    _ukurankaController = TextEditingController();
    _redaksikiController = TextEditingController();
    _redaksikaController = TextEditingController();
    _gerakAnggotabadanController = TextEditingController();
    _kesadaranController = TextEditingController();
    _sputumWarnaController = TextEditingController();
    _isiCupController = TextEditingController();
    _keteranganController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tController.clear();
    _nController.clear();
    _pController.clear();
    _sController.clear();
    _cvpController.clear();
    _ekgController.clear();
    _ukurankiController.clear();
    _ukurankaController.clear();
    _redaksikiController.clear();
    _redaksikaController.clear();
    _gerakAnggotabadanController.clear();
    _kesadaranController.clear();
    _sputumWarnaController.clear();
    _isiCupController.clear();
    _keteranganController.clear();

    _tController.dispose();
    _nController.dispose();
    _pController.dispose();
    _sController.dispose();
    _cvpController.dispose();
    _ekgController.dispose();
    _ukurankiController.dispose();
    _ukurankaController.dispose();
    _redaksikiController.dispose();
    _redaksikaController.dispose();
    _gerakAnggotabadanController.dispose();
    _kesadaranController.dispose();
    _sputumWarnaController.dispose();
    _isiCupController.dispose();
    _keteranganController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocListener<KartuObservasiBloc, KartuObservasiState>(
        listener: (context, state) {
          if (state.status == KartuObservasiStaus.loading) {
            EasyLoading.show();
          }

          if (state.status != KartuObservasiStaus.loading) {
            EasyLoading.dismiss();
          }

          //=====//
          state.saveVitalSignResult.fold(
              () => null,
              (a) => a.fold(
                  (l) => l.maybeMap(
                      orElse: () {},
                      failure: (e) async {
                        // log(e.toString());
                        if (e.meta.code == 201) {
                          final shouldPop = await Alert.warningMessage(context,
                              subTitle: e.meta.message.toString(),
                              title: "Peringatan");
                          return shouldPop ?? false;
                        }
                        if (e.meta.code == 202) {
                          final shouldPop = await Alert.warningMessage(context,
                              subTitle: e.meta.message.toString(),
                              title: "Peringatan");
                          return shouldPop ?? false;
                        }
                      }),
                  (r) => r.maybeMap(
                      orElse: () {},
                      loaded: (e) async {
                        MetaModel meta =
                            MetaModel.fromJson(e.value["metadata"]);
                        final shouldPop = await Alert.loaded(context,
                            subTitle: meta.message, title: "Pesan");
                        return shouldPop ?? false;
                      })));
        },
        child: HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            title: "SIMPAN",
            onPressed: () {
              context.read<KartuObservasiBloc>().add(OnSaveKartuObservasiEvent(
                  noReg: singlePasien.first.noreg,
                  t: _tController.text,
                  n: _nController.text,
                  p: _pController.text,
                  s: _sController.text,
                  cvp: _cvpController.text,
                  ekg: _ekgController.text,
                  ukuranKi: _ukurankiController.text,
                  ukuranKa: _ukurankaController.text,
                  redaksiKi: _redaksikiController.text,
                  redaksiKa: _redaksikaController.text,
                  anggotaGerak: _gerakAnggotabadanController.text,
                  kesadaran: _kesadaranController.text,
                  sputumWarna: _sputumWarnaController.text,
                  isiCUP: _isiCupController.text,
                  keterangan: _keteranganController.text));
            },
            widget: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "TAMBAH KARTU OBSERVASI",
                  style: whiteTextStyle,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              // 0: FlexColumnWidth(0.4),
                            },
                            children: [
                              TableRow(children: [
                                TitleWidget.headerCenterTitle2(title: "T"),
                                TitleWidget.headerCenterTitle2(title: "N"),
                                TitleWidget.headerCenterTitle2(title: "P"),
                                TitleWidget.headerCenterTitle2(title: "S"),
                                TitleWidget.headerCenterTitle2(title: "CVP"),
                                TitleWidget.headerCenterTitle2(title: "EKG"),
                              ]),
                            ])),
                    Container(
                        padding: EdgeInsets.only(
                            top: 0.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              // 0: FlexColumnWidth(0.4),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "UKURAN KI",
                                    controller: _tController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "UKURAN KI",
                                    controller: _nController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "UKURAN KI",
                                    controller: _pController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "UKURAN KI",
                                    controller: _sController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "UKURAN KI",
                                    controller: _cvpController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "UKURAN KI",
                                    controller: _ekgController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                              ]),
                            ])),
                    Container(
                        padding: EdgeInsets.only(
                            top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              // 0: FlexColumnWidth(0.4),
                            },
                            children: [
                              TableRow(children: [
                                TitleWidget.headerCenterTitle2(
                                    title: "UKURAN KI"),
                                TitleWidget.headerCenterTitle2(
                                    title: "UKURAN KA"),
                                TitleWidget.headerCenterTitle2(
                                    title: "REDAKSI KI"),
                                TitleWidget.headerCenterTitle2(
                                    title: "REDAKSI KA"),
                                TitleWidget.headerCenterTitle2(
                                    title: "GERAK ANGGOTA BADAN"),
                                TitleWidget.headerCenterTitle2(
                                    title: "KESADARAN"),
                                TitleWidget.headerCenterTitle2(
                                    title: "SPUTUM WARNA"),
                                TitleWidget.headerCenterTitle2(
                                    title: "ISI CUP"),
                              ]),
                            ])),
                    Container(
                        padding: EdgeInsets.only(
                            top: 0.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              // 0: FlexColumnWidth(0.4),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "UKURAN KI",
                                    controller: _ukurankiController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "UKURAN KA",
                                    controller: _ukurankaController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "REDAKSI KI",
                                    controller: _redaksikiController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "REDAKSI KA",
                                    controller: _redaksikaController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "REDAKSI ANGGOTA BADAN",
                                    controller: _gerakAnggotabadanController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "KESADARAN",
                                    controller: _kesadaranController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "SPUTUM WARNA",
                                    controller: _sputumWarnaController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    // hinText: "ISI CUP",
                                    controller: _isiCupController,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                              ]),
                            ])),
                    Container(
                        padding: EdgeInsets.only(
                            top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              // 0: FlexColumnWidth(0.4),
                            },
                            children: [
                              TableRow(children: [
                                TitleWidget.headerCenterTitle2(
                                    title: "KETERANGAN"),
                              ]),
                            ])),
                    Container(
                        padding: EdgeInsets.only(
                            top: 0.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              // 0: FlexColumnWidth(0.4),
                            },
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _keteranganController,
                                    hinText: "Keterangan",
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                )
                              ]),
                            ])),
                  ],
                ),
              ),
            )));
  }
}
