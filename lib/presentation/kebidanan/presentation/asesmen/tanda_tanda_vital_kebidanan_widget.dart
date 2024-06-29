import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TandaTandaVitalKebidananWidgetPage extends StatelessWidget {
  const TandaTandaVitalKebidananWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<KebidananBloc, KebidananState>(
      listener: (context, state) {
        if (state.kebidananStatus ==
            KebidananStatus.isLoadingSaveVitalSignBidan) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }
        if (state.kebidananStatus !=
            KebidananStatus.isLoadingSaveVitalSignBidan) {
          EasyLoading.dismiss();
        }

        // SATE
        state.saveVitalSignResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) async {
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.kebidananStatus ==
            KebidananStatus.isLoadingGetVitalSignBidan) {
          return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: null,
            title: "Simpan",
            widget: Loading.expandedLoading(),
          );
        }
        return HeaderContentWidget(
            isENableAdd: true,
            onPressed: () async {
              // SIMPAN DATA

              if (authState is Authenticated) {
                dynamic data = await deviceInfo.initPlatformState();

                // ignore: use_build_context_synchronously
                context
                    .read<KebidananBloc>()
                    .add(OnSaveTandaTandaVitalSignKebidanan(
                      tfu: state.vitalSignBidanModel.tfu,
                      deviceID: "ID - ${data['id']} - ${data['device']}",
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      person: toPerson(person: authState.user.person),
                      noReg: singlePasien.first.noreg,
                      tekananDarah: state.vitalSignBidanModel.tekananDarah,
                      nadi: state.vitalSignBidanModel.nadi,
                      pernapasan: state.vitalSignBidanModel.pernapasan,
                      suhu: state.vitalSignBidanModel.suhu,
                      ddj: state.vitalSignBidanModel.ddj,
                      tinggiBadan: state.vitalSignBidanModel.tinggiBadan,
                      beratBadan: state.vitalSignBidanModel.beratBadan,
                      gcsE: state.vitalSignBidanModel.gcsE,
                      gcsV: state.vitalSignBidanModel.gcsV,
                      akral: state.vitalSignBidanModel.akral,
                      kesadaran: state.vitalSignBidanModel.kesadaran,
                      pupil: state.vitalSignBidanModel.pupil,
                      gcsM: state.vitalSignBidanModel.gcsM,
                    ));
              }
            },
            title: "SIMPAN",
            widget: SingleChildScrollView(
              child: Card(
                color: ThemeColor.bgColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.sp, color: ThemeColor.blackColor),
                    borderRadius: BorderRadius.circular(2.sp)),
                child: Column(
                  children: [
                    TitleWidget.titleContainer(title: "TANDA - TANDA VITAL"),
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
                                  value: state.vitalSignBidanModel.tekananDarah,
                                  onChanged: (e) {
                                    context
                                        .read<KebidananBloc>()
                                        .add(OnChangedTekananDarah(value: e));
                                  }),
                              TitleWidget.formBox(
                                title: "Pernapasan",
                                subTitle: "x/i",
                                value: state.vitalSignBidanModel.pernapasan,
                                onChanged: (e) {
                                  context
                                      .read<KebidananBloc>()
                                      .add(OnChangedPernapasan(value: e));
                                },
                              ),
                              TitleWidget.formBox(
                                  title: "Suhu",
                                  subTitle: "°C",
                                  value: state.vitalSignBidanModel.suhu,
                                  onChanged: (e) {
                                    context
                                        .read<KebidananBloc>()
                                        .add(OnChangedSuhu(value: e));
                                  }),
                              TitleWidget.formBox(
                                  title: "Nadi",
                                  subTitle: "x/i",
                                  value: state.vitalSignBidanModel.nadi,
                                  onChanged: (e) {
                                    context
                                        .read<KebidananBloc>()
                                        .add(OnChangedNadi(value: e));
                                  }),
                              Container(
                                  margin: EdgeInsets.only(left: 15.sp),
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
                                          value: state
                                              .vitalSignBidanModel.kesadaran,
                                          onChanged: (value) {
                                            context.read<KebidananBloc>().add(
                                                OnChangedTandaKebidananKesadaran(
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
                                    title: "DDJ",
                                    subTitle: "x/menit",
                                    value: state.vitalSignBidanModel.ddj,
                                    onChanged: (e) {
                                      context
                                          .read<KebidananBloc>()
                                          .add(OnChangedDDJ(value: e));
                                    }),
                                TitleWidget.formBox(
                                    title: "Berat Badan",
                                    subTitle: "kg",
                                    value: state.vitalSignBidanModel.beratBadan,
                                    onChanged: (e) {
                                      context
                                          .read<KebidananBloc>()
                                          .add(OnChangedBeratBadan(value: e));
                                    }),
                                TitleWidget.formBox(
                                    title: "Tinggi Badan",
                                    subTitle: "cm",
                                    value:
                                        state.vitalSignBidanModel.tinggiBadan,
                                    onChanged: (e) {
                                      context
                                          .read<KebidananBloc>()
                                          .add(OnChangedTinggiBadan(value: e));
                                    }),
                                Container(
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.sp, vertical: 4.sp),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 30.sp,
                                        child:
                                            Text("GCS", style: blackTextStyle),
                                      ),
                                      SizedBox(
                                          width: 45.sp,
                                          child: Row(
                                            children: [
                                              Text(
                                                "E :",
                                                style: blackTextStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5.sp,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.sp),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        ThemeColor.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: DropdownButton<String>(
                                                  dropdownColor:
                                                      ThemeColor.darkColor,
                                                  value: state
                                                      .vitalSignBidanModel.gcsE,
                                                  onChanged: (eValue) {
                                                    context
                                                        .read<KebidananBloc>()
                                                        .add(OnChangedGcsE(
                                                            value: eValue
                                                                .toString()));
                                                  },
                                                  items: ListConstants.gcsE
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child: Text(
                                                                  value,
                                                                  style:
                                                                      whiteTextStyle,
                                                                ),
                                                              ))
                                                      .toList(),
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color:
                                                        ThemeColor.primaryColor,
                                                  ),
                                                  iconSize: 42,
                                                  underline: const SizedBox(),
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                          width: 45.sp,
                                          child: Row(
                                            children: [
                                              Text(
                                                "V :",
                                                style: blackTextStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5.sp,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.sp),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        ThemeColor.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: DropdownButton<String>(
                                                  dropdownColor:
                                                      ThemeColor.darkColor,
                                                  value: state
                                                      .vitalSignBidanModel.gcsV,
                                                  onChanged: (mValue) {
                                                    context
                                                        .read<KebidananBloc>()
                                                        .add(OnChangedGcsV(
                                                            value: mValue
                                                                .toString()));
                                                  },
                                                  items: ListConstants.gcsV
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child: Text(
                                                                  value,
                                                                  style:
                                                                      whiteTextStyle,
                                                                ),
                                                              ))
                                                      .toList(),
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color:
                                                        ThemeColor.primaryColor,
                                                  ),
                                                  iconSize: 42,
                                                  underline: const SizedBox(),
                                                ),
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                          width: 45.sp,
                                          child: Row(
                                            children: [
                                              Text(
                                                "M :",
                                                style: blackTextStyle.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 5.sp,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.sp),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        ThemeColor.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: DropdownButton<String>(
                                                  dropdownColor:
                                                      ThemeColor.darkColor,
                                                  value: state
                                                      .vitalSignBidanModel.gcsM,
                                                  onChanged: (mValue) {
                                                    context
                                                        .read<KebidananBloc>()
                                                        .add(OnChangedGcsM(
                                                            value: mValue
                                                                .toString()));
                                                  },
                                                  items: ListConstants.gcsM
                                                      .map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) =>
                                                              DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child: Text(
                                                                    value,
                                                                    style:
                                                                        whiteTextStyle),
                                                              ))
                                                      .toList(),
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color:
                                                        ThemeColor.primaryColor,
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
                                        value: state.vitalSignBidanModel.pupil,
                                        onChanged: (value) {
                                          context.read<KebidananBloc>().add(
                                              OnChangeTandaKebidananPupil(
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
                                Container(
                                    margin: EdgeInsets.only(top: 5.sp),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Akral :",
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
                                            value:
                                                state.vitalSignBidanModel.akral,
                                            onChanged: (value) {
                                              context.read<KebidananBloc>().add(
                                                  OnChangedTandaKebidananAkral(
                                                      value: value.toString()));
                                            },
                                            items: ListConstants.akralChoose
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) =>
                                                        DropdownMenuItem<
                                                            String>(
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
                                SizedBox(
                                  height: 15.sp,
                                )
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
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
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
              style: blackTextStyle.copyWith(fontSize: 6.sp),
            )),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
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
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
          child: FormWidget.numberForm(
              onChanged: onChangedM, value: valueM, enable: true),
        ),
      ],
    );
  }
}
