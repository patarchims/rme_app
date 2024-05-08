import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/anamnesa/anamnesa_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/soap/medis/asesmen_anamnesa_model.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/anamnesa_search_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_penyakit_keluarga_search_widget.dart';
import 'package:hms_app/presentation/pages/poli_gigi/medis/riwayat_sekarang_search_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../component/component.dart';
import '../../widget/header_content_widget.dart';

class AnamnesaWidget extends StatefulWidget {
  const AnamnesaWidget({super.key});

  @override
  State<AnamnesaWidget> createState() => _AnamnesaWidgetState();
}

class _AnamnesaWidgetState extends State<AnamnesaWidget> {
  late TextEditingController _riwayatAlergiDetail;
  late TextEditingController _keluhaUtama;
  late TextEditingController _gigi5DetailController;
  String riwayatAlergi = "";
  String jenisPelayananStr = "";

  // PEMERIKSAAAN GIGI
  late bool pemgigi1;
  late bool pemgigi2;
  late bool pemgigi3;
  late bool pemgigi4;
  late bool pemgigi5;

  bool setPemgigi({required int index}) {
    switch (index) {
      case 0:
        return pemgigi1;
      case 1:
        return pemgigi2;
      case 2:
        return pemgigi3;
      case 3:
        return pemgigi4;
      case 4:
        return pemgigi5;

      default:
        return false;
    }
  }

  @override
  void initState() {
    pemgigi1 = false;
    pemgigi2 = false;
    pemgigi3 = false;
    pemgigi4 = false;
    pemgigi5 = false;
    _gigi5DetailController = TextEditingController();
    _riwayatAlergiDetail = TextEditingController();
    _keluhaUtama = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _riwayatAlergiDetail.clear();
    _keluhaUtama.clear();
    _gigi5DetailController.clear();
    _riwayatAlergiDetail.dispose();
    _keluhaUtama.dispose();
    _gigi5DetailController.dispose();
    super.dispose();
  }

  setSelectedAlergi(String value) {
    setState(() {
      riwayatAlergi = value;
    });
  }

  bool setGiGiValue(int index) {
    switch (index) {
      case 0:
        return pemgigi1;
      case 1:
        return pemgigi2;
      case 2:
        return pemgigi3;
      case 3:
        return pemgigi4;
      default:
        return pemgigi5;
    }
  }

  void setPemGigi(int index, bool enable) {
    switch (index) {
      case 0:
        setState(() {
          pemgigi1 = enable;
        });
        break;
      case 1:
        setState(() {
          pemgigi2 = enable;
        });
        break;
      case 2:
        setState(() {
          pemgigi3 = enable;
        });
        break;
      case 3:
        setState(() {
          pemgigi4 = enable;
        });
        break;
      case 4:
        setState(() {
          pemgigi5 = enable;
        });
        break;
      default:
    }
  }

  setSelectedJenisPelayanan(String value) {
    setState(() {
      jenisPelayananStr = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    if (singlePasien.first.usia >= 17) {
      setState(() {});
    }

    // AnamnesaState state = context.watch<AnamnesaBloc>().state;
    return BlocConsumer<AnamnesaBloc, AnamnesaState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show();
        }

        if (!state.isLoading) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE

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
                      MetaModel metaModel =
                          MetaModel.fromJson(e.value["metadata"]);

                      // if (metaModel.code == 201) {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: metaModel.message.toString(),
                          title: "Pesan");
                      return shouldPop ?? false;
                      // }
                    })));

        state.getResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) {
                      log("VALUE DATA ANAMNESA");
                      log(e.value.toString());
                      // PARSING DATA ANAMNESA
                      AsesmenAnamnesaModel anamnesaModel =
                          AsesmenAnamnesaModel.fromJson(e.value["response"]);

                      context.read<AnamnesaBloc>().add(
                          AnamnesaEvent.selectKeluhanUtama(
                              value: anamnesaModel.kelUtama));
                      context.read<AnamnesaBloc>().add(
                          AnamnesaEvent.selectedRiwayatPenyakitKeluarga(
                              value: anamnesaModel.penyakitKeluarga));
                      context.read<AnamnesaBloc>().add(
                          AnamnesaEvent.selectedRiwayatPenyakitSekarang(
                              value: anamnesaModel.riwayatSekarang));

                      setState(() {
                        jenisPelayananStr = anamnesaModel.jenisPelayanan;
                        riwayatAlergi = anamnesaModel.riwayatAlergi;
                        _riwayatAlergiDetail = TextEditingController(
                            text: anamnesaModel.riwayatAlergiDetail);

                        pemgigi1 =
                            (anamnesaModel.gigi1 == "true") ? true : false;
                        pemgigi2 =
                            (anamnesaModel.gigi2 == "true") ? true : false;
                        pemgigi3 =
                            (anamnesaModel.gigi3 == "true") ? true : false;
                        pemgigi4 =
                            (anamnesaModel.gigi4 == "true") ? true : false;
                        pemgigi5 =
                            (anamnesaModel.gigi5 == "true") ? true : false;

                        _gigi5DetailController = TextEditingController(
                            text: anamnesaModel.gigi5Detail);
                      });
                    })));
      },
      builder: (context, state) {
        return HeaderContentWidget(
          onPressed: () {
            context.read<AnamnesaBloc>().add(AnamnesaEvent.saveData(
                noReg: singlePasien.first.noreg,
                jenisPelayanan: jenisPelayananStr,
                kelUtama: state.selectKeluhan,
                riwayatSekarang: state.selectRiwayat,
                penySekarang: state.selectRiwayat,
                penyKeluarga: state.selectRiwayatKeluarga,
                riwayatAlergi: riwayatAlergi,
                riwayatAlergiDetail: _riwayatAlergiDetail.text,
                gigi1: pemgigi1.toString(),
                gigi2: pemgigi2.toString(),
                gigi3: pemgigi3.toString(),
                gigi4: pemgigi4.toString(),
                gigi5: pemgigi5.toString(),
                gigi5Detail: _gigi5DetailController.text));
          },
          widget: (state.anamnesaLoading)
              ? SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: ShimerLoading.loadingExpandCard(),
                )
              : Container(
                  padding: EdgeInsets.all(12.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 2.sp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 6,
                                child: Text(
                                  "Keluhan Utama",
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 250.sp,
                                    child: FormWidget.textForm(
                                        enable: true,
                                        controller: TextEditingController(
                                            text: state.selectKeluhan)),
                                  ),
                                  SizedBox(width: 5.sp),
                                  SizedBox(
                                    height: 25.sp,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp)),
                                          backgroundColor:
                                              ThemeColor.primaryColor),
                                      child: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        context.read<AnamnesaBloc>().add(
                                            const AnamnesaEvent
                                                .getKeluhanUtama());
                                        // GET KELUHAN UTAMA
                                        CustomDialogWidget.getDialog(
                                            widget: Container(
                                              padding: EdgeInsets.all(12.sp),
                                              height: 200.sp,
                                              width: 400.sp,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.sp),
                                                  color: Colors.white),
                                              child:
                                                  const AnamnesaSearchWidget(),
                                            ),
                                            color: Colors.transparent);
                                      },
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 2.sp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 6,
                                child: Text(
                                  "Riwayat Penyakit Sekarang",
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 250.sp,
                                    child: FormWidget.textArea(
                                        maxLines: 2,
                                        controller: TextEditingController(
                                            text: state.selectRiwayat)),
                                  ),
                                  SizedBox(width: 5.sp),
                                  SizedBox(
                                    height: 25.sp,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ThemeColor.primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp)),
                                        ),
                                        onPressed: () {
                                          // TAMPILKAN MODAL
                                          context.read<AnamnesaBloc>().add(
                                              const AnamnesaEvent
                                                  .riwayatPenyakitSekarang());

                                          // GET KELUHAN UTAMA
                                          CustomDialogWidget.getDialog(
                                              widget: Container(
                                                padding: EdgeInsets.all(12.sp),
                                                height: 200.sp,
                                                width: 400.sp,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.sp),
                                                    color: Colors.white),
                                                child:
                                                    const RiwayatSekarangSearchWidget(),
                                              ),
                                              color: Colors.transparent);
                                        },
                                        child: const Icon(Icons.search)),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 2.sp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 6,
                                child: Text(
                                  "Riwayat Penyakit Dalam Keluarga",
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 250.sp,
                                    child: FormWidget.textArea(
                                        maxLines: 2,
                                        controller: TextEditingController(
                                            text:
                                                (state.selectRiwayatKeluarga))),
                                  ),
                                  SizedBox(width: 5.sp),
                                  SizedBox(
                                    height: 25.sp,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ThemeColor.primaryColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        2.sp))),
                                        onPressed: () {
                                          // TAMPILKAN MODAL

                                          context.read<AnamnesaBloc>().add(
                                              const AnamnesaEvent
                                                  .getRiwayatKeluarga());

                                          // GET KELUHAN
                                          // UTAMA
                                          CustomDialogWidget.getDialog(
                                              widget: Container(
                                                padding: EdgeInsets.all(12.sp),
                                                height: 200.sp,
                                                width: 400.sp,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.sp),
                                                    color: Colors.white),
                                                child:
                                                    const RiwayatPenyakitKeluargaSearchWidget(),
                                              ),
                                              color: Colors.transparent);
                                        },
                                        child: const Icon(Icons.search)),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 2.sp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 6,
                                child: Text(
                                  "Alergi",
                                  style: blackTextStyle,
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 1.9,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: tidaOrYa
                                          .map((e) => SizedBox(
                                                width: 65.sp,
                                                height: 25.sp,
                                                child: RadioListTile(
                                                    selected:
                                                        (e == riwayatAlergi)
                                                            ? true
                                                            : false,
                                                    activeColor:
                                                        const Color(0xFF293074),
                                                    selectedTileColor:
                                                        Colors.cyan,
                                                    title: Text(
                                                      e,
                                                      style:
                                                          blackCalibriTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      8.sp),
                                                      maxLines: 3,
                                                      textAlign:
                                                          TextAlign.start,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    value: e,
                                                    groupValue: riwayatAlergi,
                                                    onChanged: (value) {
                                                      setSelectedAlergi(
                                                          value.toString());
                                                    }),
                                              ))
                                          .toList(),
                                    ),
                                    if (riwayatAlergi == tidaOrYa.last) ...[
                                      Expanded(
                                        child: FormWidget.textForm(
                                          controller: _riwayatAlergiDetail,
                                          enable: true,
                                        ),
                                      )
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 2.sp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 6,
                                child: Text(
                                  "Jenis Pelayanan",
                                  style: blackTextStyle,
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 1.9,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: jenisPelayanan
                                          .map((e) => SizedBox(
                                                width: 70.sp,
                                                height: 25.sp,
                                                child: RadioListTile(
                                                    selected:
                                                        (e == jenisPelayananStr)
                                                            ? true
                                                            : false,
                                                    activeColor:
                                                        const Color(0xFF293074),
                                                    selectedTileColor:
                                                        Colors.cyan,
                                                    title: Text(
                                                      e,
                                                      style:
                                                          blackCalibriTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      5.sp),
                                                      maxLines: 3,
                                                      textAlign:
                                                          TextAlign.start,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    value: e,
                                                    groupValue:
                                                        jenisPelayananStr,
                                                    onChanged: (value) {
                                                      setSelectedJenisPelayanan(
                                                          value.toString());
                                                    }),
                                              ))
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 2.sp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 6,
                                child: Text(
                                  "Pemeriksaan Gigi",
                                  style: blackTextStyle,
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                width: Get.width / 1.9,
                                child: Column(
                                  children: [
                                    Wrap(
                                      children: pemeriksaanGigi
                                          .asMap()
                                          .entries
                                          .map(
                                            (e) => SizedBox(
                                              width: 100.sp,
                                              child: ListTile(
                                                title: Text(
                                                  e.value,
                                                  style: blackTextStyle,
                                                ),
                                                leading: Checkbox(
                                                  checkColor:
                                                      ThemeColor.primaryColor,
                                                  onChanged: (value) {
                                                    setPemGigi(e.key, value!);
                                                  },
                                                  value: setGiGiValue(e.key),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    if (pemgigi5) ...[
                                      SizedBox(
                                        width: Get.width,
                                        height: 30.sp,
                                        child: FormWidget.textForm(
                                          controller: _gigi5DetailController,
                                          enable: true,
                                        ),
                                      )
                                    ],
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.sp,
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

List<String> tidaOrYa = ["Tidak", "Ya"];

List<String> jenisPelayanan = [
  "Preventif",
  "Kuratif",
  "Paliatif",
  "Rehabilitasi"
];

List<String> pemeriksaanGigi = [
  "Karies",
  "Infeksi",
  "Berlubang",
  "Karang Gigi",
  "Lainnya"
];
