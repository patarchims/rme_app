import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class KeadaanUmumContentBangsalWidget extends StatelessWidget {
  const KeadaanUmumContentBangsalWidget({super.key});

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

        state.saveKeadaanUmumResult.fold(
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
        return (state.isLoadingGetKeadaanUmum)
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
                    context
                        .read<PemeriksaanFisikBloc>()
                        .add(PemeriksaanFisikEvent.saveKeadaanUmum(
                          person: toPerson(person: authState.user.person),
                          keadaanUmumModel: state.keadaanUmum,
                          deviceID: "ID-${data['id']}-${data['device']}",
                          pelayanan: toPelayanan(
                              poliklinik: authState.user.poliklinik),
                          noReg: singlePasien.first.noreg,
                        ));
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
                        TitleWidget.titleContainer(title: "Keadaan Umum"),
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.sp, vertical: 5.sp),
                          child: Wrap(
                            runAlignment: WrapAlignment.start,
                            runSpacing: 1.sp,
                            spacing: 1.sp,
                            alignment: WrapAlignment.start,
                            children: ListConstants.keadaanUmum
                                .map(
                                  (e) => TitleWidget.boxChoose(
                                      icon: (state.keadaanUmum.keadaanUmum == e)
                                          ? const Icon(
                                              FontAwesomeIcons.check,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.xmark,
                                              color: Colors.white,
                                            ),
                                      backgroundColor:
                                          (state.keadaanUmum.keadaanUmum == e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                      onPressed: () {
                                        context
                                            .read<PemeriksaanFisikBloc>()
                                            .add(PemeriksaanFisikEvent
                                                .keadaanUmumOnchanged(
                                                    value: e));
                                      },
                                      title: e),
                                )
                                .toList(),
                          ),
                        ),
                        TitleWidget.titleContainer(title: "Kesadaran"),
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.sp, vertical: 5.sp),
                          child: Wrap(
                            runAlignment: WrapAlignment.start,
                            runSpacing: 1.sp,
                            spacing: 1.sp,
                            alignment: WrapAlignment.start,
                            children: ListConstants.kesadaran
                                .map(
                                  (e) => TitleWidget.boxChoose(
                                      icon: (state.keadaanUmum.kesadaran == e)
                                          ? const Icon(
                                              FontAwesomeIcons.check,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.xmark,
                                              color: Colors.white,
                                            ),
                                      backgroundColor:
                                          (state.keadaanUmum.kesadaran == e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                      onPressed: () {
                                        context
                                            .read<PemeriksaanFisikBloc>()
                                            .add(PemeriksaanFisikEvent
                                                .kesadaranOnchanged(value: e));

                                        if (e != ListConstants.kesadaran.last) {
                                          context
                                              .read<PemeriksaanFisikBloc>()
                                              .add(const PemeriksaanFisikEvent
                                                  .kesadaranDetailOnchanged(
                                                  value: ""));
                                        }
                                      },
                                      title: e),
                                )
                                .toList(),
                          ),
                        ),
                        if (state.keadaanUmum.kesadaran ==
                            ListConstants.kesadaran.last) ...[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.sp, vertical: 2.sp),
                            width: Get.width,
                            child: SizedBox(
                              child: FormWidget.textArea(
                                  maxLines: 2,
                                  enabled: true,
                                  value: state.keadaanUmum.kesadaranDetail,
                                  onChanged: (e) {
                                    context.read<PemeriksaanFisikBloc>().add(
                                        PemeriksaanFisikEvent
                                            .kesadaranDetailOnchanged(
                                                value: e));
                                  }),
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 5.sp,
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
