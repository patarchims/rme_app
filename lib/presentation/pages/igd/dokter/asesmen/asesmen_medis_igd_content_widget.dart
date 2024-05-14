import 'dart:developer';

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
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/pages/igd/bloc/keluhan_utama/keluhan_utama_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/screens/emty_obat_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class AsesmenMedisIGdContentWidget extends StatefulWidget {
  const AsesmenMedisIGdContentWidget({super.key});

  @override
  State<AsesmenMedisIGdContentWidget> createState() =>
      _AsesmenMedisIGdContentWidgetState();
}

class _AsesmenMedisIGdContentWidgetState
    extends State<AsesmenMedisIGdContentWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _riwayatPenyakitKeluarga;

  @override
  void initState() {
    _riwayatPenyakitKeluarga = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _riwayatPenyakitKeluarga.clear();
    _riwayatPenyakitKeluarga.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<KeluhanUtamaBloc, KeluhanUtamaState>(
      listener: (context, state) {
        if (state.status == KeluhanUtamaStatus.isLoadingSave) {
          EasyLoading.show();
        }
        if (state.status != KeluhanUtamaStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      log(e.toString());
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
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == KeluhanUtamaStatus.loading) {
          return HeaderContentWidget(
            isENableAdd: true,
            onPressed: () {},
            title: "Simpan",
            widget: Loading.expandedLoading(),
          );
        }
        return HeaderContentWidget(
          isENableAdd: true,
          title: "Simpan",
          onPressed: () async {
            if (authState is Authenticated) {
              dynamic data = await deviceInfo.initPlatformState();

              // ignore: use_build_context_synchronously
              context.read<KeluhanUtamaBloc>().add(OnSaveKeluhanUtamaEvent(
                  deviceID: "ID-${data['id']}-${data['device']}",
                  noRM: singlePasien.first.mrn,
                  noReg: singlePasien.first.noreg,
                  tanggal: DateTime.now().toString().substring(0, 10),
                  person: toPerson(person: authState.user.person),
                  keluhanUtama: state.keluhanUtamaDokterIgd.asesmen.keluhUtama,
                  riwayatSekarang:
                      state.keluhanUtamaDokterIgd.asesmen.rwtSekarang,
                  pelayanan:
                      toPelayanan(poliklinik: authState.user.poliklinik)));
            }
          },
          widget: RawScrollbar(
            key: formKey,
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
                width: Get.width,
                child: Card(
                  color: ThemeColor.bgColor,
                  shape: RoundedRectangleBorder(
                      side:
                          BorderSide(width: 1.sp, color: ThemeColor.blackColor),
                      borderRadius: BorderRadius.circular(2.sp)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget.titleContainer(title: "Keluhan Utama"),
                      Padding(
                        padding: EdgeInsets.all(3.sp),
                        child: FormWidget.textArea(
                          enabled: true,
                          value: state.keluhanUtamaDokterIgd.asesmen.keluhUtama,
                          onChanged: (value) {
                            context
                                .read<KeluhanUtamaBloc>()
                                .add(OnChangedKeluhanUtama(valu: value));
                          },
                          maxLines: 5,
                        ),
                      ),
                      TitleWidget.titleContainer(
                          title: "Riwayat Penyakit Sekarang"),
                      Padding(
                        padding: EdgeInsets.all(3.sp),
                        child: FormWidget.textArea(
                          enabled: true,
                          value:
                              state.keluhanUtamaDokterIgd.asesmen.rwtSekarang,
                          onChanged: (value) {
                            context
                                .read<KeluhanUtamaBloc>()
                                .add(OnChangedRiwayatSekarang(value: value));
                          },
                          maxLines: 5,
                        ),
                      ),
                      TitleWidget.titleContainer(
                          title: "Riwayat Penyakit Dahulu"),
                      Padding(
                        padding: EdgeInsets.all(3.sp),
                        child: Wrap(
                          children: (state.keluhanUtamaDokterIgd
                                  .riwayatTerdahulu.isNotEmpty)
                              ? state.keluhanUtamaDokterIgd.riwayatTerdahulu
                                  .map((e) => Padding(
                                        padding: EdgeInsets.all(1.sp),
                                        child: Card(
                                          margin: EdgeInsets.all(5.sp),
                                          color: ThemeColor.bgColor,
                                          child: Text(
                                            "${e.tglMasuk.toString().substring(0, 10)} - ${e.riwayatSekarang.toString()},",
                                            style: blackTextStyle,
                                          ),
                                        ),
                                      ))
                                  .toList()
                              : [
                                  Container(
                                    height: 35.sp,
                                  )
                                ],
                        ),
                      ),
                      TitleWidget.titleContainer(
                          title: "Riwayat Penyakit Keluarga"),
                      SizedBox(height: 5.sp),
                      Container(
                        width: Get.width,
                        height: 20.sp,
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
                            // SIMPAN DATA PENYAKIT KELUARGA
                            CustomDialogWidget.getDialog(
                                widget: Container(
                                  width: Get.width / 1.5,
                                  height: 55.sp,
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
                                                    context.read<KeluhanUtamaBloc>().add(
                                                        OnSaveRiwayatKeluargaEvent(
                                                            value:
                                                                _riwayatPenyakitKeluarga
                                                                    .text,
                                                            noRM: singlePasien
                                                                .first.mrn,
                                                            noReg: singlePasien
                                                                .first.noreg,
                                                            tanggal:
                                                                DateTime.now()
                                                                    .toString()
                                                                    .substring(
                                                                        0, 10),
                                                            person: toPerson(
                                                                person: authState
                                                                    .user
                                                                    .person),
                                                            pelayanan: toPelayanan(
                                                                poliklinik:
                                                                    authState
                                                                        .user
                                                                        .poliklinik)));
                                                  }
                                                  Get.back();
                                                },
                                                controller:
                                                    _riwayatPenyakitKeluarga,
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
                                                      context.read<KeluhanUtamaBloc>().add(OnSaveRiwayatKeluargaEvent(
                                                          value:
                                                              _riwayatPenyakitKeluarga
                                                                  .text,
                                                          noRM: singlePasien
                                                              .first.mrn,
                                                          noReg:
                                                              singlePasien
                                                                  .first.noreg,
                                                          tanggal:
                                                              DateTime.now()
                                                                  .toString()
                                                                  .substring(
                                                                      0, 10),
                                                          person: toPerson(
                                                              person: authState
                                                                  .user.person),
                                                          pelayanan: toPelayanan(
                                                              poliklinik: authState
                                                                  .user
                                                                  .poliklinik)));
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
                        height: 150.sp,
                        margin: EdgeInsets.all(5.sp),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: ThemeColor.bgColor,
                          borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Card(
                          elevation: 1,
                          color: ThemeColor.whiteColor,
                          child: SizedBox(
                            width: Get.width,
                            child: Wrap(
                              children:
                                  (state.keluhanUtamaDokterIgd.riwayatKeluarga
                                          .isNotEmpty)
                                      ? state
                                          .keluhanUtamaDokterIgd.riwayatKeluarga
                                          .map((e) => SizedBox(
                                                width: 120.sp,
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
                                                                                nomor: e.nomor,
                                                                                noRm: e.noRm,
                                                                                kelompok: e.kelompok));

                                                                            if (authState
                                                                                is Authenticated) {
                                                                              context.read<KeluhanUtamaBloc>().add(OnGetKeluhanUtamaEvent(noRM: singlePasien.first.mrn, noReg: singlePasien.first.noreg, tanggal: DateTime.now().toString().substring(0, 10), person: toPerson(person: authState.user.person), pelayanan: toPelayanan(poliklinik: authState.user.poliklinik)));
                                                                            }
                                                                            Get.back();
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
                                          .toList()
                                      : [
                                          //====//
                                          Center(
                                              child: SizedBox(
                                            height: 100.sp,
                                            width: 100.sp,
                                            child: Lottie.asset(
                                                AppConstant.findAnimation,
                                                height: 20.sp,
                                                reverse: true,
                                                repeat: true),
                                          ))
                                        ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.sp),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
