import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class VitalSignContentWidget extends StatelessWidget {
  const VitalSignContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    return BlocConsumer<PemeriksaanFisikBloc, PemeriksaanFisikState>(
      listener: (context, state) {
        if (state.isLoadingSaveVitalSign) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveVitalSign) {
          EasyLoading.dismiss();
        }

        state.saveVitalSIgnBangsalResult.fold(
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
        // ====================== //
        return (state.isLoadingGetVitalSign)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                title: "Simpan",
                onPressed: () async {
                  // ONPRESS
                  //========
                  dynamic data = await deviceInfo.initPlatformState();

                  // LAKUKAN SIMPAN DATA  ignore: use_build_context_synchronously
                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously
                    context.read<PemeriksaanFisikBloc>().add(
                        PemeriksaanFisikEvent.saveVitalSignResult(
                            person: toPerson(person: authState.user.person),
                            kategori: toKategoriString(
                                spesiliasasi: authState.user.spesialisasi),
                            userID: authState.user.userId,
                            deviceID: "ID-${data['id']}-${data['device']}",
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik),
                            noReg: singlePasien.first.noreg,
                            vitalSignBangsalModel:
                                state.vitalSignBangsalModel));
                  }
                },
                widget: SingleChildScrollView(
                  child: Card(
                    color: ThemeColor.bgColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.sp, color: ThemeColor.blackColor),
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: Column(
                      children: [
                        TitleWidget.titleContainer(title: "Vital Sign"),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width / 2.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleWidget.formBox(
                                      title: "Tekanan Darah",
                                      subTitle: "mmHg",
                                      value: state
                                          .vitalSignBangsalModel.tekananDarah,
                                      onChanged: (e) {
                                        context
                                            .read<PemeriksaanFisikBloc>()
                                            .add(PemeriksaanFisikEvent
                                                .tekananDarahOnchanged(
                                                    value: e));
                                      }),
                                  TitleWidget.formBox(
                                      title: "Nadi",
                                      subTitle: "x/i",
                                      value: state.vitalSignBangsalModel.nadi,
                                      onChanged: (e) {
                                        context
                                            .read<PemeriksaanFisikBloc>()
                                            .add(PemeriksaanFisikEvent
                                                .nadiOnchanged(value: e));
                                      }),
                                  TitleWidget.formBox(
                                      title: "Pernapasan",
                                      subTitle: "x/i",
                                      onChanged: (e) {
                                        context
                                            .read<PemeriksaanFisikBloc>()
                                            .add(PemeriksaanFisikEvent
                                                .pernapasanOnchanged(value: e));
                                      },
                                      value: state
                                          .vitalSignBangsalModel.pernapasan),
                                ],
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleWidget.formBox(
                                        title: "Suhu",
                                        subTitle: "°C",
                                        value: state.vitalSignBangsalModel.suhu,
                                        onChanged: (e) {
                                          context
                                              .read<PemeriksaanFisikBloc>()
                                              .add(PemeriksaanFisikEvent
                                                  .suhuOnchanged(value: e));
                                        }),
                                    TitleWidget.formBox(
                                        title: "Tinggi Badan",
                                        subTitle: "cm",
                                        value: state
                                            .vitalSignBangsalModel.tinggiBadan,
                                        onChanged: (e) {
                                          context
                                              .read<PemeriksaanFisikBloc>()
                                              .add(PemeriksaanFisikEvent
                                                  .tinggiBadanOnchanged(
                                                      value: e));
                                        }),
                                    TitleWidget.formBox(
                                        title: "Berat Badan",
                                        subTitle: "kg",
                                        value: state
                                            .vitalSignBangsalModel.beratBadan,
                                        onChanged: (e) {
                                          context
                                              .read<PemeriksaanFisikBloc>()
                                              .add(PemeriksaanFisikEvent
                                                  .beratBadanOnchanged(
                                                      value: e));
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
