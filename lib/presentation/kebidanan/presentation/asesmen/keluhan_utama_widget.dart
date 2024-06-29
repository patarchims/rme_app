import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/alergi/alergi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/keluhan_utama_kebidanan/keluhan_utama_kebidanan_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class KeluhanUtamaKebidananWidget extends StatefulWidget {
  const KeluhanUtamaKebidananWidget({super.key});

  @override
  State<KeluhanUtamaKebidananWidget> createState() =>
      _KeluhanUtamaKebidananWidgetState();
}

class _KeluhanUtamaKebidananWidgetState
    extends State<KeluhanUtamaKebidananWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _riwayatKeluargaController;

  @override
  void initState() {
    _riwayatKeluargaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _riwayatKeluargaController.clear();
    _riwayatKeluargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<KeluhanUtamaKebidananBloc, KeluhanUtamaKebidananState>(
      listener: (context, state) {
        // LOADING HEADER

        if (state.status == KeluhanUtamaKebidananStatus.isloadingSaveData) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status == KeluhanUtamaKebidananStatus.isloadingSaveData) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) {
                      // FAILUERE
                    }),
                (r) => r.maybeMap(
                      orElse: () {},
                      loaded: (value) async {
                        // LOADED
                        MetaModel meta =
                            MetaModel.fromJson(value.value["metadata"]);
                        final shouldPop = await Alert.loaded(context,
                            subTitle: meta.message, title: "Pesan");
                        return shouldPop ?? false;
                      },
                    )));
      },
      builder: (context, state) {
        if (state.status == KeluhanUtamaKebidananStatus.isLoadingGetData) {
          return HeaderContentWidget(
              onPressed: () {},
              widget: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Loading.expandedLoading(),
              ));
        }

        return HeaderContentWidget(
            onPressed: () async {
              // SIMPAN DATA
              dynamic data = await deviceInfo.initPlatformState();
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<KeluhanUtamaKebidananBloc>().add(
                    OnSaveAsesmenKebidananEvent(
                        riwayatDahulu: state
                            .asesmenKebidananResponseModel.asesmen.rwytDahulu,
                        noReg: singlePasien.first.noreg,
                        deviceID: "ID-${data['id']}-${data['device']}",
                        keluhanUtama: state
                            .asesmenKebidananResponseModel.asesmen.keluhanUtama,
                        penyakitSekarang:
                            state.asesmenKebidananResponseModel.asesmen
                                .rwytPenyakit,
                        keluhanMenyertai:
                            state.asesmenKebidananResponseModel.asesmen
                                .keluhanMenyertai,
                        riwayatMenstruasi:
                            state
                                .asesmenKebidananResponseModel.asesmen.rwytMenstruasi,
                        siklusHaid:
                            state.asesmenKebidananResponseModel.asesmen
                                .siklusHaid,
                        riwayatPernikahan: state.asesmenKebidananResponseModel
                            .asesmen.rwytPenikahan,
                        person: toPerson(person: authState.user.person),
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
                child: Container(
                  margin: EdgeInsets.only(right: 10.sp),
                  child: Column(
                    children: [
                      TitleWidget.titleContainer(title: "Keluhan Utama"),
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 3,
                            value: state.asesmenKebidananResponseModel.asesmen
                                .keluhanUtama,
                            onChanged: (value) {
                              context.read<KeluhanUtamaKebidananBloc>().add(
                                  OnChangedKeluhanUtamaEvent(value: value));
                            }),
                      ),
                      TitleWidget.titleContainer(
                          title: "Riwayat Penyakit Sekarang"),

                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 2,
                            value: state.asesmenKebidananResponseModel.asesmen
                                .rwytPenyakit,
                            onChanged: (value) {
                              context
                                  .read<KeluhanUtamaKebidananBloc>()
                                  .add(OnChangedRiwayatPenyakit(value: value));
                            }),
                      ),
                      TitleWidget.titleContainer(
                          title: "Riwayat Penyakit Dahulu"),
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 3,
                            value: state.asesmenKebidananResponseModel.asesmen
                                .rwytDahulu,
                            onChanged: (value) {
                              context.read<KeluhanUtamaKebidananBloc>().add(
                                  OnChangedRiwayatPenyakitDahulu(value: value));
                            }),
                      ),
                      TitleWidget.titleContainer(
                          title: "Riwayat Pengobatan Sebelumnya"),
                      //===//
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: (state.asesmenKebidananResponseModel
                                .riwayatTerdahulu.isNotEmpty)
                            ? Wrap(
                                children: state.asesmenKebidananResponseModel
                                    .riwayatTerdahulu
                                    .map(
                                      (e) => Text(
                                        e.riwayatSekarang,
                                        style: blackTextStyle,
                                      ),
                                    )
                                    .toList(),
                              )
                            : SizedBox(
                                height: 35.sp,
                              ),
                      ),
                      TitleWidget.titleContainer(
                          title: "Riwayat Penyakit Keluarga"),

                      Container(
                        width: Get.width,
                        height: 20.sp,
                        margin: EdgeInsets.only(top: 5.sp),
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ThemeColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.sp))),
                          child: const Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            CustomDialogWidget.getDialog(
                                widget: Container(
                                  height: 55.sp,
                                  width: Get.width / 1.5,
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Column(
                                    children: [
                                      TitleWidget.titleContentWidget(
                                          title:
                                              "TAMBAH DATA RIWAYAT PENYAKIT KELUARGA"),
                                      Row(
                                        children: [
                                          Container(
                                              height: 35.sp,
                                              width: Get.width / 2,
                                              padding: EdgeInsets.all(5.sp),
                                              child: FormWidget.textForm(
                                                onFieldSubmitted: (value) {
                                                  if (authState
                                                      is Authenticated) {
                                                    context
                                                        .read<
                                                            KeluhanUtamaKebidananBloc>()
                                                        .add(OnSavePengkajianRiwayatPenyakitKeluarga(
                                                            riwayatPenyakitKelurga:
                                                                _riwayatKeluargaController
                                                                    .text,
                                                            tanggal:
                                                                DateTime.now()
                                                                    .toString()
                                                                    .substring(
                                                                        0, 10),
                                                            noRM:
                                                                singlePasien
                                                                    .first.mrn,
                                                            noReg: singlePasien
                                                                .first.noreg,
                                                            person: toPerson(
                                                                person: authState
                                                                    .user
                                                                    .person)));
                                                  }

                                                  Get.back();
                                                },
                                                validator: (value) {
                                                  if (value!.contains("\n")) {
                                                    Get.back();
                                                  }
                                                  return null;
                                                },
                                                controller:
                                                    _riwayatKeluargaController,
                                                enable: true,
                                              )),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.all(5.sp),
                                              height: 22.sp,
                                              width: Get.width,
                                              child: IconButton(
                                                  onPressed: () {
                                                    if (authState
                                                        is Authenticated) {
                                                      context
                                                          .read<
                                                              KeluhanUtamaKebidananBloc>()
                                                          .add(OnSavePengkajianRiwayatPenyakitKeluarga(
                                                              riwayatPenyakitKelurga:
                                                                  _riwayatKeluargaController
                                                                      .text,
                                                              tanggal: DateTime
                                                                      .now()
                                                                  .toString()
                                                                  .substring(0,
                                                                      10),
                                                              noRM: singlePasien
                                                                  .first.mrn,
                                                              noReg:
                                                                  singlePasien
                                                                      .first
                                                                      .noreg,
                                                              person: toPerson(
                                                                  person: authState
                                                                      .user
                                                                      .person)));
                                                    }
                                                    Get.back();
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          ThemeColor
                                                              .primaryColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(2
                                                                          .sp))),
                                                  color: ThemeColor.whiteColor,
                                                  icon: const Icon(
                                                      FontAwesomeIcons
                                                          .circlePlus)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                color: Colors.transparent);
                          },
                        ),
                      ),
                      Container(
                        height: 85.sp,
                        margin: EdgeInsets.all(5.sp),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: ThemeColor.bgColor,
                          borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Card(
                          elevation: 1,
                          color: ThemeColor.bgColor,
                          child: SizedBox(
                            width: Get.width,
                            child: Wrap(
                              children:
                                  state.asesmenKebidananResponseModel
                                      .riwayatPenyakitKeluarga
                                      .map((e) => SizedBox(
                                            width: 120.sp,
                                            // height: 20.sp,
                                            child: Card(
                                              color: ThemeColor.darkColor,
                                              child: ListTile(
                                                  trailing: IconButton(
                                                    onPressed: () {
                                                      // === //
                                                      // TAMPILKAN PESAN DELETE RIWAYAT ALEG
                                                      // todo : delete alergi
                                                      CustomDialogWidget
                                                          .getDialog(
                                                              widget: MessageAlert
                                                                  .deleteAlert(
                                                                      mesage:
                                                                          "Apakah Anda yakin menghapus data ${e.alergi} ini ?",
                                                                      onPressed:
                                                                          () {
                                                                        //  === DELETE DATA ==== /
                                                                        context.read<AlergiBloc>().add(OnRemovePenyakitKeluargaEvent(
                                                                            nomor:
                                                                                e.nomor,
                                                                            noRm: e.noRm,
                                                                            kelompok: e.kelompok));

                                                                        Get.back();

                                                                        if (authState
                                                                            is Authenticated) {
                                                                          context.read<KeluhanUtamaKebidananBloc>().add(OnGetAsesmenKebidananEvent(
                                                                              noReg: singlePasien.first.noreg,
                                                                              person: toPerson(person: authState.user.person)));
                                                                        }
                                                                      }));
                                                    },
                                                    icon: const Icon(
                                                      FontAwesomeIcons
                                                          .circleMinus,
                                                      color: ThemeColor
                                                          .dangerColor,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    e.alergi,
                                                    style: whiteTextStyle,
                                                  )),
                                            ),
                                          ))
                                      .toList(),
                            ),
                          ),
                        ),
                      ),
                      TitleWidget.titleContainer(
                          title: "Keluhan Yang Menyertai"),
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 2,
                            value: state.asesmenKebidananResponseModel.asesmen
                                .keluhanMenyertai,
                            onChanged: (value) {
                              context
                                  .read<KeluhanUtamaKebidananBloc>()
                                  .add(OnChangedKeluhanMenyertai(value: value));
                            }),
                      ),
                      TitleWidget.titleContainer(title: "Riwayat Menstruasi"),
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 2,
                            value: state.asesmenKebidananResponseModel.asesmen
                                .rwytMenstruasi,
                            onChanged: (value) {
                              context.read<KeluhanUtamaKebidananBloc>().add(
                                  OnChangedRiwayatMenstruasi(value: value));
                            }),
                      ),
                      TitleWidget.titleContainer(title: "Siklus Haid"),
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 2,
                            value: state.asesmenKebidananResponseModel.asesmen
                                .siklusHaid,
                            onChanged: (value) {
                              context
                                  .read<KeluhanUtamaKebidananBloc>()
                                  .add(OnChangedSiklusHaid(value: value));
                            }),
                      ),
                      TitleWidget.titleContainer(title: "Riwayat Pernikahan"),
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 2,
                            value: state.asesmenKebidananResponseModel.asesmen
                                .rwytPenikahan,
                            onChanged: (value) {
                              context.read<KeluhanUtamaKebidananBloc>().add(
                                  OnChangedRiwayatPernikahan(value: value));
                            }),
                      ),
                      SizedBox(
                        height: 15.sp,
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
