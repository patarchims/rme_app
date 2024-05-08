import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/soap/medis/anamnesa_igd_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import '../../../../domain/bloc/dashboard/pasien/pasien_bloc.dart';
import '../../../../domain/models/meta/meta_model.dart';

class AnamnesaIGDWidget extends StatelessWidget {
  const AnamnesaIGDWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        if (state.isLoadingSaveAnamnesa) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveAnamnesa) {
          EasyLoading.dismiss();
        }

        state.savefailOrSuccessAnamnesaResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      log(e.toString());

                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        return HeaderContentWidget(
          onPressed: () async {
            AnamnesaIgdModel anamnesaIgdModel = AnamnesaIgdModel(
              jenpel: state.jenisPelayananStr,
              keluhanUtama: state.keluhanUtamaStr,
              kesadaran: state.kesadaranStr,
              telaah: state.telaahStr,
              rwytDulu: state.riwayatPenyakitDahulurStr,
              rwytKlrg: state.riwayatPenayakitDalamKeluargaStr,
              noreg: singlePasien.first.noreg,
            );

            if (singlePasien.isNotEmpty) {
              // AMBIL DEVICE ID
              dynamic data = await deviceInfo.initPlatformState();
              // SAVE FISIOTERAPI

              if (authState is Authenticated) {
                if (authState.user.person == Person.dokter) {
                  // ignore: use_build_context_synchronously
                  context.read<AsesmenIgdBloc>().add(
                      AsesmenIgdEvent.saveAnamnesaIGD(
                          anamnesaIGD: anamnesaIgdModel,
                          deviceID: "ID-${data['id']}-${data['device']}",
                          pelayanan: "rajal",
                          userID: authState.user.userId,
                          person: "Dokter"));
                }
                if (authState.user.person == Person.perawat ||
                    authState.user.person == Person.nonDokter) {
                  // ignore: use_build_context_synchronously
                  context.read<AsesmenIgdBloc>().add(
                      AsesmenIgdEvent.saveAnamnesaIGD(
                          anamnesaIGD: anamnesaIgdModel,
                          deviceID: "ID-${data['id']}-${data['device']}",
                          pelayanan: "rajal",
                          userID: authState.user.userId,
                          person: "Perawat"));
                }
              }
            }
          },
          widget: SingleChildScrollView(
            child: (state.isLoadingGetAnamnesa)
                ? Loading.expandedLoading()
                : SizedBox(
                    width: Get.width,
                    child: Card(
                      color: ThemeColor.bgColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.sp,
                            color: ThemeColor.blackColor,
                          ),
                          borderRadius: BorderRadius.circular(2.sp)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleContainer(title: "Keluhan Utama"),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              enabled: true,
                              value: state.keluhanUtamaStr,
                              onChanged: (value) {
                                context.read<AsesmenIgdBloc>().add(
                                    AsesmenIgdEvent.keluhanUtamaOnchanged(
                                        value: value));
                              },
                              maxLines: 5,
                            ),
                          ),
                          titleContainer(title: "Riwayat Penyakit Sekarang"),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              enabled: true,
                              value: state.telaahStr,
                              onChanged: (value) {
                                context.read<AsesmenIgdBloc>().add(
                                    AsesmenIgdEvent.telaahOnchanged(
                                        value: value));
                              },
                              maxLines: 5,
                            ),
                          ),
                          titleContainer(title: "Riwayat Penyakit Dahulu"),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              enabled: true,
                              value: state.telaahStr,
                              onChanged: (value) {
                                context.read<AsesmenIgdBloc>().add(
                                    AsesmenIgdEvent.telaahOnchanged(
                                        value: value));
                              },
                              maxLines: 5,
                            ),
                          ),
                          titleContainer(title: "Telaah"),
                          Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: FormWidget.textArea(
                              enabled: true,
                              value: state.telaahStr,
                              onChanged: (value) {
                                context.read<AsesmenIgdBloc>().add(
                                    AsesmenIgdEvent.telaahOnchanged(
                                        value: value));
                              },
                              maxLines: 5,
                            ),
                          ),
                          // titleContainer(title: "Riwayat Penyakit Terdahulu"),
                          // Padding(
                          //   padding: EdgeInsets.all(3.sp),
                          //   child: FormWidget.textArea(
                          //       enabled: true,
                          //       value: state.riwayatPenyakitDahulurStr,
                          //       onChanged: (value) {
                          //         context.read<AsesmenIgdBloc>().add(
                          //             AsesmenIgdEvent
                          //                 .riwayatPenyakitDahuluOnchanged(
                          //                     value: value));
                          //       },
                          //       maxLines: 5,
                          //       hinText: "Riwayat Penyakit Terdahulu"),
                          // ),
                          // titleContainer(
                          //     title: "Riwayat Penyakit Dalam Keluarga"),
                          // Padding(
                          //   padding: EdgeInsets.all(3.sp),
                          //   child: FormWidget.textArea(
                          //       enabled: true,
                          //       value: state.riwayatPenayakitDalamKeluargaStr,
                          //       onChanged: (value) {
                          //         context.read<AsesmenIgdBloc>().add(
                          //             AsesmenIgdEvent
                          //                 .riwayatPenyakitDalamKeluargaOnchanged(
                          //                     value: value));
                          //       },
                          //       maxLines: 5,
                          //       hinText: "Riwayat Penyakit Dalam Keluarga"),
                          // ),
                          titleContainer(title: "Kesadaran"),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.all(4.sp),
                            child: Wrap(
                              children: kesadaranList
                                  .map((e) => SizedBox(
                                        width: 80.sp,
                                        height: 25.sp,
                                        child: Card(
                                          color: ThemeColor.lightGrey,
                                          elevation: 1.sp,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp)),
                                          child: Center(
                                            child: RadioListTile(
                                                selected: true,
                                                activeColor:
                                                    const Color(0xFF293074),
                                                selectedTileColor:
                                                    ThemeColor.bgColor,
                                                title: Text(
                                                  e,
                                                  style: blackCalibriTextStyle
                                                      .copyWith(
                                                          fontSize: 10.sp),
                                                  maxLines: 3,
                                                  textAlign: TextAlign.start,
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                value: e,
                                                groupValue: state.kesadaranStr,
                                                onChanged: (value) {
                                                  context
                                                      .read<AsesmenIgdBloc>()
                                                      .add(AsesmenIgdEvent
                                                          .kesadaranOnchanged(
                                                              value: value
                                                                  .toString()));
                                                }),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          titleContainer(title: "Jenis Pelayanan"),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.all(4.sp),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: jenisPelayanan
                                  .map((e) => SizedBox(
                                        width: 95.sp,
                                        height: 25.sp,
                                        child: Card(
                                          color: ThemeColor.lightGrey,
                                          elevation: 1.sp,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp)),
                                          child: Center(
                                            child: RadioListTile(
                                                selected: true,
                                                activeColor:
                                                    const Color(0xFF293074),
                                                selectedTileColor:
                                                    ThemeColor.bgColor,
                                                title: Text(
                                                  e,
                                                  style: blackCalibriTextStyle
                                                      .copyWith(
                                                          fontSize: 10.sp),
                                                  maxLines: 3,
                                                  textAlign: TextAlign.start,
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                value: e,
                                                groupValue:
                                                    state.jenisPelayananStr,
                                                onChanged: (value) {
                                                  context
                                                      .read<AsesmenIgdBloc>()
                                                      .add(AsesmenIgdEvent
                                                          .jenisPelayananOnchanged(
                                                              value: value
                                                                  .toString()));
                                                }),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          // titleContainer(title: "Riwayat"),
                          // SizedBox(
                          //   width: Get.width,
                          //   height: 20.sp,
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //         backgroundColor: ThemeColor.primaryColor,
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius:
                          //                 BorderRadius.circular(4.sp))),
                          //     onPressed: () {
                          //       Get.toNamed(GetRoutes.riwayatPasienPage);
                          //     },
                          //     child: Text(
                          //       "Lihat Riwayat",
                          //       style: blackTextStyle,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
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

List<String> kesadaranList = ["CM", "Somnolen", "Apatis", "Sopor", "Koma"];

List<String> jenisPelayanan = [
  "Preventif",
  "Kuratif",
  "Palatif",
  "Rehabilitatif"
];
