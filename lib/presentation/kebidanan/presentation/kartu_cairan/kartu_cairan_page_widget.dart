import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/kartu_cairan/tambah_kartu_cairan_page_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/kartu_cairan/ubah_kartu_cairan_page_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class KartuCairanPageWidget extends StatefulWidget {
  const KartuCairanPageWidget({super.key});

  @override
  State<KartuCairanPageWidget> createState() => _KartuCairanPageWidgetState();
}

class _KartuCairanPageWidgetState extends State<KartuCairanPageWidget> {
  final ScrollController _scrollController = ScrollController();

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
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<KartuObservasiBloc, KartuObservasiState>(
      listener: (context, state) {
        //===//
        state.onDeleteKartuCairanResult.fold(
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
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == KartuObservasiStaus.isLoadingGetKartuCairan) {
          return Expanded(
              child: HeaderContentWidget(widget: Loading.expandedLoading()));
        }

        return Expanded(
            child: HeaderContentWidget(
          widget: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            controller: _scrollController,
            trackVisibility: false,
            radius: Radius.circular(5.sp),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(right: 10.sp),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                        child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              10: FlexColumnWidth(1.2),
                            },
                            children: [
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
                                TitleWidget.headerCenterTitle2(
                                    title: "DRAIN, DLL"),
                                TitleWidget.headerCenterTitle2(
                                    title: "KETERANGAN"),
                                TitleWidget.headerCenterTitle2(title: "ACTION"),
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
                              columnWidths: const {
                                10: FlexColumnWidth(1.2),
                              },
                              children: state.kartuCairan.map((e) {
                                return TableRow(children: [
                                  TitleWidget.contentTitle(
                                      title: e.jam.substring(11, 19)),
                                  TitleWidget.contentTitle(
                                      title: e.cairanMasuk1),
                                  TitleWidget.contentTitle(
                                      title: e.cairanMasuk2),
                                  TitleWidget.contentTitle(
                                      title: e.cairanMasuk3),
                                  TitleWidget.contentTitle(
                                      title: e.cairanMasukNgt),
                                  TitleWidget.contentTitle(title: e.namaCairan),
                                  TitleWidget.contentTitle(
                                      title: e.cairanKeluarUrine),
                                  TitleWidget.contentTitle(
                                      title: e.cairanKeluarNgt),
                                  TitleWidget.contentTitle(title: e.drainDll),
                                  TitleWidget.contentTitle(title: e.keterangan),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // HAPUS DATA
                                            CustomDialogWidget.getDialog(
                                                widget:
                                                    MessageAlert.deleteAlert(
                                                        mesage:
                                                            "Apakah Anda yakin menghapus data ${e.namaCairan} ini ?",
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                  KartuObservasiBloc>()
                                                              .add(OnDeleteKartuCairanEvent(
                                                                  noReg:
                                                                      singlePasien
                                                                          .first
                                                                          .noreg,
                                                                  idKartu: e
                                                                      .idKartu));

                                                          Get.back();
                                                        }));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.sp),
                                              ),
                                              backgroundColor:
                                                  ThemeColor.primaryColor),
                                          child: Icon(
                                            FontAwesomeIcons.trash,
                                            size: 5.sp,
                                            color: Colors.red,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.sp),
                                              ),
                                              backgroundColor:
                                                  ThemeColor.primaryColor),
                                          onPressed: () {
                                            CustomDialogWidget.getDialog(
                                                widget: SizedBox(
                                                    height: Get.height - 150.sp,
                                                    width: Get.width,
                                                    child:
                                                        UbahKartuCairanPageWidget(
                                                      kartuRepository: e,
                                                    )),
                                                color: ThemeColor.blueColor);
                                          },
                                          child: Icon(
                                            FontAwesomeIcons.pencil,
                                            size: 5.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]);
                              }).toList())),
                    ],
                    SizedBox(
                      height: 20.sp,
                    ),
                  ],
                ),
              ),
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
