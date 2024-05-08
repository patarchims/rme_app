import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/eary_warning_system/early_warning_system_bloc.dart';
import 'package:sizer/sizer.dart';

class TambahDataEdukasiTerintegrasiPasienWidget extends StatefulWidget {
  const TambahDataEdukasiTerintegrasiPasienWidget({super.key});

  @override
  State<TambahDataEdukasiTerintegrasiPasienWidget> createState() =>
      _TambahDataEdukasiTerintegrasiPasienWidgetState();
}

class _TambahDataEdukasiTerintegrasiPasienWidgetState
    extends State<TambahDataEdukasiTerintegrasiPasienWidget> {
  late String tingkatKesadaran;
  late String kategori;
  late String obsigenTambahan;
  late int td;
  late int td2;
  late int nadi;
  late int pernapasan;
  late String reaksiOtot;
  late int suhu;
  late int spo2;
  late int crt;
  late int skalaNyeri;
  late int skor;

  int skorKesadaran = 0;
  int skorNapas = 0;
  int skorNadi = 0;
  int skorTd = 0;
  int skorsuhu = 0;
  int skorObsigen = 0;

  int nilaiKesadaran = 0;
  int nilaiNafas = 0;
  int nilaiNadi = 0;
  int nilaiTd = 0;
  int nilaiDarah = 0;
  int nilaiSuhu = 0;
  int nilaiCRT = 0;
  int nilaiObsigen = 0;

  @override
  void initState() {
    tingkatKesadaran = "";
    obsigenTambahan = "Tidak";
    kategori = "Dewasa";
    td = 10;
    td2 = 10;
    nadi = 10;
    pernapasan = 10;
    reaksiOtot = "Ringan";
    suhu = 10;
    spo2 = 10;
    crt = 10;
    skalaNyeri = 10;
    skor = 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<EarlyWarningSystemBloc, EarlyWarningSystemState>(
      listener: (context, state) {
        if (state.status == EarlyWarningSystemStatus.loading) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (state.status != EarlyWarningSystemStatus.loading) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(orElse: () async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Error");
                      return shouldPop ?? false;
                    }, failure: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString());
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      final meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },

      // ===== //
      builder: (context, state) {
        return Container(
          height: Get.height / 1.2,
          width: Get.width,
          decoration: BoxDecoration(
            color: ThemeColor.bgColor,
          ),
          child: Scaffold(
            backgroundColor: ThemeColor.bgColor,
            appBar: AppBar(
                elevation: 1,
                automaticallyImplyLeading: false,
                title: Text(
                  "Early Warning System",
                  style: whiteTextStyle,
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                      child: Table(border: TableBorder.all(), children: [
                        TableRow(children: [
                          TitleWidget.headerCenterTitle2(title: "KATEGORI"),
                          TitleWidget.headerCenterTitle2(
                              title: "TINGKAT KESADARAN"),
                          TitleWidget.headerCenterTitle2(
                              title: "TEKANAN DARAH\n(SYSTOLIK)"),
                          TitleWidget.headerCenterTitle2(title: "NADI"),
                          TitleWidget.headerCenterTitle2(title: "PERNAPASAN"),
                          TitleWidget.headerCenterTitle2(title: "REAKSI OTOT"),
                          TitleWidget.headerCenterTitle2(title: "SUHU"),
                          TitleWidget.headerCenterTitle2(title: "SPO2"),
                          TitleWidget.headerCenterTitle2(title: "CRT"),
                          TitleWidget.headerCenterTitle2(title: "SKALA NYERI"),
                          TitleWidget.headerCenterTitle2(
                              title: "OKSIGEN TAMBAHAN"),
                        ]),
                      ])),
                  Container(
                      padding: EdgeInsets.only(top: 0, left: 5.sp, right: 5.sp),
                      child: Table(
                          columnWidths: const {
                            2: FlexColumnWidth(1.2),
                          },
                          border: TableBorder.all(),
                          children: [
                            TableRow(children: [
                              // ====== KATEGORI ================ /// ====
                              Container(
                                height: 110.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    btnKategori(state, context,
                                        title: "Dewasa"),
                                    btnKategori(state, context, title: "Anak"),
                                  ],
                                ),
                              ),

                              //================== TINGKAT KESADARAN
                              Container(
                                height: 110.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    color: ThemeColor.primaryColor),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    btnTingkatKesadaran(state, context,
                                        title: "Alert"),
                                    btnTingkatKesadaran(state, context,
                                        title: "Voice"),
                                    btnTingkatKesadaran(state, context,
                                        title: "Pain"),
                                    btnTingkatKesadaran(state, context,
                                        title: "Unreponsiv"),
                                  ],
                                ),
                              ),

                              //================ TEKANAN DARAH ==== //
                              Container(
                                height: 110.sp,
                                width: 100.sp,
                                margin: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    color: ThemeColor.transparentColor),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    tdDarah1(state, context,
                                        onChanged: (value) {
                                      context
                                          .read<EarlyWarningSystemBloc>()
                                          .add(OnChangedTekananDarah1(
                                              value: value));
                                    }),
                                    Text("/", style: blackTextStyle),
                                    tdDarah2(state, context),
                                    Text("mmHg", style: blackTextStyle),
                                  ],
                                ),
                              ),

                              //  CHANGE NADI
                              buttonApp(context,
                                  value: state.earlyWarningSystemModel.nadi
                                      .toDouble(), onChanged: (value) {
                                context
                                    .read<EarlyWarningSystemBloc>()
                                    .add(OnChangedNadi(value: value));
                              }),
                              // ====== NADI ==== //
                              buttonApp(context, value: pernapasan.toDouble(),
                                  onChanged: (value) {
                                context.read<EarlyWarningSystemBloc>().add(
                                    OnChangedPernapasanEvent(value: value));
                              }),

                              Container(
                                height: 110.sp,
                                margin: EdgeInsets.all(2.sp),
                                padding: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    btnReaksiOtot(context, state,
                                        value: "Berat"),
                                    SizedBox(height: 5.sp),
                                    btnReaksiOtot(context, state,
                                        value: "Sedang"),
                                    SizedBox(height: 5.sp),
                                    btnReaksiOtot(context, state,
                                        value: "Ringan"),
                                  ],
                                ),
                              ),

                              //======== SUHU ==================//
                              Container(
                                  height: 110.sp,
                                  margin: EdgeInsets.all(2.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    color: ThemeColor.primaryColor,
                                  ),
                                  child: CupertinoSpinBox(
                                    textStyle: whiteTextStyle,
                                    min: 1,
                                    decimals: 1,
                                    max: 500,
                                    value: state.earlyWarningSystemModel.suhu,
                                    direction: Axis.vertical,
                                    decoration: BoxDecoration(
                                        color: ThemeColor.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.sp))),
                                    onChanged: (value) {
                                      context
                                          .read<EarlyWarningSystemBloc>()
                                          .add(OnChangedSuhu(value: value));
                                    },
                                  )),

                              // ===== //
                              Container(
                                height: 110.sp,
                                margin: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: CupertinoSpinBox(
                                  textStyle: whiteTextStyle,
                                  min: 1,
                                  max: 500,
                                  decimals: 1,
                                  value: spo2.toDouble(),
                                  direction: Axis.vertical,
                                  decoration: BoxDecoration(
                                      color: ThemeColor.primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.sp))),
                                  onChanged: (value) {
                                    context
                                        .read<EarlyWarningSystemBloc>()
                                        .add(OnChangedSPO2(value: value));
                                  },
                                ),
                              ),
                              Container(
                                height: 110.sp,
                                margin: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: CupertinoSpinBox(
                                  textStyle: whiteTextStyle,
                                  min: 1,
                                  max: 500,
                                  decimals: 1,
                                  value: crt.toDouble(),
                                  direction: Axis.vertical,
                                  decoration: BoxDecoration(
                                      color: ThemeColor.primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.sp))),
                                  onChanged: (value) {
                                    context
                                        .read<EarlyWarningSystemBloc>()
                                        .add(OnChangedCRT(value: value));
                                  },
                                ),
                              ),
                              Container(
                                height: 110.sp,
                                margin: EdgeInsets.all(2.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: ThemeColor.primaryColor,
                                ),
                                child: CupertinoSpinBox(
                                  textStyle: whiteTextStyle,
                                  min: 1,
                                  max: 500,
                                  decimals: 1,
                                  value: skalaNyeri.toDouble(),
                                  direction: Axis.vertical,
                                  decoration: BoxDecoration(
                                      color: ThemeColor.primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.sp))),
                                  onChanged: (value) {
                                    context
                                        .read<EarlyWarningSystemBloc>()
                                        .add(OnChangedSkalaNyeri(value: value));
                                  },
                                ),
                              ),
                              btnObsigenTambahan(state, context),
                            ]),
                          ])),
                  Container(
                      padding: EdgeInsets.only(top: 0, left: 5.sp, right: 5.sp),
                      child: Table(border: TableBorder.all(), children: [
                        TableRow(children: [
                          Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: FormWidget.textArea(
                                hinText: "Keterangan",
                                onChanged: (value) {
                                  context.read<EarlyWarningSystemBloc>().add(
                                      OnChangedKeterangan(
                                          value: value.toString()));
                                },
                                enabled: true,
                                maxLines: 3),
                          ),
                        ]),
                      ])),
                  Container(
                      padding: EdgeInsets.only(top: 0, left: 5.sp, right: 5.sp),
                      child: Table(border: TableBorder.all(), children: [
                        TableRow(children: [
                          Container(
                            height: 15.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              color: ThemeColor.primaryColor,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              onPressed: null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.handPointUp,
                                    color: ThemeColor.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 5.sp,
                                  ),
                                  Text(
                                    "TOTAL SKOR ${state.earlyWarningSystemModel.totalSkor.toString()} ",
                                    style: whiteTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ])),
                  Container(
                      padding: EdgeInsets.only(top: 0, left: 5.sp, right: 5.sp),
                      child: Table(border: TableBorder.all(), children: [
                        TableRow(children: [
                          Container(
                            height: 15.sp,
                            margin: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.sp),
                              color: ThemeColor.primaryColor,
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              onPressed: () {
                                context.read<EarlyWarningSystemBloc>().add(OnSaveData(
                                    kategori:
                                        state.earlyWarningSystemModel.kategori,
                                    obsigenTambahan: state
                                        .earlyWarningSystemModel
                                        .obsigenTambahan,
                                    totalSkor: state
                                        .earlyWarningSystemModel.totalSkor
                                        .toInt(),
                                    noreg: singlePasien.first.noreg,
                                    keterangan: state
                                        .earlyWarningSystemModel.keterangan,
                                    td2: state.earlyWarningSystemModel.td2
                                        .toInt(),
                                    kesadaran: state.earlyWarningSystemModel
                                        .tingkatKesadaran,
                                    td: state.earlyWarningSystemModel.td
                                        .toInt(),
                                    nadi: state.earlyWarningSystemModel.nadi
                                        .toInt(),
                                    pernapasan: state
                                        .earlyWarningSystemModel.pernapasan
                                        .toInt(),
                                    reaksiOtot: state
                                        .earlyWarningSystemModel.reaksiOtot,
                                    suhu: state.earlyWarningSystemModel.suhu
                                        .toInt(),
                                    spo2:
                                        state.earlyWarningSystemModel.spo2.toInt(),
                                    crt: state.earlyWarningSystemModel.crt.toInt(),
                                    skalaNyeri: state.earlyWarningSystemModel.skalaNyeri.toInt()));

                                Get.back();

                                context.read<EarlyWarningSystemBloc>().add(
                                    OnGetDataEarlyWarningSystem(
                                        noReg: singlePasien.first.noreg));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.floppyDisk,
                                    color: ThemeColor.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 5.sp,
                                  ),
                                  Text(
                                    "SIMPAN",
                                    style: whiteTextStyle,
                                  )
                                ],
                              ),
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

  Container btnObsigenTambahan(
      EarlyWarningSystemState state, BuildContext context) {
    return Container(
      height: 110.sp,
      margin: EdgeInsets.all(2.sp),
      padding: EdgeInsets.all(2.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.sp),
        color: ThemeColor.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.sp,
            width: Get.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.sp)),
                  backgroundColor:
                      (state.earlyWarningSystemModel.obsigenTambahan == "Ya")
                          ? ThemeColor.greenColor.withOpacity(0.5)
                          : ThemeColor.darkColor),
              onPressed: () {
                context
                    .read<EarlyWarningSystemBloc>()
                    .add(OnChangedObsigenTambahanEvent(value: "Ya"));
              },
              child: Text(
                "Ya",
                style: whiteTextStyle.copyWith(fontSize: 4.sp),
              ),
            ),
          ),
          SizedBox(
            height: 15.sp,
            width: Get.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.sp)),
                  backgroundColor:
                      (state.earlyWarningSystemModel.obsigenTambahan == "Tidak")
                          ? ThemeColor.greenColor.withOpacity(0.5)
                          : ThemeColor.darkColor),
              onPressed: () {
                context
                    .read<EarlyWarningSystemBloc>()
                    .add(OnChangedObsigenTambahanEvent(value: "Tidak"));
              },
              child: Text(
                "Tidak",
                style: whiteTextStyle.copyWith(fontSize: 4.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox btnReaksiOtot(BuildContext context, EarlyWarningSystemState state,
      {required String value}) {
    return SizedBox(
        width: Get.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp)),
              backgroundColor:
                  (state.earlyWarningSystemModel.reaksiOtot == value)
                      ? ThemeColor.greenColor.withOpacity(0.5)
                      : ThemeColor.darkColor),
          onPressed: () {
            context
                .read<EarlyWarningSystemBloc>()
                .add(OnChangedReaksiOtot(value: value));
          },
          child: Text(
            value,
            style: whiteTextStyle.copyWith(fontSize: 4.sp),
          ),
        ));
  }

  Container buttonApp(BuildContext context,
      {required double value, Function(double)? onChanged}) {
    return Container(
      height: 110.sp,
      margin: EdgeInsets.all(2.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.sp),
        color: ThemeColor.primaryColor,
      ),
      child: CupertinoSpinBox(
        textStyle: whiteTextStyle,
        min: 1,
        max: 500,
        decimals: 1,
        value: value,
        direction: Axis.vertical,
        decoration: BoxDecoration(
            color: ThemeColor.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(2.sp))),
        onChanged: onChanged,
      ),
    );
  }

  Container tdDarah2(EarlyWarningSystemState state, BuildContext context) {
    return Container(
      height: 45.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.sp),
        color: ThemeColor.primaryColor,
      ),
      child: CupertinoSpinBox(
        textStyle: whiteTextStyle.copyWith(fontSize: 5.sp),
        min: 1,
        max: 500,
        decimals: 1,
        value: state.earlyWarningSystemModel.td2.toDouble(),
        direction: Axis.vertical,
        decoration: BoxDecoration(
            color: ThemeColor.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(2.sp))),
        onChanged: (value) {
          // log(value.toString());
          context
              .read<EarlyWarningSystemBloc>()
              .add(OnChangedTekananDarah2(value: value));
        },
      ),
    );
  }

  Container tdDarah1(EarlyWarningSystemState state, BuildContext context,
      {Function(double)? onChanged}) {
    return Container(
      height: 45.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.sp),
        color: ThemeColor.primaryColor,
      ),
      child: CupertinoSpinBox(
        textStyle: whiteTextStyle.copyWith(fontSize: 5.sp),
        min: 1,
        max: 500,
        decimals: 1,
        value: state.earlyWarningSystemModel.td.toDouble(),
        direction: Axis.vertical,
        decoration: BoxDecoration(
            color: ThemeColor.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(2.sp))),
        onChanged: onChanged,
      ),
    );
  }

  SizedBox btnKategori(
    EarlyWarningSystemState state,
    BuildContext context, {
    required String title,
  }) {
    return SizedBox(
      height: 20.sp,
      width: Get.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp)),
            backgroundColor: (state.earlyWarningSystemModel.kategori == title)
                ? ThemeColor.greenColor.withOpacity(0.5)
                : ThemeColor.darkColor),
        onPressed: () {
          context
              .read<EarlyWarningSystemBloc>()
              .add(OnChangedKategori(kategori: title));
        },
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 3.sp),
        ),
      ),
    );
  }

  SizedBox btnTingkatKesadaran(
      EarlyWarningSystemState state, BuildContext context,
      {required String title}) {
    return SizedBox(
      height: 15.sp,
      width: Get.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp)),
            backgroundColor:
                (state.earlyWarningSystemModel.tingkatKesadaran == title)
                    ? ThemeColor.greenColor.withOpacity(0.5)
                    : ThemeColor.darkColor),
        onPressed: () {
          context
              .read<EarlyWarningSystemBloc>()
              .add(OnChangedTingkatKesadaran(value: title));
        },
        child: Text(
          title,
          style: whiteTextStyle.copyWith(fontSize: 3.sp),
        ),
      ),
    );
  }
}

List<String> menu = [
  "Early Warning System",
];
