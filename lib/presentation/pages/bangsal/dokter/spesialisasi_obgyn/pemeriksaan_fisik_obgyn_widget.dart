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

class PemeriksaanFisikObgynWidget extends StatelessWidget {
  const PemeriksaanFisikObgynWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<PemeriksaanFisikBloc, PemeriksaanFisikState>(
      listener: (context, state) {
        // PEMERIKSAAN FISIK
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
                      log(e.toString());

                      if (e.meta.code == 202) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
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

      //  ====================================== //
      builder: (context, state) {
        return HeaderContentWidget(
            onPressed: () async {
              // SIMPAN DATA
              dynamic data = await deviceInfo.initPlatformState();
              // LAUKAN SIMPAN DATA
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<PemeriksaanFisikBloc>().add(
                    PemeriksaanFisikEvent.savePemeriksaanFisikBangsal(
                        kategori: toKategoriString(
                            spesiliasasi: authState.user.spesialisasi),
                        person: toPerson(person: authState.user.person),
                        userID: authState.user.userId,
                        deviceID: "ID - ${data['id']} - ${data['device']}}",
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        noReg: singlePasien.first.noreg,
                        pemeriksaanFisikBangsalModel:
                            state.pemeriksaanFisikBangsalModel));
              }
            },
            widget: (state.isLoadingGetPemeriksaanFisikBangsal)
                ? Loading.expandedLoading()
                : SingleChildScrollView(
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
                            // ====================== ||
                            TitleWidget.titleContainer(
                                title: "Pemeriksaan Fisik"),

                            Padding(
                              padding: EdgeInsets.all(5.sp),
                              child: FormWidget.textArea(
                                  value: state.pemeriksaanFisikBangsalModel
                                      .pemeriksaanFisik,
                                  onChanged: (value) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent
                                            .pemeriksaanFisikOchanged(
                                                value: value));
                                  },
                                  maxLines: 15,
                                  enabled: true),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
      },
    );
  }
}
