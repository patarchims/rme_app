import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/pages/widget/box_emty_skrining_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../../domain/models/asesment_keb_edukasi/assement_keb_edu.dart';

class AssessmentKebutuhanEdukasiGigiPage extends StatefulWidget {
  const AssessmentKebutuhanEdukasiGigiPage({super.key});

  @override
  State<AssessmentKebutuhanEdukasiGigiPage> createState() =>
      _AssessmentKebutuhanEdukasiGigiPageState();
}

class _AssessmentKebutuhanEdukasiGigiPageState
    extends State<AssessmentKebutuhanEdukasiGigiPage> {
  late String selectedMenu;

  // KEBUTUHAN EDUKASI
  bool k1 = false;
  bool k2 = false;
  bool k3 = false;
  bool k4 = false;
  bool k5 = false;
  bool k6 = false;
  bool k7 = false;
  bool k8 = false;
  bool k9 = false;
  bool k10 = false;
  bool k11 = false;
  late TextEditingController _k11Detail;
  late TextEditingController _butuhTerjemahController;
  String butuhTerjemahValue = "";

  bool tujuan1 = false;
  bool tujuan2 = false;

  bool kempBelajar1 = false;
  bool kempBelajar2 = false;
  bool kempBelajar3 = false;

  bool motiveBel1 = false;
  bool motiveBel2 = false;
  bool motiveBel3 = false;

  bool pilPasien1 = false;
  bool pilPasien2 = false;
  bool pilPasien3 = false;
  bool pilPasien4 = false;
  bool pilPasien5 = false;
  bool pilPasien6 = false;
  late TextEditingController _pilPasien6Detail;

  bool hambatan1 = false;
  bool hambatan2 = false;
  bool hambatan3 = false;
  bool hambatan4 = false;
  bool hambatan5 = false;
  bool hambatan6 = false;
  bool hambatan7 = false;
  bool hambatan8 = false;
  bool hambatan9 = false;
  late TextEditingController _hambatanDetail;

  bool intervensi1 = false;
  bool intervensi2 = false;
  bool intervensi3 = false;
  bool intervensi4 = false;
  bool intervensi5 = false;

  bool hasil1 = false;
  bool hasil2 = false;

  late TextEditingController _rencanaEdukasi;

  @override
  void initState() {
    super.initState();
    selectedMenu = pilihanMenu.first;
    _butuhTerjemahController = TextEditingController();
    _k11Detail = TextEditingController();
    _rencanaEdukasi = TextEditingController();
    _pilPasien6Detail = TextEditingController();
    _hambatanDetail = TextEditingController();
  }

  @override
  void dispose() {
    _k11Detail.clear();
    _k11Detail.dispose();
    _butuhTerjemahController.clear();
    _butuhTerjemahController.dispose();

    _pilPasien6Detail.clear();
    _pilPasien6Detail.dispose();

    _hambatanDetail.clear();
    _hambatanDetail.dispose();

    _rencanaEdukasi.clear();
    _rencanaEdukasi.dispose();
    super.dispose();
  }

  bool setHasil(int index, {required bool hasil1, required bool hasil2}) {
    switch (index) {
      case 0:
        return hasil1;
      case 1:
        return hasil2;
      default:
        return false;
    }
  }

  void setButuhTerjemah(String value) {
    setState(() {
      butuhTerjemahValue = value;
    });
  }

  void updateData(e) {
    AssementKebEdukasiModel edukasi =
        AssementKebEdukasiModel.fromMap(e.value["response"]);

    setState(() {
      // EDUKASI
      k1 = (edukasi.edukasi.kebEdu1 == "true") ? true : false;
      k2 = (edukasi.edukasi.kebEdu2 == "true") ? true : false;
      k3 = (edukasi.edukasi.kebEdu3 == "true") ? true : false;
      k4 = (edukasi.edukasi.kebEdu4 == "true") ? true : false;
      k5 = (edukasi.edukasi.kebEdu5 == "true") ? true : false;
      k6 = (edukasi.edukasi.kebEdu6 == "true") ? true : false;
      k7 = (edukasi.edukasi.kebEdu7 == "true") ? true : false;
      k8 = (edukasi.edukasi.kebEdu8 == "true") ? true : false;
      k9 = (edukasi.edukasi.kebEdu9 == "true") ? true : false;
      k10 = (edukasi.edukasi.kebEdu10 == "true") ? true : false;
      k11 = (edukasi.edukasi.kebEdu11 == "true") ? true : false;
      _k11Detail = TextEditingController(text: edukasi.edukasi.kebEdu11Detail);

      // TUJUAN
      tujuan1 = (edukasi.tujuan.tujuan1 == "true") ? true : false;
      tujuan2 = (edukasi.tujuan.tujuan2 == "true") ? true : false;

      //  KEMAMPUAN BELAJAR
      kempBelajar1 =
          (edukasi.kemampuanBelajar.kempBelajar1 == "true") ? true : false;
      kempBelajar2 =
          (edukasi.kemampuanBelajar.kempBelajar2 == "true") ? true : false;
      kempBelajar3 =
          (edukasi.kemampuanBelajar.kempBelajar3 == "true") ? true : false;

      // MOTIVASI BELAJAR
      motiveBel1 =
          (edukasi.motivasiBelajar.motivasiBelajar1 == "true") ? true : false;
      motiveBel2 =
          (edukasi.motivasiBelajar.motivasiBelajar2 == "true") ? true : false;
      motiveBel3 =
          (edukasi.motivasiBelajar.motivasiBelajar3 == "true") ? true : false;

      // PILIHAN
      // PASIEN
      pilPasien1 = (edukasi.nilaiPasien.nilaiPasien1 == "true") ? true : false;
      pilPasien2 = (edukasi.nilaiPasien.nilaiPasien2 == "true") ? true : false;
      pilPasien2 = (edukasi.nilaiPasien.nilaiPasien3 == "true") ? true : false;
      pilPasien4 = (edukasi.nilaiPasien.nilaiPasien4 == "true") ? true : false;
      pilPasien5 = (edukasi.nilaiPasien.nilaiPasien5 == "true") ? true : false;
      pilPasien6 = (edukasi.nilaiPasien.nilaiPasien6 == "true") ? true : false;
      _pilPasien6Detail =
          TextEditingController(text: edukasi.nilaiPasien.nilaiPasien6Detail);

      // HAMBATAN
      hambatan1 = (edukasi.hambatan.hambatan1 == "true") ? true : false;
      hambatan2 = (edukasi.hambatan.hambatan2 == "true") ? true : false;
      hambatan3 = (edukasi.hambatan.hambatan3 == "true") ? true : false;
      hambatan4 = (edukasi.hambatan.hambatan4 == "true") ? true : false;
      hambatan5 = (edukasi.hambatan.hambatan5 == "true") ? true : false;
      hambatan6 = (edukasi.hambatan.hambatan6 == "true") ? true : false;
      hambatan7 = (edukasi.hambatan.hambatan7 == "true") ? true : false;
      hambatan8 = (edukasi.hambatan.hambatan8 == "true") ? true : false;
      hambatan9 = (edukasi.hambatan.hambatan9 == "true") ? true : false;
      _hambatanDetail =
          TextEditingController(text: edukasi.hambatan.hambatan9Detail);

      // INTERVENSI
      intervensi1 = (edukasi.intervensi.intervensi1 == "true") ? true : false;
      intervensi2 = (edukasi.intervensi.intervensi2 == "true") ? true : false;
      intervensi3 = (edukasi.intervensi.intervensi3 == "true") ? true : false;
      intervensi4 = (edukasi.intervensi.intervensi4 == "true") ? true : false;
      intervensi5 = (edukasi.intervensi.intervensi5 == "true") ? true : false;

      // HASIL
      hasil1 = (edukasi.hasil.hasil1 == "true") ? true : false;
      hasil2 = (edukasi.hasil.hasil2 == "true") ? true : false;

      _rencanaEdukasi = TextEditingController(text: edukasi.rencanaEdukasi);
    });
  }

  bool setTujuan(int index, {required bool tujuan1, required bool tujuan2}) {
    switch (index) {
      case 0:
        return tujuan1;
      case 1:
        return tujuan2;
      default:
        return false;
    }
  }

  bool setMotivBelajar(int index,
      {required bool motiveBel1,
      required bool motiveBel2,
      required bool motiveBel3}) {
    switch (index) {
      case 0:
        return motiveBel1;
      case 1:
        return motiveBel2;
      case 2:
        return motiveBel3;
      default:
        return false;
    }
  }

  bool setHambatan(int index,
      {required bool hambatan1,
      required bool hambatan2,
      required bool hambatan3,
      required bool hambatan4,
      required bool hambatan5,
      required bool hambatan6,
      required bool hambatan7,
      required bool hambatan8,
      required bool hambatan9}) {
    switch (index) {
      case 0:
        return hambatan1;
      case 1:
        return hambatan2;
      case 2:
        return hambatan3;
      case 3:
        return hambatan4;
      case 4:
        return hambatan5;
      case 5:
        return hambatan6;
      case 6:
        return hambatan7;
      case 7:
        return hambatan8;
      case 8:
        return hambatan9;
      default:
        return false;
    }
  }

  bool setNilai(int index,
      {required bool pilPasien1,
      required bool pilPasien2,
      required bool pilPasien3,
      required bool pilPasien4,
      required bool pilPasien5,
      required bool pilPasien6}) {
    switch (index) {
      case 0:
        return pilPasien1;
      case 1:
        return pilPasien2;
      case 2:
        return pilPasien3;
      case 3:
        return pilPasien4;
      case 4:
        return pilPasien5;
      case 5:
        return pilPasien6;
      default:
        return false;
    }
  }

  bool setKemampuanBelajar(int index,
      {required bool kempBelajar1,
      required bool kempBelajar2,
      required bool kempBelajar3}) {
    switch (index) {
      case 0:
        return kempBelajar1;
      case 1:
        return kempBelajar2;
      case 2:
        return kempBelajar3;
      default:
        return false;
    }
  }

  bool setIntervensi(int index,
      {required bool intervensi1,
      required bool intervensi2,
      required bool intervensi3,
      required bool intervensi4,
      required bool intervensi5}) {
    switch (index) {
      case 0:
        return intervensi1;
      case 1:
        return intervensi2;
      case 2:
        return intervensi3;
      case 3:
        return intervensi4;
      case 4:
        return intervensi5;
      default:
        return false;
    }
  }

  bool setEdukasi(
    int index, {
    required bool k1,
    required bool k2,
    required bool k3,
    required bool k4,
    required bool k5,
    required bool k6,
    required bool k7,
    required bool k8,
    required bool k9,
    required bool k10,
    required bool k11,
  }) {
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
      case 6:
        return k7;
      case 7:
        return k8;
      case 8:
        return k9;
      case 9:
        return k10;
      case 10:
        return k11;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasienBloc, PasienState>(
      listener: (context, state) {
        // tampilkan loading
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
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);

                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      shouldPop ?? false;
                      updateData(e);
                    })));

        state.getResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      updateData(e);
                    })));
      },
      child: BlocBuilder<PasienBloc, PasienState>(
        builder: (context, state) {
          return Expanded(
            child: HeaderContentWidget(
              onPressed: () {},
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    BoxSkriningEmtyWidget(
                        width: Get.width,
                        title: "Kebutuhan Edukasi",
                        widget: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 12.sp),
                          child: Column(
                            children: [
                              Wrap(
                                children: kebutuhanEdukasi
                                    .asMap()
                                    .entries
                                    .map((box) => Container(
                                          width: Get.width / 3.4,
                                          padding:
                                              EdgeInsets.only(bottom: 5.sp),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 10.sp,
                                                child: Checkbox(
                                                  activeColor:
                                                      const Color(0xFF6200EE),
                                                  checkColor: Colors.white,
                                                  value: setEdukasi(
                                                    box.key,
                                                    k1: k1,
                                                    k2: k2,
                                                    k3: k3,
                                                    k4: k4,
                                                    k5: k5,
                                                    k6: k6,
                                                    k7: k7,
                                                    k8: k8,
                                                    k9: k9,
                                                    k10: k10,
                                                    k11: k11,
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      switch (box.key) {
                                                        case 0:
                                                          k1 = value!;
                                                          break;
                                                        case 1:
                                                          k2 = value!;
                                                          break;
                                                        case 2:
                                                          k3 = value!;
                                                          break;
                                                        case 3:
                                                          k4 = value!;
                                                          break;
                                                        case 4:
                                                          k5 = value!;
                                                          break;
                                                        case 5:
                                                          k6 = value!;
                                                          break;
                                                        case 6:
                                                          k7 = value!;
                                                          break;
                                                        case 7:
                                                          k8 = value!;
                                                          break;
                                                        case 8:
                                                          k9 = value!;
                                                          break;
                                                        case 9:
                                                          k10 = value!;
                                                          break;
                                                        case 10:
                                                          k11 = value!;
                                                          break;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.sp,
                                              ),
                                              Text(
                                                box.value,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 10.sp),
                                              )
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                              if (k11) ...[
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.sp),
                                  height: 55.sp,
                                  child: FormWidget.textForm(
                                      enable: true, controller: _k11Detail),
                                )
                              ]
                            ],
                          ),
                        )),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Tujuan",
                      widget: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 12.sp),
                        child: Column(
                          children: tujuan
                              .asMap()
                              .entries
                              .map((box) => Container(
                                    padding: EdgeInsets.only(bottom: 5.sp),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.sp,
                                          height: 10.sp,
                                          child: Checkbox(
                                            activeColor:
                                                const Color(0xFF6200EE),
                                            checkColor: Colors.white,
                                            value: setTujuan(box.key,
                                                tujuan1: tujuan1,
                                                tujuan2: tujuan2),
                                            onChanged: (value) {
                                              setState(() {
                                                switch (box.key) {
                                                  case 0:
                                                    tujuan1 = value!;
                                                    break;
                                                  default:
                                                    tujuan2 = value!;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.sp,
                                        ),
                                        Text(
                                          box.value,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Kemampuan Belajar",
                      widget: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 12.sp),
                        child: Column(
                          children: kemampuanBelajar
                              .asMap()
                              .entries
                              .map((box) => Container(
                                    padding: EdgeInsets.only(bottom: 5.sp),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.sp,
                                          height: 10.sp,
                                          child: Checkbox(
                                            activeColor:
                                                const Color(0xFF6200EE),
                                            checkColor: Colors.white,
                                            value: setKemampuanBelajar(box.key,
                                                kempBelajar1: kempBelajar1,
                                                kempBelajar2: kempBelajar2,
                                                kempBelajar3: kempBelajar3),
                                            onChanged: (value) {
                                              setState(() {
                                                switch (box.key) {
                                                  case 0:
                                                    kempBelajar1 = value!;
                                                    break;
                                                  case 1:
                                                    kempBelajar2 = value!;
                                                    break;
                                                  case 2:
                                                    kempBelajar3 = value!;
                                                    break;
                                                  default:
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.sp,
                                        ),
                                        Text(
                                          box.value,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Motivasi Belajar",
                      widget: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 12.sp),
                        child: Column(
                          children: motivasiBelajar
                              .asMap()
                              .entries
                              .map((box) => Container(
                                    padding: EdgeInsets.only(bottom: 5.sp),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.sp,
                                          height: 10.sp,
                                          child: Checkbox(
                                            activeColor:
                                                const Color(0xFF6200EE),
                                            checkColor: Colors.white,
                                            value: setMotivBelajar(box.key,
                                                motiveBel1: motiveBel1,
                                                motiveBel2: motiveBel2,
                                                motiveBel3: motiveBel3),
                                            onChanged: (value) {
                                              setState(() {
                                                switch (box.key) {
                                                  case 0:
                                                    motiveBel1 = value!;
                                                    break;
                                                  case 1:
                                                    motiveBel2 = value!;
                                                    break;
                                                  case 2:
                                                    motiveBel3 = value!;
                                                    break;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.sp,
                                        ),
                                        Text(
                                          box.value,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Nilai - Nilai & Pilihan Pasien",
                      widget: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 12.sp),
                        child: Column(
                          children: [
                            Wrap(
                              children: pilihanPasien
                                  .asMap()
                                  .entries
                                  .map((box) => Container(
                                        width: Get.width,
                                        padding: EdgeInsets.only(bottom: 5.sp),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10.sp,
                                              height: 10.sp,
                                              child: Checkbox(
                                                activeColor:
                                                    const Color(0xFF6200EE),
                                                checkColor: Colors.white,
                                                value: setNilai(box.key,
                                                    pilPasien1: pilPasien1,
                                                    pilPasien2: pilPasien2,
                                                    pilPasien3: pilPasien3,
                                                    pilPasien4: pilPasien4,
                                                    pilPasien5: pilPasien5,
                                                    pilPasien6: pilPasien6),
                                                onChanged: (value) {
                                                  setState(() {
                                                    switch (box.key) {
                                                      case 0:
                                                        pilPasien1 = value!;
                                                        break;
                                                      case 1:
                                                        pilPasien2 = value!;
                                                        break;
                                                      case 2:
                                                        pilPasien3 = value!;
                                                        break;
                                                      case 3:
                                                        pilPasien4 = value!;
                                                        break;
                                                      case 4:
                                                        pilPasien5 = value!;
                                                        break;
                                                      case 5:
                                                        pilPasien6 = value!;
                                                        break;
                                                      default:
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.sp,
                                            ),
                                            SizedBox(
                                              width: Get.width / 1.8,
                                              child: Text(
                                                box.value,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 10.sp),
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                            if (pilPasien6) ...[
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.sp),
                                height: 55.sp,
                                child: FormWidget.textForm(
                                    enable: true,
                                    controller: _pilPasien6Detail),
                              )
                            ]
                          ],
                        ),
                      ),
                    ),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Hambatan",
                      widget: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 12.sp),
                        child: Column(
                          children: [
                            Wrap(
                              children: hambatan
                                  .asMap()
                                  .entries
                                  .map((box) => Container(
                                        width: 160.sp,
                                        padding: EdgeInsets.only(bottom: 5.sp),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10.sp,
                                              height: 10.sp,
                                              child: Checkbox(
                                                activeColor:
                                                    const Color(0xFF6200EE),
                                                checkColor: Colors.white,
                                                value: setHambatan(box.key,
                                                    hambatan1: hambatan1,
                                                    hambatan2: hambatan2,
                                                    hambatan3: hambatan3,
                                                    hambatan4: hambatan4,
                                                    hambatan5: hambatan5,
                                                    hambatan6: hambatan6,
                                                    hambatan7: hambatan7,
                                                    hambatan8: hambatan8,
                                                    hambatan9: hambatan9),
                                                onChanged: (value) {
                                                  setState(() {
                                                    switch (box.key) {
                                                      case 0:
                                                        hambatan1 = value!;

                                                        break;
                                                      case 1:
                                                        hambatan2 = value!;
                                                        break;
                                                      case 2:
                                                        hambatan3 = value!;
                                                        break;
                                                      case 3:
                                                        hambatan4 = value!;
                                                        break;
                                                      case 4:
                                                        hambatan5 = value!;
                                                        break;
                                                      case 5:
                                                        hambatan6 = value!;
                                                        break;
                                                      case 6:
                                                        hambatan7 = value!;
                                                        break;
                                                      case 7:
                                                        hambatan8 = value!;
                                                        break;
                                                      case 8:
                                                        hambatan9 = value!;
                                                        break;

                                                      default:
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.sp,
                                            ),
                                            Text(
                                              box.value,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 10.sp),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                            if (hambatan9) ...[
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.sp),
                                height: 55.sp,
                                child: FormWidget.textForm(
                                    enable: true, controller: _hambatanDetail),
                              )
                            ]
                          ],
                        ),
                      ),
                    ),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Intervensi Terhadap Hambatan",
                      widget: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 12.sp),
                        child: Column(
                          children: intervensiHambatan
                              .asMap()
                              .entries
                              .map((box) => Container(
                                    padding: EdgeInsets.only(bottom: 5.sp),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.sp,
                                          height: 10.sp,
                                          child: Checkbox(
                                            activeColor:
                                                const Color(0xFF6200EE),
                                            checkColor: Colors.white,
                                            value: setIntervensi(box.key,
                                                intervensi1: intervensi1,
                                                intervensi2: intervensi2,
                                                intervensi3: intervensi3,
                                                intervensi4: intervensi4,
                                                intervensi5: intervensi5),
                                            onChanged: (value) {
                                              setState(() {
                                                switch (box.key) {
                                                  case 0:
                                                    intervensi1 = value!;
                                                    break;
                                                  case 1:
                                                    intervensi2 = value!;
                                                    break;
                                                  case 2:
                                                    intervensi3 = value!;
                                                    break;
                                                  case 3:
                                                    intervensi4 = value!;
                                                    break;
                                                  case 4:
                                                    intervensi5 = value!;
                                                    break;
                                                  default:
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.sp,
                                        ),
                                        Text(
                                          box.value,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Hasil",
                      widget: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.sp, vertical: 12.sp),
                        child: Column(
                          children: hasil
                              .asMap()
                              .entries
                              .map((box) => Container(
                                    padding: EdgeInsets.only(bottom: 5.sp),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10.sp,
                                          height: 10.sp,
                                          child: Checkbox(
                                            activeColor:
                                                const Color(0xFF6200EE),
                                            checkColor: Colors.white,
                                            value: setHasil(box.key,
                                                hasil1: hasil1, hasil2: hasil2),
                                            onChanged: (value) {
                                              setState(() {
                                                switch (box.key) {
                                                  case 0:
                                                    hasil1 = value!;
                                                    break;
                                                  case 1:
                                                    hasil2 = value!;
                                                    break;
                                                  default:
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.sp,
                                        ),
                                        Text(
                                          box.value,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      height: 200.sp,
                      title: "Baca & Bahasa",
                      widget: Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            selectedBox(context,
                                title: "Kemampuan Berbahasa", list: baik),
                            selectedBox(context,
                                title: "Kemampuan Membaca", list: baik),
                            Row(
                              children: [
                                SizedBox(
                                  width: 120.sp,
                                  child: Text(
                                    "Butuh Penerjemah ?",
                                    style:
                                        blackTextStyle.copyWith(fontSize: 8.sp),
                                  ),
                                ),
                                Expanded(
                                    child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: tidakYa
                                            .map((e) => SizedBox(
                                                  width: 100.sp,
                                                  child: RadioListTile(
                                                    selected:
                                                        (e == tidakYa.first)
                                                            ? true
                                                            : false,
                                                    activeColor:
                                                        const Color(0xFF293074),
                                                    selectedTileColor:
                                                        Colors.cyan,
                                                    title: Text(
                                                      e,
                                                      style:
                                                          blackCalibriTextStyle,
                                                      maxLines: 3,
                                                      textAlign:
                                                          TextAlign.start,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    value: e,
                                                    groupValue:
                                                        butuhTerjemahValue,
                                                    onChanged: (value) {
                                                      setButuhTerjemah(
                                                          value.toString());

                                                      if (value.toString() ==
                                                          "Ya") {
                                                        _butuhTerjemahController
                                                            .clear();
                                                      }
                                                    },
                                                  ),
                                                ))
                                            .toList(),
                                      ),

                                      // tampilkan box
                                      if (butuhTerjemahValue == "Ya") ...[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 12.sp,
                                              right: 12.sp,
                                              bottom: 6.sp),
                                          child: FormWidget.textForm(
                                            controller:
                                                _butuhTerjemahController,
                                            onChanged: (value) {},
                                            enable: true,
                                          ),
                                        )
                                      ]
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    BoxSkriningEmtyWidget(
                      width: Get.width,
                      title: "Rencana Edukasi",
                      widget: Padding(
                        padding: EdgeInsets.all(6.sp),
                        child: FormWidget.textArea(
                            maxLines: 5, controller: _rencanaEdukasi),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Row selectedBox(BuildContext context,
    {required String title, required List<String> list}) {
  return Row(
    children: [
      SizedBox(
        width: 120.sp,
        child: Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 8.sp),
        ),
      ),
      Container(
        width: Get.width / 3,
        margin: EdgeInsets.only(
          bottom: 6.sp,
        ),
        child: DropdownButtonFormField(
          dropdownColor: Colors.white,
          isExpanded: true,
          value: list.first,
          items: list
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      overflow: TextOverflow.ellipsis,
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.w100, fontSize: 6.sp),
                    ),
                  ))
              .toList()
              .toList(),
          onChanged: (value) {},
          decoration: FormWidget.styleDropdown(context),
          style: blackTextStyle.copyWith(
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ],
  );
}

List<String> baik = ["Baik", "Tidak Baik"];
List<String> tidakYa = ["Tidak", "Ya"];

List<String> kebutuhanEdukasi = [
  "Jenis & Alur Pelayanan",
  "Fasilitas Ruangan",
  "Cuci Tangan",
  "Etika Batuk",
  "Intervensi Diet",
  "Pencegahan Risiko Jatuh",
  "Manajemen Nyeri",
  "Penyakit Khusus",
  "Pengobatan / Terapi",
  "Vaksinasi",
  "Lain-Lain"
];
List<String> motivasiBelajar = [
  "Siap",
  "Tertarik",
  "Tidak Tertarik / Tidak Mampu"
];
List<String> tujuan = [
  "Mulai Menggunakan Informasi Yang Didapat",
  "Dapat Mengungkapkan Secara Lisan Informasi Yang Didapat"
];

List<String> kemampuanBelajar = [
  "Dapat Mengubah Perilaku",
  "Dapat Menguasai Informasi",
  "Tidak Jelas Saat Ini"
];

List<String> pilihanPasien = [
  "Menolak Transfusi Darah",
  "Menolak Pulang Di Hari Tertentu",
  "Menolak Dilayani Oleh Petugas Laki-Laki Pada Pasien Perempuan",
  "Menolak Diberikan Imunisasi Pada Anaknya",
  "Menolak Dirawat Oleh Medis Dan Mencari Pengobatan Alternatif",
  "Lain-Lain"
];

List<String> hambatan = [
  "Tidak Ada",
  "Takut",
  "Nyeri/Tidak Nyaman",
  "Hambatan Kognitif",
  "Hambatan Bahasa",
  "Hambatan Budaya",
  "Hambatan Emosional",
  "Hambatan Fisik",
  "Lain-Lain"
];

List<String> hasil = [
  "Menunjukkan Tingkat Pengetahuan Yang Diharapkan",
  "Membutuhkan Petunjuk Tambahan"
];

List<String> intervensiHambatan = [
  "Tidak Ada",
  "Membatasi Materi",
  "Menggunakan Penerjemah",
  "Mengulangi Edukasi",
  "Mengedukasi Keluarga"
];

List<String> pilihanMenu = [
  "Kebutuhan Edukasi",
  "Tujuan",
  "Kemampuan Belajar",
  "Motivasi Belajar",
  "Nilai - Nilai & Pilihan Pasien",
  "Hambatan",
  "Intervensi Terhadap Hambatan",
  "Hasil",
  "Baca & Bahasa",
  "Rencana Edukasi"
];
