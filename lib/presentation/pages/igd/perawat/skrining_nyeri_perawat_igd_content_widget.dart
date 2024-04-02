import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class SkriningNyeriPerawatContentWidget extends StatefulWidget {
  const SkriningNyeriPerawatContentWidget({super.key});

  @override
  State<SkriningNyeriPerawatContentWidget> createState() =>
      _SkriningNyeriPerawatContentWidgetState();
}

class _SkriningNyeriPerawatContentWidgetState
    extends State<SkriningNyeriPerawatContentWidget> {
  final ScrollController _scrollController = ScrollController();

  String toSkalaTriase({required double skalaTriase}) {
    switch (skalaTriase) {
      case 1:
        return "KETERANGAN : Resusitasi\nRESPONSE TIME: SEGERA";
      case 2:
        return "KETERANGAN : Emergency/Gawat Darurat\nRESPONSE TIME: 10 Menit";
      case 3:
        return "KETERANGAN : Urgent/Darurat\nRESPONSE TIME: 30 Menit";
      case 4:
        return "KETERANGAN : Semi Darurat\nRESPONSE TIME: 60 Menit";
      default:
        return "KETERANGAN : Tidak Darurat\nRESPONSE TIME: 120 Menit";
    }
  }

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

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<TriaseBloc, TriaseState>(
      listener: (context, state) {
        if (state.isLoadingSaveSkriningNyeri) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveSkriningNyeri) {
          EasyLoading.dismiss();
        }

        // ================================= //
        state.saveSkriningNyeri.fold(
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
        return (state.isLoadingGetSkriningNyeri)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                onPressed: () async {
                  // KETIKA TOMBOL DITEKAN
                  dynamic data = await deviceInfo.initPlatformState();
                  // ACTION SIMPAN DATA
                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously
                    context.read<TriaseBloc>().add(
                        TriaseEvent.saveSkriningNyeri(
                            skriningNyeri: state.skriningNyeri,
                            noReg: singlePasien.first.noreg,
                            person: toPerson(person: authState.user.person),
                            deviceID: "ID - ${data['id']} - ${data['device']}}",
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik)));
                  }
                },
                widget: RawScrollbar(
                  thumbColor: ThemeColor.darkColor,
                  thumbVisibility: true,
                  interactive: true,
                  thickness: 10.sp,
                  controller: _scrollController,
                  trackVisibility: false,
                  radius: Radius.circular(5.sp),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: SizedBox(
                      width: Get.width,
                      child: Card(
                        color: ThemeColor.bgColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.sp, color: ThemeColor.blackColor),
                            borderRadius: BorderRadius.circular(2.sp)),
                        child: Column(
                          children: [
                            if (AppConstant.appSetup != AppSetup.methodist) ...[
                              TitleWidget.titleContainer(
                                  title: "Skrining Nyeri"),

                              // ==================== //
                              Slider(
                                value: state.skalaNyeriValue,
                                max: 10,
                                divisions: 10,
                                label: state.skalaNyeriValue.round().toString(),
                                onChanged: (double value) {
                                  context.read<TriaseBloc>().add(
                                      TriaseEvent.skalaNyeriOnchanged(
                                          value: value));
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.read<TriaseBloc>().add(
                                            const TriaseEvent
                                                .skalaNyeriOnchanged(
                                                value: 1.0));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/1.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.read<TriaseBloc>().add(
                                            const TriaseEvent
                                                .skalaNyeriOnchanged(
                                                value: 3.0));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/2.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.read<TriaseBloc>().add(
                                            const TriaseEvent
                                                .skalaNyeriOnchanged(
                                                value: 5.0));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/3.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.read<TriaseBloc>().add(
                                            const TriaseEvent
                                                .skalaNyeriOnchanged(
                                                value: 7.0));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/4.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.read<TriaseBloc>().add(
                                            const TriaseEvent
                                                .skalaNyeriOnchanged(
                                                value: 8.0));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/5.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.read<TriaseBloc>().add(
                                            const TriaseEvent
                                                .skalaNyeriOnchanged(
                                                value: 10.0));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/6.png")),
                                    ),
                                  ],
                                ),
                              ),
                              // ================================
                              SizedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width / 2.5,
                                      child: Text(
                                        "Skala\nNyeri\n${state.skalaNyeriValue.toInt()}",
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
                                                  nyeri:
                                                      state.skalaNyeriValue))),
                                          Text(
                                            toNyeriText(
                                                nyeri: state.skalaNyeriValue),
                                            style: blackTextStyle,
                                          )
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],

                            // ========================== LAMA NYERI
                            TitleWidget.titleContainer(
                                title: "Frekuensi Nyeri"),

                            // ===========================
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants.frekuensiNyeriChoose
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.skriningNyeri
                                                      .frekuensiNyeri ==
                                                  e)
                                              ? const Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  FontAwesomeIcons.xmark,
                                                  color: Colors.white,
                                                ),
                                          backgroundColor: (state.skriningNyeri
                                                      .frekuensiNyeri ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<TriaseBloc>().add(
                                                TriaseEvent
                                                    .frekuensiNyeriOnchanged(
                                                        value: e));
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            TitleWidget.titleContainer(title: "Lama Nyeri"),

                            //  Tampilkan lama nyeri
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 25.sp,
                                    height: 25.sp,
                                    child: FormWidget.numberForm(
                                        enable: true,
                                        onChanged: (value) {
                                          context.read<TriaseBloc>().add(
                                              TriaseEvent.lamaNyeriOnchanged(
                                                  value: value));
                                        }),
                                  ),
                                  Text(
                                    " Hari",
                                    style: blackTextStyle,
                                  )
                                ],
                              ),
                            ),

                            TitleWidget.titleContainer(title: "Menjalar"),
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants.yaTidak
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.skriningNyeri
                                                      .nyeriMenjalar ==
                                                  e)
                                              ? const Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  FontAwesomeIcons.xmark,
                                                  color: Colors.white,
                                                ),
                                          backgroundColor: (state.skriningNyeri
                                                      .nyeriMenjalar ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<TriaseBloc>().add(
                                                TriaseEvent.menjalarOnchanged(
                                                    value: e));

                                            if (e !=
                                                ListConstants.yaTidak.last) {
                                              context.read<TriaseBloc>().add(
                                                  const TriaseEvent
                                                      .menjalarDetailOnchanged(
                                                      value: ""));
                                            }
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),

                            if (state.skriningNyeri.nyeriMenjalar ==
                                ListConstants.yaTidak.last) ...[
                              Padding(
                                padding: EdgeInsets.all(5.sp),
                                child: FormWidget.textArea(
                                    enabled: true,
                                    maxLines: 2,
                                    value: state.skriningNyeri.manjalarDetail,
                                    onChanged: (value) {
                                      context.read<TriaseBloc>().add(
                                          TriaseEvent.menjalarDetailOnchanged(
                                              value: value));
                                    }),
                              ),
                            ],

                            TitleWidget.titleContainer(title: "Kualitas Nyeri"),
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 5.sp),
                              child: Wrap(
                                runAlignment: WrapAlignment.start,
                                runSpacing: 1.sp,
                                spacing: 1.sp,
                                alignment: WrapAlignment.start,
                                children: ListConstants.kualitasNyeri
                                    .map(
                                      (e) => TitleWidget.boxChoose(
                                          icon: (state.skriningNyeri
                                                      .kualitasNyeri ==
                                                  e)
                                              ? const Icon(
                                                  FontAwesomeIcons.check,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  FontAwesomeIcons.xmark,
                                                  color: Colors.white,
                                                ),
                                          backgroundColor: (state.skriningNyeri
                                                      .kualitasNyeri ==
                                                  e)
                                              ? Colors.green
                                              : ThemeColor.primaryColor,
                                          onPressed: () {
                                            context.read<TriaseBloc>().add(
                                                TriaseEvent
                                                    .kualitasNyeriOnchanged(
                                                        value: e));
                                          },
                                          title: e),
                                    )
                                    .toList(),
                              ),
                            ),
                            TitleWidget.titleContainer(title: "Faktor Pemicu"),
                            Padding(
                              padding: EdgeInsets.all(5.sp),
                              child: FormWidget.textArea(
                                  enabled: true,
                                  maxLines: 3,
                                  value: state.skriningNyeri.nyeriPemicu,
                                  onChanged: (value) {
                                    context.read<TriaseBloc>().add(
                                        TriaseEvent.faktorPemicuOnchanged(
                                            value: value));
                                  }),
                            ),
                            TitleWidget.titleContainer(
                                title: "Faktor Mengurangi"),
                            Padding(
                              padding: EdgeInsets.all(5.sp),
                              child: FormWidget.textArea(
                                  enabled: true,
                                  maxLines: 3,
                                  value: state.skriningNyeri.nyeriPengurang,
                                  onChanged: (value) {
                                    context.read<TriaseBloc>().add(
                                        TriaseEvent.faktorMengurangi(
                                            value: value));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
      },
    );
  }
}
