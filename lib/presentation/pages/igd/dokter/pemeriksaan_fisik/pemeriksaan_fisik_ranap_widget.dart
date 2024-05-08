import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class PemeriksaanFisikRanapWidget extends StatelessWidget {
  const PemeriksaanFisikRanapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PemeriksaanFisikBloc, PemeriksaanFisikState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthState authState = context.watch<AuthBloc>().state;
        PasienState pasienState = context.watch<PasienBloc>().state;
        final singlePasien = pasienState.listPasienModel
            .where((element) => element.mrn == pasienState.normSelected);

        return BlocConsumer<PemeriksaanFisikBloc, PemeriksaanFisikState>(
          listener: (context, state) {
            if (state.isLoadingSavePemeriksaaanFisikBangsal) {
              EasyLoading.show();
            }

            if (!state.isLoadingSavePemeriksaaanFisikBangsal) {
              EasyLoading.dismiss();
            }

            state.saveAsesmenPemeriksaanFisikBangsalResult.fold(
                () => null,
                (a) => a.fold(
                    (l) => l.maybeMap(
                        orElse: () {},
                        failure: (e) async {
                          // FAILURE

                          if (e.meta.code == 201) {
                            final shouldPop = await Alert.warningMessage(
                                context,
                                subTitle: e.meta.message.toString(),
                                title: "Peringatan");
                            return shouldPop ?? false;
                          }
                        }),
                    (r) => r.maybeMap(
                        orElse: () {},
                        loaded: (e) async {
                          MetaModel meta =
                              MetaModel.fromJson(e.value["metadata"]);
                          final shouldPop = await Alert.loaded(context,
                              subTitle: meta.message, title: "Pesan");
                          return shouldPop ?? false;
                        })));
          },
          builder: (context, state) {
            return (state.isLoadingGetPemeriksaanFisikBangsal)
                ? SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: ShimerLoading.loadingExpandCard(
                        baseColor: Colors.white.withOpacity(0.5),
                        highLightColor: Colors.lightBlue.withOpacity(0.1)),
                  )
                : HeaderContentWidget(
                    onPressed: () async {
                      if (singlePasien.isNotEmpty) {
                        dynamic data = await deviceInfo.initPlatformState();

                        // LAKUKAN SIMPAN DATA  ignore: use_build_context_synchronously
                        if (authState is Authenticated) {
                          if (authState.user.person == Person.dokter) {
                            // ignore: use_build_context_synchronously
                            context.read<PemeriksaanFisikBloc>().add(
                                PemeriksaanFisikEvent
                                    .savePemeriksaanFisikBangsal(
                                        kategori: toKategoriString(
                                            spesiliasasi:
                                                authState.user.spesialisasi),
                                        person: toPerson(
                                            person: authState.user.person),
                                        userID: authState.user.userId,
                                        deviceID:
                                            "ID-${data['id']}-${data['device']}",
                                        pelayanan: toPelayanan(
                                            poliklinik:
                                                authState.user.poliklinik),
                                        noReg: singlePasien.first.noreg,
                                        pemeriksaanFisikBangsalModel: state
                                            .pemeriksaanFisikBangsalModel));
                          }

                          if (authState.user.person == Person.nonDokter ||
                              authState.user.person == Person.perawat) {
                            // ignore: use_build_context_synchronously
                            context.read<PemeriksaanFisikBloc>().add(
                                PemeriksaanFisikEvent
                                    .savePemeriksaanFisikBangsal(
                                        kategori: toKategoriString(
                                            spesiliasasi:
                                                authState.user.spesialisasi),
                                        person: toPerson(
                                            person: authState.user.person),
                                        userID: authState.user.userId,
                                        deviceID:
                                            "ID-${data['id']}-${data['device']}",
                                        pelayanan: toPelayanan(
                                            poliklinik:
                                                authState.user.poliklinik),
                                        noReg: singlePasien.first.noreg,
                                        pemeriksaanFisikBangsalModel: state
                                            .pemeriksaanFisikBangsalModel));
                          }
                        }
                      }
                    },
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
                              titleContainer(title: "Kepala"),
                              Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textArea(
                                      value: state
                                          .pemeriksaanFisikBangsalModel.kepala,
                                      onChanged: (value) {
                                        context
                                            .read<PemeriksaanFisikBloc>()
                                            .add(PemeriksaanFisikEvent
                                                .kepalaOnchanged(value: value));
                                      },
                                      maxLines: 3)),
                              titleContainer(title: "Leher"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value:
                                      state.pemeriksaanFisikBangsalModel.leher,
                                  onChanged: (value) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent.leherOnchanged(
                                            value: value));
                                  },
                                  maxLines: 3,
                                ),
                              ),
                              titleContainer(title: "Dada"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value:
                                      state.pemeriksaanFisikBangsalModel.dada,
                                  onChanged: (value) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent.dadaOnchanged(
                                            value: value));
                                  },
                                  maxLines: 3,
                                ),
                              ),
                              titleContainer(title: "Abdomen"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value: state
                                      .pemeriksaanFisikBangsalModel.abdomen,
                                  onChanged: (value) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent.abdomenOnchanged(
                                            value: value));
                                  },
                                  maxLines: 3,
                                ),
                              ),
                              titleContainer(title: "Punggung"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value: state
                                      .pemeriksaanFisikBangsalModel.punggung,
                                  onChanged: (value) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent.punggungOnchanged(
                                            value: value));
                                  },
                                  maxLines: 3,
                                ),
                              ),
                              titleContainer(title: "Genetalia"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value: state
                                      .pemeriksaanFisikBangsalModel.genetalia,
                                  onChanged: (value) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent
                                            .genetaliaOnchanged(value: value));
                                  },
                                  maxLines: 3,
                                ),
                              ),
                              titleContainer(title: "Extremitas"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value: state
                                      .pemeriksaanFisikBangsalModel.ekstremitas,
                                  onChanged: (value) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent
                                            .ekstremitasOnchanged(
                                                value: value));
                                  },
                                  maxLines: 3,
                                ),
                              ),
                              titleContainer(title: "Lain-lain"),
                              Padding(
                                padding: EdgeInsets.all(3.sp),
                                child: FormWidget.textArea(
                                  value: state
                                      .pemeriksaanFisikBangsalModel.lainLain,
                                  onChanged: (value) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent.lainLainOnchanged(
                                            value: value));
                                  },
                                  maxLines: 3,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }

  Row boxFisik(
      {required String selected,
      required String hinText,
      String? valueText,
      required void Function(String?)? onChanged,
      void Function(String?)? onChangedText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 90.sp,
          height: 25.sp,
          child: Card(
            elevation: 1,
            child: RadioListTile(
                selected: true,
                activeColor: const Color(0xFF293074),
                selectedTileColor: ThemeColor.bgColor,
                title: Text(
                  "Normal",
                  style: blackCalibriTextStyle.copyWith(fontSize: 10.sp),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                value: "Normal",
                groupValue: selected,
                onChanged: onChanged),
          ),
        ),
        SizedBox(
          width: 90.sp,
          height: 25.sp,
          child: Card(
            elevation: 1,
            child: RadioListTile(
                selected: true,
                activeColor: const Color(0xFF293074),
                selectedTileColor: ThemeColor.bgColor,
                title: Text(
                  "Abnormal",
                  style: blackCalibriTextStyle.copyWith(fontSize: 10.sp),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                value: "Abnormal",
                groupValue: selected,
                onChanged: onChanged),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(2.sp),
          child: FormWidget.textArea(
            value: valueText,
            onChanged: onChangedText,
            maxLines: 1,
            hinText: hinText,
          ),
        )),
      ],
    );
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
}

List<String> pemeriksaanFisik = ["Normal", "Abnormal"];
