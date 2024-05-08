import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/informasi_medis/informasi_medis_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/informasi_medis_search_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/terapi_search_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/route/get_route.dart';
import 'package:sizer/sizer.dart';

class InformasiMedisWidget extends StatelessWidget {
  const InformasiMedisWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    InformasiMedisState stateInformasi =
        context.watch<InformasiMedisBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<InformasiMedisBloc, InformasiMedisState>(
      listener: (context, state) async {
        log(state.toString());
        if (state.isLoading) {
          EasyLoading.show();
        }

        if (!state.isLoading) {
          EasyLoading.dismiss();
        }

        // TANGKAP STATE SAVE
        state.failOrSuccessResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      await Alert.loaded(context,
                          subTitle: e.meta.message, title: "Pesan");
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) async {
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);
                      await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                    })));
      },
      builder: (context, state) {
        return HeaderContentWidget(
            onPressed: () {
              if (singlePasien.isNotEmpty) {
                context.read<InformasiMedisBloc>().add(
                    InformasiMedisEvent.saveMedis(
                        singlePasien.first.noreg,
                        singlePasien.first.kdBagian,
                        state.selectMasalahMedis,
                        state.selectTerapi,
                        state.selectPemeriksaanFisik,
                        state.selectAnjuran));
              }
            },
            widget: Container(
              decoration: const BoxDecoration(),
              padding: EdgeInsets.all(12.sp),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 5,
                          child: Text(
                            "Masalah Medis",
                            style: blackTextStyle,
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            SizedBox(
                              width: 250.sp,
                              child: FormWidget.textForm(
                                  enable: true,
                                  onChanged: (value) {
                                    context.read<InformasiMedisBloc>().add(
                                        InformasiMedisEvent
                                            .selectedMasalahMedis(
                                                value: value));
                                  },
                                  controller: TextEditingController(
                                      text: stateInformasi.selectMasalahMedis)),
                            ),
                            SizedBox(width: 5.sp),
                            FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.sp)),
                                heroTag: "btnMedis",
                                onPressed: () {
                                  // TAMPILKAN MASALAH  MEDIS
                                  context.read<InformasiMedisBloc>().add(
                                      const InformasiMedisEvent
                                          .getMasalahMedis());

                                  // GET KELUHAN UTAMA
                                  CustomDialogWidget.getDialog(
                                      widget: Container(
                                        padding: EdgeInsets.all(12.sp),
                                        height: 200.sp,
                                        width: 400.sp,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.sp),
                                            color: Colors.white),
                                        child:
                                            const InformasiMedisSearchWidget(),
                                      ),
                                      color: Colors.transparent);
                                },
                                child: const Icon(Icons.search))
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 2.sp),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 5,
                          child: Text(
                            "Terapi",
                            style: blackTextStyle,
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            SizedBox(
                              width: 250.sp,
                              child: FormWidget.textArea(
                                  onChanged: (value) {
                                    context.read<InformasiMedisBloc>().add(
                                        InformasiMedisEvent.selectedTerapi(
                                            value: value));
                                  },
                                  maxLines: 2,
                                  controller: TextEditingController(
                                      text: stateInformasi.selectTerapi)),
                            ),
                            SizedBox(width: 5.sp),
                            FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.sp)),
                                heroTag: "btnRiwayatSeakrang",
                                onPressed: () {
                                  // TAMPILKAN MODAL
                                  // TAMPILKAN MASALAH  MEDIS
                                  context.read<InformasiMedisBloc>().add(
                                      const InformasiMedisEvent.getTerapi());

                                  // GET KELUHAN
                                  // UTAMA
                                  CustomDialogWidget.getDialog(
                                      widget: Container(
                                        padding: EdgeInsets.all(12.sp),
                                        height: 200.sp,
                                        width: 400.sp,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.sp),
                                            color: Colors.white),
                                        child: const TerapiSearchWidget(),
                                      ),
                                      color: Colors.transparent);
                                },
                                child: const Icon(Icons.search))
                          ],
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 5,
                          child: Text(
                            "Pemeriksaan Fisik",
                            style: blackTextStyle,
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            SizedBox(
                              width: 250.sp,
                              child: FormWidget.textArea(
                                value: state.selectPemeriksaanFisik,
                                onChanged: (value) {
                                  context.read<InformasiMedisBloc>().add(
                                      InformasiMedisEvent
                                          .selectedPemeriksaanFisik(
                                              value: value));
                                },
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(width: 5.sp),
                            //
                          ],
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 5,
                          child: Text(
                            "Anjuran",
                            style: blackTextStyle,
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            SizedBox(
                              width: 250.sp,
                              child: FormWidget.textArea(
                                value: state.selectAnjuran,
                                onChanged: (value) {
                                  context.read<InformasiMedisBloc>().add(
                                      InformasiMedisEvent.selectedAnjuran(
                                          value: value));
                                },
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(width: 5.sp),
                            //
                          ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 12.sp,
                    ),
                    SizedBox(
                      height: 25.sp,
                      width: 100.sp,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.sp))),
                          onPressed: () {
                            context.read<PasienBloc>().add(
                                PasienEvent.riwayatPasien(
                                    noRM: singlePasien.first.mrn));
                            Get.toNamed(GetRoutes.riwayatPasienPage);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              Text(
                                "LIHAT RIWAYAT",
                                style: whiteTextStyle,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
