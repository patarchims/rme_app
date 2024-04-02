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
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PemeriksaanFisikIGDContentWidgetView extends StatelessWidget {
  const PemeriksaanFisikIGDContentWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<PemeriksaanFisikBloc, PemeriksaanFisikState>(
      listener: (context, state) {
        // PEMERIKSAAN FISIK
        if (state.isLoadingSavePemeriksaanFisikIgd) {
          EasyLoading.show();
        }

        if (!state.isLoadingSavePemeriksaanFisikIgd) {
          EasyLoading.dismiss();
        }

        state.saveAsesmenPemeriksaanFisikResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
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
                    PemeriksaanFisikEvent.savePemeriksaanFisikIGD(
                        person: toPerson(person: authState.user.person),
                        userID: authState.user.userId,
                        deviceID: "ID - ${data['id']} - ${data['device']}}",
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        noReg: singlePasien.first.noreg,
                        pemeriksaanFisikIgdModel:
                            state.pemeriksaanFisikIgdModel));
              }
            },
            widget: (state.isLoadingGetPemeriksaanFisikIgd)
                ? SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: ShimerLoading.loadingExpandCard(
                        baseColor: Colors.white.withOpacity(0.5),
                        highLightColor: Colors.lightBlue.withOpacity(0.1)),
                  )
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
                            TitleWidget.titleContainer(title: "Kepala"),

                            TitleWidget.boxPemeriksaanFisik(
                                title: "Mata",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.mata,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.mataOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "THT",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.tht,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.thtOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Mulut",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.mulut,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.mulutOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Gigi",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.gigi,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.gigiOnchanged(
                                          value: value));
                                }),
                            TitleWidget.titleContainer(title: "Leher"),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Thyroid",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.thyroid,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.thyroidOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Lain-lain",
                                enabled: false,
                                value:
                                    state.pemeriksaanFisikIgdModel.leherLainnya,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent
                                          .leherLainnyaOnchanged(value: value));
                                }),
                            TitleWidget.titleContainer(title: "Dada"),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Dinding Dada",
                                enabled: false,
                                value:
                                    state.pemeriksaanFisikIgdModel.dindingDada,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.dadaOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                value:
                                    state.pemeriksaanFisikIgdModel.suaraJantung,
                                title: "Suara Jantung",
                                enabled: false,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.jantungOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Suara Paru",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.suaraParu,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.paruOnchanged(
                                          value: value));
                                }),
                            TitleWidget.titleContainer(title: "Abdomen"),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Dinding Perut",
                                enabled: false,
                                value:
                                    state.pemeriksaanFisikIgdModel.dindingPerut,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.perutOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Hati",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.hati,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.hatiOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Lien",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.hati,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.lienOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Peristaltik Usus",
                                enabled: false,
                                value: state
                                    .pemeriksaanFisikIgdModel.peristatikUsus,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent
                                          .peristaltikUsusOnchanged(
                                              value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Lain-Lain",
                                enabled: false,
                                value: state
                                    .pemeriksaanFisikIgdModel.abdomenDetail,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent
                                          .abdomenLainnyaOnchanged(
                                              value: value));
                                }),
                            TitleWidget.titleContainer(title: "Punggung"),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Kulit",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.kulit,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.kulitOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "CV, Ginjal",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.ginjal,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.ginjalOnchanged(
                                          value: value));
                                }),
                            TitleWidget.titleContainer(title: "Genetalia"),
                            Container(
                              padding: EdgeInsets.all(2.sp),
                              width: Get.width,
                              child: FormWidget.textArea(
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.genetalia,
                                onChanged: (value) {
                                  // ============================
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.genetaliaOnchanged(
                                          value: value));
                                },
                                maxLines: 2,
                              ),
                            ),
                            TitleWidget.titleContainer(title: "Extremitas"),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Superior",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.superior,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.superiorOnchanged(
                                          value: value));
                                }),
                            TitleWidget.boxPemeriksaanFisik(
                                title: "Inferior",
                                enabled: false,
                                value: state.pemeriksaanFisikIgdModel.inferior,
                                onChanged: (value) {
                                  context.read<PemeriksaanFisikBloc>().add(
                                      PemeriksaanFisikEvent.inferiorOnchanged(
                                          value: value));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ));
      },
    );
  }
}
