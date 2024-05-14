import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/response/daskep_model.dart';
import 'package:hms_app/domain/models/response/sdki_response_model.dart';
import 'package:hms_app/domain/models/response/siki_model.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/get_sammery_diagnosa_widget.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/intervensi_keperawatan_widget.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/keluaran_keperawatan_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/masalah_keperawatan_page_widget.dart';
import 'package:hms_app/presentation/pages/igd/keperawatan/selesai_diagnosa_widget.dart';
import 'package:hms_app/presentation/pages/igd/medis/asuhan_widget_content.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../component/component.dart';

class AsuhanKeperawatanWidget extends StatelessWidget {
  const AsuhanKeperawatanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AsesmenKeperawatanBidanBloc,
        AsesmenKeperawatanBidanState>(
      listener: (context, state) {
        // TAMPILKAN LOADING
        if (state.isLoadingSaveAsuhanKeperawatan) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveAsuhanKeperawatan) {
          EasyLoading.dismiss();
        }

        state.saveResultAsuhanKeperawatan.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    connectionTimeOut: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Koneksi Time Out");
                      return shouldPop ?? false;
                    },
                    disconectToServer: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Disconnect to server");
                      return shouldPop ?? false;
                    },
                    noConnection: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "No connection");
                      return shouldPop ?? false;
                    },
                    badResponse: (e) async {
                      log(e.toString());
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Response gagal");
                      return shouldPop ?? false;
                    },
                    unProccessable: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Tidak dapat diproses");
                      return shouldPop ?? false;
                    },
                    failure: (e) async {
                      // TAMPILKAN PESAN KESALAHAN
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString());
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    emty: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Data gagal diproses");
                      return shouldPop ?? false;
                    },
                    loaded: (e) async {
                      // TAMPILKAN PESAN KESALAHAN
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.value["metadata"]["message"].toString());
                      return shouldPop ?? false;
                    })));
      },
      child: BlocBuilder<AsesmenKeperawatanBidanBloc,
          AsesmenKeperawatanBidanState>(
        builder: (context, state) {
          PasienState pasienState = context.watch<PasienBloc>().state;
          final singlePasien = pasienState.listPasienModel
              .where((element) => element.mrn == pasienState.normSelected);

          if (state.isLoadingAsuhanKeperawatan) {
            return HeaderContentWidget(
              onPressed: () {
                if (state.selectionSIKI == null) {
                  Get.showSnackbar(GetSnackBar(
                      backgroundColor: ThemeColor.dangerColor.withOpacity(0.8),
                      title: "Kesalahan",
                      message: 'Silahkan pilih diagnosa terlebih dahulu',
                      icon: const Icon(FontAwesomeIcons.xmark),
                      duration: const Duration(seconds: 2)));
                }
                if (state.selectionSIKI != null) {
                  // LAKUKAN // SIMPAN DATA
                  context.read<AsesmenKeperawatanBidanBloc>().add(
                      AsesmenKeperawatanBidanEvent.saveAsuhanKeperawatan(
                          noReg: singlePasien.first.noreg));
                }
              },
              widget: Shimmer.fromColors(
                baseColor: const Color(0xFFE1E1E1),
                highlightColor: const Color(0xFFF8F8F8),
                child: Container(
                    height: 250.sp,
                    width: Get.width,
                    color: ThemeColor.bgColor,
                    child: const Placeholder()),
              ),
            );
          }

          return HeaderContentWidget(
            onPressed: () {
              if (state.selectionSIKI == null) {
                Get.showSnackbar(GetSnackBar(
                    backgroundColor: ThemeColor.dangerColor.withOpacity(0.8),
                    title: "Kesalahan",
                    message: 'Silahkan pilih diagnosa terlebih dahulu',
                    icon: const Icon(FontAwesomeIcons.xmark),
                    duration: const Duration(seconds: 2)));
              }
              if (state.selectionSIKI != null) {
                context.read<AsesmenKeperawatanBidanBloc>().add(
                    AsesmenKeperawatanBidanEvent.saveAsuhanKeperawatan(
                        noReg: singlePasien.first.noreg));
              }
            },
            widget: ListView(
              children: [
                // LIST VIEW
                state.getFailResultAsuhanKeperawatan.fold(
                    () => Container(),
                    (a) => a.fold(
                        (l) => Column(
                              children: [
                                if (state.pilihDiagnosaKeperawatan ==
                                    PilihDiagnosaKeperawatan.diagnosa) ...[
                                  SizedBox(
                                      height: 250.sp,
                                      width: Get.width,
                                      child: const MasalahKeperawatanWidget())
                                ],
                                if (state.pilihDiagnosaKeperawatan ==
                                    PilihDiagnosaKeperawatan.keluaran) ...[
                                  SizedBox(
                                      height: 250.sp,
                                      width: Get.width,
                                      child: const IntervensiKeperawatanPage())
                                ],
                                if (state.pilihDiagnosaKeperawatan ==
                                    PilihDiagnosaKeperawatan.intervensi) ...[
                                  SizedBox(
                                      height: 250.sp,
                                      width: Get.width,
                                      // ==>
                                      child: const AsuhanWidgetContentValue())
                                ],
                                if (state.pilihDiagnosaKeperawatan ==
                                    PilihDiagnosaKeperawatan.selesai) ...[
                                  SizedBox(
                                      height: 250.sp,
                                      width: Get.width,
                                      child: const SelesaiDiagnosaWidget())
                                ],
                              ],
                            ),
                        (r) => r.maybeMap(orElse: () {
                              return Container();
                            }, loaded: (e) {
                              // == // >
                              List<DaskepModel> data =
                                  (e.value["response"]["daskep"] as Iterable)
                                      .map((e) => DaskepModel.fromMap(e))
                                      .toList();

                              // GET SIKI
                              SikiModel siki = SikiModel.fromMap(
                                  e.value["response"]["siki"]);

                              // GET SDKI
                              SDKIModelResponse sdki =
                                  SDKIModelResponse.fromMap(
                                      e.value["response"]["skdi"]);

                              return Column(
                                children: [
                                  if (data.isNotEmpty) ...[
                                    SizedBox(
                                        height: 250.sp,
                                        width: Get.width,
                                        child: GetSammeryDiagnosaWidget(
                                            sdkiModelResponse: sdki,
                                            daskep: data,
                                            sikiModel: siki))
                                  ],
                                  if (data.isEmpty) ...[
                                    if (state.pilihDiagnosaKeperawatan ==
                                        PilihDiagnosaKeperawatan.diagnosa) ...[
                                      SizedBox(
                                          height: 250.sp,
                                          width: Get.width,
                                          child:
                                              const MasalahKeperawatanWidget())
                                    ],
                                    if (state.pilihDiagnosaKeperawatan ==
                                        PilihDiagnosaKeperawatan.keluaran) ...[
                                      SizedBox(
                                          height: 250.sp,
                                          width: Get.width,
                                          child:
                                              const IntervensiKeperawatanPage())
                                    ],
                                    if (state.pilihDiagnosaKeperawatan ==
                                        PilihDiagnosaKeperawatan
                                            .intervensi) ...[
                                      SizedBox(
                                          height: 250.sp,
                                          width: Get.width,
                                          child:
                                              const IntervensiKeperawatanWidget())
                                    ],
                                    //====//
                                    if (state.pilihDiagnosaKeperawatan ==
                                        PilihDiagnosaKeperawatan.selesai) ...[
                                      SizedBox(
                                          height: 250.sp,
                                          width: Get.width,
                                          child: const SelesaiDiagnosaWidget())
                                    ],
                                  ]
                                ],
                              );
                            })))
              ],
            ),
          );
        },
      ),
    );
  }
}

Container titleContainer({required String title}) {
  return Container(
    width: Get.width,
    height: 20.sp,
    decoration: BoxDecoration(
      color: ThemeColor.blueColor.withOpacity(0.5),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2.sp), topRight: Radius.circular(2.sp)),
    ),
    child: Center(
      child: Text(
        title,
        style: blackTextStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
