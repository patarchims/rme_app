import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/response/skala/skala_nyeri_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class SkalaNyeriIGDWidget extends StatefulWidget {
  const SkalaNyeriIGDWidget({super.key});

  @override
  State<SkalaNyeriIGDWidget> createState() => _SkalaNyeriIGDWidgetState();
}

class _SkalaNyeriIGDWidgetState extends State<SkalaNyeriIGDWidget> {
  // ==========================================

  String selectedJalanNafas = "";
  String selectedGangguan = "";
  String selectedBahaya = "";
  String selectedNafas = "";
  late String statusAlergi;
  late String selectedSkala;

  void setValueFlacc({required double value}) {
    if (selectedSkala == skala[0]) {
      context
          .read<TriaseBloc>()
          .add(TriaseEvent.skalaFlaccWajahOnchanged(value: value));
    }
    if (selectedSkala == skala[1]) {
      context
          .read<TriaseBloc>()
          .add(TriaseEvent.skalaFlaccKakiOnchanged(value: value));
    }
    if (selectedSkala == skala[2]) {
      context
          .read<TriaseBloc>()
          .add(TriaseEvent.skalaFlaccAktifitasOnchanged(value: value));
    }

    if (selectedSkala == skala[3]) {
      context
          .read<TriaseBloc>()
          .add(TriaseEvent.skalaFlaccMenangisOnchanged(value: value));
    } else {
      context
          .read<TriaseBloc>()
          .add(TriaseEvent.skalaFlaccBersuaraOnchanged(value: value));
    }
  }

  String toLabel({required TriaseState state}) {
    if (selectedSkala == skala[0]) {
      return state.skalaFlaccWajah.round().toString();
    }
    if (selectedSkala == skala[1]) {
      return state.skalaFlaccKaki.round().toString();
    }
    if (selectedSkala == skala[2]) {
      return state.skalaFlaccAktifitas.round().toString();
    }

    if (selectedSkala == skala[3]) {
      return state.skalaFlaccMenangis.round().toString();
    } else {
      return state.skalaFlaccBersuara.round().toString();
    }
  }

  @override
  void initState() {
    //===============================
    selectedSkala = skala[0];
    super.initState();
  }

  double toSkalaFlacc(
      {required String selectedSkala, required TriaseState state}) {
    if (selectedSkala == skala[0]) {
      return state.skalaFlaccWajah;
    }
    if (selectedSkala == skala[1]) {
      return state.skalaFlaccKaki;
    }
    if (selectedSkala == skala[2]) {
      return state.skalaFlaccAktifitas;
    }

    if (selectedSkala == skala[3]) {
      return state.skalaFlaccMenangis;
    } else {
      return state.skalaFlaccBersuara;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        // =========== ============= //
        // TODO: implement listener
        if (state.isLoadingSaveSkalaTriase) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveSkalaTriase) {
          EasyLoading.dismiss();
        }

        state.savefailOrSuccessSkalaTriaseResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE ||
                      log(e.toString());

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
        return (state.isLoadingGetSkalaTriase)
            ? SizedBox(
                width: Get.width,
                height: Get.height,
                child: ShimerLoading.loadingExpandCard(
                    baseColor: Colors.white.withOpacity(0.5),
                    highLightColor: Colors.lightBlue.withOpacity(0.1)),
              )
            : HeaderContentWidget(
                title: "Simpan",
                onPressed: () async {
                  // SIMPAN DATA SKALA TRIASE
                  // -================================== SIMPAN SKALA TRIASE  ========================- //
                  dynamic data = await deviceInfo.initPlatformState();
                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously

                    final skala = SkalaTriaseModel(
                        flaccWajah: state.skalaFlaccWajah.toInt(),
                        flaccKaki: state.skalaFlaccKaki.toInt(),
                        flaccAktifitas: state.skalaFlaccAktifitas.toInt(),
                        flaccMenangis: state.skalaFlaccMenangis.toInt(),
                        flaccBersuara: state.skalaFlaccBersuara.toInt(),
                        flaccTotal: state.skalaFlaccWajah.toInt() +
                            state.skalaFlaccKaki.toInt() +
                            state.skalaFlaccAktifitas.toInt() +
                            state.skalaFlaccMenangis.toInt() +
                            state.skalaFlaccBersuara.toInt(),
                        nyeri: state.skalaNyeriValue.toInt(),
                        nyeriP: state.profokatifStr,
                        nyeriQ: state.qualityStr,
                        nyeriR: state.radiationStr,
                        nyeriS: state.severityStr,
                        nyeriT: state.timeStr,
                        skalaTriase: state.skalaTriaseValue.toInt());

                    // ignore: use_build_context_synchronously
                    context.read<TriaseBloc>().add(TriaseEvent.saveTriaseSkala(
                        skalaTriaseModel: skala,
                        noReg: singlePasien.first.noreg,
                        keluhanUtama: state.keluhanUtama,
                        statusAlergi: state.statusAlergi,
                        statusAlergiDetail: state.statusAlergiDetail,
                        person: toPerson(person: authState.user.person),
                        userID: authState.user.userId,
                        deviceID: "ID - ${data['id']} - ${data['device']}}",
                        pelayanan: toPelayanan(
                            poliklinik: authState.user.poliklinik)));
                  }
                },
                widget: ListView(
                  children: [
                    titleContainer(title: "Skala Nyeri"),

                    Slider(
                      value: state.skalaNyeriValue,
                      max: 10,
                      divisions: 10,
                      label: state.skalaNyeriValue.round().toString(),
                      onChanged: (double value) {
                        context
                            .read<TriaseBloc>()
                            .add(TriaseEvent.skalaNyeriOnchanged(value: value));
                      },
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
                                    child: Image.asset(
                                        toNyeri(nyeri: state.skalaNyeriValue))),
                                Text(
                                  toNyeriText(nyeri: state.skalaNyeriValue),
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),

                    formBox(
                        title: "P",
                        subTitle: "",
                        value: state.profokatifStr,
                        labelText: "Isikan Deskripsi Provokatif Disini",
                        onChanged: (value) {
                          context.read<TriaseBloc>().add(
                              TriaseEvent.provokatifOnchanged(value: value));
                        }),

                    //=================
                    formBox(
                        title: "Q",
                        subTitle: "",
                        value: state.qualityStr,
                        labelText: "Isikan Deskripsi Quality Disini",
                        onChanged: (value) {
                          context
                              .read<TriaseBloc>()
                              .add(TriaseEvent.qualityOnchanged(value: value));
                        }),
                    //=================
                    formBox(
                        title: "R",
                        subTitle: "",
                        value: state.radiationStr,
                        labelText: "Isikan Deskripsi Radiation Disini",
                        onChanged: (value) {
                          context.read<TriaseBloc>().add(
                              TriaseEvent.radiationOnchanged(value: value));
                        }),
                    //=================
                    formBox(
                        title: "S",
                        subTitle: "",
                        value: state.severityStr,
                        labelText: "Isikan Deskripsi Severity Disini",
                        onChanged: (value) {
                          context
                              .read<TriaseBloc>()
                              .add(TriaseEvent.severityOnchanged(value: value));
                        }),
                    //=================
                    formBox(
                        title: "T",
                        value: state.timeStr,
                        subTitle: "",
                        labelText: "Isikan Deskripsi Time Disini",
                        onChanged: (value) {
                          context
                              .read<TriaseBloc>()
                              .add(TriaseEvent.timeOnchanged(value: value));
                        }),
                    // =================================
                    SizedBox(height: 5.sp),
                    // ==================================
                    titleContainer(title: "Skala FLACC (Anak < 6 Tahun)"),
                    SizedBox(
                      height: 2.sp,
                    ),

                    //=================
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5.sp),
                            width: Get.width / 5,
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                      bottom: 6.sp,
                                    ),
                                    child: DropdownButtonFormField(
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      focusColor: Colors.black,
                                      value: skala.first,
                                      items: skala
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e.toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        blackTextStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    )),
                                              ))
                                          .toList(),
                                      onChanged: (e) {
                                        setState(() {
                                          selectedSkala = e.toString();
                                        });

                                        // SET JUMLAH
                                      },
                                      decoration:
                                          FormWidget.styleDropdown(context),
                                      style: blackTextStyle.copyWith(
                                          overflow: TextOverflow.ellipsis),
                                    ))
                              ],
                            ),
                          ),

                          /// ===
                          Expanded(
                              child: SizedBox(
                            child: Slider(
                              activeColor: ThemeColor.primaryColor,
                              value: toSkalaFlacc(
                                  selectedSkala: selectedSkala, state: state),
                              max: 2,
                              divisions: 2,
                              label: toLabel(state: state),
                              onChanged: (double value) {
                                setValueFlacc(value: value);
                              },
                            ),
                          )),
                        ],
                      ),
                    ),

                    if (selectedSkala == skala[0]) ...[
                      Center(
                        child: Text(
                            (state.skalaFlaccWajah == 0)
                                ? "Tersenyum/Tidak Ada Ekspresi Khusus"
                                : (state.skalaFlaccWajah == 1)
                                    ? "Terkadang Menangis/Menarik Diri"
                                    : (state.skalaFlaccWajah == 2)
                                        ? "Sering Menggertakan Dagu Dan Mengatupkan Rahang"
                                        : "",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                    if (selectedSkala == skala[1]) ...[
                      Center(
                        child: Text(
                          (state.skalaFlaccKaki == 0)
                              ? "Gerakan Normal/Relaksasi"
                              : (state.skalaFlaccKaki == 1)
                                  ? "Tidak Tenang/Tegang"
                                  : (state.skalaFlaccKaki == 2)
                                      ? "Kaki Dibuatkan Menendang/Menarik Diri"
                                      : "",
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    if (selectedSkala == skala[2]) ...[
                      Center(
                        child: Text(
                          (state.skalaFlaccAktifitas == 0)
                              ? "Tidur, Posisi Normal / Relaksasi"
                              : (state.skalaFlaccAktifitas == 1)
                                  ? "Gerakan Menggeliat, Berguling, Kaku"
                                  : (state.skalaFlaccAktifitas == 2)
                                      ? "Melengkungkan Punggung / Kaku / Menghentak"
                                      : "",
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    if (selectedSkala == skala[3]) ...[
                      Center(
                        child: Text(
                          (state.skalaFlaccMenangis == 0)
                              ? "Tidak Menangis (Bangun Tidur)"
                              : (state.skalaFlaccMenangis == 1)
                                  ? "Mengerang, Merengek-rengek"
                                  : (state.skalaFlaccMenangis == 2)
                                      ? "Menangis  Terus Menerus, Terhisak, Menjerit"
                                      : "",
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    if (selectedSkala == skala[4]) ...[
                      Center(
                        child: Text(
                          (state.skalaFlaccBersuara == 0)
                              ? "Bersuara Normal / Tenang"
                              : (state.skalaFlaccBersuara == 1)
                                  ? "Tenang Bila Dipeluk, Digendong Atau Diajak Bicara"
                                  : (state.skalaFlaccBersuara == 2)
                                      ? "Sulit Menenangkan"
                                      : "",
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],

                    SizedBox(height: 5.sp),
                    titleContainer(title: "Skala Triase)"),
                    Slider(
                      activeColor: ThemeColor.primaryColor,
                      value: state.skalaTriaseValue,
                      max: 5,
                      divisions: 5,
                      label: state.skalaTriaseValue.round().toString(),
                      onChanged: (double value) {
                        context.read<TriaseBloc>().add(
                            TriaseEvent.skalaTriaseOnchanged(value: value));
                      },
                    ),
                    Center(
                      child: Text(
                        toSkalaTriase(skalaTriase: state.skalaTriaseValue),
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5.sp,
                    )
                  ],
                ));
      },
    );
  }

  Container titleContainer({required String title}) {
    return Container(
      width: Get.width,
      height: 20.sp,
      decoration: BoxDecoration(
        color: ThemeColor.blueColor.withOpacity(0.5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2.sp), topRight: Radius.circular(2.sp)),
      ),
      child: Center(
        child: Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container formBox(
      {required String title,
      required String subTitle,
      String? labelText,
      dynamic Function(String)? onChanged,
      String? value}) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
      child: Row(
        children: [
          SizedBox(
            width: 70.sp,
            child: Text(
              title,
              style: (labelText != null)
                  ? blackTextStyle.copyWith(fontWeight: FontWeight.bold)
                  : blackTextStyle,
            ),
          ),
          Expanded(
              child: FormWidget.textForm(
            onChanged: onChanged,
            value: value,
            labelText: labelText,
            enable: true,
          )),
          SizedBox(
            width: 5.sp,
          ),
          SizedBox(
            width: 25.sp,
            child: Text(
              subTitle,
              style: blackTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

List<String> skala = ["Wajah", "Kaki", "Aktifitas", "Menangis", "Bersuara"];
