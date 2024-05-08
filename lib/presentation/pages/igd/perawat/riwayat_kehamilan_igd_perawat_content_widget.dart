import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class RiwayatKehamilanContentWidget extends StatelessWidget {
  const RiwayatKehamilanContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;

    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenIgdBloc, AsesmenIgdState>(
      listener: (context, state) {
        if (state.isLoadingSaveRiwayatKehamilan) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveRiwayatKehamilan) {
          EasyLoading.dismiss();
        }

        // ============== RIWAYAT KEHAMILAN
        // ================================= //
        state.saveRiwayatKehamilanResult.fold(
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

        // ================================= //
      },
      builder: (context, state) {
        return (state.isLoadingGetRiwayatKehamilan)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                title: "Simpan",
                onPressed: () async {
                  // ======================= // SIMPAN DATA // =================
                  dynamic data = await deviceInfo.initPlatformState();

                  if (authState is Authenticated) {
                    // ============================== //
                    // ignore: use_build_context_synchronously
                    context.read<AsesmenIgdBloc>().add(
                        AsesmenIgdEvent.saveRiwayatKehamilan(
                            riwayatKehamilan: state.riwayatKehamilanModel,
                            noreg: singlePasien.first.noreg,
                            person: toPerson(person: authState.user.person),
                            deviceID: "ID-${data['id']}-${data['device']}",
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik)));
                  }
                },
                widget: SizedBox(
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Card(
                      color: ThemeColor.bgColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.sp, color: ThemeColor.blackColor),
                          borderRadius: BorderRadius.circular(2.sp)),
                      child: Column(
                        children: [
                          TitleWidget.titleContainer(
                              title: "Riwayat Kehamilan"),
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 10.sp,
                                  child: Checkbox(
                                    activeColor: ThemeColor.primaryColor,
                                    checkColor: Colors.white,
                                    value:
                                        state.riwayatKehamilanModel.kehamilan,
                                    onChanged: (values) {
                                      context.read<AsesmenIgdBloc>().add(
                                          AsesmenIgdEvent.hamilOnchanged(
                                              value: !state
                                                  .riwayatKehamilanModel
                                                  .kehamilan));
                                    },
                                  ),
                                ),
                                Text(
                                  "Hamil",
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width / 2.5,
                                child: Column(
                                  children: [
                                    TitleWidget.formBox(
                                        title: "Gravida",
                                        subTitle: "",
                                        value:
                                            state.riwayatKehamilanModel.gravida,
                                        onChanged: (value) {
                                          context.read<AsesmenIgdBloc>().add(
                                              AsesmenIgdEvent.gravidaOnchanged(
                                                  value: value));
                                        }),
                                    TitleWidget.formBox(
                                        title: "Para",
                                        subTitle: "",
                                        value: state.riwayatKehamilanModel.para,
                                        onChanged: (value) {
                                          context.read<AsesmenIgdBloc>().add(
                                              AsesmenIgdEvent.paraOnchanged(
                                                  value: value));
                                        }),
                                    TitleWidget.formBox(
                                        title: "Abortus ",
                                        subTitle: "mm/mm",
                                        value:
                                            state.riwayatKehamilanModel.abortus,
                                        onChanged: (value) {
                                          context.read<AsesmenIgdBloc>().add(
                                              AsesmenIgdEvent.abortusOnchanged(
                                                  value: value));
                                        }),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      TitleWidget.formBox(
                                          title: "HPHT",
                                          value:
                                              state.riwayatKehamilanModel.hpht,
                                          subTitle: "",
                                          onChanged: (value) {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent.hphtOnchanged(
                                                    value: value));
                                          }),
                                      TitleWidget.formBox(
                                          title: "TTP",
                                          subTitle: "",
                                          value:
                                              state.riwayatKehamilanModel.ttp,
                                          onChanged: (value) {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent.ttpOnchanged(
                                                    value: value));
                                          }),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TitleWidget.titleContainer(
                              title: "Pemeriksaan Fisik Kebidanan"),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width / 2.5,
                                child: Column(
                                  children: [
                                    TitleWidget.formBox(
                                        title: "Leopoid I",
                                        subTitle: "",
                                        value: state
                                            .riwayatKehamilanModel.leopold1,
                                        onChanged: (value) {
                                          context.read<AsesmenIgdBloc>().add(
                                              AsesmenIgdEvent.leopoid1Onchanged(
                                                  value: value));
                                        }),
                                    TitleWidget.formBox(
                                        title: "Leopoid II",
                                        subTitle: "",
                                        value: state
                                            .riwayatKehamilanModel.leopold2,
                                        onChanged: (value) {
                                          context.read<AsesmenIgdBloc>().add(
                                              AsesmenIgdEvent.leopoid2Onchanged(
                                                  value: value));
                                        }),
                                    TitleWidget.formBox(
                                        title: "Leopoid III ",
                                        subTitle: "",
                                        value: state
                                            .riwayatKehamilanModel.leopold3,
                                        onChanged: (value) {
                                          context.read<AsesmenIgdBloc>().add(
                                              AsesmenIgdEvent.leopoid3Onchanged(
                                                  value: value));
                                        }),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      TitleWidget.formBox(
                                          title: "Leopoid IV",
                                          value: state
                                              .riwayatKehamilanModel.leopold4,
                                          subTitle: "",
                                          onChanged: (value) {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent
                                                    .leopoid4Onchanged(
                                                        value: value));
                                          }),
                                      TitleWidget.formBox(
                                          title: "Djj",
                                          subTitle: "",
                                          value:
                                              state.riwayatKehamilanModel.ddj,
                                          onChanged: (value) {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent.ddjOnchanged(
                                                    value: value));
                                          }),
                                      TitleWidget.formBox(
                                          title: "VT",
                                          value: state.riwayatKehamilanModel.vt,
                                          subTitle: "",
                                          onChanged: (value) {
                                            context.read<AsesmenIgdBloc>().add(
                                                AsesmenIgdEvent.vtOnchanged(
                                                    value: value));
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
                ));
      },
    );
  }
}
