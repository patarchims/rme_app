import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../domain/models/meta/meta_model.dart';

class PemeriksaanFisikKebidananContentWidget extends StatefulWidget {
  const PemeriksaanFisikKebidananContentWidget({super.key});

  @override
  State<PemeriksaanFisikKebidananContentWidget> createState() =>
      _PemeriksaanFisikKebidananContentWidgetState();
}

class _PemeriksaanFisikKebidananContentWidgetState
    extends State<PemeriksaanFisikKebidananContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<KebidananBloc, KebidananState>(
      listener: (context, state) {
        if (state.kebidananStatus ==
            KebidananStatus.isLoadingPemeriksaanFisikKebidanan) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (state.kebidananStatus !=
            KebidananStatus.isLoadingPemeriksaanFisikKebidanan) {
          EasyLoading.dismiss();
        }

        state.savePemeriksaanFisikResult.fold(
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
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      final meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        // GET PENKAJIAN FISIK KEBIDANAN
        return HeaderContentWidget(
            isENableAdd: true,
            onPressed: () async {
              // SIMPAN DATA
              if (authState is Authenticated) {
                dynamic data = await deviceInfo.initPlatformState();

                // ignore: use_build_context_synchronously
                context
                    .read<KebidananBloc>()
                    .add(OnSavePemeriksaanFisikKebidahan(
                      deviceID: "ID - ${data['id']} - ${data['device']}",
                      person: toPerson(person: authState.user.person),
                      kdBagian: authState.user.bagian,
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      noReg: singlePasien.first.noreg,
                      kepala: (state.pemeriksaanFisik.kepala != "Lainnya")
                          ? state.pemeriksaanFisik.kepala
                          : state.pemeriksaanFisikLainnya.kepala,
                      mata: (state.pemeriksaanFisik.mata != "Lainnya")
                          ? state.pemeriksaanFisik.mata
                          : state.pemeriksaanFisikLainnya.mata,
                      telinga: (state.pemeriksaanFisik.telinga != "Lainnya")
                          ? state.pemeriksaanFisik.telinga
                          : state.pemeriksaanFisikLainnya.telinga,
                      mulut: (state.pemeriksaanFisik.mulut != "Lainnya")
                          ? state.pemeriksaanFisik.mulut
                          : state.pemeriksaanFisikLainnya.mulut,
                      gigi: (state.pemeriksaanFisik.gigi != "Lainnya")
                          ? state.pemeriksaanFisik.gigi
                          : state.pemeriksaanFisikLainnya.gigi,
                      hidung: (state.pemeriksaanFisik.hidung != "Lainnya")
                          ? state.pemeriksaanFisik.hidung
                          : state.pemeriksaanFisikLainnya.hidung,
                      tenggorokan:
                          (state.pemeriksaanFisik.tenggorokan != "Lainnya")
                              ? state.pemeriksaanFisik.tenggorokan
                              : state.pemeriksaanFisikLainnya.tenggorokan,
                      payudara: (state.pemeriksaanFisik.payudara != "Lainnya")
                          ? state.pemeriksaanFisik.payudara
                          : state.pemeriksaanFisikLainnya.payudara,
                      leherDanBahu:
                          (state.pemeriksaanFisik.leherDanBahu != "Lainnya")
                              ? state.pemeriksaanFisik.leherDanBahu
                              : state.pemeriksaanFisikLainnya.leherDanBahu,
                      mucosaMulut:
                          (state.pemeriksaanFisik.mucosaMulut != "Lainnya")
                              ? state.pemeriksaanFisik.mucosaMulut
                              : state.pemeriksaanFisikLainnya.mucosaMulut,
                      abdomen: (state.pemeriksaanFisik.abdomen != "Lainnya")
                          ? state.pemeriksaanFisik.abdomen
                          : state.pemeriksaanFisikLainnya.abdomen,
                      nutrisiDanHidrasi:
                          (state.pemeriksaanFisik.nutrisiDanHidrasi !=
                                  "Lainnya")
                              ? state.pemeriksaanFisik.nutrisiDanHidrasi
                              : state.pemeriksaanFisikLainnya.nutrisiDanHidrasi,
                    ));
              }
            },
            title: "Simpan",
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
                children: [
                  TitleWidget.headerTitle(title: "PEMERIKSAAN FISIK"),
                  contentBox(
                      title: "KEPALA",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: kepala.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: (state
                                          .pemeriksaanFisik.kepala
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  width: 90.sp,
                                  onPressed: () {
                                    context
                                        .read<KebidananBloc>()
                                        .add(OnSelectionKepala(value: e.value));
                                  },
                                  icon: (state.pemeriksaanFisik.kepala
                                          .contains(e.value))
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

                            // TAMPILKAN TEXT FIELD
                            if (state.pemeriksaanFisik.kepala
                                .contains(kepala.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state.pemeriksaanFisikLainnya.kepala,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangedKepalaLainnya(value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "MATA",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: mata.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  backgroundColor: (state.pemeriksaanFisik.mata
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  onPressed: () {
                                    context
                                        .read<KebidananBloc>()
                                        .add(OnSelectionMata(value: e.value));
                                  },
                                  icon: (state.pemeriksaanFisik.mata
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.mata
                                .contains(mata.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state.pemeriksaanFisikLainnya.mata,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangeMataLainnya(value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "TELINGA",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: telinga.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: (state
                                          .pemeriksaanFisik.telinga
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<KebidananBloc>().add(
                                        OnSelectionTelinga(value: e.value));
                                  },
                                  icon: (state.pemeriksaanFisik.telinga
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.telinga
                                .contains(telinga.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    value:
                                        state.pemeriksaanFisikLainnya.telinga,
                                    enable: true,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangedTelingaLainnya(
                                              value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "LEHER DAN BAHU",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: leherDanBahu.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: (state
                                          .pemeriksaanFisik.leherDanBahu
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<KebidananBloc>().add(
                                        OnSelectionLeherDanBahu(
                                            value: e.value));
                                  },
                                  icon: (state.pemeriksaanFisik.leherDanBahu
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.leherDanBahu
                                .contains(leherDanBahu.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state
                                        .pemeriksaanFisikLainnya.leherDanBahu,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangedLeherDanBahuLainnya(
                                              value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "MULUT",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: leherDanBahu.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  backgroundColor: (state.pemeriksaanFisik.mulut
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  onPressed: () {
                                    context
                                        .read<KebidananBloc>()
                                        .add(OnSelecteionMulut(value: e.value));
                                  },
                                  icon: (state.pemeriksaanFisik.mulut
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.mulut
                                .contains(mulut.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state.pemeriksaanFisikLainnya.mulut,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnchangedMulutLainnya(value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "MUCOSA MULUT",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: mucosa.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<KebidananBloc>().add(
                                        OnSelectionMucosaMulut(value: e.value));
                                  },
                                  backgroundColor: (state
                                          .pemeriksaanFisik.mucosaMulut
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  icon: (state.pemeriksaanFisik.mucosaMulut
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.mucosaMulut
                                .contains(mucosa.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state
                                        .pemeriksaanFisikLainnya.mucosaMulut,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangedMucosaMulutLainnya(
                                              value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "GIGI",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: gigi.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  onPressed: () {
                                    context
                                        .read<KebidananBloc>()
                                        .add(OnSelectionGigi(value: e.value));
                                  },
                                  backgroundColor: (state.pemeriksaanFisik.gigi
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  icon: (state.pemeriksaanFisik.gigi
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.gigi
                                .contains(gigi.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state.pemeriksaanFisikLainnya.gigi,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangedGigiLainnya(value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "HIDUNG",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: hidung.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  onPressed: () {
                                    context
                                        .read<KebidananBloc>()
                                        .add(OnSelectionHidung(value: e.value));
                                  },
                                  backgroundColor: (state
                                          .pemeriksaanFisik.hidung
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  icon: (state.pemeriksaanFisik.hidung
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.hidung
                                .contains(hidung.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state.pemeriksaanFisikLainnya.hidung,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnchangedHidungLainnya(value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "TENGGOROKAN",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: tenggorokan.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<KebidananBloc>().add(
                                        OnSelectionTenggorakan(value: e.value));
                                  },
                                  backgroundColor: (state
                                          .pemeriksaanFisik.tenggorokan
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  icon: (state.pemeriksaanFisik.tenggorokan
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.tenggorokan
                                .contains(tenggorokan.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state
                                        .pemeriksaanFisikLainnya.tenggorokan,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangedTenggorokanLainya(
                                              value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "PAYUDARA",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: payudara.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<KebidananBloc>().add(
                                        OnSelectionPayudara(value: e.value));
                                  },
                                  backgroundColor: (state
                                          .pemeriksaanFisik.payudara
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  icon: (state.pemeriksaanFisik.payudara
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.payudara
                                .contains(payudara.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state
                                        .pemeriksaanFisikLainnya.tenggorokan,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangedTenggorokanLainya(
                                              value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "ABDOMEN",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children: abdomen.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<KebidananBloc>().add(
                                        OnSelectionAbdomen(value: e.value));
                                  },
                                  backgroundColor: (state
                                          .pemeriksaanFisik.abdomen
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  icon: (state.pemeriksaanFisik.abdomen
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.abdomen
                                .contains(abdomen.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(enable: true),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
                  ),
                  contentBox(
                      title: "NUTRISI & HIDRASI",
                      widget: Container(
                        width: Get.width,
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Column(
                          children: [
                            Wrap(
                              children:
                                  nutrisiDanHidrasi.asMap().entries.map((e) {
                                return TitleWidget.boxChoose(
                                  width: 90.sp,
                                  onPressed: () {
                                    context.read<KebidananBloc>().add(
                                        OnSelectionNutrisiDanHidrasi(
                                            value: e.value));
                                  },
                                  backgroundColor: (state
                                          .pemeriksaanFisik.nutrisiDanHidrasi
                                          .contains(e.value))
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor,
                                  icon: (state
                                          .pemeriksaanFisik.nutrisiDanHidrasi
                                          .contains(e.value))
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
                            if (state.pemeriksaanFisik.nutrisiDanHidrasi
                                .contains(nutrisiDanHidrasi.last)) ...[
                              SizedBox(
                                height: 20.sp,
                                width: Get.width / 2,
                                child: FormWidget.textForm(
                                    enable: true,
                                    value: state.pemeriksaanFisikLainnya
                                        .nutrisiDanHidrasi,
                                    onChanged: (value) {
                                      context.read<KebidananBloc>().add(
                                          OnChangedNutrisiDahHidrasiLainnya(
                                              value: value));
                                    }),
                              )
                            ]
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const Divider(),
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

List<String> kepala = ["TAK", "Nyeri", "Haematom", "Lainnya"];
List<String> mata = ["TAK", "Pandangan Kabur", "Lainnya"];
List<String> telinga = ["TAK", "Nyeri", "Lainnya"];
List<String> leherDanBahu = ["TAK", "Nyeri", "Lainnya"];
List<String> mulut = ["TAK", "Randang", "Lainnya"];
List<String> mucosa = ["TAK", "Lembab", "Gusi Berdarah", "Lainnya"];
List<String> gigi = ["TAK", "Gigi Palsu", "Berlubang", "Lainnya"];
List<String> hidung = ["TAK", "Polip Membesar", "Lainnya"];
List<String> tenggorokan = ["TAK", "Sakit Menelan", "Lainnya"];
List<String> payudara = ["TAK", "Nyeri", "Bengkak", "Lainnya"];
List<String> abdomen = ["TAK", "Perut Membesar", "Lainnya"];
List<String> nutrisiDanHidrasi = [
  "TAK",
  "Mual",
  "Muntah",
  "Mulas",
  "Tidak Selera Makan",
  "Lainnya"
];
