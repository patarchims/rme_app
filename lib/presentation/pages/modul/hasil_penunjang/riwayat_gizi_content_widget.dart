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

class RiwayatHasilGiziWidgetContent extends StatelessWidget {
  const RiwayatHasilGiziWidgetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasienBloc, PasienState>(
      builder: (context, state) {
        return BlocBuilder<HasilPenunjangBloc, HasilPenunjangState>(
          builder: (context, state) {
            //======================//
            if (state.isLoadingGizi) {
              return SizedBox(
                width: Get.width,
                height: Get.height,
                child: ShimerLoading.loadingExpandCard(
                    baseColor: Colors.white.withOpacity(0.5),
                    highLightColor: Colors.lightBlue.withOpacity(0.1)),
              );
            }

            return state.getOrSuccessResultGiziOldDB.fold(
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
                          // log(e.value["response"].toString());

                          List<DPenlabModel> data =
                              (e.value["response"] as Iterable)
                                  .map((e) => DPenlabModel.fromJson(e))
                                  .toList();

                          // log(penMed.toString());

                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(2.sp),
                              child: (data.isNotEmpty)
                                  ? Column(
                                      children: data
                                          .map((e) => Container(
                                                width: Get.width,
                                                decoration:
                                                    const BoxDecoration(),
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "Tanggal : ${tglIndo(e.tanggal)} Jam : ${e.tanggal.substring(11, 19)}",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: whiteTextStyle,
                                                      ),
                                                    ),
                                                    Container(
                                                        width: Get.width,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .green
                                                                    .withOpacity(
                                                                        0.5)),
                                                        padding: EdgeInsets.all(
                                                            2.sp),
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
                                                            color:
                                                                Colors.black),
                                                        children: [
                                                          TableRow(children: [
                                                            headerTitle(
                                                                title:
                                                                    "Deskripsi"),
                                                            headerTitle(
                                                                title:
                                                                    "Satuan"),
                                                            headerTitle(
                                                                title:
                                                                    "Normal"),
                                                            headerTitle(
                                                                title: "Hasil"),
                                                          ]),
                                                        ],
                                                      ),
                                                    ),
                                                    if (e
                                                        .penlab.isNotEmpty) ...[
                                                      SizedBox(
                                                        child: Table(
                                                          border:
                                                              TableBorder.all(),
                                                          children:
                                                              e.penlab.map((e) {
                                                            return TableRow(
                                                                children: [
                                                                  textBox(
                                                                      title: e
                                                                          .hasil),
                                                                  textBox(
                                                                      title: e
                                                                          .satuan),
                                                                  textBox(
                                                                      title: e
                                                                          .normal),
                                                                  textBox(
                                                                      title: e
                                                                          .hasil),
                                                                ]);
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ]
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : Container(),
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
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
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
