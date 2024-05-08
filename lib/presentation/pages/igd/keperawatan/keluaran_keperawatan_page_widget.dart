import 'dart:developer';
import 'package:custom_radio_group_list/custom_radio_group_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/selection_siki/selection_siki_bloc.dart';
import 'package:hms_app/domain/models/response/intervensi_model.dart';
import 'package:hms_app/domain/models/response/intervensi_selection_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:sizer/sizer.dart';

class IntervensiKeperawatanPage extends StatefulWidget {
  const IntervensiKeperawatanPage({super.key});

  @override
  State<IntervensiKeperawatanPage> createState() =>
      _IntervensiKeperawatanPageState();
}

class _IntervensiKeperawatanPageState extends State<IntervensiKeperawatanPage> {
  List<String> selected = [];
  bool isMessage = true;

  List<IntervensiSelectionModel> intervensiSelectionModel = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ThemeColor.primaryColor,
          title: BlocBuilder<AsesmenKeperawatanBidanBloc,
              AsesmenKeperawatanBidanState>(
            builder: (context, state) {
              return Text(
                state.selectedKeluaran,
                style: whiteTextStyle,
              );
            },
          ),
        ),
        body: BlocConsumer<AsesmenKeperawatanBidanBloc,
            AsesmenKeperawatanBidanState>(
          listener: (context, state) {
            state.intervensiSelectionModel.map((e) {
              // log("SELECTION $e");
            });

            state.getFailOrScuccessCariIntervensi.fold(
                () => null,
                (a) => a.fold((l) => null,
                    (r) => r.maybeMap(orElse: () {}, loaded: (e) {})));
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  margin: EdgeInsets.only(top: 20.sp),
                  width: Get.width,
                  height: Get.height,
                  child: Card(
                    color: ThemeColor.bgColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.sp,
                          color: ThemeColor.blackColor,
                        ),
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: (state.isLoadingIntervensi)
                        ? Center(
                            child: SizedBox(
                            height: 100.sp,
                            width: 100.sp,
                            child: CircularProgressIndicator(
                                strokeWidth: 5.sp,
                                color: ThemeColor.primaryColor),
                          ))
                        : ListView(
                            children: state.intervesiModel.asMap().entries.map(
                              (e) {
                                Iterable<Slki> menurun = e.value.slki
                                    .where((element) => element.menurun != "");

                                Iterable<Slki> meningkat = e.value.slki.where(
                                    (element) => element.meningkat != "");

                                Iterable<Slki> memburuk = e.value.slki
                                    .where((element) => element.memburuk != "");

                                return Column(
                                  children: [
                                    Container(
                                      color: ThemeColor.primaryColor,
                                      width: Get.width,
                                      child: Padding(
                                          padding: EdgeInsets.all(8.sp),
                                          child: Text(
                                            "(KODE LUARAN :  ${state.intervesiModel[e.key].kode}) ${state.intervesiModel[e.key].judul} (EKSPEKTASI: ${state.intervesiModel[e.key].ekspetasi})",
                                            textAlign: TextAlign.center,
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    SizedBox(
                                        width: Get.width,
                                        child: Table(
                                          columnWidths: {
                                            1: FlexColumnWidth(2.sp),
                                            4: FlexColumnWidth(2.sp),
                                          },
                                          defaultColumnWidth:
                                              const FixedColumnWidth(120.0),
                                          border: TableBorder.all(
                                              color: ThemeColor.bgColor),
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: [
                                            if (menurun.isNotEmpty) ...[
                                              titleTable2(title: "Pilihan "),
                                              ...menurun.map(
                                                (e) => TableRow(
                                                    decoration: BoxDecoration(
                                                        color: ThemeColor
                                                            .bgColor
                                                            .withOpacity(0.5)),
                                                    children: [
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            e.menurun,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style:
                                                                blackTextStyle,
                                                          )),
                                                      TableCell(
                                                          verticalAlignment:
                                                              TableCellVerticalAlignment
                                                                  .middle,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: SizedBox(
                                                              height: 30,
                                                              child: RadioGroup(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                activeColor:
                                                                    ThemeColor
                                                                        .primaryColor,
                                                                items:
                                                                    e.kriteria,
                                                                onChanged:
                                                                    (value) {
                                                                  context
                                                                      .read<
                                                                          AsesmenKeperawatanBidanBloc>()
                                                                      .add(AsesmenKeperawatanBidanEvent.copyWriteIntervensi(
                                                                          slki:
                                                                              e.copyWith(selectedNumber: int.parse(value))));
                                                                },
                                                                shrinkWrap:
                                                                    true,
                                                                fillColor:
                                                                    ThemeColor
                                                                        .primaryColor,
                                                                labelBuilder:
                                                                    (ctx,
                                                                        index) {
                                                                  switch (
                                                                      index) {
                                                                    case 0:
                                                                      return Text(
                                                                        "Menurun",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 1:
                                                                      return Text(
                                                                        "Cukup Menurun",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 2:
                                                                      return Text(
                                                                        "Sendang",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 3:
                                                                      return Text(
                                                                        "Cukup Meningkat",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 4:
                                                                      return Text(
                                                                        "Meningkat",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    default:
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          )),
                                                    ]),
                                              ),
                                            ],
                                            if (meningkat.isNotEmpty) ...[
                                              titleTable2(title: "Pilihan "),
                                              ...meningkat.map(
                                                (e) => TableRow(
                                                    decoration: BoxDecoration(
                                                        color: ThemeColor
                                                            .bgColor
                                                            .withOpacity(0.5)),
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          e.meningkat,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: blackTextStyle,
                                                        ),
                                                      ),

                                                      // =======

                                                      TableCell(
                                                          verticalAlignment:
                                                              TableCellVerticalAlignment
                                                                  .middle,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: SizedBox(
                                                              height: 30,
                                                              child: RadioGroup(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                activeColor:
                                                                    ThemeColor
                                                                        .primaryColor,
                                                                items:
                                                                    e.kriteria,
                                                                onChanged:
                                                                    (value) {
                                                                  context
                                                                      .read<
                                                                          AsesmenKeperawatanBidanBloc>()
                                                                      .add(AsesmenKeperawatanBidanEvent.copyWriteIntervensi(
                                                                          slki:
                                                                              e.copyWith(selectedNumber: int.parse(value))));
                                                                },
                                                                shrinkWrap:
                                                                    true,
                                                                fillColor:
                                                                    ThemeColor
                                                                        .primaryColor,
                                                                labelBuilder:
                                                                    (ctx,
                                                                        index) {
                                                                  switch (
                                                                      index) {
                                                                    case 0:
                                                                      return Text(
                                                                        "Meningkat",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 1:
                                                                      return Text(
                                                                        "Cukup Meningkat",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 2:
                                                                      return Text(
                                                                        "Sendang",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 3:
                                                                      return Text(
                                                                        "Cukup Menurun",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 4:
                                                                      return Text(
                                                                        "Menurun",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    default:
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          )),
                                                    ]),
                                              ),
                                            ],
                                            if (memburuk.isNotEmpty) ...[
                                              titleTable2(title: "Pilihan "),
                                              ...memburuk.map(
                                                (e) => TableRow(
                                                    decoration: BoxDecoration(
                                                        color: ThemeColor
                                                            .bgColor
                                                            .withOpacity(0.5)),
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          e.memburuk,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: blackTextStyle,
                                                        ),
                                                      ),

                                                      // =======

                                                      TableCell(
                                                          verticalAlignment:
                                                              TableCellVerticalAlignment
                                                                  .middle,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: SizedBox(
                                                              height: 30,
                                                              child: RadioGroup(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                activeColor:
                                                                    ThemeColor
                                                                        .primaryColor,
                                                                items:
                                                                    e.kriteria,
                                                                onChanged:
                                                                    (value) {
                                                                  // ===== >
                                                                  context
                                                                      .read<
                                                                          AsesmenKeperawatanBidanBloc>()
                                                                      .add(AsesmenKeperawatanBidanEvent.copyWriteIntervensi(
                                                                          slki:
                                                                              e.copyWith(selectedNumber: int.parse(value))));
                                                                },
                                                                shrinkWrap:
                                                                    true,
                                                                fillColor:
                                                                    ThemeColor
                                                                        .primaryColor,
                                                                labelBuilder:
                                                                    (ctx,
                                                                        index) {
                                                                  switch (
                                                                      index) {
                                                                    case 0:
                                                                      return Text(
                                                                        "Memburuk",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 1:
                                                                      return Text(
                                                                        "Cukup Memburuk",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 2:
                                                                      return Text(
                                                                        "Sendang",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 3:
                                                                      return Text(
                                                                        "Cukup Membaik",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    case 4:
                                                                      return Text(
                                                                        "Membaik",
                                                                        style:
                                                                            blackTextStyle,
                                                                      );
                                                                    default:
                                                                  }
                                                                  return null;
                                                                },
                                                              ),
                                                            ),
                                                          )),
                                                    ]),
                                              ),
                                            ],
                                          ],
                                        ))
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                  ),
                )),
                Positioned(
                    top: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.sp),
                            height: 20.sp,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.sp))),
                                onPressed: () {
                                  context
                                      .read<AsesmenKeperawatanBidanBloc>()
                                      .add(const AsesmenKeperawatanBidanEvent
                                          .pilihDiagnosa(
                                          pilihDiagnosaKeperawatan:
                                              PilihDiagnosaKeperawatan
                                                  .diagnosa));

                                  context
                                      .read<AsesmenKeperawatanBidanBloc>()
                                      .add(const AsesmenKeperawatanBidanEvent
                                          .clearIntervensi());
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.arrowLeft,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 2.sp,
                                    ),
                                    Text(
                                      "PILIH DIAGNOSA",
                                      style: whiteTextStyle,
                                    ),
                                  ],
                                ))),
                      ],
                    )),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.sp),
                            height: 20.sp,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.sp))),
                                onPressed: () {
                                  // GET INTERVENSI
                                  if (state.sdkiModel != null) {
                                    for (var innerList
                                        in state.intervesiModel) {
                                      for (var innerData in innerList.slki) {
                                        if (innerData.selectedNumber != 0) {
                                          setState(() {
                                            isMessage = false;
                                          });
                                        }
                                      }
                                    }

                                    for (var innerList
                                        in state.intervesiModel) {
                                      for (var innerData in innerList.slki) {
                                        if (innerData.selectedNumber != 0) {
                                          log("SELECTED DATA ${innerData.selectedNumber}");
                                        }
                                      }
                                    }

                                    if (isMessage == true) {
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          backgroundColor: ThemeColor
                                              .dangerColor
                                              .withOpacity(0.8),
                                          title: "Pesan",
                                          message:
                                              'Silahkan pilih keluaran terlebih dahulu',
                                          icon: const Icon(
                                              FontAwesomeIcons.circleCheck),
                                          duration: const Duration(seconds: 3),
                                        ),
                                      );
                                    }

                                    if (isMessage == false) {
                                      context
                                          .read<AsesmenKeperawatanBidanBloc>()
                                          .add(
                                              const AsesmenKeperawatanBidanEvent
                                                  .pilihDiagnosa(
                                                  pilihDiagnosaKeperawatan:
                                                      PilihDiagnosaKeperawatan
                                                          .intervensi));

                                      context
                                          .read<AsesmenKeperawatanBidanBloc>()
                                          .add(AsesmenKeperawatanBidanEvent
                                              .cariSIKI(
                                                  sikiSelected:
                                                      state.sdkiModel!.siki));

                                      context.read<SelectionSikiBloc>().add(
                                          OnGetDeskripsiSikiEvent(
                                              siki: state.sdkiModel!.siki));

                                      context
                                          .read<AsesmenKeperawatanBidanBloc>()
                                          .add(AsesmenKeperawatanBidanEvent
                                              .selectIntervensi(
                                                  listIntervensiSelectionModel:
                                                      intervensiSelectionModel));
                                    }
                                  }
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "PILIH INTERVENSI",
                                      style: whiteTextStyle,
                                    ),
                                    SizedBox(
                                      width: 2.sp,
                                    ),
                                    const Icon(
                                      FontAwesomeIcons.arrowRight,
                                      color: Colors.white,
                                    ),
                                  ],
                                ))),
                      ],
                    )),
              ],
            );
          },
        ));
  }

  TableRow titleTable() {
    return TableRow(
        decoration:
            BoxDecoration(color: ThemeColor.primaryColor.withOpacity(0.5)),
        children: [
          Container(
            width: 150.sp,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Hasil Kriteria",
              textAlign: TextAlign.left,
              style: blackTextStyle,
            ),
          ),
          titleCell(title: "Menurun 1"),
          titleCell(title: "Cukup Menurun 2"),
          titleCell(title: "Sedang 3"),
          titleCell(title: "Cukup Meningkat 4"),
          titleCell(title: "Meningkat 5"),
        ]);
  }

  TableRow titleTable2({required String title}) {
    return TableRow(
        decoration:
            BoxDecoration(color: ThemeColor.primaryColor.withOpacity(0.5)),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Hasil Kriteria",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 8.sp),
            ),
          ),
          titleCell(title: title),
        ]);
  }

  TableCell titleCell({required String title}) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 8.sp),
          ),
        ));
  }

  TableCell radioCell({required String title}) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Radio(
            value: title,
            activeColor: ThemeColor.primaryColor,
            groupValue: title,
            onChanged: (value) {
              log(value.toString());
            },
          ),
        ));
  }

  TableCell radioCellMenurun({required String title}) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Checkbox(
              value: true,
              onChanged: (value) {
                log(value.toString());
              }),
        ));
  }
}
