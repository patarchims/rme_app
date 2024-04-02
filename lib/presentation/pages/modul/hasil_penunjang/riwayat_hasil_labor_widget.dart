import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/hasil_penunjang/hasil_penunjang_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/response/old_database/dpenmend_lab_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class RiwayatHasilLaborOldDBWidget extends StatefulWidget {
  const RiwayatHasilLaborOldDBWidget({super.key});

  @override
  State<RiwayatHasilLaborOldDBWidget> createState() =>
      _RiwayatHasilLaborOldDBWidgetState();
}

class _RiwayatHasilLaborOldDBWidgetState
    extends State<RiwayatHasilLaborOldDBWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasienBloc, PasienState>(
      builder: (context, state) {
        return BlocBuilder<HasilPenunjangBloc, HasilPenunjangState>(
          builder: (context, state) {
            //======================//
            if (state.isLoadingLabor) {
              return SizedBox(
                width: Get.width,
                height: Get.height,
                child: ShimerLoading.loadingExpandCard(
                    baseColor: Colors.white.withOpacity(0.5),
                    highLightColor: Colors.lightBlue.withOpacity(0.1)),
              );
            }

            return state.getOrSuccessResultLaborOldDB.fold(
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
                            subTitle: "Data Kosong",
                            textStyle: blackTextStyle,
                          );
                        }, loaded: (e) {
                          // ================ //
                          List<DPenlabModel> data =
                              (e.value["response"] as Iterable)
                                  .map((e) => DPenlabModel.fromJson(e))
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
                                            width: Get.width,
                                            decoration: const BoxDecoration(),
                                            margin:
                                                EdgeInsets.only(right: 10.sp),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: Get.width,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: ThemeColor
                                                              .primaryColor),
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Tanggal : ${tglIndo(e.tanggal)} Jam : ${e.tanggal.substring(11, 19)}",
                                                    textAlign: TextAlign.end,
                                                    style: whiteTextStyle,
                                                  ),
                                                ),
                                                Container(
                                                    width: Get.width,
                                                    decoration: BoxDecoration(
                                                        color: Colors.green
                                                            .withOpacity(0.5)),
                                                    padding:
                                                        EdgeInsets.all(2.sp),
                                                    child: Text(
                                                      e.namaKelompok,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    )),
                                                SizedBox(
                                                  child: Table(
                                                    border: TableBorder.all(
                                                        color: Colors.black),
                                                    children: [
                                                      TableRow(children: [
                                                        headerTitle(
                                                            title: "Deskripsi"),
                                                        headerTitle(
                                                            title: "Satuan"),
                                                        headerTitle(
                                                            title: "Normal"),
                                                        headerTitle(
                                                            title: "Hasil"),
                                                      ]),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: Table(
                                                    border: TableBorder.all(),
                                                    children: e.penlab.map((e) {
                                                      return TableRow(
                                                          children: [
                                                            textBox(
                                                                title:
                                                                    "${e.pemeriksaanDeskripsi} ${e.hasil}"),
                                                            textBox(
                                                                title:
                                                                    e.satuan),
                                                            textBox(
                                                                title:
                                                                    e.normal),
                                                            textBox(
                                                                title: e.hasil),
                                                          ]);
                                                    }).toList(),
                                                  ),
                                                ),
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
      },
    );
  }

  Container headerTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp),
      decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.5)),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 6.sp),
        ),
      ),
    );
  }

  Padding textBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        style: blackTextStyle.copyWith(fontSize: 6.sp),
      ),
    );
  }
}
