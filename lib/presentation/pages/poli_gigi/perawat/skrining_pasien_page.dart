import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/widget/box_emty_skrining_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/subjective/skrining_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class SkriningPasienPage extends StatefulWidget {
  const SkriningPasienPage({super.key});

  @override
  State<SkriningPasienPage> createState() => _SkriningPasienPageState();
}

class _SkriningPasienPageState extends State<SkriningPasienPage> {
  late String selectedMenu;

  bool k1 = false;
  bool k2 = false;
  bool k3 = false;
  bool k4 = false;
  bool k5 = false;
  bool k6 = false;

  // KEGAWATAN
  String kg1 = "";
  String kg2 = "";
  String kg3 = "";
  String kg4 = "";
  String kg5 = "";
  String kg6 = "";

  bool kF1 = false;
  bool kF2 = false;
  bool kF3 = false;
  bool kF4 = false;

  // KETERBATASAN FISIK
  String kf1 = "";
  String kf2 = "";
  String kf3 = "";
  String kf4 = "";

  bool b1 = false;
  bool b2 = false;

  // BATUK
  String bt1 = "";
  String bt2 = "";

  bool ir1 = false;
  bool ir2 = false;
  bool ir3 = false;
  bool ir4 = false;

  String irs1 = "";
  String irs2 = "";
  String irs3 = "";
  String irs4 = "";

  String selectedItem = "";

  late String rj;

  String toValueIntervensi({required bool selected}) {
    return selected.toString();
  }

  String toValue({required bool seledted}) {
    if (seledted) {
      return "1";
    } else {
      return "2";
    }
  }

  void setValueIntervensi({required bool selected, required intkey}) {
    switch (intkey) {
      case 0:
        setState(() {
          irs1 = toValueIntervensi(selected: selected);
        });

        break;
      case 1:
        setState(() {
          irs2 = toValueIntervensi(selected: selected);
        });
        break;
      case 2:
        setState(() {
          irs3 = toValueIntervensi(selected: selected);
        });
        break;
      case 3:
        setState(() {
          irs4 = toValueIntervensi(selected: selected);
        });
        break;

      default:
    }
  }

  void setValueBatuk({required bool selected, required int key}) {
    switch (key) {
      case 0:
        setState(() {
          bt1 = toValue(seledted: selected);
        });

        break;
      case 1:
        setState(() {
          bt2 = toValue(seledted: selected);
        });
        break;

      default:
    }
  }

  void setValue({required bool seledted, required int key}) {
    switch (key) {
      case 0:
        setState(() {
          kg1 = toValue(seledted: seledted);
        });
        break;
      case 1:
        setState(() {
          kg2 = toValue(seledted: seledted);
        });
        break;
      case 2:
        kg3 = toValue(seledted: seledted);
        break;
      case 3:
        kg4 = toValue(seledted: seledted);
        break;
      case 4:
        kg5 = toValue(seledted: seledted);
        break;
      case 5:
        kg6 = toValue(seledted: seledted);
        break;
      default:
    }
  }

  void setValueKeterbatasanFisik({required bool selected, required int key}) {
    switch (key) {
      case 0:
        setState(() {
          kf1 = toValue(seledted: selected);
        });
        break;
      case 1:
        setState(() {
          kf2 = toValue(seledted: selected);
        });
        break;
      case 2:
        setState(() {
          kf3 = toValue(seledted: selected);
        });
        break;
      case 3:
        setState(() {
          kf4 = toValue(seledted: selected);
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    selectedItem = resikoJatuh.last;
    selectedMenu = menuSkrining.first;
    rj = resikoJatuh.last;

    super.initState();
  }

  setSelectedRadio(String value) {
    setState(() {
      selectedItem = value;
      rj = value;
      log(selectedItem.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool setBatuk({
    required int index,
    required bool b1,
    required bool b2,
  }) {
    switch (index) {
      case 0:
        return b1;
      case 1:
        return b2;
      default:
        return false;
    }
  }

  bool setIntervensi(
      {required int index,
      required bool ir1,
      required bool ir2,
      required bool ir3,
      required bool ir4}) {
    switch (index) {
      case 0:
        return ir1;
      case 1:
        return ir2;
      case 2:
        return ir3;
      case 3:
        return ir4;
      default:
        return false;
    }
  }

  bool setKeterbatasanFisik(
      {required int index,
      required bool kF1,
      required bool kF2,
      required bool kF3,
      required bool kF4}) {
    switch (index) {
      case 0:
        return kF1;
      case 1:
        return kF2;
      case 2:
        return kF3;
      case 3:
        return kF4;
      default:
        return false;
    }
  }

  bool kegawatan(
      {required int index,
      required bool k1,
      required bool k2,
      required bool k3,
      required bool k4,
      required bool k5,
      required bool k6}) {
    switch (index) {
      case 0:
        return k1;
      case 1:
        return k2;
      case 2:
        return k3;
      case 3:
        return k4;
      case 4:
        return k5;
      case 5:
        return k6;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocListener<PasienBloc, PasienState>(
      listener: (context, state) {
        if (state.loadingSkrining) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (!state.loadingSkrining) {
          EasyLoading.dismiss();
        }

        state.getSkriningResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) {
                      final skrining =
                          SkirningModel.fromJson(value.value["response"]);
                      context.read<PasienBloc>().add(
                          PasienEvent.saveStateSkrining(skrining: skrining));

                      setState(() {
                        // KEGAWAWATAN
                        k1 = (skrining.k1 == "1") ? true : false;
                        k2 = (skrining.k2 == "1") ? true : false;
                        k3 = (skrining.k3 == "1") ? true : false;
                        k3 = (skrining.k3 == "1") ? true : false;
                        k4 = (skrining.k4 == "1") ? true : false;
                        k5 = (skrining.k5 == "1") ? true : false;
                        k6 = (skrining.k6 == "1") ? true : false;

                        kg1 = skrining.k1;
                        kg2 = skrining.k2;
                        kg3 = skrining.k3;
                        kg4 = skrining.k4;
                        kg5 = skrining.k5;
                        kg6 = skrining.k6;

                        kF1 = (skrining.kf1 == "1") ? true : false;
                        kF2 = (skrining.kf2 == "1") ? true : false;
                        kF3 = (skrining.kf3 == "1") ? true : false;
                        kF4 = (skrining.kf4 == "1") ? true : false;

                        kf1 = skrining.kf1;
                        kf2 = skrining.kf2;
                        kf3 = skrining.kf3;
                        kf4 = skrining.kf4;

                        selectedItem = skrining.rj;

                        // SELECTED BATUK
                        bt1 = skrining.b1;
                        bt2 = skrining.b2;

                        b1 = (skrining.b1 == "1") ? true : false;
                        b2 = (skrining.b2 == "1") ? true : false;

                        ir1 = (skrining.iv1 == "true") ? true : false;
                        ir2 = (skrining.iv2 == "true") ? true : false;
                        ir3 = (skrining.iv3 == "true") ? true : false;
                        ir4 = (skrining.iv4 == "true") ? true : false;

                        irs1 = skrining.iv1;
                        irs2 = skrining.iv2;
                        irs3 = skrining.iv3;
                        irs4 = skrining.iv4;
                      });
                    })));

        state.skriningResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    unProccessable: (e) async {
                      final error = List<String>.from(
                          e.value["response"]["errors"].map((x) => x));
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: error.toString(), title: meta.message);
                      return shouldPop ?? false;
                    },
                    failure: (e) async {
                      final shouldPop = await Alert.loaded(context,
                          subTitle: e.meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) async {
                      final skrining =
                          SkirningModel.fromJson(value.value["response"]);

                      // log(skrining.toString());
                      context.read<PasienBloc>().add(
                          PasienEvent.saveStateSkrining(skrining: skrining));

                      log("STATE SKRINING");
                      log(state.skriningModel.toString());

                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      child: BlocBuilder<PasienBloc, PasienState>(
        builder: (context, state) {
          final singlePasien = state.listPasienModel
              .where((element) => element.mrn == state.normSelected);
          return Expanded(
            child: HeaderContentWidget(
              onPressed: () {
                // todo : sAVE DATA

                if (authState is Authenticated) {
                  DateTime now = DateTime.now();

                  context.read<PasienBloc>().add(PasienEvent.saveSkrining(
                      kdBagian: authState.user.kodePoli,
                      noReg: singlePasien.first.noreg,
                      k1: k1.toString(),
                      k2: k2.toString(),
                      k3: k3.toString(),
                      k4: k4.toString(),
                      k5: k5.toString(),
                      k6: k6.toString(),
                      kF1: kf1,
                      kF2: kf2,
                      kF3: kf3,
                      kF4: kf4,
                      b1: bt1,
                      b2: bt2,
                      rJ: rj,
                      iV1: irs1,
                      iV2: irs2,
                      iV3: irs3,
                      iV4: irs4,
                      tanggal: now.toString().substring(0, 10),
                      jam: now.day.toString(),
                      user: authState.user.userId));
                }
              },
              widget: SingleChildScrollView(
                child: (state.loadingGetSkrining)
                    ? SizedBox(
                        height: Get.height,
                        width: Get.width,
                        child: ShimerLoading.loadingExpandCard(),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            BoxSkriningEmtyWidget(
                                width: Get.width,
                                title: "Kegawatan",
                                widget: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.sp, vertical: 4.sp),
                                  child: Wrap(
                                    runSpacing: 5.sp,
                                    spacing: 5.sp,
                                    children: skriningKegawatan
                                        .asMap()
                                        .entries
                                        .map((e) => Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5.sp),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 15.sp,
                                                    height: 15.sp,
                                                    child: Checkbox(
                                                      activeColor: const Color(
                                                          0xFF6200EE),
                                                      checkColor: Colors.white,
                                                      value: kegawatan(
                                                          index: e.key,
                                                          k1: k1,
                                                          k2: k2,
                                                          k3: k3,
                                                          k4: k4,
                                                          k5: k5,
                                                          k6: k6),
                                                      onChanged: (selected) {
                                                        setValue(
                                                            seledted: selected!,
                                                            key: e.key);
                                                        if (e.key == 0) {
                                                          setState(() {
                                                            k1 = selected;
                                                          });

                                                          log(kg1.toString());
                                                        }
                                                        if (e.key == 1) {
                                                          setState(() {
                                                            k2 = selected;
                                                          });
                                                        }

                                                        if (e.key == 2) {
                                                          setState(() {
                                                            k3 = selected;
                                                          });
                                                        }

                                                        if (e.key == 3) {
                                                          setState(() {
                                                            k4 = selected;
                                                          });
                                                        }
                                                        if (e.key == 4) {
                                                          setState(() {
                                                            k5 = selected;
                                                          });
                                                        }
                                                        if (e.key == 5) {
                                                          setState(() {
                                                            k6 = selected;
                                                          });
                                                        }

                                                        log(kg1 +
                                                            kg2 +
                                                            kg3 +
                                                            kg4 +
                                                            kg5 +
                                                            kg6);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.sp,
                                                  ),
                                                  Text(
                                                    e.value,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 10.sp),
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )),
                            BoxSkriningEmtyWidget(
                                width: Get.width,
                                title: "Keterbatasan Fisik",
                                widget: Container(
                                  padding: EdgeInsets.all(12.sp),
                                  child: Wrap(
                                    runSpacing: 5.sp,
                                    spacing: 5.sp,
                                    children: keterbatasanFisik
                                        .asMap()
                                        .entries
                                        .map((box) => Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5.sp),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10.sp,
                                                    height: 10.sp,
                                                    child: Checkbox(
                                                      activeColor: const Color(
                                                          0xFF6200EE),
                                                      checkColor: Colors.white,
                                                      value:
                                                          setKeterbatasanFisik(
                                                              index: box.key,
                                                              kF1: kF1,
                                                              kF2: kF2,
                                                              kF3: kF3,
                                                              kF4: kF4),
                                                      onChanged: (value) {
                                                        setValueKeterbatasanFisik(
                                                            key: box.key,
                                                            selected:
                                                                (value != null)
                                                                    ? value
                                                                    : false);
                                                        if (box.key == 0) {
                                                          setState(() {
                                                            kF1 = value!;
                                                          });
                                                        }
                                                        if (box.key == 1) {
                                                          setState(() {
                                                            kF2 = value!;
                                                          });
                                                        }
                                                        if (box.key == 2) {
                                                          setState(() {
                                                            kF3 = value!;
                                                          });
                                                        }
                                                        if (box.key == 3) {
                                                          setState(() {
                                                            kF4 = value!;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.sp,
                                                  ),
                                                  Text(
                                                    box.value,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 10.sp),
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )),
                            BoxSkriningEmtyWidget(
                                width: Get.width,
                                title: "Batuk",
                                widget: Container(
                                  padding: EdgeInsets.all(12.sp),
                                  child: Wrap(
                                    runSpacing: 5.sp,
                                    spacing: 5.sp,
                                    children: batuk
                                        .asMap()
                                        .entries
                                        .map((e) => Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5.sp),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10.sp,
                                                    height: 10.sp,
                                                    child: Checkbox(
                                                      value: setBatuk(
                                                          index: e.key,
                                                          b1: b1,
                                                          b2: b2),
                                                      activeColor: const Color(
                                                          0xFF6200EE),
                                                      checkColor: Colors.white,
                                                      onChanged: (selected) {
                                                        setValueBatuk(
                                                            selected: selected!,
                                                            key: e.key);
                                                        if (e.key == 0) {
                                                          setState(() {
                                                            b1 = selected;
                                                          });
                                                        }

                                                        if (e.key == 1) {
                                                          setState(() {
                                                            b2 = selected;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.sp,
                                                  ),
                                                  Text(
                                                    e.value,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 10.sp),
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )),
                            BoxSkriningEmtyWidget(
                                width: Get.width,
                                title: "Intervensi",
                                widget: Container(
                                  padding: EdgeInsets.all(12.sp),
                                  child: Wrap(
                                    runSpacing: 5.sp,
                                    spacing: 5.sp,
                                    children: intervensi
                                        .asMap()
                                        .entries
                                        .map((e) => Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5.sp),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10.sp,
                                                    height: 10.sp,
                                                    child: Checkbox(
                                                      activeColor: const Color(
                                                          0xFF6200EE),
                                                      checkColor: Colors.white,
                                                      value: setIntervensi(
                                                          index: e.key,
                                                          ir1: ir1,
                                                          ir2: ir2,
                                                          ir3: ir3,
                                                          ir4: ir4),
                                                      onChanged: (selected) {
                                                        setValueIntervensi(
                                                            intkey: e.key,
                                                            selected:
                                                                selected!);
                                                        setState(() {
                                                          if (e.key == 0) {
                                                            ir1 = selected;
                                                          }
                                                          if (e.key == 1) {
                                                            ir2 = selected;
                                                          }
                                                          if (e.key == 2) {
                                                            ir3 = selected;
                                                          }
                                                          if (e.key == 3) {
                                                            ir4 = selected;
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5.sp,
                                                  ),
                                                  SizedBox(
                                                    width: Get.width / 1.7,
                                                    child: Text(
                                                      e.value,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 9.sp),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )),
                            BoxSkriningEmtyWidget(
                                width: Get.width,
                                title: "Resiko Jatuh",
                                widget: Container(
                                  margin: EdgeInsets.only(top: 6.sp),
                                  padding: EdgeInsets.all(6.sp),
                                  child: Wrap(
                                    children: resikoJatuh
                                        .map((e) => SizedBox(
                                              width: 150.sp,
                                              height: 35.sp,
                                              child: Card(
                                                color: ThemeColor.lightGrey,
                                                elevation: 1.sp,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp)),
                                                child: Center(
                                                  child: RadioListTile(
                                                      selected:
                                                          (e == selectedItem)
                                                              ? true
                                                              : false,
                                                      activeColor: const Color(
                                                          0xFF293074),
                                                      selectedTileColor:
                                                          Colors.cyan,
                                                      title: Text(
                                                        e,
                                                        style:
                                                            blackCalibriTextStyle
                                                                .copyWith(
                                                                    fontSize:
                                                                        10.sp),
                                                        maxLines: 3,
                                                        textAlign:
                                                            TextAlign.start,
                                                        softWrap: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      value: e,
                                                      groupValue: selectedItem,
                                                      onChanged: (value) {
                                                        setSelectedRadio(
                                                            value.toString());
                                                      }),
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )),
                          ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> menuSkrining = [
  "Kegawatan",
  "Keterbatasan Fisik",
  "Batuk",
  "Resiko Jatuh",
  "Intervensi"
];

List<String> skriningKegawatan = [
  "Tidak Sadar",
  "Jari-jari & Kaki Teraba Dingin Atau Tampak Kebiruan",
  "Sesak Napas berat",
  "Muntah, Diare Atau Keduanya >4-5x/24jam",
  "Kejang",
  "Khusus Bayi :Ubun-ubun Keliatan Cekung Atau Teraba Cekung"
];

List<String> keterbatasanFisik = [
  "Kesulitan Berjalan",
  "Kesakitan",
  "Gangguan Penglihatan",
  "Kelemahan Anggota Gerak"
];

List<String> batuk = [
  "Batuk-batuk berkepanjangan (Baik Disertai Panas Atau Tidak)",
  "Batuk Berdarah"
];

List<String> resikoJatuh = ["BERISIKO", "TIDAK BERISIKO"];

List<String> intervensi = [
  "Berikan kursi roda atau tawarkan brankart bila pasien membutuhkan",
  "Berikan edukasi kepada pasien dan atau keluarga agar meminta pertolongan kepada Petugas apabila akan melakukan aktivitas selama berada di Rumah Sakit, misal : ketoilet, dll",
  "Informasikan kepada pasien dan atau keluarga untuk melepas pita risiko jatuh setelah keluar dari RS Fatima",
  "Bantu pasien yang melakukan kegiatan dilokasi yang meningkatkan risiko jatuh, misal pasien melakukan latihan dengan menggunakan alat-alat yang meningkatkan risiko jatuh di Unit Rehabilitasi Medik"
];
