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
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_persistem/pengkajian_persistem_bloc.dart';
import 'package:hms_app/presentation/kebidanan/component/pengkajian_persistem.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class PengkajianPersistemPageWidget extends StatefulWidget {
  const PengkajianPersistemPageWidget({super.key});

  @override
  State<PengkajianPersistemPageWidget> createState() =>
      _PengkajianPersistemPageWidgetState();
}

class _PengkajianPersistemPageWidgetState
    extends State<PengkajianPersistemPageWidget> {
  final ScrollController _scrollController = ScrollController();
  // final TextEditingController _eliminasiBAKController = TextEditingController();
  // final TextEditingController _eliminasiBABController = TextEditingController();
  // final TextEditingController _istirahatController = TextEditingController();
  // final TextEditingController _aktivitasController = TextEditingController();
  // final TextEditingController _kardiovaskulerController =
  //     TextEditingController();
  // final TextEditingController _respiratoriController = TextEditingController();
  // final TextEditingController _secebralController = TextEditingController();
  // final TextEditingController _thermoregulasiController =
  //     TextEditingController();
  // final TextEditingController _sistemPerfusiController =
  //     TextEditingController();
  // final TextEditingController _sistemPencernaanController =
  //     TextEditingController();
  // final TextEditingController _integumenController = TextEditingController();
  // final TextEditingController _kenyamananController = TextEditingController();
  // final TextEditingController _statusMentalController = TextEditingController();
  // final TextEditingController _papsSmerController = TextEditingController();
  // final TextEditingController _pendarahanController = TextEditingController();
  // final TextEditingController _hambatanBahasaController =
  //     TextEditingController();
  // final TextEditingController _caraBelajarYangdisukaiController =
  //     TextEditingController();
  // final TextEditingController _bahasaSehariHariControler =
  //     TextEditingController();
  // final TextEditingController _spikologisController = TextEditingController();
  // final TextEditingController _hambatanSosialController =
  //     TextEditingController();
  // final TextEditingController _hambatanEkonomiController =
  //     TextEditingController();
  // final TextEditingController _hambatanSpiritualController =
  //     TextEditingController();
  // final TextEditingController _responseEmosiController =
  //     TextEditingController();
  // final TextEditingController _menjalankanIbadahController =
  //     TextEditingController();
  // final TextEditingController _persepsiTerhadapSakitController =
  //     TextEditingController();
  // final TextEditingController _nilaiKepercayaanController =
  //     TextEditingController();

  String mandi = "";
  String berpakaian = "";
  String makan = "";
  String eliminasi = "";
  String mobilisasi = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PengkajianPersistemBloc, PengkajianPersistemState>(
      listener: (context, state) {
        // TAMPILKAN LOADING
        if (state.status == PengkajianPersistemStatus.isLoadingSavePengkajian) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != PengkajianPersistemStatus.isLoadingSavePengkajian) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                      orElse: () {},
                      loaded: (value) async {
                        // LOADED
                        // context.read<KebidananBloc>().add(
                        //     OnGetRiwayatPengobatanDirumah(
                        //         noReg: singlePasien.first.noreg));
                        MetaModel meta =
                            MetaModel.fromJson(value.value["metadata"]);
                        final shouldPop = await Alert.loaded(context,
                            subTitle: meta.message, title: "Pesan");
                        return shouldPop ?? false;
                      },
                    )));
      },
      builder: (context, state) {
        if (state.status == PengkajianPersistemStatus.isLoadingGet) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
          backgroundColor: ThemeColor.softBlue,
          isENableAdd: true,
          onPressed: () async {
            if (authState is Authenticated) {
              dynamic data = await deviceInfo.initPlatformState();

              // ignore: use_build_context_synchronously
              context.read<PengkajianPersistemBloc>().add(
                  OnSavePengkajianPersistemEvent(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person),
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      deviceID: "ID - ${data['id']} - ${data['device']}}",
                      pengkajian: state.penkajianKebidanan.copyWith(
                        aktivitas: state.penkajianKebidanan.aktivitas,
                        bahasaSehari: state.penkajianKebidanan.bahasaSehari,
                        berpakaian: state.penkajianKebidanan.berpakaian,
                        caraBelajar: state.penkajianKebidanan.caraBelajar,
                        eliminasi: state.penkajianKebidanan.eliminasi,
                        eliminasiBab: state.penkajianKebidanan.eliminasiBab,
                        eliminasiBak: state.penkajianKebidanan.eliminasiBak,
                        hambatanBahasa: state.penkajianKebidanan.hambatanBahasa,
                        hambatanEkonomi:
                            state.penkajianKebidanan.hambatanEkonomi,
                        hambatanSosial:
                            state.penkajianKebidanan.hambatanEkonomi,
                        integumen: state.penkajianKebidanan.integumen,
                        istirahat: state.penkajianKebidanan.istirahat,
                        kardiovaskuler: state.penkajianKebidanan.kardiovaskuler,
                        kenyamanan: state.penkajianKebidanan.kenyamanan,
                        khususKepercayaan:
                            state.penkajianKebidanan.khususKepercayaan,
                        makan: state.penkajianKebidanan.makan,
                        mandi: state.penkajianKebidanan.mandi,
                        mobilisasi: state.penkajianKebidanan.mobilisasi,
                        nilaiKepercayaan:
                            state.penkajianKebidanan.nilaiKepercayaan,
                        papsSmer: state.penkajianKebidanan.papsSmer,
                        pencernaan: state.penkajianKebidanan.pencernaan,
                        pendarahan: state.penkajianKebidanan.pendarahan,
                        perfusiPerifer: state.penkajianKebidanan.perfusiPerifer,
                        spiritual: state.penkajianKebidanan.spiritual,
                        presepsiSakit: state.penkajianKebidanan.presepsiSakit,
                        secebral: state.penkajianKebidanan.secebral,
                        responseEmosi: state.penkajianKebidanan.responseEmosi,
                        respiratori: state.penkajianKebidanan.respiratori,
                        spikologis: state.penkajianKebidanan.spikologis,
                        proteksi: state.penkajianKebidanan.proteksi,
                      )));
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
                // PERLEPASAN
                TitleWidget.headerTitle(title: "ELIMINASI DAN PELEPASAN"),
                //
                ComponenPengkajian.selectionPengkajian(
                    title: "Eliminasi BAK",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: eliminasiBAK.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.eliminasiBak ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedEliminasiBAK(value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedEliminasiBAK(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                const Divider(),

                ComponenPengkajian.selectionPengkajian(
                    title: "Eliminasi BAB",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: eliminasiBAB.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.eliminasiBab ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedEliminasiBAB(value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedEliminasiBAB(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                TitleWidget.headerTitle(title: "AKTIVITAS / ISTIRAHAT"),

                ComponenPengkajian.selectionPengkajian(
                    title: "Tidur / Istirahat",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children:
                                aktivitasIstirahat.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.istirahat ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedIstirahat(value: e.value));
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
                                      .read<PengkajianPersistemBloc>()
                                      .add(OnChangedIstirahat(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                const Divider(),

                ComponenPengkajian.selectionPengkajian(
                    title: "Aktivitas",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: aktivitas.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.aktivitas ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedAktivitas(value: e.value));
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
                                      .read<PengkajianPersistemBloc>()
                                      .add(OnChangedAktivitas(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                const Divider(),

                skorAktifivas(
                  title: "Mandi",
                  widget: Container(
                    width: Get.width,
                    decoration: BoxDecoration(color: ThemeColor.bgColor),
                    child: Wrap(
                      children: skorAktivitas.asMap().entries.map((e) {
                        if (state.penkajianKebidanan.mandi ==
                            e.value.toString()) {
                          return TitleWidget.boxChoose(
                            backgroundColor: ThemeColor.greenColor,
                            width: 50.sp,
                            onPressed: () {
                              context.read<PengkajianPersistemBloc>().add(
                                  OnChangedMandi(value: e.value.toString()));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                            ),
                            title: e.value.toString(),
                          );
                        }
                        return TitleWidget.boxChoose(
                          backgroundColor: ThemeColor.primaryColor,
                          width: 50.sp,
                          onPressed: () {
                            context
                                .read<PengkajianPersistemBloc>()
                                .add(OnChangedMandi(value: e.value.toString()));
                          },
                          icon: const Icon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                          ),
                          title: e.value.toString(),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                skorAktifivas(
                  title: "Berpakaian",
                  widget: Container(
                    width: Get.width,
                    decoration: BoxDecoration(color: ThemeColor.bgColor),
                    child: Wrap(
                      children: skorAktivitas.asMap().entries.map((e) {
                        if (state.penkajianKebidanan.berpakaian ==
                            e.value.toString()) {
                          return TitleWidget.boxChoose(
                            backgroundColor: ThemeColor.greenColor,
                            width: 50.sp,
                            onPressed: () {
                              context.read<PengkajianPersistemBloc>().add(
                                  OnChangedBerpakaian(
                                      value: e.value.toString()));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                            ),
                            title: e.value.toString(),
                          );
                        }
                        return TitleWidget.boxChoose(
                          backgroundColor: ThemeColor.primaryColor,
                          width: 50.sp,
                          onPressed: () {
                            context.read<PengkajianPersistemBloc>().add(
                                OnChangedBerpakaian(value: e.value.toString()));
                          },
                          icon: const Icon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                          ),
                          title: e.value.toString(),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                skorAktifivas(
                  title: "Makan/Mandi",
                  widget: Container(
                    width: Get.width,
                    decoration: BoxDecoration(color: ThemeColor.bgColor),
                    child: Wrap(
                      children: skorAktivitas.asMap().entries.map((e) {
                        if (state.penkajianKebidanan.makan ==
                            e.value.toString()) {
                          return TitleWidget.boxChoose(
                            backgroundColor: ThemeColor.greenColor,
                            width: 50.sp,
                            onPressed: () {
                              context.read<PengkajianPersistemBloc>().add(
                                  OnChangedMakan(value: e.value.toString()));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                            ),
                            title: e.value.toString(),
                          );
                        }
                        return TitleWidget.boxChoose(
                          backgroundColor: ThemeColor.primaryColor,
                          width: 50.sp,
                          onPressed: () {
                            context
                                .read<PengkajianPersistemBloc>()
                                .add(OnChangedMakan(value: e.value.toString()));
                          },
                          icon: const Icon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                          ),
                          title: e.value.toString(),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                skorAktifivas(
                  title: "Eliminasi",
                  widget: Container(
                    width: Get.width,
                    decoration: BoxDecoration(color: ThemeColor.bgColor),
                    child: Wrap(
                      children: skorAktivitas.asMap().entries.map((e) {
                        if (state.penkajianKebidanan.eliminasi ==
                            e.value.toString()) {
                          return TitleWidget.boxChoose(
                            backgroundColor: ThemeColor.greenColor,
                            width: 50.sp,
                            onPressed: () {
                              context.read<PengkajianPersistemBloc>().add(
                                  OnChangedEliminasi(
                                      value: e.value.toString()));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                            ),
                            title: e.value.toString(),
                          );
                        }
                        return TitleWidget.boxChoose(
                          backgroundColor: ThemeColor.primaryColor,
                          width: 50.sp,
                          onPressed: () {
                            context.read<PengkajianPersistemBloc>().add(
                                OnChangedEliminasi(value: e.value.toString()));
                          },
                          icon: const Icon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                          ),
                          title: e.value.toString(),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                skorAktifivas(
                  title: "Mobilisasi",
                  widget: Container(
                    width: Get.width,
                    decoration: BoxDecoration(color: ThemeColor.bgColor),
                    child: Wrap(
                      children: skorAktivitas.asMap().entries.map((e) {
                        if (state.penkajianKebidanan.mobilisasi ==
                            e.value.toString()) {
                          return TitleWidget.boxChoose(
                            backgroundColor: ThemeColor.greenColor,
                            width: 50.sp,
                            onPressed: () {
                              context.read<PengkajianPersistemBloc>().add(
                                  OnChangedMobilisasi(
                                      value: e.value.toString()));
                            },
                            icon: const Icon(
                              FontAwesomeIcons.check,
                              color: Colors.white,
                            ),
                            title: e.value.toString(),
                          );
                        }
                        return TitleWidget.boxChoose(
                          backgroundColor: ThemeColor.primaryColor,
                          width: 50.sp,
                          onPressed: () {
                            context.read<PengkajianPersistemBloc>().add(
                                OnChangedMobilisasi(value: e.value.toString()));
                          },
                          icon: const Icon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                          ),
                          title: e.value.toString(),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                TitleWidget.headerTitle(title: "SISTEM KARDIO-RESPIRATORI"),

                ComponenPengkajian.selectionPengkajian(
                    title: "KARDIOVASKULER",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: kardiovaSkuler.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.kardiovaskuler ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedKardiovaskuler(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedKardiovaskuler(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "KARDIOVASKULER"),

                const Divider(),

                ComponenPengkajian.selectionPengkajian(
                    title: "RESPIRATORI",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: respiratori.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.respiratori ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedRespiratori(value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedRespiratori(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                // ComponenPengkajian.selectionPengkajian(
                //     title: "RESPIRATORI",
                //     widget: Container(
                //       width: Get.width,
                //       decoration: BoxDecoration(color: ThemeColor.bgColor),
                //       child: Column(
                //         children: [
                //           Wrap(
                //             children: respiratori.asMap().entries.map((e) {
                //               if (state.penkajianKebidanan.respiratori ==
                //                   e.value) {
                //                 return TitleWidget.boxChoose(
                //                   backgroundColor: ThemeColor.greenColor,
                //                   onPressed: () {
                //                     context.read<PengkajianPersistemBloc>().add(
                //                         OnChangedRespiratori(value: e.value));
                //                   },
                //                   icon: const Icon(
                //                     FontAwesomeIcons.check,
                //                     color: Colors.white,
                //                   ),
                //                   title: e.value,
                //                 );
                //               }
                //               return TitleWidget.boxChoose(
                //                 backgroundColor: ThemeColor.primaryColor,
                //                 onPressed: () {
                //                   context.read<PengkajianPersistemBloc>().add(
                //                       OnChangedRespiratori(value: e.value));
                //                 },
                //                 icon: const Icon(
                //                   FontAwesomeIcons.check,
                //                   color: Colors.white,
                //                 ),
                //                 title: e.value,
                //               );
                //             }).toList(),
                //           ),
                //         ],
                //       ),
                //     )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "RESPIRATORI"),

                TitleWidget.headerTitle(title: "SISTEM PERFUSI SECEBRAL"),
                ComponenPengkajian.selectionPengkajian(
                    title: "PERFUSI SECEBRAL",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: perfusiSecebral.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.secebral ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedPerusiSecebral(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedPerusiSecebral(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                // ComponenPengkajian.penkajian(
                //     pilihan: perfusiSecebral,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "RESPIRATORI"),

                TitleWidget.headerTitle(title: "THERMOREGULASI"),
                ComponenPengkajian.selectionPengkajian(
                    title: "THERMOREGULASI",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: thermoregulasi.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.thermoregulasi ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedThermoregulasi(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedThermoregulasi(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: perfusiSecebral,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "THERMOREGULASI"),

                TitleWidget.headerTitle(title: "SISTEM PERFUSI PERIFER"),
                ComponenPengkajian.selectionPengkajian(
                    title: "SISTEM PERFUSI PERIFER",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children:
                                sistemPerfusiPerifer.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.perfusiPerifer ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedPerfusiPefifer(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedPerfusiPefifer(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: perfusiSecebral,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "SISTEM PERFUSI PERIFER"),

                TitleWidget.headerTitle(title: "SISTEM PENCERNAAN"),

                ComponenPengkajian.selectionPengkajian(
                    title: "SISTEM PENCERNAAN",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: sistemPencernaan.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.pencernaan ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedSistemPencernaan(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedSistemPencernaan(
                                          value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                // ComponenPengkajian.penkajian(
                //     pilihan: perfusiSecebral,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "SISTEM PENCERNAAN"),

                TitleWidget.headerTitle(title: "INTEGUMEN"),

                ComponenPengkajian.selectionPengkajian(
                    title: "INTEGUMEN",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: integumen.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.integumen ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedIntegumen(value: e.value));
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
                                      .read<PengkajianPersistemBloc>()
                                      .add(OnChangedIntegumen(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: perfusiSecebral,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "INTEGUMEN"),

                TitleWidget.headerTitle(title: "KENYAMANAN"),
                ComponenPengkajian.selectionPengkajian(
                    title: "KENYAMANAN",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: kenyamanan.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.kenyamanan ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedKenyamanan(value: e.value));
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
                                      .read<PengkajianPersistemBloc>()
                                      .add(OnChangedKenyamanan(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: perfusiSecebral,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "KENYAMANAN"),

                TitleWidget.headerTitle(title: "PROTEKSI"),

                ComponenPengkajian.selectionPengkajian(
                    title: "STATUS MENTAL",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: statusMental.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.proteksi ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context
                                        .read<PengkajianPersistemBloc>()
                                        .add(OnChangedProteksi(value: e.value));
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
                                      .read<PengkajianPersistemBloc>()
                                      .add(OnChangedProteksi(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: perfusiSecebral,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "STATUS MENTAL"),

                TitleWidget.headerTitle(title: "SEKSUAL & REPRODUKSI"),
                ComponenPengkajian.selectionPengkajian(
                    title: "PAPS SMER",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: pAPSSMER.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.papsSmer ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context
                                        .read<PengkajianPersistemBloc>()
                                        .add(OnChangedPapsSmer(value: e.value));
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
                                      .read<PengkajianPersistemBloc>()
                                      .add(OnChangedPapsSmer(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: perfusiSecebral,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "PAPS SMER"),

                const Divider(),

                ComponenPengkajian.selectionPengkajian(
                    title: "PENDARAHAN",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: pAPSSMER.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.pendarahan ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedPendaharan(value: e.value));
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
                                      .read<PengkajianPersistemBloc>()
                                      .add(OnChangedPendaharan(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "PENDARAHAN"),

                TitleWidget.headerTitle(
                    title: "KOMUNIKASI / PENDIDIKAN PENGAJARAN"),

                ComponenPengkajian.selectionPengkajian(
                    title: "Hambatan Bahasa",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: hambatanBahasa.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.hambatanBahasa ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedHambatanBahasa(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedHambatanBahasa(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Hambatan Bahasa"),

                ComponenPengkajian.selectionPengkajian(
                    title: "Cara Belajar Yang Disukai",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children:
                                caraBelajarYangDisukai.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.caraBelajar ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedCaraBelajar(value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedCaraBelajar(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Cara Belajar Yang Disukai"),
                ComponenPengkajian.selectionPengkajian(
                    title: "Bahasa Sehari Hari",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: bahasaSehariHari.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.bahasaSehari ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedBahasaSehari(value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedBahasaSehari(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Bahasa Sehari Hari"),

                TitleWidget.headerTitle(
                    title: "DATA PSIKOLOGIS, SOSIAL , EKONOMI DAN SPIRITUAL"),

                ComponenPengkajian.selectionPengkajian(
                    title: "Spikologis",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: spikologis.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.spikologis ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedSpikologis(value: e.value));
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
                                      .read<PengkajianPersistemBloc>()
                                      .add(OnChangedSpikologis(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Spikologis"),

                const Divider(),
                ComponenPengkajian.selectionPengkajian(
                    title: "Hambatan Sosial",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: hambatanSosial.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.hambatanSosial ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedHambatanSosial(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedHambatanSosial(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Hambatan Sosial"),

                const Divider(),

                ComponenPengkajian.selectionPengkajian(
                    title: "Hambatan Ekonomi",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: hambatanEkonomi.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.hambatanEkonomi ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedHambatanEkomoni(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedHambatanEkomoni(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),

                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Hambatan Ekonomi"),

                const Divider(),
                ComponenPengkajian.selectionPengkajian(
                    title: "Hambatan Spiritual",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children:
                                hambatanSpiritual.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.spiritual ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedHambatanSpiritual(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedHambatanSpiritual(
                                          value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Hambatan Spiritual"),

                TitleWidget.headerTitle(title: "RESPONSE EMOSI"),
                ComponenPengkajian.selectionPengkajian(
                    title: "Response Emosi",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: responseEmosi.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.responseEmosi ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedResponseEmosi(value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedResponseEmosi(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Response Emosi"),

                TitleWidget.headerTitle(title: "NILAI KEPERCAYAAN"),
                ComponenPengkajian.selectionPengkajian(
                    title: "Menjalankan Ibadah",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children:
                                menjalankanIbadah.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.nilaiKepercayaan ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedNilaiKepercayaaan(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedNilaiKepercayaaan(
                                          value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Menjalankan Ibadah"),

                const Divider(),
                ComponenPengkajian.selectionPengkajian(
                    title: "Persepsi Terhadap Sakit",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children:
                                presepsiTerhadapSakit.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.presepsiSakit ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedPresepsiSakit(value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedPresepsiSakit(value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Persepsi Terhadap Sakit"),

                const Divider(),
                ComponenPengkajian.selectionPengkajian(
                    title: "Nilai/aturan Khusus dalam kepercayaan",
                    widget: Container(
                      width: Get.width,
                      decoration: BoxDecoration(color: ThemeColor.bgColor),
                      child: Column(
                        children: [
                          Wrap(
                            children: nilaiKepercayaan.asMap().entries.map((e) {
                              if (state.penkajianKebidanan.khususKepercayaan ==
                                  e.value) {
                                return TitleWidget.boxChoose(
                                  backgroundColor: ThemeColor.greenColor,
                                  onPressed: () {
                                    context.read<PengkajianPersistemBloc>().add(
                                        OnChangedKhususKepercayaan(
                                            value: e.value));
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
                                  context.read<PengkajianPersistemBloc>().add(
                                      OnChangedKhususKepercayaan(
                                          value: e.value));
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.check,
                                  color: Colors.white,
                                ),
                                title: e.value,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    )),
                // ComponenPengkajian.penkajian(
                //     pilihan: aktivitas,
                //     controller: _aktivitasController,
                //     value: state.penkajianKebidanan.aktivitas,
                //     title: "Nilai/aturan Khusus dalam kepercayaan"),
              ],
            ),
          ),
        );
      },
    );
  }

  Container skorAktifivas({
    required String title,
    required Widget widget,
  }) {
    return Container(
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

List<String> eliminasiBAKPilihan = ["TAK", "NORMAL"];
List<String> eliminasiBABPilihan = ["TAK", "Konstipasi"];
List<String> aktivitasIstirahatPilihan = ["TAK", "Susah Tidur"];
List<String> aktivitasPilihan = ["Mandiri", "Bantuan Sebagian"];

List<String> eliminasiBAK = ["TAK", "Sering BAK"];
List<String> eliminasiBAB = ["TAK", "Konstipasi"];
List<String> aktivitasIstirahat = ["TAK", "Susah Tidur"];
List<String> aktivitas = ["Mandiri", "Bantuan Sebagian"];
List<String> kardiovaSkuler = ["TAK", "Nyeri Dada", "Tidak", "Ya"];
List<String> respiratori = ["TAK", "Sesak Napas", "Tidak", "Ya"];
List<String> perfusiSecebral = [
  "TAK",
  "Kejang",
  "Riwayat Kejang",
  "Sakit Kepala",
];
List<String> thermoregulasi = ["TAK", "Demam", "Riwayat Demam"];
List<String> sistemPerfusiPerifer = [
  "TAK",
  "Odema",
  "Kesemutan/Kebas",
];
List<String> sistemPencernaan = [
  "TAK",
  "Perut Kembung",
  "Distensi Abdomen",
];
List<String> integumen = ["TAK", "Luka/Abses"];
List<String> itegumen = ["TAK", "Luka"];
List<String> odema = ["Tidak", "Ya"];
List<String> kenyamanan = ["TAK", "Tidak Nyaman", "Gelisah"];
List<String> statusMental = ["Orientasi", "Agitasi"];
List<String> pAPSSMER = ["Tidak", "Ya"];
List<String> hambatanBahasa = ["Tidak", "Ya"];
List<String> perluPenerjemah = ["Tidak", "Ya"];
List<String> caraBelajarYangDisukai = [
  "Demontrasi",
  "Diskusi",
  "Menulis",
];
List<String> bahasaSehariHari = ["Indonesia", "Bahasa Daerah"];
List<String> spikologis = [
  "Stabil/Tenan",
  "Cemas/Takut",
  "Marah",
  "Sedih",
];
List<String> hambatanSosial = ["Tidak Ada"];
List<String> hambatanEkonomi = ["Tidak Ada"];
List<String> hambatanSpiritual = ["Tidak Ada"];
List<String> responseEmosi = [
  "TAK",
  "Takut Terhadap Lingkungan/Tindakan di RS",
  "Sedih",
  "Marah",
  "Menangis",
  "Rendah Diri",
  "Cemas",
];
List<String> menjalankanIbadah = [
  "Selalu/Taat",
  "Kadang-kadang",
  "Tidak Pernah",
  "Sedih",
  "Marah",
  "Menangis",
  "Rendah Diri",
  "Cemas",
];
List<String> hamil = ["Tidak", "Ya"];
List<String> nilaiKepercayaan = [
  "Tidak Ada",
  "Jelaskan",
];
List<String> presepsiTerhadapSakit = [
  "Perasaan Bersalah",
  "Perasaan Ditinggal Tuhan Nilai/aturan Khusus dalam kepercayaan",
  "Tidak Ada ",
  "Jelaskan"
];
List<String> pendarahan = ["Tidak", "Ya"];
List<int> skorAktivitas = [1, 2, 3, 4, 5];
