import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:sizer/sizer.dart';

class SelesaiDiagnosaWidget extends StatelessWidget {
  const SelesaiDiagnosaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ========
        Positioned(
            top: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // =====>
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.sp),
                    height: 20.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.sp))),
                        onPressed: () {
                          // PILIH INTERVENSI
                          context.read<AsesmenKeperawatanBidanBloc>().add(
                              const AsesmenKeperawatanBidanEvent.pilihDiagnosa(
                                  pilihDiagnosaKeperawatan:
                                      PilihDiagnosaKeperawatan.diagnosa));

                          // CLEAR STATE
                          context.read<AsesmenKeperawatanBidanBloc>().add(
                              const AsesmenKeperawatanBidanEvent
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

        // POSITION
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
            child: BlocBuilder<AsesmenKeperawatanBidanBloc,
                AsesmenKeperawatanBidanState>(
              builder: (context, state) {
                // FILTER MENURUN

                // Iterable<IntervensiModel> menurun = state
                //     .intervesiModel
                //     .where((element) => element.slki. != "");

                // FILTER MEMBURUK
                // Iterable<IntervensiModel> memburuk = state
                //     .intervesiModel
                //     .where((element) => element.slki.memburuk != "");

                // // FILTER MENINGKAT
                // Iterable<IntervensiModel> meningkat = state
                //     .intervesiModel
                //     .where((element) => element.slki.meningkat != "");

                return ListView(
                  children: [
                    Container(
                      color: ThemeColor.primaryColor,
                      width: Get.width,
                      child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Text(
                            "SUMMARY DIAGNOSA KEPERAWATAN",
                            textAlign: TextAlign.center,
                            style: whiteTextStyle.copyWith(
                                fontSize: 8.sp, fontWeight: FontWeight.bold),
                          )),
                    ),
                    if (state.sdkiModel != null) ...[
                      Container(
                        color: Colors.purple.withOpacity(0.5),
                        width: Get.width,
                        child: Padding(
                            padding: EdgeInsets.all(4.sp),
                            child: Text(
                              "Diagnosa Keperawatan : ${state.sdkiModel!.judul} (${state.sdkiModel!.kode})",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],

                    if (state.intervesiModel.isNotEmpty) ...[
                      Container(
                        color: Colors.purple.withOpacity(0.5),
                        width: Get.width,
                        child: Padding(
                            padding: EdgeInsets.all(4.sp),
                            child: Text(
                              "Luaran Keperawatan : ${state.intervesiModel[0].slki[0].judul}",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],

                    // TOdo:
                    // TAMPILKAN KELUARAN KEPERAWATAN DISINI
                    SizedBox(
                      width: Get.width,
                      child: Column(
                        children: state.intervesiModel.map((e) {
                          final menurun = e.slki.where((element) =>
                              element.selectedNumber != 0 &&
                              element.menurun != "");
                          final meningkat = e.slki.where((element) =>
                              element.selectedNumber != 0 &&
                              element.meningkat != "");
                          final memburuk = e.slki.where((element) =>
                              element.selectedNumber != 0 &&
                              element.memburuk != "");

                          return Table(
                            defaultColumnWidth:
                                FixedColumnWidth(Get.width / 2.5),
                            border: TableBorder.all(color: ThemeColor.bgColor),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              if (menurun.isNotEmpty) ...[
                                titleTable2(title: "Hasil"),
                                ...menurun.map(
                                  (es) => TableRow(
                                      decoration: BoxDecoration(
                                          color: ThemeColor.bgColor
                                              .withOpacity(0.5)),
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            es.menurun,
                                            textAlign: TextAlign.left,
                                            style: blackTextStyle,
                                          ),
                                        ),

                                        // ============================

                                        TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                setMenurun(es.selectedNumber
                                                    .toString()),
                                                style: blackTextStyle,
                                              ),
                                            )),
                                      ]),
                                ),
                              ],
                              if (memburuk.isNotEmpty) ...[
                                titleTable2(title: "Hasil"),
                                ...memburuk.map(
                                  (es) => TableRow(
                                      decoration: BoxDecoration(
                                          color: ThemeColor.bgColor
                                              .withOpacity(0.5)),
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            es.memburuk,
                                            textAlign: TextAlign.left,
                                            style: blackTextStyle,
                                          ),
                                        ),

                                        // ============================

                                        TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                setMenurun(es.selectedNumber
                                                    .toString()),
                                                style: blackTextStyle,
                                              ),
                                            )),
                                      ]),
                                ),
                              ],
                              if (meningkat.isNotEmpty) ...[
                                titleTable2(title: "Hasil"),
                                ...meningkat.map(
                                  (es) => TableRow(
                                      decoration: BoxDecoration(
                                          color: ThemeColor.bgColor
                                              .withOpacity(0.5)),
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            es.meningkat,
                                            textAlign: TextAlign.left,
                                            style: blackTextStyle,
                                          ),
                                        ),

                                        // ============================

                                        TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                setMenurun(es.selectedNumber
                                                    .toString()),
                                                style: blackTextStyle,
                                              ),
                                            )),
                                      ]),
                                ),
                              ],
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    if (state.selectionSIKI != null) ...[
                      Container(
                        color: Colors.purple.withOpacity(0.5),
                        width: Get.width,
                        child: Padding(
                            padding: EdgeInsets.all(4.sp),
                            child: Text(
                              "Intervensi Keperawatan : ${state.selectionSIKI!.judul} (${state.selectionSIKI!.kode})",
                              textAlign: TextAlign.left,
                              style: blackTextStyle.copyWith(
                                  fontSize: 6.sp, fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                    if (state.selectionSIKI != null) ...[
                      titleCard(title: "OBSERVASI"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          state.selectionSIKI!.observasi,
                          style: blackTextStyle.copyWith(fontSize: 6.sp),
                          maxLines: 30,
                        ),
                      ),
                      titleCard(title: "TERAPEUTIK"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          state.selectionSIKI!.terapeutik,
                          style: blackTextStyle.copyWith(fontSize: 6.sp),
                          maxLines: 30,
                        ),
                      ),
                      titleCard(title: "EDUKASI"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          state.selectionSIKI!.edukasi,
                          style: blackTextStyle.copyWith(fontSize: 6.sp),
                          maxLines: 30,
                        ),
                      ),
                      titleCard(title: "KOLABORASI"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          state.selectionSIKI!.kolaborasi,
                          style: blackTextStyle.copyWith(fontSize: 6.sp),
                          maxLines: 30,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ))
      ],
    );
  }

  Container titleCard({required String title}) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: ThemeColor.primaryColor.withOpacity(0.2),
          border: const Border()),
      width: Get.width,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  TableRow titleTable2({required String title}) {
    return TableRow(
        decoration:
            BoxDecoration(color: ThemeColor.primaryColor.withOpacity(0.5)),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Kriteria",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

String setMenurun(String value) {
  switch (value) {
    case "1":
      return "Menurun";
    case "2":
      return "Cukup Menurun";
    case "3":
      return "Sedang";
    case "4":
      return "Cukup Meningkat";

    default:
      return "Meningkat";
  }
}

String setMeningkat(String value) {
  switch (value) {
    case "1":
      return "Meningkat";
    case "2":
      return "Cukup Meningkat";
    case "3":
      return "Sedang";
    case "4":
      return "Cukup Menurun";
    default:
      return "Menurun";
  }
}

String setMemburuk(String value) {
  switch (value) {
    case "1":
      return "Memburuk";
    case "2":
      return "Cukup Memburuk";
    case "3":
      return "Sendang";
    case "4":
      return "Cukup Membaik";
    default:
      return "Membaik";
  }
}
