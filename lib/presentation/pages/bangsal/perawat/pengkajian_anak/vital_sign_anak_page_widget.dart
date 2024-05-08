// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/igd/bloc/tanda_vital_igd_dokter/tanda_vital_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class VitalSignAnakPageWidget extends StatefulWidget {
  final bool isENableAdd;
  const VitalSignAnakPageWidget({
    super.key,
    required this.isENableAdd,
  });

  @override
  State<VitalSignAnakPageWidget> createState() =>
      _VitalSignAnakPageWidgetState();
}

class _VitalSignAnakPageWidgetState extends State<VitalSignAnakPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<TandaVitalIgdDokterBloc, TandaVitalIgdDokterState>(
      listener: (context, state) {
        if (state.status == TandaVitalIgdDokterStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != TandaVitalIgdDokterStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
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
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));

        // ======================= //
      },
      builder: (context, state) {
        if (state.status == TandaVitalIgdDokterStatus.isLoadingGet) {
          return HeaderContentWidget(
              title: "Simpan",
              widget: SizedBox(
                width: Get.width,
                height: Get.height,
                child: ShimerLoading.loadingExpandCard(
                    baseColor: Colors.white.withOpacity(0.5),
                    highLightColor: Colors.lightBlue.withOpacity(0.1)),
              ));
        }

        return HeaderContentWidget(
            title: "Simpan",
            isENableAdd: widget.isENableAdd,
            onPressed: (widget.isENableAdd)
                ? () async {
                    // ======================================================= //
                    // SIMPAN DATA GANGGUAN PERILAKU //
                    dynamic data = await deviceInfo.initPlatformState();
                    if (authState is Authenticated) {
                      // ignore: use_build_context_synchronously
                      context.read<TandaVitalIgdDokterBloc>().add(
                          OnSaveTandaVitalIGDDokter(
                              deviceId: "ID-${data['id']}-${data['device']}",
                              noReg: singlePasien.first.noreg,
                              pelayanan: toPelayanan(
                                  poliklinik: authState.user.poliklinik),
                              person: toPerson(person: authState.user.person),
                              tandaVital: state.tandaVitalIgdDokter));
                      // SIMPAN SEBAGAI DOKTER
                    }
                  }
                : null,
            widget: ListView(
              controller: _scrollController,
              children: [
                TitleWidget.titleContainer(title: "Tanda Tanda Vital"),
                Container(
                  width: Get.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70.sp,
                        child: Text("GCS", style: blackTextStyle),
                      ),
                      SizedBox(
                          width: 65.sp,
                          child: Row(
                            children: [
                              Text(
                                "E :",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.sp),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: ThemeColor.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton<String>(
                                  dropdownColor: ThemeColor.darkColor,
                                  value: state.tandaVitalIgdDokter.gcsE,
                                  onChanged: (eValue) {
                                    context.read<TandaVitalIgdDokterBloc>().add(
                                        OnChangedE(value: eValue.toString()));
                                  },
                                  items: ListConstants.gcs
                                      .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: whiteTextStyle,
                                                ),
                                              ))
                                      .toList(),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: ThemeColor.primaryColor,
                                  ),
                                  iconSize: 42,
                                  underline: const SizedBox(),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                          width: 65.sp,
                          child: Row(
                            children: [
                              Text(
                                "V :",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.sp),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: ThemeColor.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton<String>(
                                  dropdownColor: ThemeColor.darkColor,
                                  value: state.tandaVitalIgdDokter.gcsV,
                                  onChanged: (mValue) {
                                    context.read<TandaVitalIgdDokterBloc>().add(
                                        OnChangedV(value: mValue.toString()));
                                  },
                                  items: ListConstants.gcs
                                      .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: whiteTextStyle,
                                                ),
                                              ))
                                      .toList(),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: ThemeColor.primaryColor,
                                  ),
                                  iconSize: 42,
                                  underline: const SizedBox(),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                          width: 65.sp,
                          child: Row(
                            children: [
                              Text(
                                "M :",
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 2.sp),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: ThemeColor.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton<String>(
                                  dropdownColor: ThemeColor.darkColor,
                                  value: state.tandaVitalIgdDokter.gcsM,
                                  onChanged: (mValue) {
                                    context.read<TandaVitalIgdDokterBloc>().add(
                                        OnChangedM(value: mValue.toString()));
                                  },
                                  items: ListConstants.gcs
                                      .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value,
                                                    style: whiteTextStyle),
                                              ))
                                      .toList(),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: ThemeColor.primaryColor,
                                  ),
                                  iconSize: 42,
                                  underline: const SizedBox(),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width / 2.5,
                      child: Column(
                        children: [
                          TitleWidget.formBox(
                            title: "Tekanan Darah",
                            subTitle: "mmHg",
                            value: state.tandaVitalIgdDokter.td,
                            onChanged: (value) {
                              context.read<TandaVitalIgdDokterBloc>().add(
                                  OnChangedTekananDarahEvent(value: value));
                            },
                          ),
                          TitleWidget.formBox(
                            title: "Nadi",
                            subTitle: "x/mnt",
                            value: state.tandaVitalIgdDokter.nadi,
                            onChanged: (value) {
                              context
                                  .read<TandaVitalIgdDokterBloc>()
                                  .add(OnChangedNadiEvent(value: value));
                            },
                          ),
                          TitleWidget.formBox(
                            title: "Suhu",
                            subTitle: "°C",
                            value: state.tandaVitalIgdDokter.suhu,
                            onChanged: (value) {
                              context
                                  .read<TandaVitalIgdDokterBloc>()
                                  .add(OnChangedSuhuEvent(value: value));
                            },
                          ),
                          TitleWidget.formBox(
                            title: "Tinggi Badan",
                            subTitle: "Cm",
                            value: state.tandaVitalIgdDokter.tinggiBadan,
                            onChanged: (value) {
                              context
                                  .read<TandaVitalIgdDokterBloc>()
                                  .add(OnChangedTinggiBadanEvent(value: value));
                            },
                          ),
                          TitleWidget.formBox(
                            title: "Akral",
                            subTitle: "",
                            value: state.tandaVitalIgdDokter.akral,
                            onChanged: (value) {
                              context
                                  .read<TandaVitalIgdDokterBloc>()
                                  .add(OnChangedAkralEvent(value: value));
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                                // width: 65.sp,
                                child: Row(
                              children: [
                                Text(
                                  "Kesadaran :",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5.sp,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 2.sp),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: ThemeColor.primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButton<String>(
                                    dropdownColor: ThemeColor.darkColor,
                                    value: state.tandaVitalIgdDokter.kesadaran,
                                    onChanged: (value) {
                                      context
                                          .read<TandaVitalIgdDokterBloc>()
                                          .add(OnChangedKesadaranEvent(
                                              value: value.toString()));
                                    },
                                    items: ListConstants.kesadaranManusia
                                        .map<DropdownMenuItem<String>>(
                                            (String value) =>
                                                DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value,
                                                      style: whiteTextStyle),
                                                ))
                                        .toList(),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: ThemeColor.primaryColor,
                                    ),
                                    iconSize: 42,
                                    underline: const SizedBox(),
                                  ),
                                ),
                              ],
                            )),
                            TitleWidget.formBox(
                              title: "Pernapasan",
                              subTitle: "x/mnt",
                              value: state.tandaVitalIgdDokter.pernafasan,
                              onChanged: (value) {
                                context.read<TandaVitalIgdDokterBloc>().add(
                                    OnChangedPernapasanEvent(value: value));
                              },
                            ),
                            TitleWidget.formBox(
                              title: "SpO2",
                              subTitle: "%",
                              value: state.tandaVitalIgdDokter.spo2,
                              onChanged: (value) {
                                context
                                    .read<TandaVitalIgdDokterBloc>()
                                    .add(OnChangedSpoEvent(value: value));
                              },
                            ),
                            TitleWidget.formBox(
                              title: "Berat Badan",
                              subTitle: "Kg",
                              value: state.tandaVitalIgdDokter.beratBadan,
                              onChanged: (value) {
                                context
                                    .read<TandaVitalIgdDokterBloc>()
                                    .add(OnChangedBeratBadan(value: value));
                              },
                            ),
                            TitleWidget.formBox(
                              title: "Pupil",
                              subTitle: "",
                              value: state.tandaVitalIgdDokter.pupil,
                              onChanged: (value) {
                                context
                                    .read<TandaVitalIgdDokterBloc>()
                                    .add(OnChangedPupilEvent(value: value));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
