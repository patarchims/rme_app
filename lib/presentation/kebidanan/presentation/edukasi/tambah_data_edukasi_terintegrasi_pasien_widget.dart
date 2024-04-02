import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/header/tabbar_header_content_widget.dart';
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

  @override
  void initState() {
    tingkatKesadaran = "";
    obsigenTambahan = "Tidak";
    kategori = "Dewasa";
    td = 10;
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
          height: Get.height / 1.7,
          width: Get.width / 1.2,
          decoration: BoxDecoration(
            color: ThemeColor.bgColor,
          ),
          child: TabbarHeaderContentWidget(
              backgroundColor: ThemeColor.bgColor,
              menu: menu,
              children: menu.asMap().entries.map((e) {
                if (e.key == 0) {
                  return Scaffold(
                    backgroundColor: ThemeColor.bgColor,
                    appBar: AppBar(
                      elevation: 1,
                      automaticallyImplyLeading: false,
                      title: Text(
                        "Early Warning System",
                        style: whiteTextStyle,
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: 5.sp,
                                  bottom: 0,
                                  right: 5.sp,
                                  left: 5.sp),
                              child:
                                  Table(border: TableBorder.all(), children: [
                                TableRow(children: [
                                  TitleWidget.headerCenterTitle2(
                                      title: "KATEGORI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "TINGKAT KESADARAN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "TEKANAN DARAH\n(SYSTOLIK)"),
                                  TitleWidget.headerCenterTitle2(title: "NADI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "PERNAPASAN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "REAKSI OTOT"),
                                  TitleWidget.headerCenterTitle2(title: "SUHU"),
                                  TitleWidget.headerCenterTitle2(title: "SPO2"),
                                  TitleWidget.headerCenterTitle2(title: "CRT"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "SKALA NYERI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "OBSIGEN TAMBAHAN"),
                                ]),
                              ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child:
                                  Table(border: TableBorder.all(), children: [
                                TableRow(children: [
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (kategori == "Dewasa")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                kategori = "Dewasa";
                                              });
                                            },
                                            child: Text(
                                              "Dewasa",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (kategori == "Anak")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                kategori = "Anak";
                                              });
                                            },
                                            child: Text(
                                              "Anak",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (tingkatKesadaran ==
                                                            "Alert")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                tingkatKesadaran = "Alert";
                                              });
                                            },
                                            child: Text(
                                              "Alert",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (tingkatKesadaran ==
                                                            "Voice")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                tingkatKesadaran = "Voice";
                                              });
                                            },
                                            child: Text(
                                              "Voice",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (tingkatKesadaran == "Pain")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                tingkatKesadaran = "Pain";
                                              });
                                            },
                                            child: Text(
                                              "Pain",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (tingkatKesadaran ==
                                                            "Unreponsiv")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                tingkatKesadaran = "Unreponsiv";
                                              });
                                            },
                                            child: Text(
                                              "Unreponsiv",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: td.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          td = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: nadi.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          nadi = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: pernapasan.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          pernapasan = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: Get.width,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.sp)),
                                                  backgroundColor:
                                                      (reaksiOtot == "Berat")
                                                          ? ThemeColor
                                                              .greenColor
                                                              .withOpacity(0.5)
                                                          : ThemeColor
                                                              .darkColor),
                                              onPressed: () {
                                                setState(() {
                                                  reaksiOtot = "Berat";
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Berat",
                                                  style: whiteTextStyle
                                                      .copyWith(fontSize: 4.sp),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        SizedBox(
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (reaksiOtot == "Sedang")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                reaksiOtot = "Sedang";
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Sedang",
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 4.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        SizedBox(
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (reaksiOtot == "Ringan")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                reaksiOtot = "Ringan";
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Ringan",
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 4.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: suhu.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          suhu = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: spo2.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          spo2 = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: crt.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          crt = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: skalaNyeri.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          skalaNyeri = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (obsigenTambahan == "Ya")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                obsigenTambahan = "Ya";
                                              });
                                            },
                                            child: Text(
                                              "Ya",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (obsigenTambahan == "Tidak")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                obsigenTambahan = "Tidak";
                                              });
                                            },
                                            child: Text(
                                              "Tidak",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child:
                                  Table(border: TableBorder.all(), children: [
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
                                          backgroundColor:
                                              ThemeColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp))),
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.handPointUp,
                                            color: ThemeColor.whiteColor,
                                          ),
                                          SizedBox(
                                            width: 5.sp,
                                          ),
                                          Text(
                                            "TOTAL SKOR",
                                            style: whiteTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child:
                                  Table(border: TableBorder.all(), children: [
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
                                          backgroundColor:
                                              ThemeColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp))),
                                      onPressed: () {
                                        context
                                            .read<EarlyWarningSystemBloc>()
                                            .add(OnSaveData(
                                                noreg: singlePasien.first.noreg,
                                                kesadaran: tingkatKesadaran,
                                                td: td,
                                                nadi: nadi,
                                                pernapasan: pernapasan,
                                                reaksiOtot: reaksiOtot,
                                                suhu: suhu,
                                                spo2: spo2,
                                                crt: crt,
                                                skalaNyeri: skalaNyeri));

                                        context
                                            .read<EarlyWarningSystemBloc>()
                                            .add(OnGetDataEarlyWarningSystem(
                                                noReg:
                                                    singlePasien.first.noreg));

                                        Get.back();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                  );
                }

                if (e.key == 1) {
                  return Scaffold(
                    backgroundColor: ThemeColor.bgColor,
                    appBar: AppBar(
                      elevation: 1,
                      automaticallyImplyLeading: false,
                      title: Text(
                        "Kontrol Istimewa",
                        style: whiteTextStyle,
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  top: 5.sp,
                                  bottom: 0,
                                  right: 5.sp,
                                  left: 5.sp),
                              child:
                                  Table(border: TableBorder.all(), children: [
                                TableRow(children: [
                                  TitleWidget.headerCenterTitle2(
                                      title: "KATEGORI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "TINGKAT KESADARAN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "TEKANAN DARAH\n(SYSTOLIK)"),
                                  TitleWidget.headerCenterTitle2(title: "NADI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "PERNAPASAN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "REAKSI OTOT"),
                                  TitleWidget.headerCenterTitle2(title: "SUHU"),
                                  TitleWidget.headerCenterTitle2(title: "SPO2"),
                                  TitleWidget.headerCenterTitle2(title: "CRT"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "SKALA NYERI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "OBSIGEN TAMBAHAN"),
                                ]),
                              ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child:
                                  Table(border: TableBorder.all(), children: [
                                TableRow(children: [
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (kategori == "Dewasa")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                kategori = "Dewasa";
                                              });
                                            },
                                            child: Text(
                                              "Dewasa",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (kategori == "Anak")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                kategori = "Anak";
                                              });
                                            },
                                            child: Text(
                                              "Anak",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (tingkatKesadaran ==
                                                            "Alert")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                tingkatKesadaran = "Alert";
                                              });
                                            },
                                            child: Text(
                                              "Alert",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (tingkatKesadaran ==
                                                            "Voice")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                tingkatKesadaran = "Voice";
                                              });
                                            },
                                            child: Text(
                                              "Voice",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (tingkatKesadaran == "Pain")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                tingkatKesadaran = "Pain";
                                              });
                                            },
                                            child: Text(
                                              "Pain",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (tingkatKesadaran ==
                                                            "Unreponsiv")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                tingkatKesadaran = "Unreponsiv";
                                              });
                                            },
                                            child: Text(
                                              "Unreponsiv",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: td.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          td = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: nadi.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          nadi = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: pernapasan.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          pernapasan = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: Get.width,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.sp)),
                                                  backgroundColor:
                                                      (reaksiOtot == "Berat")
                                                          ? ThemeColor
                                                              .greenColor
                                                              .withOpacity(0.5)
                                                          : ThemeColor
                                                              .darkColor),
                                              onPressed: () {
                                                setState(() {
                                                  reaksiOtot = "Berat";
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Berat",
                                                  style: whiteTextStyle
                                                      .copyWith(fontSize: 4.sp),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        SizedBox(
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (reaksiOtot == "Sedang")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                reaksiOtot = "Sedang";
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Sedang",
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 4.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        SizedBox(
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (reaksiOtot == "Ringan")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                reaksiOtot = "Ringan";
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Ringan",
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 4.sp),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: suhu.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          suhu = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: spo2.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          spo2 = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: crt.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          crt = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: CupertinoSpinBox(
                                      textStyle: whiteTextStyle,
                                      min: 1,
                                      max: 100,
                                      value: skalaNyeri.toDouble(),
                                      direction: Axis.vertical,
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.sp))),
                                      onChanged: (value) {
                                        setState(() {
                                          skalaNyeri = value.toInt();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 65.sp,
                                    margin: EdgeInsets.all(2.sp),
                                    padding: EdgeInsets.all(2.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.sp),
                                      color: ThemeColor.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (obsigenTambahan == "Ya")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                obsigenTambahan = "Ya";
                                              });
                                            },
                                            child: Text(
                                              "Ya",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.sp,
                                          width: Get.width,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (obsigenTambahan == "Tidak")
                                                        ? ThemeColor.greenColor
                                                            .withOpacity(0.5)
                                                        : ThemeColor.darkColor),
                                            onPressed: () {
                                              setState(() {
                                                obsigenTambahan = "Tidak";
                                              });
                                            },
                                            child: Text(
                                              "Tidak",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 4.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child:
                                  Table(border: TableBorder.all(), children: [
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
                                          backgroundColor:
                                              ThemeColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp))),
                                      onPressed: null,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.handPointUp,
                                            color: ThemeColor.whiteColor,
                                          ),
                                          SizedBox(
                                            width: 5.sp,
                                          ),
                                          Text(
                                            "TOTAL SKOR",
                                            style: whiteTextStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ])),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 0, left: 5.sp, right: 5.sp),
                              child:
                                  Table(border: TableBorder.all(), children: [
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
                                          backgroundColor:
                                              ThemeColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp))),
                                      onPressed: () {
                                        context
                                            .read<EarlyWarningSystemBloc>()
                                            .add(OnSaveData(
                                                noreg: singlePasien.first.noreg,
                                                kesadaran: tingkatKesadaran,
                                                td: td,
                                                nadi: nadi,
                                                pernapasan: pernapasan,
                                                reaksiOtot: reaksiOtot,
                                                suhu: suhu,
                                                spo2: spo2,
                                                crt: crt,
                                                skalaNyeri: skalaNyeri));

                                        context
                                            .read<EarlyWarningSystemBloc>()
                                            .add(OnGetDataEarlyWarningSystem(
                                                noReg:
                                                    singlePasien.first.noreg));

                                        Get.back();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                  );
                }
                return Container();
              }).toList()),
        );
      },
    );
  }
}

List<String> menu = ["Early Warning System", "Kontrol Istimewa"];
