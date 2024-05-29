import 'dart:developer';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
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
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_kebidanan/pengkajian_kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/repository/asesmen_kebidanan_model_response.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class PengkajianKebidananWidgetContent extends StatefulWidget {
  const PengkajianKebidananWidgetContent({super.key});

  @override
  State<PengkajianKebidananWidgetContent> createState() =>
      _PengkajianKebidananWidgetContentState();
}

class _PengkajianKebidananWidgetContentState
    extends State<PengkajianKebidananWidgetContent> {
  final ScrollController _scrollController = ScrollController();

  late String haidTerakhir;
  late String perkiraanPartus;

  @override
  void initState() {
    haidTerakhir = DateTime.now().toString().substring(0, 10);
    perkiraanPartus = DateTime.now().toString().substring(0, 10);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PengkajianKebidananBloc, PengkajianKebidananState>(
      listener: (context, state) {
        if (state.status == PengkajianKebidananStatus.isLoadingSavePengkajian) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (state.status != PengkajianKebidananStatus.isLoadingSavePengkajian) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
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
                      // GET DATA
                      if (authState is Authenticated) {
                        context.read<PengkajianKebidananBloc>().add(
                            OnGetAsesmenKebidananEvent(
                                noReg: singlePasien.first.noreg,
                                person:
                                    toPerson(person: authState.user.person)));
                      }

                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == PengkajianKebidananStatus.isLoadingGet) {
          return HeaderContentWidget(
            widget: Loading.expandedLoading(),
          );
        }
        return HeaderContentWidget(
            isENableAdd: true,
            onPressed: () async {
              if (authState is Authenticated) {
                dynamic data = await deviceInfo.initPlatformState();

                // ignore: use_build_context_synchronously
                context.read<PengkajianKebidananBloc>().add(
                    OnSaveAsesmenKebidananEvent(
                        dpjp: singlePasien.first.kdDokter,
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        asesmenKebidananModel: AsesmenKebidananModel(
                          palpasi: state.pengkajianKebidanan.palpasi,
                          nyeriTekan: state.pengkajianKebidanan.nyeriTekan,
                          tbj: state.pengkajianKebidanan.tbj,
                          tfu: state.pengkajianKebidanan.tfu,
                          hamilMuda: state.pengkajianKebidanan.hamilMuda,
                          hamilTua: state.pengkajianKebidanan.hamilTua,
                          gravida: state.pengkajianKebidanan.gravida,
                          abortus: state.pengkajianKebidanan.abortus,
                          para: state.pengkajianKebidanan.para,
                          haid: state.pengkajianKebidanan.haid,
                          haidTerakhir: state.pengkajianKebidanan.haidTerakhir,
                          usiaKehamilan:
                              state.pengkajianKebidanan.usiaKehamilan,
                          partusHpl: state.pengkajianKebidanan.partusHpl,
                          leopold1: state.pengkajianKebidanan.leopold1,
                          leopold2: state.pengkajianKebidanan.leopold2,
                          leopold3: state.pengkajianKebidanan.leopold3,
                          leopold4: state.pengkajianKebidanan.leopold4,
                          hodge: state.pengkajianKebidanan.hodge,
                          inspeksi: state.pengkajianKebidanan.inspeksi,
                          inspekuloV: state.pengkajianKebidanan.inspekuloV,
                          inspekuloP: state.pengkajianKebidanan.inspekuloP,
                          pemeriksaanDalam:
                              state.pengkajianKebidanan.pemeriksaanDalam,
                        ),
                        noReg: singlePasien.first.noreg,
                        devicesID: "ID-${data['id']} - ${data['device']}",
                        person: toPerson(person: authState.user.person)));
              }
            },
            title: "Simpan",
            widget: Container(
                color: ThemeColor.bgColor,
                height: Get.height,
                width: Get.width,
                child: RawScrollbar(
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
                      Container(
                        height: 30.sp,
                        width: Get.width,
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(color: ThemeColor.bgColor),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Kehamilan Sekarang",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              Container(
                                color: ThemeColor.bgColor,
                                child: Wrap(
                                  children: [
                                    SizedBox(
                                      width: 80.sp,
                                      child: Row(
                                        children: [
                                          Text(
                                            "G :  ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 50.sp,
                                            child: FormWidget.textForm(
                                              value: state
                                                  .pengkajianKebidanan.gravida,
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(OnChangedKehamilanG(
                                                        value: value));
                                              },
                                              enable: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.sp,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Ab :  ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 50.sp,
                                            child: FormWidget.textForm(
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(OnChangedKehamilanAB(
                                                        value: value));
                                              },
                                              value: state
                                                  .pengkajianKebidanan.abortus,
                                              enable: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.sp,
                                      child: Row(
                                        children: [
                                          Text(
                                            "P :  ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 50.sp,
                                            child: FormWidget.textForm(
                                              onChanged: (value) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(OnChangedKehamilanP(
                                                        value: value));
                                              },
                                              value: state
                                                  .pengkajianKebidanan.para,
                                              enable: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: const Divider()),

                      // == //
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 100.sp,
                        widget: Wrap(
                          children: haidChoose.asMap().entries.map((e) {
                            if (state.pengkajianKebidanan.haid == e.value) {
                              return TitleWidget.boxChoose(
                                backgroundColor: ThemeColor.greenColor,
                                onPressed: () {
                                  context
                                      .read<PengkajianKebidananBloc>()
                                      .add(OnChangedHaidEvent(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }
                            return TitleWidget.boxChoose(
                              backgroundColor: ThemeColor.primaryColor,
                              onPressed: () {
                                context
                                    .read<PengkajianKebidananBloc>()
                                    .add(OnChangedHaidEvent(value: e.value));
                              },
                              icon: const Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                              ),
                              title: e.value,
                            );
                          }).toList(),
                        ),
                        title: "  Haid",
                      ),

                      // === //
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: const Divider()),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Haid Terakhir",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (state.pengkajianKebidanan.haidTerakhir
                                                  .length >
                                              10)
                                          ? state
                                              .pengkajianKebidanan.haidTerakhir
                                              .substring(0, 10)
                                          : state
                                              .pengkajianKebidanan.haidTerakhir,
                                      style: blackTextStyle,
                                    ),
                                    DateTimeField(
                                      format: DateFormat("yyyy-MM-dd"),
                                      onChanged: (value) {
                                        context
                                            .read<PengkajianKebidananBloc>()
                                            .add(OnChangedHaidterakhir(
                                                value: value.toString()));
                                      },
                                      onShowPicker:
                                          (context, currentValue) async {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate:
                                                currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: const Divider()),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Usia Kehamilan",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              SizedBox(
                                width: Get.width,
                                height: 25.sp,
                                child: FormWidget.numberForm(
                                    enable: true,
                                    value:
                                        state.pengkajianKebidanan.usiaKehamilan,
                                    onChanged: (value) {
                                      context
                                          .read<PengkajianKebidananBloc>()
                                          .add(OnChangedUsiaKehamilanEvent(
                                              value: value));
                                    }),
                              )
                            ]),
                          ],
                        ),
                      ),

                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: const Divider()),

                      // ============= //
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Perkiraan Partus / HPL",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.pengkajianKebidanan.partusHpl,
                                      style: blackTextStyle,
                                    ),
                                    DateTimeField(
                                      format: DateFormat("yyyy-MM-dd"),
                                      onChanged: (value) {
                                        context
                                            .read<PengkajianKebidananBloc>()
                                            .add(OnChangePerkiraanPartus(
                                                value: value
                                                    .toString()
                                                    .substring(0, 10)));
                                      },
                                      onShowPicker:
                                          (context, currentValue) async {
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate:
                                                currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: const Divider(),
                      ),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 100.sp,
                        widget: Wrap(
                          children: hamilMuda.asMap().entries.map((e) {
                            if (state.pengkajianKebidanan.hamilMuda ==
                                e.value) {
                              return TitleWidget.boxChoose(
                                backgroundColor: ThemeColor.greenColor,
                                onPressed: () {
                                  context.read<PengkajianKebidananBloc>().add(
                                      OnChangedHamilMudaEvent(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }
                            return TitleWidget.boxChoose(
                              backgroundColor: ThemeColor.primaryColor,
                              onPressed: () {
                                context.read<PengkajianKebidananBloc>().add(
                                    OnChangedHamilMudaEvent(value: e.value));
                              },
                              icon: const Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                              ),
                              title: e.value,
                            );
                          }).toList(),
                        ),
                        title: "  Hamil Muda",
                      ),

                      // ==== //
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: const Divider()),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 100.sp,
                        widget: Wrap(
                          children: hamilTua.asMap().entries.map((e) {
                            if (state.pengkajianKebidanan.hamilTua == e.value) {
                              return TitleWidget.boxChoose(
                                backgroundColor: ThemeColor.greenColor,
                                onPressed: () {
                                  context.read<PengkajianKebidananBloc>().add(
                                      OnChangedHamilTuaEvent(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }
                            return TitleWidget.boxChoose(
                              backgroundColor: ThemeColor.primaryColor,
                              onPressed: () {
                                context.read<PengkajianKebidananBloc>().add(
                                    OnChangedHamilTuaEvent(value: e.value));
                              },
                              icon: const Icon(
                                FontAwesomeIcons.check,
                                color: Colors.white,
                              ),
                              title: e.value,
                            );
                          }).toList(),
                        ),
                        title: "  Hamil Tua",
                      ),

                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: const Divider()),
                      TitleWidget.headerTitle(title: "OBSTETRIK"),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Palpasi : Leopold",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                color: ThemeColor.bgColor,
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 5.sp,
                                  runSpacing: 5.sp,
                                  children: [
                                    SizedBox(
                                      width: 100.sp,
                                      child: Row(
                                        children: [
                                          Text(
                                            "I   :  ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 80.sp,
                                            child: FormWidget.textForm(
                                              value: state
                                                  .pengkajianKebidanan.leopold1,
                                              onChanged: (v) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(OnChangedLeopold1(
                                                        value: v));
                                              },
                                              enable: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.sp,
                                      child: Row(
                                        children: [
                                          Text(
                                            "II :  ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 80.sp,
                                            child: FormWidget.textForm(
                                              value: state
                                                  .pengkajianKebidanan.leopold2,
                                              onChanged: (v) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(OnChangedLeopold2(
                                                        value: v));
                                              },
                                              enable: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.sp,
                                      child: Row(
                                        children: [
                                          Text(
                                            "III :  ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 80.sp,
                                            child: FormWidget.textForm(
                                              value: state
                                                  .pengkajianKebidanan.leopold3,
                                              onChanged: (v) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(OnChangedLeopold3(
                                                        value: v));
                                              },
                                              enable: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.sp,
                                      child: Row(
                                        children: [
                                          Text(
                                            "IV :  ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 80.sp,
                                            child: FormWidget.textForm(
                                              value: state
                                                  .pengkajianKebidanan.leopold4,
                                              onChanged: (v) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(OnChangedLeopold4(
                                                        value: v));
                                              },
                                              enable: true,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: const Divider(),
                      ),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {},
                          children: [
                            TableRow(children: [
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                color: ThemeColor.bgColor,
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 1.sp,
                                  runSpacing: 1.sp,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 5,
                                      child: Row(
                                        children: [
                                          Text(
                                            "TFU   ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 45.sp,
                                            child: FormWidget.textForm(
                                              onChanged: (v) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(
                                                        OnChangedTfu(value: v));
                                              },
                                              enable: true,
                                              value:
                                                  state.pengkajianKebidanan.tfu,
                                            ),
                                          ),
                                          Text(
                                            "    cm  ",
                                            style: blackTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 5,
                                      child: Row(
                                        children: [
                                          Text(
                                            "TBJ   ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 45.sp,
                                            child: FormWidget.textForm(
                                              value:
                                                  state.pengkajianKebidanan.tbj,
                                              onChanged: (v) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(
                                                        OnChangedTbj(value: v));
                                              },
                                              enable: true,
                                            ),
                                          ),
                                          Text(
                                            "    gram  ",
                                            style: blackTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width / 5,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Nyeri Tekan   ",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 40.sp,
                                            child: FormWidget.textForm(
                                              value: state.pengkajianKebidanan
                                                  .nyeriTekan,
                                              onChanged: (v) {
                                                context
                                                    .read<
                                                        PengkajianKebidananBloc>()
                                                    .add(OnChangedNyeriTekan(
                                                        value: v));
                                              },
                                              enable: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: const Divider(),
                      ),
                      TitleWidget.headerTitle(title: "GYNEKOLOGI"),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Hodge",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                color: ThemeColor.bgColor,
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 5.sp,
                                  runSpacing: 5.sp,
                                  children: [
                                    FormWidget.textForm(
                                      value: state.pengkajianKebidanan.hodge,
                                      onChanged: (v) {
                                        context
                                            .read<PengkajianKebidananBloc>()
                                            .add(OnChangedHodgeEvent(value: v));
                                      },
                                      enable: true,
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: const Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Inspeksi",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                color: ThemeColor.bgColor,
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 5.sp,
                                  runSpacing: 5.sp,
                                  children: [
                                    FormWidget.textForm(
                                      value: state.pengkajianKebidanan.inspeksi,
                                      onChanged: (v) {
                                        context
                                            .read<PengkajianKebidananBloc>()
                                            .add(OnchangedInspeksiEvent(
                                                value: v));
                                      },
                                      enable: true,
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: const Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Palpasi",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                color: ThemeColor.bgColor,
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 5.sp,
                                  runSpacing: 5.sp,
                                  children: [
                                    FormWidget.textForm(
                                      value: state.pengkajianKebidanan.palpasi,
                                      onChanged: (v) {
                                        context
                                            .read<PengkajianKebidananBloc>()
                                            .add(OnChangedPalpasiEvent(
                                                value: v));
                                      },
                                      enable: true,
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: const Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Inspekulo",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                color: ThemeColor.bgColor,
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 5.sp,
                                  runSpacing: 5.sp,
                                  children: [
                                    Text(
                                      "Vagina",
                                      style: blackTextStyle,
                                    ),
                                    SizedBox(
                                      width: 100.sp,
                                      child: FormWidget.textForm(
                                        value: state
                                            .pengkajianKebidanan.inspekuloV,
                                        onChanged: (v) {
                                          context
                                              .read<PengkajianKebidananBloc>()
                                              .add(OnChangedInspekuloV(
                                                  value: v));
                                        },
                                        enable: true,
                                      ),
                                    ),
                                    Text(
                                      "Portio",
                                      style: blackTextStyle,
                                    ),
                                    SizedBox(
                                      width: 100.sp,
                                      child: FormWidget.textForm(
                                        onChanged: (v) {
                                          context
                                              .read<PengkajianKebidananBloc>()
                                              .add(OnChangedInspekuloP(
                                                  value: v));
                                        },
                                        value: state
                                            .pengkajianKebidanan.inspekuloP,
                                        enable: true,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: const Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(1.2),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Pemeriksaan dalam",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                color: ThemeColor.bgColor,
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceAround,
                                  spacing: 5.sp,
                                  runSpacing: 5.sp,
                                  children: [
                                    FormWidget.textForm(
                                      value: state
                                          .pengkajianKebidanan.pemeriksaanDalam,
                                      onChanged: (v) {
                                        context
                                            .read<PengkajianKebidananBloc>()
                                            .add(OnChangedPemeriksaanDalam(
                                                value: v));
                                      },
                                      enable: true,
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
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
              style: blackTextStyle,
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
            style: blackTextStyle,
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

List<String> haidChoose = ["TAK", "Menarchoe", "Spoting", "Menorrhagia"];
List<String> jenisPengkajian = [
  "Autoanamnese",
  "Alloanamnese",
];
List<String> hamilMuda = [
  "TAK",
  "Pusing",
  "Muntah",
  "Pendarahan",
];
List<String> hamilTua = [
  "TAK",
  "Pusing",
  "Sakit Kepala",
  "Pendarahan",
];
