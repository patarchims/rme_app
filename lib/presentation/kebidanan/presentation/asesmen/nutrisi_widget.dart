import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_nutrisi/pengkajian_nutrisi_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class AsesmenNutrisiKebidananWidget extends StatefulWidget {
  const AsesmenNutrisiKebidananWidget({super.key});

  @override
  State<AsesmenNutrisiKebidananWidget> createState() =>
      _AsesmenNutrisiKebidananWidgetState();
}

class _AsesmenNutrisiKebidananWidgetState
    extends State<AsesmenNutrisiKebidananWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    // AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PengkajianNutrisiBloc, PengkajianNutrisiState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state.status == PengkajianNutrisiStatus.isLoadingSavePengkajian) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (state.status != PengkajianNutrisiStatus.isLoadingSavePengkajian) {
          EasyLoading.dismiss();
        }

        state.savePengkajianResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      log("ERROR FAILURE $e");
                      // TAMPILKAN PESAN KESALAHAN
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
      builder: (context, state) {
        if (state.status == PengkajianNutrisiStatus.isLoadingGetPengkajian) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
          isENableAdd: true,
          onPressed: () async {
            dynamic data = await deviceInfo.initPlatformState();

            // ignore: use_build_context_synchronously
            context.read<PengkajianNutrisiBloc>().add(OnSavePengkajianNutrisi(
                noReg: singlePasien.first.noreg,
                deviceID: "ID - ${data['id']} - ${data['device']}}",
                n1: state.pengkajianNutrisiResponseModel.n1,
                n2: state.pengkajianNutrisiResponseModel.n2,
                nilai: state.pengkajianNutrisiResponseModel.nilaiN1 +
                    state.pengkajianNutrisiResponseModel.nilaiN2));
          },
          title: "Simpan",
          widget: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            controller: _scrollController,
            trackVisibility: false,
            radius: Radius.circular(5.sp),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(
                    height: 5.sp,
                  ),
                  // ======================= START HEADER
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: TableDesk(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      child: TableDeskRow(
                        border: const BorderSide(width: 1, color: Colors.black),
                        gaps: [
                          TableGap.width(60),
                          TableGap.weight(),
                          TableGap.width(420),
                          TableGap.width(220),
                        ],
                        children: [
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "NO.",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "PARAMETER",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          TableDeskColumn(
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            children: [
                              Container(
                                color: ThemeColor.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "SKALA",
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                color: ThemeColor.primaryColor,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "YA",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "TIDAK",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "NILAI",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ======================= END HEADER
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "1. ",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Apakah pasien mengalami penurunan\nBB yang tidak diinginkan dalam 6 bulan terakhir ?",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),

                  // END TITLE
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " ",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "a. Tidak ada penurunan BB",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                              onPressed: () {
                                context.read<PengkajianNutrisiBloc>().add(
                                    OnChangedN1(
                                        value: "Tidak ada penurunan BB"));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (state
                                              .pengkajianNutrisiResponseModel
                                              .n1 ==
                                          "Tidak ada penurunan BB")
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              color: ThemeColor.whiteColor,
                              icon: Text(
                                "YA",
                                style: whiteTextStyle.copyWith(fontSize: 6.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                          ),
                          Center(
                            child: Text(
                              state.pengkajianNutrisiResponseModel.nilaiN1
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "b. Tidak yakin / Tidak tahu / Baju terasa Longgar",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                              onPressed: () {
                                // TODO : SIMPAN DATA ALERGI OBAT
                                context.read<PengkajianNutrisiBloc>().add(
                                    OnChangedN1(
                                        value:
                                            "Tidak yakin / Tidak tahu / Baju terasa Longgar"));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (state
                                          .pengkajianNutrisiResponseModel.n1
                                          .contains(
                                              "Tidak yakin / Tidak tahu / Baju terasa Longgar"))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              color: ThemeColor.whiteColor,
                              icon: Text(
                                "YA",
                                style: whiteTextStyle.copyWith(fontSize: 6.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                          ),
                          Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 7.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "c. Ya, Berapa penurunan BB Tersebut ?",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                          ),
                          Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 7.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "               • 1-5 Kg",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                              onPressed: () {
                                // TODO : SIMPAN DATA ALERGI OBAT
                                context
                                    .read<PengkajianNutrisiBloc>()
                                    .add(OnChangedN1(value: "1-5 Kg"));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (state
                                              .pengkajianNutrisiResponseModel
                                              .n1 ==
                                          "1-5 Kg")
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              color: ThemeColor.whiteColor,
                              icon: Text(
                                "YA",
                                style: whiteTextStyle.copyWith(fontSize: 6.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                          ),
                          Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 7.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "               • 6-10 Kg",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                              onPressed: () {
                                // TODO : SIMPAN DATA ALERGI OBAT
                                context
                                    .read<PengkajianNutrisiBloc>()
                                    .add(OnChangedN1(value: "6-10 Kg"));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (state
                                              .pengkajianNutrisiResponseModel
                                              .n1 ==
                                          "6-10 Kg")
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              color: ThemeColor.whiteColor,
                              icon: Text(
                                "YA",
                                style: whiteTextStyle.copyWith(fontSize: 6.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                          ),
                          Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 7.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "               • 11-15 Kg",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                              onPressed: () {
                                // TODO : SIMPAN DATA ALERGI OBAT
                                context
                                    .read<PengkajianNutrisiBloc>()
                                    .add(OnChangedN1(value: "11-15 Kg"));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (state
                                              .pengkajianNutrisiResponseModel
                                              .n1 ==
                                          "11-15 Kg")
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              color: ThemeColor.whiteColor,
                              icon: Text(
                                "YA",
                                style: whiteTextStyle.copyWith(fontSize: 6.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                          ),
                          Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 7.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "               • > 15 Kg",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                              onPressed: () {
                                // TODO : SIMPAN DATA ALERGI OBAT
                                context
                                    .read<PengkajianNutrisiBloc>()
                                    .add(OnChangedN1(value: "> 15 Kg"));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (state
                                              .pengkajianNutrisiResponseModel
                                              .n1 ==
                                          "> 15 Kg")
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              color: ThemeColor.whiteColor,
                              icon: Text(
                                "YA",
                                style: whiteTextStyle.copyWith(fontSize: 6.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                          ),
                          Center(
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 7.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: Table(
                      border: TableBorder.all(color: ThemeColor.bgColor),
                      columnWidths: const {
                        0: FlexColumnWidth(0.1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(0.6),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "2. ",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Apakah asupan makan berkurang \nkarena tidak nafsu makan ?",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 5.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<PengkajianNutrisiBloc>()
                                    .add(OnChangedN2(value: "Ya"));

                                log(state.pengkajianNutrisiResponseModel.n2);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (state
                                              .pengkajianNutrisiResponseModel
                                              .n2 ==
                                          "Ya")
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              color: ThemeColor.whiteColor,
                              icon: Text(
                                "YA",
                                style: whiteTextStyle.copyWith(fontSize: 6.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<PengkajianNutrisiBloc>()
                                    .add(OnChangedN2(value: "Tidak"));

                                log(state.pengkajianNutrisiResponseModel.n2);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: (state
                                              .pengkajianNutrisiResponseModel
                                              .n2 ==
                                          "Tidak")
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp))),
                              color: ThemeColor.whiteColor,
                              icon: Text(
                                "TIDAK",
                                style: whiteTextStyle.copyWith(fontSize: 6.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.pengkajianNutrisiResponseModel.nilaiN2
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),

                  //====================//
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: TableDesk(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      child: TableDeskRow(
                        border: const BorderSide(width: 1, color: Colors.black),
                        gaps: [
                          TableGap.weight(),
                          TableGap.width(420),
                          TableGap.width(20),
                        ],
                        children: [
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "TOTAL",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  (state.pengkajianNutrisiResponseModel
                                              .nilaiN1 +
                                          state.pengkajianNutrisiResponseModel
                                              .nilaiN2)
                                      .toString(),
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.sp,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
