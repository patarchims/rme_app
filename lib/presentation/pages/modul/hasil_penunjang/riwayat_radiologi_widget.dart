import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/hasil_penunjang/hasil_penunjang_bloc.dart';
import 'package:hms_app/domain/models/response/old_database/dhasil_radiologi_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class RiwayatRadiologiPenmedikOldDBWidget extends StatefulWidget {
  const RiwayatRadiologiPenmedikOldDBWidget({super.key});

  @override
  State<RiwayatRadiologiPenmedikOldDBWidget> createState() =>
      _RiwayatRadiologiPenmedikOldDBWidgetState();
}

class _RiwayatRadiologiPenmedikOldDBWidgetState
    extends State<RiwayatRadiologiPenmedikOldDBWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HasilPenunjangBloc, HasilPenunjangState>(
      builder: (context, state) {
        if (state.isLoadingRadiologi) {
          return SizedBox(
            width: Get.width,
            height: Get.height,
            child: ShimerLoading.loadingExpandCard(
                baseColor: Colors.white.withOpacity(0.5),
                highLightColor: Colors.lightBlue.withOpacity(0.1)),
          );
        }

        return state.getOrSuccessResultRadiologiOldDB.fold(
            () => Container(),
            (a) => a.fold(
                (l) => l.maybeMap(
                      orElse: () {
                        return Container();
                      },
                    ),
                (r) => r.maybeMap(orElse: () {
                      return const Text("Sdf");
                    }, emty: (e) {
                      return EmtyScren(
                          subTitle: "Data Kosong", textStyle: blackTextStyle);
                    }, loaded: (e) {
                      List<DRadilogiModel> data =
                          (e.value["response"] as Iterable)
                              .map((e) => DRadilogiModel.fromJson(e))
                              .toList();

                      return RawScrollbar(
                        thumbColor: ThemeColor.darkColor,
                        thumbVisibility: true,
                        interactive: true,
                        thickness: 10.sp,
                        controller: _scrollController,
                        trackVisibility: false,
                        radius: Radius.circular(5.sp),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Padding(
                            padding: EdgeInsets.all(2.sp),
                            child: Column(
                              children: data
                                  .map((e) => Container(
                                        margin: EdgeInsets.only(right: 10.sp),
                                        width: Get.width,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width,
                                              decoration: const BoxDecoration(
                                                  color:
                                                      ThemeColor.primaryColor),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${e.namaKelompok} - Tangggal : ${tglIndo(e.tanggal)}",
                                                textAlign: TextAlign.start,
                                                style: whiteTextStyle,
                                              ),
                                            ),
                                            SizedBox(
                                              child: Table(
                                                border: TableBorder.all(
                                                    color: Colors.black),
                                                children: [
                                                  TableRow(children: [
                                                    headerTitle(
                                                        title: "Pemeriksaan : ")
                                                  ]),
                                                  ...e.radiologi
                                                      .map((e) => TableRow(
                                                              children: [
                                                                textBox(
                                                                    title: e
                                                                        .pemeriksaanDeskripsi)
                                                              ]))
                                                      .toList(),
                                                  TableRow(children: [
                                                    headerTitle(
                                                        title: "Uraian : ")
                                                  ]),
                                                  ...e.radiologi
                                                      .map((e) =>
                                                          TableRow(children: [
                                                            textBox(
                                                                title: e.uraian)
                                                          ]))
                                                      .toList(),
                                                  TableRow(children: [
                                                    headerTitle(
                                                        title: "Hasil : ")
                                                  ]),
                                                  ...e.radiologi
                                                      .map((e) =>
                                                          TableRow(children: [
                                                            textBox(
                                                                title: e.hasil)
                                                          ]))
                                                      .toList()
                                                ],
                                              ),
                                            ),

                                            // SizedBox(
                                            //   child: Table(
                                            //     border: TableBorder.all(
                                            //         color: Colors.black),
                                            //     children: [
                                            //       TableRow(children: [
                                            //         headerTitle(title: "Uraian : ")
                                            //       ]),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Container(
                                            //   width: Get.width,
                                            //   decoration: BoxDecoration(
                                            //       color: ThemeColor.primaryColor
                                            //           .withOpacity(0.3)),
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: Text(
                                            //     e.uraian,
                                            //     textAlign: TextAlign.start,
                                            //     style: blackTextStyle,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      );
                    })));
      },
    );
  }

  Container headerTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
      decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.5)),
      child: Text(
        title,
        style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding textBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        style: blackTextStyle,
      ),
    );
  }
}
