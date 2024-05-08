import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/subjective/asses_rawat_jalan_perawat_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/pages/widget/box_emty_skrining_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/pages/widget/radio_button_with_textfield_wdiget.dart';
import 'package:sizer/sizer.dart';

class AssessmentRawatJalanPerawatPage extends StatefulWidget {
  const AssessmentRawatJalanPerawatPage({super.key});

  @override
  State<AssessmentRawatJalanPerawatPage> createState() =>
      _AssessmentRawatJalanPerawatPageState();
}

class _AssessmentRawatJalanPerawatPageState
    extends State<AssessmentRawatJalanPerawatPage> {
  // SELECTED MENU
  late String selectedMenu;
  String selectedPsikologis = "";
  String selectedSkriningNyeri = "";

  String selectedresikoJatuh = "";
  String selectedresikoJatuhSatu = "";

  // DATA UNTUK DISIMPAN
  String assesmentFungsional = "";

  late TextEditingController _kelUtama;
  late TextEditingController _riwayatPenyakit;
  String selectedRiwayatSaatDirumah = "";
  late TextEditingController _detailPengobatanSaatDiRumah;
  String selectedItemFungsional = "";
  String resikoJatuh1 = "";
  String resikoJatuh2 = "";
  String riwayatObatDirumah = "";

  late TextEditingController _riwayatObatDirumah;
  late TextEditingController _masalahKeperawatan;
  late TextEditingController _rencanaKeperawatan;
  late TextEditingController _td;
  late TextEditingController _nadi;
  late TextEditingController _suhu;
  late TextEditingController _pernapasan;
  late TextEditingController _beratBadan;
  late TextEditingController _tinggiBadan;
  late TextEditingController _lainnya;

  late TextEditingController _aseskepFungsionalDetail;
  late TextEditingController _psikoDetail;
  String selectedPulang1 = "";
  String selectedPulang2 = "";
  String selectedPulang3 = "";
  String hasilResikoJatuh = "";
  late TextEditingController _pulang1Detail;
  late TextEditingController _pulang2Detail;
  late TextEditingController _pulang3Detail;
  late TextEditingController _spikologisDetail;

  // Masalah Keperawatan
  late TextEditingController _aseskepMasalahKeperawatan;
  late TextEditingController _asesRencKeperawatan;

  void setFungsional({required String value}) {
    setState(() {
      selectedItemFungsional = value;
    });
  }

  void setRiwayatSaatDirumah({required String value}) {
    setState(() {
      selectedRiwayatSaatDirumah = value;
    });
  }

  void setSkriningNyeri({required String value}) {
    setState(() {
      selectedSkriningNyeri = value;
    });
  }

  void setResiko(String value1, String value2) {
    if (value1 == "true" && value2 == "true") {
      setState(() {
        hasilResikoJatuh = "RISIKO TINGGI - Pasang Pin Kuning, Edukasi";
      });
    } else if (value1 == "false" && value2 == "false") {
      setState(() {
        hasilResikoJatuh = "TIDAK BERISIKO - Tidak Ada Tindakan";
      });
    } else if (value1 == "" && value2 == "") {
      setState(() {
        hasilResikoJatuh = "";
      });
    } else {
      setState(() {
        hasilResikoJatuh = "RISIKO RENDAH - Edukasi";
      });
    }
  }

  void setPsikologis({required String value}) {
    setState(() {
      selectedPsikologis = value;
    });
  }

  void setResikoJatuh1({required String value}) {
    if (value == "Ya") {
      setState(() {
        resikoJatuh1 = "true";
      });
      setResiko(resikoJatuh1, resikoJatuh2);
    } else {
      setState(() {
        resikoJatuh1 = "false";
      });
      setResiko(resikoJatuh1, resikoJatuh2);
    }
  }

  void setResikoJatuh2({required String value}) {
    if (value == "Ya") {
      setState(() {
        resikoJatuh2 = "true";
      });
      setResiko(resikoJatuh1, resikoJatuh2);
    } else {
      setState(() {
        resikoJatuh2 = "false";
      });
      setResiko(resikoJatuh1, resikoJatuh2);
    }
  }

  @override
  void initState() {
    selectedMenu = menuAssementRawatJalan.first;
    _kelUtama = TextEditingController();
    _riwayatPenyakit = TextEditingController();
    _riwayatObatDirumah = TextEditingController();
    _masalahKeperawatan = TextEditingController();
    _rencanaKeperawatan = TextEditingController();
    _lainnya = TextEditingController();
    _td = TextEditingController();
    _nadi = TextEditingController();
    _suhu = TextEditingController();
    _pernapasan = TextEditingController();
    _beratBadan = TextEditingController();
    _tinggiBadan = TextEditingController();
    _spikologisDetail = TextEditingController();
    _detailPengobatanSaatDiRumah = TextEditingController();
    _asesRencKeperawatan = TextEditingController();
    _aseskepMasalahKeperawatan = TextEditingController();
    _aseskepFungsionalDetail = TextEditingController();
    _psikoDetail = TextEditingController();
    _pulang1Detail = TextEditingController();
    _pulang2Detail = TextEditingController();
    _pulang3Detail = TextEditingController();
    super.initState();
  }

  void clear() {
    _kelUtama.clear();
    _riwayatPenyakit.clear();
    _riwayatObatDirumah.clear();
    _masalahKeperawatan.clear();
    _rencanaKeperawatan.clear();
    _lainnya.clear();
    _td.clear();
    _nadi.clear();
    _suhu.clear();
    _pernapasan.clear();
    _beratBadan.clear();
    _detailPengobatanSaatDiRumah.clear();
    _asesRencKeperawatan.clear();
    _aseskepMasalahKeperawatan.clear();
    _tinggiBadan.clear();
    _spikologisDetail.clear();
    _pulang1Detail.clear();
    _aseskepFungsionalDetail.clear();
    _pulang2Detail.clear();
    _pulang3Detail.clear();
    _psikoDetail.clear();
  }

  @override
  void dispose() {
    clear();
    _td.dispose();
    _nadi.dispose();
    _suhu.dispose();
    _pernapasan.dispose();
    _beratBadan.dispose();
    _tinggiBadan.dispose();
    _spikologisDetail.dispose();

    _kelUtama.dispose();
    _riwayatObatDirumah.dispose();
    _riwayatPenyakit.dispose();
    _masalahKeperawatan.dispose();
    _rencanaKeperawatan.dispose();
    _detailPengobatanSaatDiRumah.dispose();
    _asesRencKeperawatan.dispose();
    _aseskepMasalahKeperawatan.dispose();

    _aseskepFungsionalDetail.dispose();
    _pulang2Detail.dispose();
    _pulang1Detail.dispose();
    _pulang3Detail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasienBloc, PasienState>(
      listener: (context, state) {
        if (state.loading) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (!state.loading) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                      orElse: () {},
                      loaded: (value) async {
                        MetaModel meta =
                            MetaModel.fromJson(value.value["metadata"]);
                        final shouldPop = await Alert.loaded(context,
                            subTitle: meta.message, title: "Pesan");
                        return shouldPop ?? false;
                      },
                    )));

        state.getResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) {
                      // GET RESULT
                      final value =
                          AssesRawatJalanModel.fromMap(e.value["response"]);

                      setState(() {
                        _kelUtama = TextEditingController(text: value.kelUtama);
                        _riwayatPenyakit =
                            TextEditingController(text: value.riwayatPenyakit);

                        // Set Pengobatan Saat Di Rumah
                        selectedRiwayatSaatDirumah =
                            (value.riwayatObat == "true")
                                ? "Ada"
                                : (value.riwayatObat == "false")
                                    ? "Tidak"
                                    : "";

                        _detailPengobatanSaatDiRumah = TextEditingController(
                            text: value.riwayatObatDetail);

                        // NYERI
                        selectedSkriningNyeri = value.nyeri;

                        // SET RESIKO JATUH
                        resikoJatuh1 = value.resikoJatuh1;
                        resikoJatuh2 = value.resikoJatuh2;

                        selectedresikoJatuh = (value.resikoJatuh1 == "true")
                            ? "Ya"
                            : (value.resikoJatuh1 == "false")
                                ? "Tidak"
                                : "";
                        selectedresikoJatuhSatu = (value.resikoJatuh2 == "true")
                            ? "Ya"
                            : (value.resikoJatuh2 == "false")
                                ? "Tidak"
                                : "";

                        selectedItemFungsional = (value.fungsional == "true")
                            ? "Mandiri"
                            : value.fungsionalDetail;

                        hasilResikoJatuh =
                            "${value.hasilKajiResikoJatuh}-${value.hasilKajiResikoJatuhTindakan}";

                        selectedPsikologis = value.psikologis;
                        _spikologisDetail =
                            TextEditingController(text: value.psikologisDetail);

                        // RENCANA PULANG
                        selectedPulang2 = value.pulang2;
                        selectedPulang1 = value.pulang1;
                        selectedPulang3 = value.pulang3;

                        _pulang1Detail =
                            TextEditingController(text: value.pulang1Detail);
                        _pulang2Detail =
                            TextEditingController(text: value.pulang2Detail);
                        _pulang3Detail =
                            TextEditingController(text: value.pulang3Detail);

                        _beratBadan =
                            TextEditingController(text: value.beratBadan);
                        _rencanaKeperawatan = TextEditingController(
                            text: value.rencanaKeperawatan);
                        _masalahKeperawatan = TextEditingController(
                            text: value.masalahKeperawatan);

                        _nadi = TextEditingController(text: value.nadi);

                        _riwayatObatDirumah = TextEditingController(
                            text: value.riwayatObatDetail);
                        _pernapasan =
                            TextEditingController(text: value.pernapasan);
                        _suhu = TextEditingController(text: value.suhu);
                        _td = TextEditingController(text: value.tekananDarah);
                        _tinggiBadan =
                            TextEditingController(text: value.tinggiBadan);
                      });
                    })));
      },
      child: BlocBuilder<PasienBloc, PasienState>(
        builder: (context, state) {
          // final singlePasien = state.listPasienModel
          //     .where((element) => element.mrn == state.normSelected);

          return Expanded(
              child: HeaderContentWidget(
            onPressed: () {
              // SAVE DATA
            },
            widget: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // KELUHAN UTAMA
                  BoxSkriningEmtyWidget(
                    width: Get.width,
                    title: "Keluhan Utama",
                    widget: Padding(
                      padding:
                          EdgeInsets.only(right: 6.sp, left: 6.sp, top: 3.sp),
                      child: FormWidget.textArea(
                        controller: _kelUtama,
                        maxLines: 3,
                      ),
                    ),
                  ),

                  // RIWAYAT PENYAKIITA
                  BoxSkriningEmtyWidget(
                    width: Get.width,
                    title: "Riwayat Penyakit",
                    widget: Padding(
                      padding:
                          EdgeInsets.only(right: 6.sp, left: 6.sp, top: 3.sp),
                      child: FormWidget.textArea(
                        controller: _riwayatPenyakit,
                        maxLines: 3,
                      ),
                    ),
                  ),

                  BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Riwayat Pengobatan Saat Dirumah",
                      widget: Container(
                        padding: EdgeInsets.all(6.sp),
                        child: Column(
                          children: [
                            Wrap(
                              children:
                                  riwayatPengobatan.asMap().entries.map((e) {
                                return SizedBox(
                                  width: 100.sp,
                                  child: RadioListTile(
                                      selected: (e.value ==
                                              selectedRiwayatSaatDirumah)
                                          ? true
                                          : false,
                                      activeColor: const Color(0xFF293074),
                                      selectedTileColor: Colors.cyan,
                                      title: Text(
                                        e.value,
                                        style: blackCalibriTextStyle.copyWith(
                                            fontSize: 10.sp),
                                        maxLines: 3,
                                        textAlign: TextAlign.start,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      value: e.value,
                                      groupValue: selectedRiwayatSaatDirumah,
                                      onChanged: (value) {
                                        if (value == "Tidak") {
                                          setState(() {
                                            riwayatObatDirumah = "false";
                                          });

                                          setRiwayatSaatDirumah(
                                              value: value.toString());

                                          setState(() {
                                            _detailPengobatanSaatDiRumah.text =
                                                "";
                                          });
                                        } else {
                                          setState(() {
                                            riwayatObatDirumah = "true";
                                          });
                                          setRiwayatSaatDirumah(
                                              value: value.toString());
                                        }
                                        log(selectedRiwayatSaatDirumah
                                            .toString());
                                      }),
                                );
                              }).toList(),
                            ),
                            if (selectedRiwayatSaatDirumah == "Ada") ...[
                              // TAMPILKAN KETERANGAN
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 12.sp, vertical: 10.sp),
                                width: Get.width,
                                child: FormWidget.textForm(
                                  controller: _detailPengobatanSaatDiRumah,
                                  enable: true,
                                ),
                              )
                            ],
                          ],
                        ),
                      )),

                  // TANDA TANDA VITAL
                  BoxSkriningEmtyWidget(
                    width: Get.width,
                    title: "Tanda Tanda Vital",
                    widget: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.sp, vertical: 12.sp),
                      child: Padding(
                          padding: EdgeInsets.only(
                              right: 6.sp, left: 6.sp, top: 3.sp),
                          child: Column(
                            children: [
                              vitalForm(
                                  satuan: "mmHg",
                                  title: "Tekanan Darah",
                                  controller: _td),
                              vitalForm(
                                  satuan: "x/menit",
                                  title: "Nadi",
                                  controller: _nadi),
                              vitalForm(
                                  satuan: "C",
                                  title: "Suhu",
                                  controller: _suhu),
                              vitalForm(
                                  satuan: "x/menit",
                                  title: "Pernapasan",
                                  controller: _pernapasan),
                              vitalForm(
                                  satuan: "kg",
                                  title: "Berat Badan",
                                  controller: _beratBadan),
                              vitalForm(
                                  satuan: "cm",
                                  title: "Tinggi Badan",
                                  controller: _tinggiBadan),
                            ],
                          )),
                    ),
                  ),

                  // SKRINING NYERI
                  BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Skrining Nyeri",
                      widget: Container(
                        padding: EdgeInsets.all(12.sp),
                        child: Wrap(
                          children: nyeri
                              .asMap()
                              .entries
                              .map((e) => SizedBox(
                                    width: 100.sp,
                                    child: RadioListTile(
                                        selected:
                                            (e.value == selectedSkriningNyeri)
                                                ? true
                                                : false,
                                        activeColor: const Color(0xFF293074),
                                        selectedTileColor: Colors.cyan,
                                        title: Text(
                                          e.value,
                                          style: blackCalibriTextStyle.copyWith(
                                              fontSize: 10.sp),
                                          maxLines: 3,
                                          textAlign: TextAlign.start,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        value: e.value,
                                        groupValue: selectedSkriningNyeri,
                                        onChanged: (value) {
                                          setSkriningNyeri(
                                              value: value.toString());
                                          log(selectedSkriningNyeri);
                                        }),
                                  ))
                              .toList(),
                        ),
                      )),
                  BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Psikologis",
                      widget: Container(
                        padding: EdgeInsets.all(12.sp),
                        child: Column(
                          children: [
                            Wrap(
                              children: spikologis
                                  .asMap()
                                  .entries
                                  .map((e) => SizedBox(
                                        width: 100.sp,
                                        child: RadioListTile(
                                            selected:
                                                (e.value == selectedPsikologis)
                                                    ? true
                                                    : false,
                                            activeColor:
                                                const Color(0xFF293074),
                                            selectedTileColor: Colors.cyan,
                                            title: Text(
                                              e.value,
                                              style: blackCalibriTextStyle
                                                  .copyWith(fontSize: 10.sp),
                                              maxLines: 3,
                                              textAlign: TextAlign.start,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            value: e.value,
                                            groupValue: selectedPsikologis,
                                            onChanged: (value) {
                                              setPsikologis(
                                                  value: value.toString());
                                            }),
                                      ))
                                  .toList(),
                            ),
                            if (selectedPsikologis == spikologis.last) ...[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 12.sp, vertical: 10.sp),
                                width: Get.width,
                                child: FormWidget.textForm(
                                  controller: _spikologisDetail,
                                  enable: true,
                                ),
                              )
                            ],
                          ],
                        ),
                      )),

                  BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Assesmen Fungsional",
                      widget: Container(
                        padding: EdgeInsets.all(12.sp),
                        child: Wrap(
                          children: pelayanan
                              .asMap()
                              .entries
                              .map((e) => SizedBox(
                                    width: 150.sp,
                                    child: RadioListTile(
                                        selected:
                                            (e.value == selectedItemFungsional)
                                                ? true
                                                : false,
                                        activeColor: const Color(0xFF293074),
                                        selectedTileColor: Colors.cyan,
                                        title: Text(
                                          e.value,
                                          style: blackCalibriTextStyle.copyWith(
                                              fontSize: 10.sp),
                                          maxLines: 3,
                                          textAlign: TextAlign.start,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        value: e.value,
                                        groupValue: selectedItemFungsional,
                                        onChanged: (value) {
                                          setFungsional(
                                              value: value.toString());
                                          log(selectedItemFungsional);
                                        }),
                                  ))
                              .toList(),
                        ),
                      )),

                  // ASSESSMENT FUNGSIONAL
                  BoxSkriningEmtyWidget(
                      width: Get.width,
                      title:
                          "Perencanaan Pemulangan Pasien (Discharge Planning)",
                      widget: Column(
                        children: [
                          SizedBox(
                            height: 5.sp,
                          ),
                          SizedBox(
                            height: 70.sp,
                            child: RadioButtonWithTextField(
                              selectedItem:
                                  (selectedPulang1 == "true") ? "Ya" : "Tidak",
                              height: 100.sp,
                              width: Get.width / 2,
                              title:
                                  "Apakah Pasien Dengan Diagnosa & Asuhan Kompleks ?",
                              children: pemulanganPasien,
                              onTap: (v) {
                                if (v == "Tidak") {
                                  setState(() {
                                    selectedPulang1 = "false";
                                  });
                                } else {
                                  setState(() {
                                    selectedPulang1 = "true";
                                  });
                                }
                                log(selectedPulang1.toString());
                              },
                              textEditingController: _pulang1Detail,
                            ),
                          ),
                          Divider(height: 2.sp, color: Colors.grey),
                          SizedBox(
                            height: 5.sp,
                          ),
                          SizedBox(
                            height: 70.sp,
                            child: RadioButtonWithTextField(
                              selectedItem:
                                  (selectedPulang2 == "true") ? "Ya" : "Tidak",
                              height: 50.sp,
                              width: Get.width / 2,
                              title: "Memerlukan Perawatan Lanjutan Di Rumah ?",
                              children: pemulanganPasien,
                              onTap: (v) {
                                if (v == "Tidak") {
                                  setState(() {
                                    selectedPulang2 = "false";
                                  });
                                } else {
                                  setState(() {
                                    selectedPulang2 = "true";
                                  });
                                }

                                log(selectedPulang2.toString());
                              },
                              textEditingController: _pulang2Detail,
                            ),
                          ),
                          Divider(height: 2.sp, color: Colors.grey),
                          SizedBox(
                            height: 5.sp,
                          ),
                          SizedBox(
                            height: 70.sp,
                            child: RadioButtonWithTextField(
                              selectedItem:
                                  (selectedPulang3 == "true") ? "Ya" : "Tidak",
                              width: Get.width / 2,
                              title:
                                  "Apakah Pasien Memerlukan Manager Pelayanan Pasien (MPP)?",
                              children: pemulanganPasien,
                              onTap: (v) {
                                if (v == "Tidak") {
                                  setState(() {
                                    selectedPulang3 = "false";
                                  });
                                } else {
                                  setState(() {
                                    selectedPulang3 = "true";
                                  });
                                }

                                log(selectedPulang3.toString());
                              },
                              textEditingController: _pulang3Detail,
                            ),
                          ),
                        ],
                      )),

                  BoxSkriningEmtyWidget(
                    width: Get.width,
                    title: "Assesmen Resiko Jatuh (Get Up & Get Test)",
                    widget: Padding(
                      padding: EdgeInsets.only(
                          right: 6.sp, left: 6.sp, top: 3.sp, bottom: 3.sp),
                      child: SizedBox(
                        child: Column(
                          children: [
                            // ==== //
                            Row(
                              children: [
                                Text(
                                  "Cara Berjalan Pasien (Salah Satu Atau Lebih)\n1. Tidak Seimbang/Sempoyongan/Limbung\n2. Jalan Dengan Menggunakan Alat bantu (Kruk, Tripot, Kursi Roda, Orang Lain)",
                                  style: blackTextStyle,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 50.sp,
                                  child: Column(
                                    children: [
                                      Wrap(
                                        children: pemulanganPasien
                                            .asMap()
                                            .entries
                                            .map((e) => RadioListTile(
                                                value: e.value,
                                                title: Text(
                                                  e.value,
                                                  style: blackTextStyle,
                                                ),
                                                activeColor:
                                                    const Color(0xFF293074),
                                                selectedTileColor: Colors.cyan,
                                                groupValue: selectedresikoJatuh,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedresikoJatuh =
                                                        value.toString();
                                                  });

                                                  setResikoJatuh1(
                                                      value: value!);
                                                }))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),

                            //
                            Row(
                              children: [
                                Text(
                                  "Menopang Saat Akan Duduk : Tampak Memegang Pinggiran Kursi Atau \nMeja/Benda Lain Sebagai Penopang Saat Akan Duduk",
                                  style: blackTextStyle,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 50.sp,
                                  child: Column(
                                    children: [
                                      Wrap(
                                        children: pemulanganPasien
                                            .asMap()
                                            .entries
                                            .map((e) => RadioListTile(
                                                  value: e.value,
                                                  title: Text(
                                                    e.value,
                                                    style: blackTextStyle,
                                                  ),
                                                  activeColor:
                                                      const Color(0xFF293074),
                                                  selectedTileColor:
                                                      Colors.cyan,
                                                  groupValue:
                                                      selectedresikoJatuhSatu,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedresikoJatuhSatu =
                                                          value.toString();
                                                    });

                                                    setResikoJatuh2(
                                                        value: value!);
                                                  },
                                                ))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                ))
                              ],
                            ),

                            SizedBox(
                              height: 5.sp,
                            ),

                            Text(hasilResikoJatuh,
                                style: blackCalibriTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp))
                          ],
                        ),
                      ),
                    ),
                  ),

                  // MASALAH KEPERAWATAN
                  BoxSkriningEmtyWidget(
                    width: Get.width,
                    title: "Masalah Keperawatan",
                    widget: Padding(
                      padding:
                          EdgeInsets.only(right: 6.sp, left: 6.sp, top: 3.sp),
                      child: FormWidget.textArea(
                        controller: _masalahKeperawatan,
                        maxLines: 3,
                      ),
                    ),
                  ),

                  // RENCANCA KEPERAWATAN
                  BoxSkriningEmtyWidget(
                    width: Get.width,
                    title: "Rencana Keperawatan",
                    widget: Padding(
                      padding:
                          EdgeInsets.only(right: 6.sp, left: 6.sp, top: 3.sp),
                      child: FormWidget.textArea(
                        controller: _rencanaKeperawatan,
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }

  Container vitalForm(
      {required String title,
      TextEditingController? controller,
      required String satuan}) {
    return Container(
      padding: EdgeInsets.all(1.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 120.sp,
              child: Text(
                title,
                style: blackCalibriTextStyle,
              )),
          SizedBox(
            width: 50.sp,
            child: FormWidget.numberForm(
              controller: controller,
              enable: true,
            ),
          ),
          SizedBox(
            width: 12.sp,
          ),
          Text(
            satuan,
            style: blackCalibriTextStyle,
          ),
        ],
      ),
    );
  }
}

List<String> riwayatPengobatan = ["Tidak", "Ada"];

List<String> risikoJatuh = [
  "Cara Berjalan Pasien (Salah Satu Atau Lebih)\n1.Tidak Seimbang/Sempoyongan/Limbung\n2. Jalan Dengan Menggunakan Alat bantu (Kruk, Tripot, Kursi Roda, Orang Lain)",
  "Menopang Saat Akan Duduk : Tampak Memegang Pinggiran Kursi Atau Meja/Benda Lain Sebagai Penopang Saat Akan Duduk"
];
List<String> pelayanan = [
  "Mandiri",
  "Dengan Bantuan Bidan",
  "Dengan Bantuan Dokter",
  "Dengan Bantuan Kursi Roda"
];

List<String> nyeri = [
  "Nyeri",
  "Tidak Nyeri",
];

List<String> spikologis = [
  "Tenang",
  "Cemas",
  "Gelisah",
  "Depresi",
  "Lain - Lain"
];

List<String> pemulanganPasien = [
  "Tidak",
  "Ya",
];

List<String> menuAssementRawatJalan = [
  "Keluhan Utama",
  "Riwayat Penyakit",
  "Riwayat Pengobatan Saat Dirumah",
  "Assesmen Fungsional",
  "Skrining Nyeri",
  "Tanda Tanda Vital",
  "Assesmen Resiko Jatuh (Get Up & Get Test)",
  // "Riwayat Obat Di Rumah",
  "Psikologis",
  "Perencanaan Pemulangan Pasien (Discharge Planning)",
  "Masalah Keperawatan",
  "Rencana Keperawatan"
];
