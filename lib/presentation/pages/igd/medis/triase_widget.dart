import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart';
import 'package:hms_app/domain/models/triase/triase_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class TriaseWidget extends StatefulWidget {
  const TriaseWidget({super.key});

  @override
  State<TriaseWidget> createState() => _TriaseWidgetState();
}

class _TriaseWidgetState extends State<TriaseWidget> {
  late TextEditingController _statusController = TextEditingController();
  late TextEditingController _alergiDetailController = TextEditingController();
  late TextEditingController _keluhanUtamaConttoller = TextEditingController();
  late TextEditingController _tekananDarahController = TextEditingController();
  late TextEditingController _pernapasanController = TextEditingController();
  late TextEditingController _pupilController = TextEditingController();
  late TextEditingController _nadiController = TextEditingController();
  late TextEditingController _spoController = TextEditingController();
  late TextEditingController _suhuController = TextEditingController();
  late TextEditingController _akralController = TextEditingController();
  late TextEditingController _reflekController = TextEditingController();
  late TextEditingController _provokasiController = TextEditingController();
  late TextEditingController _qualityController = TextEditingController();
  late TextEditingController _radiationController = TextEditingController();
  late TextEditingController _severityController = TextEditingController();
  late TextEditingController _timeController = TextEditingController();

  final double _currentSliderTriase = 0;
  double _currentNyeri = 0;
  double _currentWajah = 0;
  double _currentKaki = 0;
  double _currentAktifitas = 0;
  double _currentMenangis = 0;
  double _currentBersuara = 0;
  double _currentTotal = 0;
  // ==========================================
  late double _currentTriase;

  String selectedJalanNafas = "";
  String selectedGangguan = "";
  String selectedBahaya = "";
  String selectedNafas = "";
  late String statusAlergi;
  late String selectedSkala;

  @override
  void initState() {
    _statusController = TextEditingController();
    _alergiDetailController = TextEditingController();
    _keluhanUtamaConttoller = TextEditingController();
    _tekananDarahController = TextEditingController();
    _pernapasanController = TextEditingController();
    _pupilController = TextEditingController();
    _nadiController = TextEditingController();
    _spoController = TextEditingController();
    _suhuController = TextEditingController();
    _akralController = TextEditingController();
    _reflekController = TextEditingController();
    _provokasiController = TextEditingController();
    _qualityController = TextEditingController();
    _radiationController = TextEditingController();
    _severityController = TextEditingController();
    _timeController = TextEditingController();

    _currentTriase = 0;

    //===============================
    selectedSkala = skala[0];
    statusAlergi = "";
    super.initState();
  }

  void jumlah() {
    setState(() {
      _currentTotal = _currentWajah +
          _currentAktifitas +
          _currentKaki +
          _currentMenangis +
          _currentBersuara;
    });
  }

  void setGangguan(String value) {
    setState(() {
      selectedGangguan = value;
    });
  }

  void setBahaya(String value) {
    setState(() {
      selectedBahaya = value;
    });
  }

  void setJalanNafas(String value) {
    setState(() {
      selectedJalanNafas = value;
    });
  }

  String toLabel() {
    if (selectedSkala == skala[0]) {
      return _currentWajah.round().toString();
    }
    if (selectedSkala == skala[1]) {
      return _currentKaki.round().toString();
    }
    if (selectedSkala == skala[2]) {
      return _currentAktifitas.round().toString();
    }

    if (selectedSkala == skala[3]) {
      return _currentMenangis.round().toString();
    } else {
      return _currentBersuara.round().toString();
    }
  }

  void setValueFlacc({required double value}) {
    if (selectedSkala == skala[0]) {
      setState(() {
        _currentWajah = value;
      });
    }
    if (selectedSkala == skala[1]) {
      setState(() {
        _currentKaki = value;
      });
    }
    if (selectedSkala == skala[2]) {
      setState(() {
        _currentAktifitas = value;
      });
    }

    if (selectedSkala == skala[3]) {
      setState(() {
        _currentMenangis = value;
      });
    } else {
      setState(() {
        _currentBersuara = value;
      });
    }
  }

  double toSkalaFlacc({required String selectedSkala}) {
    if (selectedSkala == skala[0]) {
      return _currentWajah;
    }
    if (selectedSkala == skala[1]) {
      return _currentKaki;
    }
    if (selectedSkala == skala[2]) {
      return _currentAktifitas;
    }

    if (selectedSkala == skala[3]) {
      return _currentMenangis;
    } else {
      return _currentBersuara;
    }
  }

  void setNafas() {}

  @override
  void dispose() {
    _statusController.clear();
    _alergiDetailController.clear();
    _keluhanUtamaConttoller.clear();
    _tekananDarahController.clear();
    _pernapasanController.clear();
    _pupilController.clear();
    _nadiController.clear();
    _spoController.clear();
    _suhuController.clear();
    _akralController.clear();
    _reflekController.clear();
    _provokasiController.clear();
    _qualityController.clear();
    _radiationController.clear();
    _severityController.clear();
    _timeController.clear();

    _statusController.dispose();
    _alergiDetailController.dispose();
    _keluhanUtamaConttoller.dispose();
    _tekananDarahController.dispose();
    _pernapasanController.dispose();
    _pupilController.dispose();
    _nadiController.dispose();
    _spoController.dispose();
    _suhuController.dispose();
    _akralController.dispose();
    _reflekController.dispose();
    _provokasiController.dispose();
    _qualityController.dispose();
    _radiationController.dispose();
    _severityController.dispose();
    _timeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return Expanded(
      child: HeaderContentWidget(
          onPressed: () {
            // BUTTON TEKAN
            TriaseModel triase = TriaseModel(
              noreg: singlePasien.first.noreg,
              keluhan: _keluhanUtamaConttoller.text,
              alergiDetail: _alergiDetailController.text,
              nafas: selectedJalanNafas,
              tekananDarah: _tekananDarahController.text,
              pernapasan: _pernapasanController.text,
              pupil: _pupilController.text,
              nadi: _nadiController.text,
              spo: _spoController.text,
              suhu: _suhuController.text,
              akral: _akralController.text,
              reflekCahaya: _reflekController.text,
              gangguan: selectedGangguan,
              gangguanDetail: selectedBahaya,
              nyeri: _currentNyeri.toInt(),
              nyeriP: _provokasiController.text,
              nyeriQ: _qualityController.text,
              nyeriR: _radiationController.text,
              nyeriS: _severityController.text,
              nyeriT: _timeController.text,
              wajah: _currentWajah.toInt(),
              kaki: _currentKaki.toInt(),
              aktifitas: _currentAktifitas.toInt(),
              menangis: _currentMenangis.toInt(),
              bersuara: _currentBersuara.toInt(),
              total: _currentTotal.toInt(),
              triase: _currentTriase.toInt(),
              alergi: statusAlergi,
            );

            context
                .read<TriaseBloc>()
                .add(TriaseEvent.saveTriase(triaseModel: triase));
          },
          widget: BlocConsumer<TriaseBloc, TriaseState>(
            listener: (context, state) {
              log(state.saveOrSuccessResult.toString());

              if (state.isLoading) {
                EasyLoading.show();
              }

              if (!state.isLoading) {
                EasyLoading.dismiss();
              }

              state.saveOrSuccessResult.fold(
                  () => null,
                  (a) => a.fold(
                      (l) => l.maybeMap(
                          orElse: () {},
                          failure: (e) async {
                            // Failure
                            // TAMPILKAN PESAN KESALAHAN
                            final shouldPop = await Alert.warningMessage(
                                context,
                                subTitle: e.meta.message.toString());
                            return shouldPop ?? false;
                          }),
                      (r) => r.maybeMap(
                          orElse: () {},
                          loaded: (e) async {
                            log("GET DATA $e");
                            // TAMPILKAN PESAN KESALAHAN
                            final shouldPop = await Alert.warningMessage(
                                context,
                                subTitle:
                                    e.value["metadata"]["message"].toString());
                            return shouldPop ?? false;
                          })));

              state.getfailOrSuccessResult.fold(
                  () => null,
                  (a) => a.fold(
                      (l) => null,
                      (r) => r.maybeMap(
                            orElse: () {},
                            auAutorized: (e) {},
                            emty: (e) {},
                            loaded: (e) {
                              TriaseModel triase =
                                  TriaseModel.fromJson(e.value["response"]);

                              setState(() {
                                _keluhanUtamaConttoller.text = triase.keluhan;
                                selectedJalanNafas = triase.nafas;
                                _tekananDarahController.text =
                                    triase.tekananDarah;
                                _pernapasanController.text = triase.pernapasan;
                                selectedNafas = triase.nafas;
                                _pupilController.text = triase.pupil;
                                _nadiController.text = triase.nadi;
                                _spoController.text = triase.spo;
                                _suhuController.text = triase.suhu;
                                _akralController.text = triase.akral;
                                _reflekController.text = triase.reflekCahaya;
                                selectedGangguan = triase.gangguan;
                                selectedBahaya = triase.gangguanDetail;

                                _statusController.text = triase.alergiDetail;
                                _provokasiController.text = triase.nyeriP;
                                _qualityController.text = triase.nyeriQ;
                                _radiationController.text = triase.nyeriR;
                                _severityController.text = triase.nyeriS;

                                /// ========================================================///
                                _timeController.text = triase.nyeriT;
                                _currentWajah = triase.wajah.toDouble();
                                _currentKaki = triase.kaki.toDouble();
                                _currentAktifitas = triase.aktifitas.toDouble();
                                _currentMenangis = triase.menangis.toDouble();
                                _currentBersuara = triase.bersuara.toDouble();

                                /// ========================================================///
                                _statusController.text = triase.alergiDetail;
                                _alergiDetailController.text =
                                    triase.alergiDetail;
                                _currentNyeri = triase.nyeri.toDouble();
                                //===========================================================//
                                statusAlergi = triase.alergi;
                                if (triase.alergi == "Tidak") {
                                  _alergiDetailController.clear();
                                }
                                _currentTriase = triase.triase.toDouble();
                              });
                            },
                          )));

              //===
            },
            builder: (context, state) {
              return ListView(
                children: [
                  // ===========================
                  SizedBox(
                    width: Get.width,
                    child: Card(
                      color: ThemeColor.bgColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.sp,
                            color: ThemeColor.blackColor,
                          ),
                          borderRadius: BorderRadius.circular(2.sp)),
                      //========
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleContainer(title: "Riwayat Dan Alergi"),

                          //  =======
                          Container(
                            width: Get.width,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: Text(
                                    "Keluhan Utama",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(3.sp),
                                  child: FormWidget.textForm(
                                      enable: true,
                                      controller: _keluhanUtamaConttoller),
                                ),
                                const Divider(),
                              ],
                            ),
                          ),

                          //========
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Status Alergi",
                              style: blackTextStyle,
                            ),
                          ),

                          SizedBox(height: 5.sp),

                          SizedBox(
                            width: Get.width / 3,
                            child: Wrap(
                              children: pemulanganPasien
                                  .map((e) => SizedBox(
                                        width: 90.sp,
                                        height: 25.sp,
                                        child: Card(
                                          color: ThemeColor.lightGrey,
                                          elevation: 1.sp,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp)),
                                          child: Center(
                                            child: RadioListTile(
                                                selected: (e == statusAlergi)
                                                    ? true
                                                    : false,
                                                activeColor:
                                                    const Color(0xFF293074),
                                                selectedTileColor:
                                                    ThemeColor.bgColor,
                                                title: Text(
                                                  e,
                                                  style: blackCalibriTextStyle
                                                      .copyWith(
                                                          fontSize: 10.sp),
                                                  maxLines: 3,
                                                  textAlign: TextAlign.start,
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                value: e,
                                                groupValue: statusAlergi,
                                                onChanged: (value) {
                                                  // ============== //
                                                  setState(() {
                                                    statusAlergi =
                                                        value.toString();
                                                  });

                                                  if (statusAlergi == "Tidak") {
                                                    _alergiDetailController
                                                        .clear();
                                                  }
                                                }),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),

                          if (statusAlergi == pemulanganPasien.first) ...[
                            Padding(
                              padding: EdgeInsets.all(2.sp),
                              child: FormWidget.textForm(
                                  controller: _alergiDetailController,
                                  enable: true,
                                  labelText: "Status Alergi"),
                            )
                          ],

                          SizedBox(height: 5.sp),
                          titleContainer(
                              title: "Tanda Vital & Gangguan Perilaku"),

                          // ================================================
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.sp),
                                width: Get.width / 5,
                                child: Text(
                                  "Jalan Nafas",
                                  style: blackTextStyle,
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 3,
                                child: Wrap(
                                  children: jalanNafas
                                      .map((e) => SizedBox(
                                            width: 90.sp,
                                            height: 25.sp,
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
                                                        (e == selectedNafas)
                                                            ? true
                                                            : false,
                                                    activeColor:
                                                        const Color(0xFF293074),
                                                    selectedTileColor:
                                                        ThemeColor.bgColor,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    value: e,
                                                    groupValue:
                                                        selectedJalanNafas,
                                                    onChanged: (value) {
                                                      setJalanNafas(
                                                          value.toString());
                                                    }),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width / 2.5,
                                child: Column(
                                  children: [
                                    formBox(
                                        title: "Tekanan Darah",
                                        subTitle: "mmHg",
                                        controller: _tekananDarahController),
                                    formBox(
                                        title: "Pernapasan",
                                        subTitle: "x/mnt",
                                        controller: _pernapasanController),
                                    formBox(
                                        title: "Pupil ",
                                        subTitle: "mm/mm",
                                        controller: _pupilController),
                                    formBox(
                                        title: "Nadi",
                                        subTitle: "x/mnt",
                                        controller: _nadiController),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      formBox(
                                          title: "SpO2",
                                          subTitle: "%",
                                          controller: _spoController),
                                      formBox(
                                          title: "Suhu",
                                          subTitle: "*C",
                                          controller: _suhuController),
                                      formBox(
                                          title: "Akral",
                                          subTitle: "",
                                          controller: _akralController),
                                      formBox(
                                          title: "Reflek Cahaya",
                                          subTitle: "",
                                          controller: _reflekController),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // =====
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.sp),
                                width: Get.width / 5,
                                child: Text(
                                  "Gangguan Perilaku",
                                  style: blackTextStyle,
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 5,
                                child: Wrap(
                                  children: gangguan
                                      .map((e) => SizedBox(
                                            height: 30.sp,
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
                                                        (e == selectedGangguan)
                                                            ? true
                                                            : false,
                                                    activeColor:
                                                        const Color(0xFF293074),
                                                    selectedTileColor:
                                                        ThemeColor.bgColor,
                                                    title: Text(
                                                      e,
                                                      style: blackTextStyle,
                                                      maxLines: 3,
                                                      textAlign:
                                                          TextAlign.start,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    value: e,
                                                    groupValue:
                                                        selectedGangguan,
                                                    onChanged: (value) {
                                                      setGangguan(
                                                          value.toString());

                                                      if (selectedGangguan ==
                                                          gangguan.first) {
                                                        setState(() {
                                                          selectedBahaya == "";
                                                        });
                                                      }
                                                    }),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),

                              // ===
                              if (selectedGangguan == gangguan.last) ...[
                                SizedBox(
                                  width: Get.width / 4,
                                  child: Wrap(
                                    children: membahayakan
                                        .map((e) => SizedBox(
                                              height: 30.sp,
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
                                                          (e == selectedBahaya)
                                                              ? true
                                                              : false,
                                                      activeColor: const Color(
                                                          0xFF293074),
                                                      selectedTileColor:
                                                          ThemeColor.bgColor,
                                                      title: Text(
                                                        e,
                                                        style: blackTextStyle,
                                                        maxLines: 3,
                                                        textAlign:
                                                            TextAlign.start,
                                                        softWrap: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      value: e,
                                                      groupValue:
                                                          selectedBahaya,
                                                      onChanged: (value) {
                                                        setBahaya(
                                                            value.toString());
                                                      }),
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          titleContainer(title: "Skala Nyeri"),
                          Slider(
                            value: _currentNyeri,
                            max: 10,
                            divisions: 10,
                            label: _currentNyeri.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentNyeri = value;
                              });
                              // log(value.toString());
                              log(_currentNyeri.toString());
                            },
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 2.5,
                                  child: Text(
                                    "Skala\nNyeri\n${_currentNyeri.toInt()}",
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
                                              toNyeri(nyeri: _currentNyeri))),
                                      Text(
                                        toNyeriText(nyeri: _currentNyeri),
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
                              labelText: "Isikan Deskripsi Provokatif Disini",
                              controller: _provokasiController),
                          formBox(
                              title: "Q",
                              subTitle: "",
                              labelText: "Isikan Deskripsi Quality Disini",
                              controller: _qualityController),
                          formBox(
                              title: "R",
                              subTitle: "",
                              labelText: "Isikan Deskripsi Radiation Disini",
                              controller: _radiationController),
                          formBox(
                              title: "S",
                              subTitle: "",
                              labelText: "Isikan Deskripsi Severity Disini",
                              controller: _severityController),
                          formBox(
                              title: "T",
                              subTitle: "",
                              labelText: "Isikan Deskripsi Time Disini",
                              controller: _timeController),
                          SizedBox(height: 5.sp),

                          // ==================================
                          titleContainer(title: "Skala FLACC (Anak < 6 Tahun)"),
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
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: blackTextStyle
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                                FormWidget.styleDropdown(
                                                    context),
                                            style: blackTextStyle.copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis),
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
                                        selectedSkala: selectedSkala),
                                    max: 2,
                                    divisions: 2,
                                    label: toLabel(),
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
                                (_currentWajah == 0)
                                    ? "Tersenyum/Tidak Ada Ekspresi Khusus"
                                    : (_currentWajah == 1)
                                        ? "Terkadang Menangis/Menarik Diri"
                                        : (_currentWajah == 2)
                                            ? "Sering Menggertakan Dagu Dan Mengatupkan Rahang"
                                            : "",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          if (selectedSkala == skala[1]) ...[
                            Center(
                              child: Text(
                                (_currentKaki == 0)
                                    ? "Gerakan Normal/Relaksasi"
                                    : (_currentKaki == 1)
                                        ? "Tidak Tenang/Tegang"
                                        : (_currentKaki == 2)
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
                                (_currentAktifitas == 0)
                                    ? "Tidur, Posisi Normal / Relaksasi"
                                    : (_currentAktifitas == 1)
                                        ? "Gerakan Menggeliat, Berguling, Kaku"
                                        : (_currentAktifitas == 2)
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
                                (_currentMenangis == 0)
                                    ? "Tidak Menangis (Bangun Tidur)"
                                    : (_currentMenangis == 1)
                                        ? "Mengerang, Merengek-rengek"
                                        : (_currentMenangis == 2)
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
                                (_currentBersuara == 0)
                                    ? "Bersuara Normal / Tenang"
                                    : (_currentBersuara == 1)
                                        ? "Tenang Bila Dipeluk, Digendong Atau Diajak Bicara"
                                        : (_currentBersuara == 2)
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
                            value: _currentTriase,
                            max: 5,
                            divisions: 5,
                            label: _currentTriase.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentTriase = value;
                              });
                            },
                          ),
                          Center(
                            child: Text(
                              toSkalaTriase(skalaTriase: _currentSliderTriase),
                              textAlign: TextAlign.center,
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                  // =========================== TRIASE ================== //
                ],
              );
            },
          )),
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
      TextEditingController? controller}) {
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
            labelText: labelText,
            controller: controller,
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

  Container cardForm(
      {required BuildContext context,
      required String title,
      required String value,
      required void Function()? onPressed}) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 40.sp,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: blackTextStyle,
              )),

          SizedBox(
            width: Get.width / 1.9.sp,
            child: FormWidget.textForm(
                enable: true, controller: TextEditingController(text: value)),
          ),
          SizedBox(
            width: 2.sp,
          ),
          //
          SizedBox(
            width: 30.sp,
            height: 25.sp,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.sp))),
                onPressed: onPressed,
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          )
          //NOTED
        ],
      ),
    );
  }
}

List<String> pemulanganPasien = [
  "Ya",
  "Tidak",
];

List<String> jalanNafas = [
  "Bebas",
  "Sumbatan",
];

List<String> gangguan = [
  "Tidak Terganggu",
  "Ada Gangguan",
];

List<String> membahayakan = [
  "Tidak Membahayakan",
  "Membahayakan Diri Sendiri/Orang Lain"
];

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

List<String> skala = ["Wajah", "Kaki", "Aktifitas", "Menangis", "Bersuara"];
