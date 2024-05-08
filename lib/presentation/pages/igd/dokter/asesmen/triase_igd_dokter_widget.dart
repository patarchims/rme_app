import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/pages/igd/bloc/triase_igd_dokter/triase_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class TriaseIGD extends StatefulWidget {
  const TriaseIGD({super.key});

  @override
  State<TriaseIGD> createState() => _TriaseIGDState();
}

class _TriaseIGDState extends State<TriaseIGD> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _penyebabCederaController =
      TextEditingController();
  late TextEditingController _ngangguanPerilakuController =
      TextEditingController();

  @override
  void initState() {
    _penyebabCederaController = TextEditingController();
    _ngangguanPerilakuController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _penyebabCederaController.clear();
    _penyebabCederaController.dispose();
    _ngangguanPerilakuController.clear();
    _ngangguanPerilakuController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;
    return BlocConsumer<TriaseIgdDokterBloc, TriaseIgdDokterState>(
      listener: (context, state) {
        if (state.status == TriaseIGDDokterStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != TriaseIGDDokterStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                      orElse: () {},
                      failure: (e) async {
                        log("ERROR FAILURE $e");
                        // TAMPILKAN PESAN KESALAHAN
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString());
                        return shouldPop ?? false;
                      },
                    ),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      // LOADED
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == TriaseIGDDokterStatus.isLoadingGet) {
          return HeaderContentWidget(
              onPressed: () {}, widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            isENableAdd: true,
            backgroundColor: ThemeColor.bgColor,
            title: "Simpan",
            onPressed: () async {
              // ON SAVE DATA
              if (authState is Authenticated) {
                dynamic data = await deviceInfo.initPlatformState();
                // ignore: use_build_context_synchronously
                // ignore: use_build_context_synchronously
                context.read<TriaseIgdDokterBloc>().add(
                    OnSaveTriaseIGDDokterEvent(
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person),
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        devicesID: "ID:${data['id']}-${data['device']}",
                        kategori: toPerson(person: authState.user.person),
                        triase: state.triaseIgdDokterModel.copyWith(
                            gangguanPerilaku: _ngangguanPerilakuController.text,
                            penyebabCedera: _penyebabCederaController.text)));
              }

              log(state.triaseIgdDokterModel.toJson().toString());
            },
            widget: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 10.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.only(right: 5.sp),
                children: [
                  // TAMPILKAN ALASAN DATA // ===== //
                  TitleWidget.titleContainer(title: "Alasan Datang"),
                  contentBox(
                      title: "ALASAN DATANG",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: alasanDatang.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  backgroundColor:
                                      (state.triaseIgdDokterModel.alasanMasuk ==
                                              e.value)
                                          ? ThemeColor.greenColor
                                          : ThemeColor.primaryColor,
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<TriaseIgdDokterBloc>().add(
                                        OnChangedAlasanDatang(value: e.value));
                                  },
                                  icon:
                                      (state.triaseIgdDokterModel.alasanMasuk ==
                                              e.value)
                                          ? const Icon(
                                              FontAwesomeIcons.check,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.white,
                                            ),
                                  title: e.value,
                                );
                              }).toList(),
                            ),

                            //===//
                          ],
                        ),
                      )),

                  TitleWidget.titleContainer(title: "Penyebab Cedera"),

                  Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: Text(state.triaseIgdDokterModel.penyebabCedera,
                          style: blackTextStyle)),

                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: cedera
                          .map(
                            (e) => SearchFieldListItem(
                              e,
                              item: e.toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      validator: (x) {
                        return null;
                      },

                      // CONTROLLER
                      controller: _penyebabCederaController,
                      onSubmit: (value) {},
                      onSaved: (a) {},
                      searchInputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                  TitleWidget.titleContainer(title: "Gangguan Perilaku"),

                  Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: Text(
                        state.triaseIgdDokterModel.gangguanPerilaku,
                        style: blackTextStyle,
                      )),

                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: gangguan
                          .map(
                            (e) => SearchFieldListItem(
                              e,
                              item: e.toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      validator: (x) {
                        return null;
                      },

                      // CONTROLLER
                      controller: _ngangguanPerilakuController,
                      onSubmit: (value) {},
                      onSaved: (a) {},
                      searchInputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                  TitleWidget.titleContainer(
                      title: "Status Kehamilan (Khusus Obgyn)"),

                  //===//
                  contentBox(
                      title: "HAMIL",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: hamil.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  backgroundColor:
                                      (state.triaseIgdDokterModel.kehamilan ==
                                              e.value)
                                          ? ThemeColor.greenColor
                                          : ThemeColor.primaryColor,
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<TriaseIgdDokterBloc>().add(
                                        OnChangedKehamilan(value: e.value));
                                  },
                                  icon: (state.triaseIgdDokterModel.kehamilan ==
                                          e.value)
                                      ? const Icon(
                                          FontAwesomeIcons.check,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          FontAwesomeIcons.minus,
                                          color: Colors.white,
                                        ),
                                  title: e.value,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      )),

                  Row(
                    children: [
                      SizedBox(
                        width: Get.width / 2.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleWidget.formBox(
                                title: "Gravida",
                                subTitle: "",
                                value: state.triaseIgdDokterModel.gravida,
                                onChanged: (e) {
                                  context
                                      .read<TriaseIgdDokterBloc>()
                                      .add(OnChangedGravida(value: e));
                                }),
                            TitleWidget.formBox(
                                title: "Para",
                                subTitle: "",
                                value: state.triaseIgdDokterModel.para,
                                onChanged: (e) {
                                  context
                                      .read<TriaseIgdDokterBloc>()
                                      .add(OnChangedPara(value: e));
                                }),
                            TitleWidget.formBox(
                                title: "Abortus",
                                subTitle: "",
                                value: state.triaseIgdDokterModel.abortus,
                                onChanged: (e) {
                                  context
                                      .read<TriaseIgdDokterBloc>()
                                      .add(OnChangedAbortus(value: e));
                                }),
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
                                  title: "HPHT",
                                  subTitle: "",
                                  value: state.triaseIgdDokterModel.hpht,
                                  onChanged: (e) {
                                    context
                                        .read<TriaseIgdDokterBloc>()
                                        .add(OnChangedHPHT(value: e));
                                  }),
                              TitleWidget.formBox(
                                  title: "DDJ",
                                  subTitle: "",
                                  value: state.triaseIgdDokterModel.ddj,
                                  onChanged: (e) {
                                    context
                                        .read<TriaseIgdDokterBloc>()
                                        .add(OnChangedDDJEvent(value: e));
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  TitleWidget.titleContainer(title: "Skala Nyeri"),
                  // === //

                  Slider(
                    value: state.triaseIgdDokterModel.skalaNyeri.toDouble(),
                    max: 10,
                    divisions: 10,
                    label: state.triaseIgdDokterModel.skalaNyeri
                        .round()
                        .toString(),
                    onChanged: (double value) {
                      context
                          .read<TriaseIgdDokterBloc>()
                          .add(OnChangedSkalaNyeri(value: value));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<TriaseIgdDokterBloc>()
                                .add(OnChangedSkalaNyeri(value: 1));
                          },
                          child: SizedBox(
                              height: 20.sp,
                              child: Image.asset("assets/images/nyeri/1.png")),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<TriaseIgdDokterBloc>()
                                .add(OnChangedSkalaNyeri(value: 3));
                          },
                          child: SizedBox(
                              height: 20.sp,
                              child: Image.asset("assets/images/nyeri/2.png")),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<TriaseIgdDokterBloc>()
                                .add(OnChangedSkalaNyeri(value: 5));
                          },
                          child: SizedBox(
                              height: 20.sp,
                              child: Image.asset("assets/images/nyeri/3.png")),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<TriaseIgdDokterBloc>()
                                .add(OnChangedSkalaNyeri(value: 7));
                          },
                          child: SizedBox(
                              height: 20.sp,
                              child: Image.asset("assets/images/nyeri/4.png")),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<TriaseIgdDokterBloc>()
                                .add(OnChangedSkalaNyeri(value: 8));
                          },
                          child: SizedBox(
                              height: 20.sp,
                              child: Image.asset("assets/images/nyeri/5.png")),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<TriaseIgdDokterBloc>()
                                .add(OnChangedSkalaNyeri(value: 10));
                          },
                          child: SizedBox(
                              height: 20.sp,
                              child: Image.asset("assets/images/nyeri/6.png")),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                      child: Row(
                    children: [
                      SizedBox(
                        width: Get.width / 2.5,
                        child: Text(
                          "Skala\nNyeri\n${state.triaseIgdDokterModel.skalaNyeri.toInt()}",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                                height: 50.sp,
                                child: Image.asset(toNyeri(
                                    nyeri: state.triaseIgdDokterModel.skalaNyeri
                                        .toDouble()))),
                            Text(
                              toNyeriText(
                                  nyeri: state.triaseIgdDokterModel.skalaNyeri
                                      .toDouble()),
                              style: blackTextStyle,
                            )
                          ],
                        ),
                      )),
                    ],
                  )),
                  TitleWidget.formBox(
                      title: "P",
                      subTitle: "",
                      value: state.triaseIgdDokterModel.nyeriP,
                      labelText: "Isikan Deskripsi Provokatif Disini",
                      onChanged: (value) {
                        context
                            .read<TriaseIgdDokterBloc>()
                            .add(OnChangedPEvent(value: value));
                      }),
                  TitleWidget.formBox(
                    title: "Q",
                    subTitle: "",
                    value: state.triaseIgdDokterModel.nyeriQ,
                    onChanged: (value) {
                      context
                          .read<TriaseIgdDokterBloc>()
                          .add(OnChangedQEvent(value: value));
                    },
                    labelText: "Isikan Deskripsi Quality Disini",
                  ),
                  TitleWidget.formBox(
                      title: "R",
                      subTitle: "",
                      value: state.triaseIgdDokterModel.nyeriR,
                      labelText: "Isikan Deskripsi Radiant Disini",
                      onChanged: (value) {
                        context
                            .read<TriaseIgdDokterBloc>()
                            .add(OnChangedREvent(value: value));
                      }),
                  TitleWidget.formBox(
                      title: "S",
                      subTitle: "",
                      value: state.triaseIgdDokterModel.nyeriS,
                      labelText: "Isikan Deskripsi Severity Disini",
                      onChanged: (value) {
                        context
                            .read<TriaseIgdDokterBloc>()
                            .add(OnChangedSEvent(value: value));
                      }),
                  TitleWidget.formBox(
                      title: "T",
                      subTitle: "",
                      value: state.triaseIgdDokterModel.nyeriT,
                      labelText: "Isikan Deskripsi Time Disini",
                      onChanged: (e) {
                        context
                            .read<TriaseIgdDokterBloc>()
                            .add(OnChangedTEvent(value: e));
                      }),
                  TitleWidget.titleContainer(
                      title: "Skala FLACC (Anak < 6 Tahun)"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width / 4,
                        height: 150.sp,
                        child: Lottie.asset(AppConstant.kidsAnimation,
                            height: Get.height, reverse: true, repeat: true),
                      ),
                      Expanded(
                          child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ===================== //

                            TitleWidget.headerTitle(title: "Wajah"),
                            Wrap(
                              runSpacing: 5.sp,
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 5.sp,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: kids1
                                  .asMap()
                                  .entries
                                  .map((e) => SizedBox(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    side: (state.triaseIgdDokterModel
                                                                .flagWajah ==
                                                            e.key + 1)
                                                        ? BorderSide(
                                                            width: 1.sp,
                                                            color: ThemeColor
                                                                .blackColor)
                                                        : BorderSide(
                                                            width: 0.sp,
                                                          ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (state.triaseIgdDokterModel
                                                                .flagWajah ==
                                                            e.key + 1)
                                                        ? ThemeColor.greenColor
                                                        : ThemeColor
                                                            .primaryColor),
                                            onPressed: () {
                                              context
                                                  .read<TriaseIgdDokterBloc>()
                                                  .add(OnChangedFlaggWajah(
                                                      value: e.key + 1));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.value,
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 5.sp),
                                              ),
                                            )),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            TitleWidget.headerTitle(title: "Kaki"),
                            Wrap(
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 5.sp,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: kids2
                                  .asMap()
                                  .entries
                                  .map((e) => SizedBox(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    side:
                                                        (state.triaseIgdDokterModel
                                                                    .flagKaki ==
                                                                e.key + 1)
                                                            ? BorderSide(
                                                                width: 1.sp,
                                                                color: ThemeColor
                                                                    .blackColor)
                                                            : BorderSide(
                                                                width: 0.sp,
                                                              ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (state.triaseIgdDokterModel
                                                                .flagKaki ==
                                                            e.key + 1)
                                                        ? ThemeColor.greenColor
                                                        : ThemeColor
                                                            .primaryColor),
                                            onPressed: () {
                                              context
                                                  .read<TriaseIgdDokterBloc>()
                                                  .add(OnChangedFlaggKaki(
                                                      value: e.key + 1));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.value,
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 5.sp),
                                              ),
                                            )),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            TitleWidget.headerTitle(title: "Aktifitas"),

                            Wrap(
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 5.sp,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: kids3
                                  .asMap()
                                  .entries
                                  .map((e) => SizedBox(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    side: (state.triaseIgdDokterModel
                                                                .flagAktifitas ==
                                                            e.key + 1)
                                                        ? BorderSide(
                                                            width: 1.sp,
                                                            color: ThemeColor
                                                                .blackColor)
                                                        : BorderSide(
                                                            width: 0.sp,
                                                          ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor: (state
                                                            .triaseIgdDokterModel
                                                            .flagAktifitas ==
                                                        e.key + 1)
                                                    ? ThemeColor.greenColor
                                                    : ThemeColor.primaryColor),
                                            onPressed: () {
                                              context
                                                  .read<TriaseIgdDokterBloc>()
                                                  .add(OnChangedFlaggAktifitas(
                                                      value: e.key + 1));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.value,
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 5.sp),
                                              ),
                                            )),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            TitleWidget.headerTitle(title: "Menangis"),

                            Wrap(
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 5.sp,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: kids4
                                  .asMap()
                                  .entries
                                  .map((e) => SizedBox(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    side: (state.triaseIgdDokterModel
                                                                .flagMenangis ==
                                                            e.key + 1)
                                                        ? BorderSide(
                                                            width: 1.sp,
                                                            color: ThemeColor
                                                                .blackColor)
                                                        : BorderSide(
                                                            width: 0.sp,
                                                          ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (state.triaseIgdDokterModel
                                                                .flagMenangis ==
                                                            e.key + 1)
                                                        ? ThemeColor.greenColor
                                                        : ThemeColor
                                                            .primaryColor),
                                            onPressed: () {
                                              context
                                                  .read<TriaseIgdDokterBloc>()
                                                  .add(OnChangedFlaggMenangis(
                                                      value: e.key + 1));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.value,
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 5.sp),
                                              ),
                                            )),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            TitleWidget.headerTitle(title: "Bersuara"),
                            Wrap(
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.spaceAround,
                              spacing: 5.sp,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: kids5
                                  .asMap()
                                  .entries
                                  .map((e) => SizedBox(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    side: (state.triaseIgdDokterModel
                                                                .flagBersuara ==
                                                            e.key + 1)
                                                        ? BorderSide(
                                                            width: 1.sp,
                                                            color: ThemeColor
                                                                .blackColor)
                                                        : BorderSide(
                                                            width: 0.sp,
                                                          ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                backgroundColor:
                                                    (state.triaseIgdDokterModel
                                                                .flagBersuara ==
                                                            e.key + 1)
                                                        ? ThemeColor.greenColor
                                                        : ThemeColor
                                                            .primaryColor),
                                            onPressed: () {
                                              context
                                                  .read<TriaseIgdDokterBloc>()
                                                  .add(OnChangedFlaggBersuara(
                                                      value: e.key + 1));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.value,
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 5.sp),
                                              ),
                                            )),
                                      ))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),

                  TitleWidget.titleContainer(title: "Skala Triase"),

                  // === //
                  SizedBox(height: 5.sp),

                  // ===== //
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    width: Get.width,
                    child: SizedBox(
                        width: Get.width / 3,
                        height: 15.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: (state.triaseIgdDokterModel
                                                .skalaTriase ==
                                            "Resusitasi")
                                        ? BorderSide(
                                            width: 1.sp, color: Colors.black)
                                        : BorderSide(
                                            width: 0.sp,
                                          ),
                                    borderRadius: BorderRadius.circular(2.sp)),
                                backgroundColor: ThemeColor.redColor),
                            onPressed: () {
                              context.read<TriaseIgdDokterBloc>().add(
                                  OnChangedSkalaTriase(value: "Resusitasi"));
                            },
                            child: Text("Resusitasi", style: whiteTextStyle))),
                  ),
                  SizedBox(height: 5.sp),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    width: Get.width,
                    child: SizedBox(
                        width: Get.width / 3,
                        height: 15.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: (state.triaseIgdDokterModel
                                                .skalaTriase ==
                                            "Emergency / Gawat Darurat")
                                        ? BorderSide(
                                            width: 1.sp, color: Colors.black)
                                        : BorderSide(
                                            width: 0.sp,
                                          ),
                                    borderRadius: BorderRadius.circular(2.sp)),
                                backgroundColor: ThemeColor.yellowColor),
                            onPressed: () {
                              context.read<TriaseIgdDokterBloc>().add(
                                  OnChangedSkalaTriase(
                                      value: "Emergency / Gawat Darurat"));
                            },
                            child: Text("Emergency / Gawat Darurat",
                                style: blackTextStyle))),
                  ),

                  SizedBox(height: 5.sp),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    width: Get.width,
                    child: SizedBox(
                        width: Get.width / 3,
                        height: 15.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: (state.triaseIgdDokterModel.skalaTriase ==
                                        "Urgent / Darurat")
                                    ? BorderSide(
                                        width: 1.sp, color: Colors.black)
                                    : BorderSide(
                                        width: 0.sp,
                                      ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.sp)),
                                backgroundColor:
                                    ThemeColor.yellowColor.withOpacity(0.8)),
                            onPressed: () {
                              context.read<TriaseIgdDokterBloc>().add(
                                  OnChangedSkalaTriase(
                                      value: "Urgent / Darurat"));
                            },
                            child: Text("Urgent / Darurat",
                                style: blackTextStyle))),
                  ),

                  SizedBox(height: 5.sp),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    width: Get.width,
                    child: SizedBox(
                        width: Get.width / 3,
                        height: 15.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: (state.triaseIgdDokterModel
                                                .skalaTriase ==
                                            "Semi / Darurat")
                                        ? BorderSide(
                                            width: 1.sp, color: Colors.black)
                                        : BorderSide(
                                            width: 0.sp,
                                          ),
                                    borderRadius: BorderRadius.circular(2.sp)),
                                backgroundColor: ThemeColor.greenColor),
                            onPressed: () {
                              context.read<TriaseIgdDokterBloc>().add(
                                  OnChangedSkalaTriase(
                                      value: "Semi / Darurat"));
                            },
                            child:
                                Text("Semi / Darurat", style: whiteTextStyle))),
                  ),
                  SizedBox(height: 5.sp),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    width: Get.width,
                    child: SizedBox(
                        width: Get.width / 3,
                        height: 15.sp,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                side: (state.triaseIgdDokterModel.skalaTriase ==
                                        "Tidak Darurat")
                                    ? BorderSide(
                                        width: 1.sp, color: Colors.black)
                                    : BorderSide(
                                        width: 0.sp,
                                      ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.sp)),
                                backgroundColor:
                                    ThemeColor.greenColor.withOpacity(0.8)),
                            onPressed: () {
                              // === //
                              context.read<TriaseIgdDokterBloc>().add(
                                  OnChangedSkalaTriase(value: "Tidak Darurat"));
                            },
                            child:
                                Text("Tidak Darurat", style: whiteTextStyle))),
                  ),

                  SizedBox(
                    height: 15.sp,
                  )
                ],
              ),
            ));
      },
    );
  }

  Container contentBox({required String title, required Widget widget}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.sp,
      ),
      child: Table(
        border: TableBorder.all(color: ThemeColor.bgColor),
        columnWidths: const {
          1: FlexColumnWidth(4),
          2: FlexColumnWidth(1.2),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 6.sp),
              ),
            ),
            widget
          ]),
        ],
      ),
    );
  }
}

List<String> alasanDatang = [
  "Penyakit",
  "Ruda Paksa",
  "Cedera",
];
List<String> hamil = [
  "Hamil",
  "Tidak Hamil",
];

String toNyeriText({required double nyeri}) {
  switch (nyeri) {
    case 1:
      return "Tidak Ada Nyeri";
    case 2:
      return "Nyeri Ringan";
    case 3:
      return "Nyeri Ringan";
    case 4:
      return "Nyeri Yang Menganggu";
    case 5:
      return "Nyeri Yang Menganggu";
    case 6:
      return "Nyeri Yang Menyusahkan";
    case 7:
      return "Nyeri Yang Menyusahkan";
    case 8:
      return "Nyeri Hebat";
    case 9:
      return "Nyeri Hebat";
    case 10:
      return "Nyeri Sangat Hebat";
    default:
      return "Tidak Ada Nyeri";
  }
}

String toNyeri({required double nyeri}) {
  switch (nyeri) {
    case 1:
      return "assets/images/nyeri/1.png";
    case 2:
      return "assets/images/nyeri/2.png";
    case 3:
      return "assets/images/nyeri/2.png";
    case 4:
      return "assets/images/nyeri/3.png";
    case 5:
      return "assets/images/nyeri/3.png";
    case 6:
      return "assets/images/nyeri/4.png";
    case 7:
      return "assets/images/nyeri/5.png";
    case 8:
      return "assets/images/nyeri/5.png";
    case 9:
      return "assets/images/nyeri/6.png";
    case 10:
      return "assets/images/nyeri/6.png";
    default:
      return "assets/images/nyeri/1.png";
  }
}

List<String> skala = ["Wajah", "Kaki", "Aktifitas", "Menangis", "Bersuara"];
List<String> cedera = ["Kecelakaan Lalu Lintas (KKL)", "Trauma"];
List<String> gangguan = [
  "Tidak Terganggu",
  "Ada Gangguan : Tidak membahayakan",
  "Ada Gangguan Membahayakan diri sendiri/orang lain"
];

List<String> kids = ["Wajah", "Kaki", "Aktifitas", "Menangis", "Bersuara"];
List<String> kids1 = [
  "Tersenyum/Tidak\nAda Ekspresi Khusus",
  "Terkadang Menangis\n/Menarik Diri",
  "Sering Mengertakan\nDagu Dan Mengatupkan Rahang"
];
List<String> kids2 = [
  "Gerakan Normal\n/Relaksasi",
  "Tidak Tenang\nTegang",
  "Kaki Dibuatkan\nMenendang\nMenarik Diri"
];
List<String> kids3 = [
  "Tidur, Posisi Normal\n/Relaksasi",
  "Gerakan Menggeliat,\nBerguling, Kaku",
  "Melengkungkan Punggung\n/Kaku/Menghentak",
];
List<String> kids4 = [
  "Tidak Menangis (Bangun Tidur)",
  "Mengerang, Merengek-rengek",
  "Menangis Terus Menerus,\nTerhisak, Menjerit"
];
List<String> kids5 = [
  "Bersuara Normal\nTenang",
  "Tenang Bila Dipeluk,\nDigendong Atau Diajak Bicara",
  "Sulit Menenangkan"
];
