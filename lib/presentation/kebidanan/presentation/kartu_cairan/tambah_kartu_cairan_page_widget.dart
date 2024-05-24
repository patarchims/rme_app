import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TambahKartuCairanPage extends StatefulWidget {
  const TambahKartuCairanPage({super.key});

  @override
  State<TambahKartuCairanPage> createState() => _TambahKartuCairanPageState();
}

class _TambahKartuCairanPageState extends State<TambahKartuCairanPage> {
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
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<KartuObservasiBloc, KartuObservasiState>(
      listener: (context, state) {
        //
        if (state.status == KartuObservasiStaus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != KartuObservasiStaus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        //=====//
        state.saveKartuCairan.fold(
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
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () {
              // TODO SIMPAN DATA // OnSaveKartuCarianEvent
              context.read<KartuObservasiBloc>().add(OnSaveKartuCarianEvent(
                    noReg: singlePasien.first.noreg,
                    cairanMasuk1: _cairanmasuk1.text,
                    cairanMasuk2: _cairanmasuk2.text,
                    cairanMasuk3: _cairanmasuk3.text,
                    cairanMasukNgt: _cairanmasukNgt.text,
                    drainDll: _drainDLL.text,
                    namaCairan: _namaCairan.text,
                    cairanKeluarNgt: _cairanKeluarNgt.text,
                    cairanKeluarUrine: _cairanKeluarUrine.text,
                    cairanMasuk: _cairanMasuk.text,
                    keterangan: _keterangan.text,
                  ));
            },
            widget: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                // toolbarOpacity: 2,
                title: Text(
                  "TAMBAH KARTU CAIRAN",
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
                                TitleWidget.headerCenterTitle2(
                                    title: "DRAIN, DLL"),
                                TitleWidget.headerCenterTitle2(
                                    title: "KETERANGAN"),
                              ]),
                            ])),
                    Container(
                        padding:
                            EdgeInsets.only(bottom: 0, right: 5.sp, left: 5.sp),
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
                                    controller: _cairanmasuk1,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _cairanmasuk2,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _cairanmasuk3,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _cairanMasuk,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _namaCairan,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _cairanKeluarUrine,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _cairanKeluarNgt,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _drainDLL,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                    controller: _keterangan,
                                    maxLines: 3,
                                    enabled: true,
                                  ),
                                ),
                              ]),
                            ])),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
