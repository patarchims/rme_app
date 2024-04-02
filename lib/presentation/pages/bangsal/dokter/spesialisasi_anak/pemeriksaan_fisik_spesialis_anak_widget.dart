import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class PemeriksaanFisikSpesialisasiAnak extends StatelessWidget {
  const PemeriksaanFisikSpesialisasiAnak({super.key});

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<PemeriksaanFisikBloc, PemeriksaanFisikState>(
      listener: (context, state) {
        // TODO: implement listener
        log(state.pemeriksaanFisikIgdModel.suaraJantung.toString());

        if (state.isLoadingSavePemeriksaanFisikIgd) {
          EasyLoading.show();
        }

        if (!state.isLoadingSavePemeriksaanFisikIgd) {
          EasyLoading.dismiss();
        }

        state.savePemeriksaanFisikAnakResult.fold(
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
        return (state.isLoadingGetPemeriksaanFisikAnak)
            ? Loading.expandedLoading()
            : HeaderContentWidget(
                isENableAdd: true,
                onPressed: () async {
                  // SIMPAN DATA
                  dynamic data = await deviceInfo.initPlatformState();
                  // LAUKAN SIMPAN DATA
                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously

                    // ignore: use_build_context_synchronously
                    context.read<PemeriksaanFisikBloc>().add(
                        PemeriksaanFisikEvent.onSavePemeriksaanFisikAnak(
                            person: toPerson(person: authState.user.person),
                            deviceID: "ID - ${data['id']} - ${data['device']}}",
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik),
                            noReg: singlePasien.first.noreg,
                            kategori: toKategoriString(
                                spesiliasasi: authState.user.spesialisasi),
                            pemeriksaanFisikAnak: state.pemeriksaanFisikAnak));
                  }
                },
                title: "Simpan",
                widget: SingleChildScrollView(
                  child: Card(
                    color: ThemeColor.bgColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.sp,
                          color: ThemeColor.blackColor,
                        ),
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: Column(
                      children: [
                        TitleWidget.titleContainer(title: "Kepala"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Mata",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.mataAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .mata ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .mata ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .mataOnchanged(value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        TitleWidget.boxPemeriksaanFisik(
                            title: "Mulut",
                            value: state.pemeriksaanFisikAnak.mata,
                            onChanged: (e) {
                              context.read<PemeriksaanFisikBloc>().add(
                                  PemeriksaanFisikEvent.mulutOnchanged(
                                      value: e));
                            }),
                        TitleWidget.boxPemeriksaanFisik(
                            value: state.pemeriksaanFisikAnak.gigi,
                            title: "Gigi",
                            onChanged: (e) {
                              context.read<PemeriksaanFisikBloc>().add(
                                  PemeriksaanFisikEvent.gigiOnchanged(
                                      value: e));
                            }),
                        TitleWidget.titleContainer(title: "Leher"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "KGB",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.kgb
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .thyroid ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .thyroid ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .thyroidOnchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        TitleWidget.titleContainer(title: "Dada"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Paru",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.paruAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .paru ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .paru ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .paruOnchanged(value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Jantung",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.jantungAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.jantungSelection
                                                    .contains(e))
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                    .jantungSelection
                                                    .contains(e))
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .addJantungSelection(
                                                          value: e));

                                              if (state.jantungSelection
                                                  .contains(e)) {
                                                context
                                                    .read<
                                                        PemeriksaanFisikBloc>()
                                                    .add(PemeriksaanFisikEvent
                                                        .deleteJantungSelection(
                                                            value: e));
                                              }

                                              if (state.jantungSelection
                                                  .contains(ListConstants
                                                      .jantungAnak.last)) {
                                                context
                                                    .read<
                                                        PemeriksaanFisikBloc>()
                                                    .add(
                                                        const PemeriksaanFisikEvent
                                                            .jantungOnchanged(
                                                            value: ""));
                                              }
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        if (state.jantungSelection
                            .contains(ListConstants.jantungAnak.last)) ...[
                          Row(
                            children: [
                              SizedBox(
                                width: 55.sp,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: FormWidget.textArea(
                                    enabled: true,
                                    value: state
                                        .pemeriksaanFisikIgdModel.suaraJantung,
                                    onChanged: (value) {
                                      context.read<PemeriksaanFisikBloc>().add(
                                          PemeriksaanFisikEvent
                                              .jantungOnchanged(value: value));
                                    },
                                    maxLines: 3,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                        TitleWidget.titleContainer(title: "Dinding Dada"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Dinding Dada",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.dindingDadaAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .dindingDada ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .dindingDada ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .dadaOnchanged(value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Retraksi epigastrium : ",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: FormWidget.textArea(
                                    value: state.pemeriksaanFisikAnak
                                        .dindingdadaRetEpigastrium,
                                    onChanged: (value) {
                                      context.read<PemeriksaanFisikBloc>().add(
                                          PemeriksaanFisikEvent
                                              .epigastriumOnchanged(
                                                  value: value));
                                    },
                                    maxLines: 3,
                                    enabled: true),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Retraksi suprastemal : ",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: FormWidget.textArea(
                                    value: state.pemeriksaanFisikAnak
                                        .dindingDadaRetSuprastermal,
                                    onChanged: (value) {
                                      context.read<PemeriksaanFisikBloc>().add(
                                          PemeriksaanFisikEvent
                                              .suprastermalOnchanged(
                                                  value: value));
                                    },
                                    maxLines: 3,
                                    enabled: true),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Retraksi :  ",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: FormWidget.textArea(
                                    value: state.pemeriksaanFisikAnak
                                        .dindingDadaRetraksi,
                                    onChanged: (value) {
                                      context.read<PemeriksaanFisikBloc>().add(
                                          PemeriksaanFisikEvent
                                              .retraksiOnchanged(value: value));
                                    },
                                    maxLines: 3,
                                    enabled: true),
                              ),
                            ],
                          ),
                        ),
                        TitleWidget.titleContainer(title: "Abdomen"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Hepar",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.heparAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .hepar ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .hepar ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .heparOnchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Ukuran :  ",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              SizedBox(
                                width: 60.sp,
                                child: FormWidget.numberForm(
                                    enable: true,
                                    value:
                                        state.pemeriksaanFisikAnak.heparDetail,
                                    onChanged: (value) {
                                      context.read<PemeriksaanFisikBloc>().add(
                                          PemeriksaanFisikEvent
                                              .heparDetailOnchanged(
                                                  value: value));
                                    }),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Cm ",
                                    textAlign: TextAlign.left,
                                    style: blackTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Limpa",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.limpaAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .limpa ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .limpa ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .limpaOnchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Ukuran :  ",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              SizedBox(
                                width: 60.sp,
                                child: FormWidget.numberForm(
                                    enable: true,
                                    value:
                                        state.pemeriksaanFisikAnak.limpaDetail,
                                    onChanged: (value) {
                                      context.read<PemeriksaanFisikBloc>().add(
                                          PemeriksaanFisikEvent
                                              .limpaDetailOnchanged(
                                                  value: value));
                                    }),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Cm ",
                                    textAlign: TextAlign.left,
                                    style: blackTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TitleWidget.titleContainer(title: "Pinggang"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Ginjal",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.ginjalAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .ginjal ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .ginjal ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .ginjalOnchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Ukuran :  ",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              SizedBox(
                                width: 60.sp,
                                child: FormWidget.numberForm(
                                    enable: true,
                                    value:
                                        state.pemeriksaanFisikAnak.ginjalDetail,
                                    onChanged: (value) {
                                      context.read<PemeriksaanFisikBloc>().add(
                                          PemeriksaanFisikEvent
                                              .ginjalDetailOnchanged(
                                                  value: value));
                                    }),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Cm ",
                                    textAlign: TextAlign.left,
                                    style: blackTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TitleWidget.titleContainer(title: "Genetalia"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Genetalia",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.genetaliaAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .genetalia ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .genetalia ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .genetaliaOnchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "OUF",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.oufAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .ouf ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .ouf ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .oufOnchanged(value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        TitleWidget.titleContainer(title: "Ekstremitas"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Ekstremitas",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.ekstremitasAnak
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .ekstremitas ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .ekstremitas ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .ekstremitasOnchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.sp,
                                child: Text(
                                  "Tugor Kulit",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  runSpacing: 1.sp,
                                  spacing: 1.sp,
                                  alignment: WrapAlignment.start,
                                  children: ListConstants.tugorKulit
                                      .map(
                                        (e) => TitleWidget.boxChoose(
                                            icon: (state.pemeriksaanFisikAnak
                                                        .tugorKulit ==
                                                    e)
                                                ? const Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    FontAwesomeIcons.xmark,
                                                    color: Colors.white,
                                                  ),
                                            backgroundColor: (state
                                                        .pemeriksaanFisikAnak
                                                        .tugorKulit ==
                                                    e)
                                                ? Colors.green
                                                : ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<PemeriksaanFisikBloc>()
                                                  .add(PemeriksaanFisikEvent
                                                      .tugorKulitOnchanged(
                                                          value: e));
                                            },
                                            title: e),
                                      )
                                      .toList(),
                                )),
                              )
                            ],
                          ),
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
