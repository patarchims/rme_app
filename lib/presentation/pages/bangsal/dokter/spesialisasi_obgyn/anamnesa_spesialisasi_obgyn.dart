import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class AnamnesaSpesialisasiObgyn extends StatelessWidget {
  const AnamnesaSpesialisasiObgyn({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenDokterBloc, AsesmenDokterState>(
      listener: (context, state) {
        if (state.isLoadingSaveAsesmen) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (!state.isLoadingSaveAsesmen) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
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
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));

        //=============================
      },
      builder: (context, state) {
        return (state.isLoadingGetAsesmen)
            ? Loading.expandedLoading()
            : Expanded(
                child: HeaderContentWidget(
                    onPressed: () async {
                      // LAKUKAN SIMPAN DATA

                      log("ASESMEN DOKTER");
                      log(state.asesmentDokter.toString());

                      dynamic data = await deviceInfo.initPlatformState();
                      // ACTION SIMPAN DATA
                      if (authState is Authenticated) {
                        // ignore: use_build_context_synchronously
                        context.read<AsesmenDokterBloc>().add(
                            AsesmenDokterEvent.onSaveAsesment(
                                asesmentDokter: state.asesmentDokter,
                                noReg: singlePasien.first.noreg,
                                person: toPerson(person: authState.user.person),
                                deviceID:
                                    "ID - ${data['id']} - ${data['device']}}",
                                pelayanan: toPelayanan(
                                    poliklinik: authState.user.poliklinik)));
                      }
                    },
                    title: "Simpan",
                    widget: SingleChildScrollView(
                      child: SizedBox(
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
                              TitleWidget.titleContainer(
                                  title: "Keluhan Utama"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value: state.asesmentDokter.keluhanUtama,
                                  enabled: true,
                                  onChanged: (value) {
                                    context.read<AsesmenDokterBloc>().add(
                                        AsesmenDokterEvent
                                            .keluhanUtamaOnchanged(
                                                value: value));
                                  },
                                  maxLines: 5,
                                ),
                              ),
                              TitleWidget.titleContainer(
                                  title: "Keluhan Tambahan"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  enabled: true,
                                  value: state.asesmentDokter.keluhanTambahan,
                                  onChanged: (value) {
                                    context.read<AsesmenDokterBloc>().add(
                                        AsesmenDokterEvent
                                            .keluhanTambahanOnchanged(
                                                value: value));
                                  },
                                  maxLines: 5,
                                ),
                              ),
                              // TitleWidget.titleContainer(title: "Alergi"),
                              // Padding(
                              //   padding: EdgeInsets.all(3.sp),
                              //   child: FormWidget.textArea(
                              //     value: state.asesmentDokter.riwayatAlergi,
                              //     enabled: true,
                              //     onChanged: (value) {
                              //       context.read<AsesmenDokterBloc>().add(
                              //           AsesmenDokterEvent
                              //               .riwayatAlergiOnchanged(
                              //                   value: value));
                              //     },
                              //     maxLines: 5,
                              //   ),
                              // ),
                              // TitleWidget.titleContainer(
                              //     title: "Riwayat Penyakit Keluarga"),
                              // Padding(
                              //   padding: EdgeInsets.all(3.sp),
                              //   child: FormWidget.textArea(
                              //     value: state.asesmentDokter.riwayatKeluarga,
                              //     enabled: true,
                              //     onChanged: (value) {
                              //       context.read<AsesmenDokterBloc>().add(
                              //           AsesmenDokterEvent
                              //               .riwayatKeluargaOnchanged(
                              //                   value: value));
                              //     },
                              //     maxLines: 5,
                              //   ),
                              // ),
                              TitleWidget.titleContainer(
                                  title: "Riwayat Pengobatan"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value: state.asesmentDokter.riwayatObat,
                                  enabled: true,
                                  onChanged: (value) {
                                    context.read<AsesmenDokterBloc>().add(
                                        AsesmenDokterEvent.riwayatObatOnchanged(
                                            value: value));
                                  },
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )));
      },
    );
  }
}
