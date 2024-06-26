import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/tanda_vital_keperawatan/tanda_vital_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../domain/bloc/dashboard/pasien/pasien_bloc.dart';

class VitalSignKeperawatanBangsalWidget extends StatefulWidget {
  const VitalSignKeperawatanBangsalWidget({super.key});

  @override
  State<VitalSignKeperawatanBangsalWidget> createState() =>
      _VitalSignKeperawatanBangsalWidgetState();
}

class _VitalSignKeperawatanBangsalWidgetState
    extends State<VitalSignKeperawatanBangsalWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<TandaVitalKeperawatanBloc, TandaVitalKeperawatanState>(
      listener: (context, state) {
        if (state.status == TandaVitalKeperawatanStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != TandaVitalKeperawatanStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
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
      builder: (context, state) {
        if (state.status == TandaVitalKeperawatanStatus.isLoadingGet) {
          return HeaderContentWidget(
              isENableAdd: true,
              onPressed: () {},
              title: "SIMPAN",
              widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
          isENableAdd: true,
          title: "Simpan",
          onPressed: () async {
            dynamic data = await deviceInfo.initPlatformState();
            if (authState is Authenticated) {
              // ignore: use_build_context_synchronously
              context.read<TandaVitalKeperawatanBloc>().add(
                  OnSaveTandaVitalKeperawatanBangsal(
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      deviceId: "ID-${data['id']}-${data['device']}",
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person),
                      tandaVital: state.vitalSignKeperawatanModel));
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
                    TitleWidget.titleContainer(title: "Tanda  Tanda Vital"),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.sp, vertical: 4.sp),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.sp),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: ThemeColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: DropdownButton<String>(
                                      dropdownColor: ThemeColor.darkColor,
                                      value:
                                          state.vitalSignKeperawatanModel.gcsE,
                                      onChanged: (eValue) {
                                        context
                                            .read<TandaVitalKeperawatanBloc>()
                                            .add(OnChangedE(
                                                value: eValue.toString()));
                                      },
                                      items: ListConstants.gcsE
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.sp),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: ThemeColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: DropdownButton<String>(
                                      dropdownColor: ThemeColor.darkColor,
                                      value:
                                          state.vitalSignKeperawatanModel.gcsV,
                                      onChanged: (mValue) {
                                        context
                                            .read<TandaVitalKeperawatanBloc>()
                                            .add(OnChangedV(
                                                value: mValue.toString()));
                                      },
                                      items: ListConstants.gcsV
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.sp),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: ThemeColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: DropdownButton<String>(
                                      dropdownColor: ThemeColor.darkColor,
                                      value:
                                          state.vitalSignKeperawatanModel.gcsM,
                                      onChanged: (mValue) {
                                        context
                                            .read<TandaVitalKeperawatanBloc>()
                                            .add(OnChangedM(
                                                value: mValue.toString()));
                                      },
                                      items: ListConstants.gcsM
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleWidget.formBox(
                                  title: "Tekanan Darah",
                                  subTitle: "mmHg",
                                  value: state.vitalSignKeperawatanModel.td,
                                  onChanged: (e) {
                                    context
                                        .read<TandaVitalKeperawatanBloc>()
                                        .add(OnChangedTekananDarahEvent(
                                            value: e));
                                  }),
                              TitleWidget.formBox(
                                  title: "Berat Badan",
                                  subTitle: "kg",
                                  value: state
                                      .vitalSignKeperawatanModel.beratBadan,
                                  onChanged: (e) {
                                    context
                                        .read<TandaVitalKeperawatanBloc>()
                                        .add(
                                            OnChangedBeratBadanEvent(value: e));
                                  }),
                              TitleWidget.formBox(
                                  title: "Pernapasan",
                                  subTitle: "x/i",
                                  onChanged: (e) {
                                    context
                                        .read<TandaVitalKeperawatanBloc>()
                                        .add(
                                            OnChangedPernapasanEvent(value: e));
                                  },
                                  value: state
                                      .vitalSignKeperawatanModel.pernafasan),
                              TitleWidget.formBox(
                                  title: "SPO 2",
                                  subTitle: "%",
                                  onChanged: (e) {
                                    context
                                        .read<TandaVitalKeperawatanBloc>()
                                        .add(OnChangedSPO2Event(value: e));
                                  },
                                  value: state.vitalSignKeperawatanModel.spo2),
                              Container(
                                  margin: EdgeInsets.only(left: 10.sp),
                                  child: Row(
                                    children: [
                                      Text("Akral :",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 5.sp),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.sp),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: ThemeColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: DropdownButton<String>(
                                          dropdownColor: ThemeColor.darkColor,
                                          value: state
                                              .vitalSignKeperawatanModel.akral,
                                          onChanged: (value) {
                                            context
                                                .read<
                                                    TandaVitalKeperawatanBloc>()
                                                .add(OnChangedAkralEvent(
                                                    value: value.toString()));
                                          },
                                          items: ListConstants.akralChoose
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) =>
                                                      DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value,
                                                            style:
                                                                whiteTextStyle),
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
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
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
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 2.sp),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: DropdownButton<String>(
                                        dropdownColor: ThemeColor.darkColor,
                                        value: state.vitalSignKeperawatanModel
                                            .kesadaran,
                                        onChanged: (value) {
                                          context
                                              .read<TandaVitalKeperawatanBloc>()
                                              .add(OnChangedKesadaranEvent(
                                                  value: value.toString()));
                                        },
                                        items: ListConstants.kesadaranManusia
                                            .map<DropdownMenuItem<String>>(
                                                (String value) =>
                                                    DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value,
                                                          style:
                                                              whiteTextStyle),
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
                                    title: "Nadi",
                                    subTitle: "x/menit",
                                    value: state.vitalSignKeperawatanModel.nadi,
                                    onChanged: (e) {
                                      context
                                          .read<TandaVitalKeperawatanBloc>()
                                          .add(OnChangedNadiEvent(value: e));
                                    }),
                                TitleWidget.formBox(
                                    title: "Suhu",
                                    subTitle: "°C",
                                    value: state.vitalSignKeperawatanModel.suhu,
                                    onChanged: (e) {
                                      context
                                          .read<TandaVitalKeperawatanBloc>()
                                          .add(OnChangedSuhuEvent(value: e));
                                    }),
                                TitleWidget.formBox(
                                    title: "Tinggi Badan",
                                    subTitle: "cm",
                                    value: state
                                        .vitalSignKeperawatanModel.tinggiBadan,
                                    onChanged: (e) {
                                      context
                                          .read<TandaVitalKeperawatanBloc>()
                                          .add(OnChangedTinggiBadan(value: e));
                                    }),
                                SizedBox(
                                    child: Row(
                                  children: [
                                    Text(
                                      "Pupil :",
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5.sp,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 2.sp),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: ThemeColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: DropdownButton<String>(
                                        dropdownColor: ThemeColor.darkColor,
                                        value: state
                                            .vitalSignKeperawatanModel.pupil,
                                        onChanged: (value) {
                                          context
                                              .read<TandaVitalKeperawatanBloc>()
                                              .add(OnChangedPupilEvent(
                                                  value: value.toString()));
                                        },
                                        items: ListConstants.pupilChoose
                                            .map<DropdownMenuItem<String>>(
                                                (String value) =>
                                                    DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value,
                                                          style:
                                                              whiteTextStyle),
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
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  Row formBoxGSC(
      {String? labelText,
      String? valueE,
      String? valueV,
      String? valueM,
      dynamic Function(String)? onChangedE,
      dynamic Function(String)? onChangedV,
      dynamic Function(String)? onChangedM,
      TextEditingController? controller}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          child: Text(
            "E :",
            style: blackTextStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 35.sp,
          child: FormWidget.numberForm(
            onChanged: onChangedE,
            enable: true,
            value: valueE,
          ),
        ),
        Container(
            padding: EdgeInsets.only(right: 5.sp),
            child: Text(
              "V :",
              style: blackTextStyle,
            )),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 35.sp,
          child: FormWidget.numberForm(
            onChanged: onChangedV,
            enable: true,
            value: valueV,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          child: Text(
            "M :",
            style: blackTextStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 35.sp,
          child: FormWidget.numberForm(
              onChanged: onChangedM, value: valueM, enable: true),
        ),
      ],
    );
  }
}
