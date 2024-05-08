import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/icu/bloc/vital_sign_icu/vital_sign_icu_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class VitalSignPageWidget extends StatefulWidget {
  const VitalSignPageWidget({super.key});

  @override
  State<VitalSignPageWidget> createState() => _VitalSignPageWidgetState();
}

class _VitalSignPageWidgetState extends State<VitalSignPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<VitalSignIcuBloc, VitalSignIcuState>(
      listener: (context, state) {
        // ================== //
        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                      if (e.meta.code == 202) {
                        final shouldPop = await Alert.warningMessage(context,
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
                      },
                    )));
      },
      builder: (context, state) {
        if (state.status == VitalSignIcuStatus.isLoadingGet) {
          return Loading.expandedLoading();
        }
        return HeaderContentWidget(
            isENableAdd: true,
            title: "Simpan",
            backgroundColor: ThemeColor.bgColor,
            onPressed: () async {
              // ONSAVE DATA //
              dynamic data = await deviceInfo.initPlatformState();

              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<VitalSignIcuBloc>().add(OnSaveVitalSignEvent(
                    kategori: toKategoriString(
                        spesiliasasi: authState.user.spesialisasi),
                    noReg: singlePasien.first.noreg,
                    devicesID: "ID-${data['id']}-${data['device']}",
                    person: toPerson(person: authState.user.person),
                    pelayanan:
                        toPelayanan(poliklinik: authState.user.poliklinik),
                    vitalSign: state.vitalSignIcu));
              }
            },
            widget: Scrollbar(
              thumbVisibility: true,
              interactive: true,
              thickness: 5.sp,
              trackVisibility: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
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
                                  value: state.vitalSignIcu.tekananDarah,
                                  onChanged: (e) {
                                    context.read<VitalSignIcuBloc>().add(
                                        OnChangedTekananDarahEvent(value: e));
                                  }),
                              TitleWidget.formBox(
                                  title: "Berat Badan",
                                  subTitle: "kg",
                                  value: state.vitalSignIcu.beratBadan,
                                  onChanged: (e) {
                                    context.read<VitalSignIcuBloc>().add(
                                        OnChangedBeratBadanEvent(value: e));
                                  }),
                              TitleWidget.formBox(
                                title: "Pernapasan",
                                subTitle: "x/i",
                                value: state.vitalSignIcu.pernapasan,
                                onChanged: (e) {
                                  context.read<VitalSignIcuBloc>().add(
                                      OnChangedPernapasanICUEvent(value: e));
                                },
                              ),
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
                                    title: "Nadi",
                                    subTitle: "x/i",
                                    value: state.vitalSignIcu.nadi,
                                    onChanged: (e) {
                                      context
                                          .read<VitalSignIcuBloc>()
                                          .add(OnChangedNadiEvent(value: e));
                                    }),
                                TitleWidget.formBox(
                                    title: "Suhu",
                                    value: state.vitalSignIcu.suhu,
                                    subTitle: "°C",
                                    onChanged: (e) {
                                      context
                                          .read<VitalSignIcuBloc>()
                                          .add(OnChangedSuhuEvent(value: e));
                                    }),
                                TitleWidget.formBox(
                                    title: "Tinggi Badan",
                                    subTitle: "cm",
                                    value: state.vitalSignIcu.tinggiBadan,
                                    onChanged: (e) {
                                      context.read<VitalSignIcuBloc>().add(
                                          OnChangedTinggiBadanEvent(value: e));
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
            ));
      },
    );
  }
}
