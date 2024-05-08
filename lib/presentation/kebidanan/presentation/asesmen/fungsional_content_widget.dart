// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class AsesmentFungsionalKebidananWidget extends StatefulWidget {
  const AsesmentFungsionalKebidananWidget({super.key});

  @override
  State<AsesmentFungsionalKebidananWidget> createState() =>
      _AsesmentFungsionalKebidananWidgetState();
}

class _AsesmentFungsionalKebidananWidgetState
    extends State<AsesmentFungsionalKebidananWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<KebidananBloc, KebidananState>(
      listener: (context, state) {
        if (state.kebidananStatus ==
            KebidananStatus.isLoadingSavePengkajianFungsional) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (state.kebidananStatus !=
            KebidananStatus.isLoadingSavePengkajianFungsional) {
          EasyLoading.dismiss();
        }

        state.saveResultPengkajianFungsionalResult.fold(
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
        if (state.kebidananStatus ==
            KebidananStatus.isLoadingPengkajianFungsional) {
          return HeaderContentWidget(
            isENableAdd: true,
            title: "Simapn",
            widget: Loading.expandedLoading(),
          );
        }

        return HeaderContentWidget(
          isENableAdd: true,
          onPressed: () async {
            // ON SAVE PENGKAJIAN FUNGSIONAL KEBIDANAN
            dynamic data = await deviceInfo.initPlatformState();
            // ignore: use_build_context_synchronously
            context.read<KebidananBloc>().add(OnSavePengkajianFungsionalEvent(
                noReg: singlePasien.first.noreg,
                devicesID: "ID-${data['id']}-${data['device']}",
                f1: state.pengkajianFungsional.f1,
                f2: state.pengkajianFungsional.f2,
                f3: state.pengkajianFungsional.f3,
                f4: state.pengkajianFungsional.f4,
                f5: state.pengkajianFungsional.f5,
                f6: state.pengkajianFungsional.f6,
                f7: state.pengkajianFungsional.f7,
                f8: state.pengkajianFungsional.f8,
                f9: state.pengkajianFungsional.f9,
                f10: state.pengkajianFungsional.f1,
                nilai: state.pengkajianFungsional.nilai));
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
                          TableGap.width(70),
                          TableGap.weight(),
                          TableGap.width(220),
                          TableGap.width(220),
                          TableGap.width(220),
                        ],
                        children: [
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: EdgeInsets.all(5.sp),
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
                                  "KRITERIA BARTHERL INDEX",
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
                                  "Dengan Bantuan",
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
                                  "Mandiri",
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
                              "1",
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(fontSize: 5.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Makan",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(fontSize: 6.sp),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                                onPressed: () {
                                  context.read<KebidananBloc>().add(
                                      OnChangedFungsionalF1(
                                          value: denganBantuan));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        (state.pengkajianFungsional.f1 ==
                                                denganBantuan)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp))),
                                color: ThemeColor.whiteColor,
                                icon: Text(
                                  "Dengan Bantuan",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.sp),
                            height: 15.sp,
                            width: 25.sp,
                            child: IconButton(
                                onPressed: () {
                                  context.read<KebidananBloc>().add(
                                      OnChangedFungsionalF1(value: mandiri));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        (state.pengkajianFungsional.f1 ==
                                                mandiri)
                                            ? ThemeColor.greenColor
                                            : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp))),
                                color: ThemeColor.whiteColor,
                                icon: Text(
                                  "Mandiri",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                )),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.pengkajianFungsional.nilaiF1.toString(),
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontSize: 7.sp,
                                    fontWeight: FontWeight.bold),
                              ),
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
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF2,
                    nomor: "2",
                    title: "Aktifitas di Toilet",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF2(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f2 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF2(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f2 == denganBantuan)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF3,
                    nomor: "3",
                    title:
                        "Berpindah dari kursi roda ke tempat tidur / sebaliknya, termasuk duduk ditempat tidur",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF3(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f3 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF3(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f3 == denganBantuan)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF4,
                    nomor: "4",
                    title:
                        "Kebersihan diri, mencuci muka, menyisir rambut, mengosok gigi",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF4(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f4 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF4(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f4 == denganBantuan)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF5,
                    nomor: "5",
                    title: "Mandi",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF5(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f5 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF5(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f5 == denganBantuan)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF6,
                    nomor: "6",
                    title: "Berjalan di permukaan datar",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF6(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f6 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF6(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f6 == denganBantuan)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF7,
                    nomor: "7",
                    title: "Naik turun tangga",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF7(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f7 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF7(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f7 == denganBantuan)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF8,
                    nomor: "8",
                    title: "Berpakaian",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF8(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f8 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF8(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f8 == denganBantuan)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF9,
                    nomor: "9",
                    title: "Mengontrol defekasi",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF9(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f9 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF9(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f9 == denganBantuan)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  fungsionalMethod(
                    nilai: state.pengkajianFungsional.nilaiF10,
                    nomor: "10",
                    title: "Mengontrol Berkemih",
                    icon2: IconButton(
                        onPressed: () {
                          context
                              .read<KebidananBloc>()
                              .add(OnChangedFungsionalF10(value: mandiri));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.pengkajianFungsional.f10 == mandiri)
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Mandiri",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                    icon1: IconButton(
                        onPressed: () {
                          context.read<KebidananBloc>().add(
                              OnChangedFungsionalF10(value: denganBantuan));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (state.pengkajianFungsional.f10 ==
                                    denganBantuan)
                                ? ThemeColor.greenColor
                                : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp))),
                        color: ThemeColor.whiteColor,
                        icon: Text(
                          "Dengan Bantuan",
                          style: whiteTextStyle.copyWith(fontSize: 4.sp),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
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
                          TableGap.width(220),
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
                                  (state.pengkajianFungsional.nilai <= 20)
                                      ? "Ketergantungan Total"
                                      : (state.pengkajianFungsional.nilai <= 61)
                                          ? "Ketergantungan Berat"
                                          : (state.pengkajianFungsional.nilai <=
                                                  90)
                                              ? "Ketergantungan Sedang"
                                              : (state.pengkajianFungsional
                                                          .nilai <=
                                                      99)
                                                  ? "Ketergantungan Ringan"
                                                  : "Mandiri",
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
                                  state.pengkajianFungsional.nilai.toString(),
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
                    height: 35.sp,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container fungsionalMethod({
    required String nomor,
    required int nilai,
    required String title,
    required Widget? icon1,
    required Widget? icon2,
  }) {
    return Container(
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
                nomor,
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 6.sp),
              ),
            ),

            // ==== Dengan Bantuan
            Container(
              margin: EdgeInsets.all(5.sp),
              height: 15.sp,
              width: 25.sp,
              child: icon1,
            ),
            Container(
                margin: EdgeInsets.all(5.sp),
                height: 15.sp,
                width: 25.sp,
                child: icon2),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  nilai.toString(),
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                      fontSize: 7.sp, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class BarthelIndex {
  final String title;
  final String hasil;
  final int skor;
  BarthelIndex({
    required this.title,
    required this.hasil,
    required this.skor,
  });

  BarthelIndex copyWith({
    String? title,
    String? hasil,
    int? skor,
  }) {
    return BarthelIndex(
      title: title ?? this.title,
      hasil: hasil ?? this.hasil,
      skor: skor ?? this.skor,
    );
  }
}

List<BarthelIndex> barthelIndex = [
  BarthelIndex(title: "Makan", hasil: "", skor: 0),
  BarthelIndex(title: "Aktifitas di Toilet", hasil: "", skor: 0),
  BarthelIndex(
      title:
          "Berpindah dari kursi roda ke tempat tidur/sebaliknya, termasuk duduk ditempat tidur",
      hasil: "",
      skor: 0),
  BarthelIndex(
      title: "Kebersihan diri, mencuci muka, menyisir rambut, menggosok gigi",
      hasil: "",
      skor: 0),
  BarthelIndex(title: "Mandi", hasil: "", skor: 0),
  BarthelIndex(title: "Berjalan di permukaan datar", hasil: "", skor: 0),
  BarthelIndex(title: "Naik turun tangga", hasil: "", skor: 0),
  BarthelIndex(title: "Berpakaian", hasil: "", skor: 0),
  BarthelIndex(title: "Mengontrol defakasi", hasil: "", skor: 0),
  BarthelIndex(title: "Mengontrol Berkemih", hasil: "", skor: 0),
];

String denganBantuan = "Dengan Bantuan";
String mandiri = "Mandiri";
