import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class VitalSignObginViewWidget extends StatelessWidget {
  const VitalSignObginViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PemeriksaanFisikBloc, PemeriksaanFisikState>(
      builder: (context, state) {
        // ====================== //
        return (state.isLoadingGetVitalSign)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                title: "Simpan",
                onPressed: () async {},
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
                                      enable: false,
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
                                      enable: false,
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
                                      enable: false,
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
                                        enable: false,
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
                                        enable: false,
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
                                        enable: false,
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
