import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/models/response/daskep_model.dart';
import 'package:hms_app/domain/models/response/sdki_response_model.dart';
import 'package:hms_app/domain/models/response/siki_model.dart';
import '../../../component/component.dart';

class GetSammeryDiagnosaWidget extends StatelessWidget {
  final List<DaskepModel> daskep;
  final SikiModel sikiModel;
  final SDKIModelResponse sdkiModelResponse;
  const GetSammeryDiagnosaWidget({
    Key? key,
    required this.daskep,
    required this.sikiModel,
    required this.sdkiModelResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ===============

    final menurun = daskep.where((element) => element.menurun != "");
    final meningkat = daskep.where((element) => element.meningkat != "");
    final memburuk = daskep.where((element) => element.memburuk != "");

    return Stack(
      children: [
        // ===============
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
                                borderRadius: BorderRadius.circular(4.sp))),
                        onPressed: () {
                          context.read<AsesmenKeperawatanBidanBloc>().add(
                              const AsesmenKeperawatanBidanEvent.pilihDiagnosa(
                                  pilihDiagnosaKeperawatan:
                                      PilihDiagnosaKeperawatan.diagnosa));

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

        // ===============
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
            child: ListView(
              //============
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
                Container(
                  color: Colors.purple.withOpacity(0.5),
                  width: Get.width,
                  child: Padding(
                      padding: EdgeInsets.all(4.sp),
                      child: Text(
                        "Diagnosa Keperawatan : ${sdkiModelResponse.judul}",
                        textAlign: TextAlign.left,
                        style: blackTextStyle.copyWith(
                            fontSize: 6.sp, fontWeight: FontWeight.bold),
                      )),
                ),

                Container(
                  color: Colors.purple.withOpacity(0.5),
                  width: Get.width,
                  child: Padding(
                      padding: EdgeInsets.all(4.sp),
                      child: Text(
                        "Luaran Keperawatan : ${daskep[0].judul}",
                        textAlign: TextAlign.left,
                        style: blackTextStyle.copyWith(
                            fontSize: 6.sp, fontWeight: FontWeight.bold),
                      )),
                ),

                SizedBox(
                  width: Get.width,
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(Get.width / 2.5),
                    border: TableBorder.all(color: ThemeColor.bgColor),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      titleTable2(title: "Hasil"),
                      ...menurun
                          .map((es) => TableRow(
                                  decoration: BoxDecoration(
                                      color:
                                          ThemeColor.bgColor.withOpacity(0.5)),
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
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            setMenurun(es.nilai.toString()),
                                            style: blackTextStyle,
                                          ),
                                        )),
                                  ]))
                          .toList(),
                      titleTable2(title: "Hasil"),
                      ...memburuk
                          .map((es) => TableRow(
                                  decoration: BoxDecoration(
                                      color:
                                          ThemeColor.bgColor.withOpacity(0.5)),
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
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            setMemburuk(es.nilai.toString()),
                                            style: blackTextStyle,
                                          ),
                                        )),
                                  ]))
                          .toList(),

                      // FILTER MENINGKAT
                      titleTable2(title: "Hasil"),
                      ...meningkat
                          .map((es) => TableRow(
                                  decoration: BoxDecoration(
                                      color:
                                          ThemeColor.bgColor.withOpacity(0.5)),
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
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            setMeningkat(es.nilai.toString()),
                                            style: blackTextStyle,
                                          ),
                                        )),
                                  ]))
                          .toList(),
                    ],
                  ),
                ),

                /// ===
                Container(
                  color: Colors.purple.withOpacity(0.5),
                  width: Get.width,
                  child: Padding(
                      padding: EdgeInsets.all(4.sp),
                      child: Text(
                        "Intervensi Keperawatan : ${sikiModel.kode}",
                        textAlign: TextAlign.left,
                        style: blackTextStyle.copyWith(
                            fontSize: 6.sp, fontWeight: FontWeight.bold),
                      )),
                ),

                titleCard(title: "OBSERVASI"),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      sikiModel.observasi,
                      style: blackTextStyle.copyWith(fontSize: 6.sp),
                      maxLines: 30,
                    )),

                titleCard(title: "TERAPEUTIK"),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    sikiModel.terapeutik,
                    style: blackTextStyle.copyWith(fontSize: 6.sp),
                    maxLines: 30,
                  ),
                ),

                titleCard(title: "EDUKASI"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    sikiModel.edukasi,
                    style: blackTextStyle.copyWith(fontSize: 6.sp),
                    maxLines: 30,
                  ),
                ),
                titleCard(title: "KOLABORASI"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    sikiModel.kolaborasi,
                    style: blackTextStyle.copyWith(fontSize: 6.sp),
                    maxLines: 30,
                  ),
                ),
              ],
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
