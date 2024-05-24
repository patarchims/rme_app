import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/repository/kartu_observasi_model_repository.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class UpdateKartuObservasiPageWidget extends StatefulWidget {
  final KartuObservasiModelRepository kartuObservasiModelRepository;
  const UpdateKartuObservasiPageWidget({
    super.key,
    required this.kartuObservasiModelRepository,
  });

  @override
  State<UpdateKartuObservasiPageWidget> createState() =>
      _UpdateKartuObservasiPageWidgetState();
}

class _UpdateKartuObservasiPageWidgetState
    extends State<UpdateKartuObservasiPageWidget> {
  final ScrollController _scrollController = ScrollController();
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

    return BlocConsumer<KartuObservasiBloc, KartuObservasiState>(
      listener: (context, state) {
        state.onDeleteKartuObservasiResult.fold(
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
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");

                      Get.back();
                      return shouldPop ?? false;
                    })));

        state.onUpdatekartuCairan.fold(
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
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");

                      Get.back();
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        return HeaderContentWidget(
          isENableAdd: true,
          backgroundColor: ThemeColor.bgColor,
          onPressed: () {
            // ON UPDATE KARTU OBSERVASI
            context.read<KartuObservasiBloc>().add(OnUpdateKartuObservasiEvent(
                noReg: singlePasien.first.noreg,
                idObservasi: widget.kartuObservasiModelRepository.idObservasi,
                t: _tController.text,
                n: _nController.text,
                p: _pController.text,
                s: _sController.text,
                cvp: _cvpController.text,
                ekg: _ekgController.text,
                pupilKiri: _ukurankiController.text,
                pupilKanan: _ukurankaController.text,
                redaksiKiri: _redaksikiController.text,
                redaksiKanan: _redaksikaController.text,
                anggoataBadan: _gerakAnggotabadanController.text,
                kesadaran: _kesadaranController.text,
                sputumWarna: _sputumWarnaController.text,
                isiCup: _isiCupController.text,
                keterangan: _keteranganController.text));
          },
          title: "UPDATE",
          widget: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "UBAH KARTU OBSERVASI",
                style: whiteTextStyle,
              ),
            ),
            body: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 10.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  margin: EdgeInsets.only(right: 10.sp),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                          child: Table(
                              border: TableBorder.all(),
                              columnWidths: const {},
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
                                      controller: _tController
                                        ..text = widget
                                            .kartuObservasiModelRepository.t,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _nController
                                        ..text = widget
                                            .kartuObservasiModelRepository.n,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _pController
                                        ..text = widget
                                            .kartuObservasiModelRepository.p,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _sController
                                        ..text = widget
                                            .kartuObservasiModelRepository.s,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _cvpController
                                        ..text = widget
                                            .kartuObservasiModelRepository.cvp,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _ekgController
                                        ..text = widget
                                            .kartuObservasiModelRepository.ekg,
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
                              columnWidths: const {},
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
                              columnWidths: const {},
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _ukurankiController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .pupilKiri,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _ukurankaController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .pupilKanan,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _redaksikiController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .redaksiKiri,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _redaksikaController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .redaksiKanan,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _gerakAnggotabadanController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .anggotaBadan,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _kesadaranController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .kesadaran,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _sputumWarnaController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .sputumWarna,
                                      maxLines: 3,
                                      enabled: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _isiCupController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .isiCup,
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
                              columnWidths: const {},
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
                              columnWidths: const {},
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.all(3.sp),
                                    child: FormWidget.textArea(
                                      controller: _keteranganController
                                        ..text = widget
                                            .kartuObservasiModelRepository
                                            .keterangan,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
