import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/medis/data_medik/data_medik_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/soap/medis/data_medik_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class DataMedikDiperlukanWidget extends StatefulWidget {
  const DataMedikDiperlukanWidget({super.key});

  @override
  State<DataMedikDiperlukanWidget> createState() =>
      _DataMedikDiperlukanWidgetState();
}

class _DataMedikDiperlukanWidgetState extends State<DataMedikDiperlukanWidget> {
  String golonganDarahValue = "";
  String tekananDarahValue = "";
  String pJantungValue = "";
  String diabetesValue = "";
  String haemophiliaValue = "";
  String hepatitisValue = "";
  String kebiasaanBurukValue = "";
  String penyLainValue = "";
  String alergiObatValue = "";
  String alergiMakananValue = "";
  TextEditingController _tDarahController = TextEditingController();
  TextEditingController _pJantungController = TextEditingController();
  TextEditingController _diabetesController = TextEditingController();
  TextEditingController _haemophiliaController = TextEditingController();
  TextEditingController _kebiasaanBurukController = TextEditingController();
  TextEditingController _hepatitisController = TextEditingController();
  TextEditingController _penyakitLainnnyaController = TextEditingController();
  TextEditingController _alergiObatController = TextEditingController();
  TextEditingController _alergiMakananController = TextEditingController();

  @override
  void initState() {
    _tDarahController = TextEditingController();
    _pJantungController = TextEditingController();
    _diabetesController = TextEditingController();
    _haemophiliaController = TextEditingController();
    _kebiasaanBurukController = TextEditingController();
    _hepatitisController = TextEditingController();
    _penyakitLainnnyaController = TextEditingController();
    _alergiObatController = TextEditingController();
    _alergiMakananController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tDarahController.clear();
    _pJantungController.clear();
    _diabetesController.clear();
    _haemophiliaController.clear();
    _kebiasaanBurukController.clear();
    _hepatitisController.clear();
    _penyakitLainnnyaController.clear();
    _alergiObatController.clear();
    _alergiMakananController.clear();

    _tDarahController.dispose();
    _pJantungController.dispose();
    _diabetesController.dispose();
    _haemophiliaController.dispose();
    _kebiasaanBurukController.dispose();
    _hepatitisController.dispose();
    _penyakitLainnnyaController.dispose();
    _alergiObatController.dispose();
    _alergiMakananController.dispose();

    super.dispose();
  }

  void setGolonganDarah(String value) {
    setState(() {
      golonganDarahValue = value;
    });
  }

  void setPenyakitJantungValue(String value) {
    setState(() {
      pJantungValue = value;
    });
  }

  void setHaemophiliaValue(String value) {
    setState(() {
      haemophiliaValue = value;
    });
  }

  void setKebiasaanBurukValue(String value) {
    setState(() {
      kebiasaanBurukValue = value;
    });
  }

  void setHepatitisValue(String value) {
    setState(() {
      hepatitisValue = value;
    });
  }

  void setPenyakitLainnyaValue(String value) {
    setState(() {
      penyLainValue = value;
    });
  }

  void setAlergiObatValue(String value) {
    setState(() {
      alergiObatValue = value;
    });
  }

  void setAlergiMakananValue(String value) {
    setState(() {
      alergiMakananValue = value;
    });
  }

  void setTekananDarahValue(String value) {
    setState(() {
      tekananDarahValue = value;
    });
  }

  void setDiabetesValue(String value) {
    setState(() {
      diabetesValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataMedikBloc, DataMedikState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show();
        }

        if (!state.isLoading) {
          EasyLoading.dismiss();
        }

        state.getResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      // EMIT DATA
                      final data = DataMedikModel.fromJson(e.value["response"]);
                      setState(() {
                        golonganDarahValue = data.golDarah;
                        tekananDarahValue = data.tekananDarah;
                        _tDarahController = TextEditingController(
                            text: data.tekananDarahDetail);
                        pJantungValue = data.penyJantung;
                        haemophiliaValue = data.haemop;
                        _haemophiliaController =
                            TextEditingController(text: data.hepatDetail);
                        _pJantungController =
                            TextEditingController(text: data.penyJantungDetail);
                        diabetesValue = data.diabet;
                        _diabetesController =
                            TextEditingController(text: data.diabetDetail);
                        hepatitisValue = data.hepat;
                        _hepatitisController =
                            TextEditingController(text: data.hepatDetail);
                        penyLainValue = data.penyLain;
                        _penyakitLainnnyaController =
                            TextEditingController(text: data.penyLainDetail);
                        alergiObatValue = data.alergiObat;
                        alergiMakananValue = data.alergiMakanan;
                        kebiasaanBurukValue = data.kebiasaanBuruk;
                        _kebiasaanBurukController =
                            TextEditingController(text: data.kebiasaanBuruk);
                      });
                    })));

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString(), title: "Pesan");
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      // Save Data

                      MetaModel metaModel =
                          MetaModel.fromJson(e.value["metadata"]);

                      // if (metaModel.code == 201) {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: metaModel.message.toString(),
                          title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        PasienState pasienState = context.watch<PasienBloc>().state;
        final singlePasien = pasienState.listPasienModel
            .where((element) => element.mrn == pasienState.normSelected);
        return HeaderContentWidget(
            onPressed: () {
              // todo
              // save data
              context.read<DataMedikBloc>().add(DataMedikEvent.saveDataMedik(
                  noReg: singlePasien.first.noreg,
                  golDarah: golonganDarahValue,
                  tekananDarah: tekananDarahValue,
                  tekananDarahDetail: _tDarahController.text,
                  penyJantung: pJantungValue,
                  penyJantungDetail: _pJantungController.text,
                  diabet: diabetesValue,
                  diabetDetail: _diabetesController.text,
                  haemop: haemophiliaValue,
                  haemopDetail: _haemophiliaController.text,
                  hepat: hepatitisValue,
                  hepatDetail: _hepatitisController.text,
                  penyLain: penyLainValue,
                  penyLainDetail: _penyakitLainnnyaController.text,
                  alergiObat: alergiObatValue,
                  alergiObatDetail: _alergiObatController.text,
                  alergiMakanan: alergiMakananValue,
                  alergiMakananDetail: _alergiMakananController.text,
                  kebiasaanBuruk: _kebiasaanBurukController.text));
            },
            widget: (state.isLoadingGetResult)
                ? Container(
                    width: Get.width,
                    height: Get.height,
                    child: ShimerLoading.loadingExpandCard(),
                  )
                : Container(
                    padding: EdgeInsets.all(6.sp),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          golDarah(),

                          // TODO: TEKANAN DARAH
                          pilihanCard(
                              color: ThemeColor.lightGrey,
                              title: "Tekanan Darah",
                              groupValue: tekananDarahValue,
                              pilihan: tekananDarah,
                              onChanged: (va) {
                                setTekananDarahValue(va.toString());
                              },
                              controller: _tDarahController),

                          // TODO : PENYAKIT JANTUNG
                          pilihanCard(
                              color: ThemeColor.bgColor,
                              title: "Penyakit Jantung",
                              groupValue: pJantungValue,
                              pilihan: penyakitJantug,
                              onChanged: (va) {
                                setPenyakitJantungValue(va.toString());
                              },
                              controller: _pJantungController),

                          // TODO : DIABETES
                          pilihanCard(
                              groupValue: diabetesValue,
                              color: ThemeColor.lightGrey,
                              title: "Diabetes",
                              pilihan: penyakitJantug,
                              onChanged: (value) {
                                setDiabetesValue(value.toString());
                              },
                              controller: _diabetesController),

                          // TODO : HAEMOPHELIA
                          pilihanCard(
                              groupValue: haemophiliaValue,
                              color: ThemeColor.bgColor,
                              title: "Haemophilia",
                              pilihan: penyakitJantug,
                              onChanged: (value) {
                                setHaemophiliaValue(value.toString());
                              },
                              controller: _hepatitisController),

                          // TODO : KEBIASAAN BURUK
                          pilihanCard(
                              groupValue: kebiasaanBurukValue,
                              color: ThemeColor.lightGrey,
                              title: "Kebiasaan Buruk",
                              pilihan: penyakitJantug,
                              onChanged: (value) {
                                setKebiasaanBurukValue(value.toString());
                              },
                              controller: _kebiasaanBurukController),

                          // TODO : HEPATITIS
                          pilihanCard(
                              groupValue: hepatitisValue,
                              color: ThemeColor.bgColor,
                              title: "Hepatitis",
                              pilihan: penyakitJantug,
                              onChanged: (value) {
                                setHepatitisValue(value.toString());
                              },
                              controller: _hepatitisController),

                          // TODO : PENYAKIT LAINNYA
                          pilihanCard(
                              groupValue: penyLainValue,
                              color: ThemeColor.bgColor,
                              title: "Penyakit Lainnya",
                              pilihan: penyakitJantug,
                              onChanged: (value) {
                                setPenyakitLainnyaValue(value.toString());
                              },
                              controller: _penyakitLainnnyaController),

                          // TODO : Alergi Obat
                          pilihanCard(
                              groupValue: alergiObatValue,
                              color: ThemeColor.bgColor,
                              title: "Alergi Obat",
                              pilihan: penyakitJantug,
                              onChanged: (value) {
                                setAlergiObatValue(value.toString());
                              },
                              controller: _alergiObatController),
                          // Alergi Makanan
                          // TODO : Alergi makanan
                          pilihanCard(
                              groupValue: alergiMakananValue,
                              color: ThemeColor.bgColor,
                              title: "Alergi Makanan",
                              pilihan: penyakitJantug,
                              onChanged: (value) {
                                setAlergiMakananValue(value.toString());
                              },
                              controller: _alergiMakananController),
                        ],
                      ),
                    ),
                  ));
      },
    );
  }

  Row golDarah() {
    return Row(
      children: [
        Container(
          width: Get.width / 5,
          child: Text(
            "Golongan Darah",
            style: blackTextStyle,
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Wrap(
              children: golonganDarah
                  .map((e) => SizedBox(
                        width: 55.sp,
                        height: 25.sp,
                        child: ListTile(
                          title: Text(
                            e,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                              value: e,
                              groupValue: golonganDarahValue,
                              activeColor: ThemeColor.primaryColor,
                              onChanged: (va) {
                                setGolonganDarah(va.toString());
                              }),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(width: 5.sp),
          ],
        ))
      ],
    );
  }

  Card cardBox(
      {required String title,
      required String hinText,
      Color? color,
      required void Function(Object?)? onChanged,
      required Object? groupValue}) {
    return Card(
      borderOnForeground: true,
      color: color ?? ThemeColor.lightGrey,
      elevation: 0,
      child: Row(
        children: [
          Container(
            width: Get.width / 5,
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Wrap(
                    children: penyakitJantug
                        .map((e) => SizedBox(
                              width: 75.sp,
                              height: 25.sp,
                              child: ListTile(
                                title: Text(
                                  e,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Radio(
                                    value: e,
                                    groupValue: groupValue,
                                    onChanged: onChanged),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(width: 5.sp),
                ],
              ),
              FormWidget.textArea(maxLines: 1, hinText: hinText)
            ],
          ))
        ],
      ),
    );
  }

  Card pilihanCard(
      {required String title,
      required String? groupValue,
      Function(String?)? onChanged,
      required Color color,
      required List<String> pilihan,
      TextEditingController? controller}) {
    if (groupValue == "Tidak Ada") {
      controller!.clear();
    }
    return Card(
      borderOnForeground: true,
      color: color,
      elevation: 0,
      child: Row(
        children: [
          Container(
            width: Get.width / 5,
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Wrap(
                    children: pilihan
                        .map((e) => SizedBox(
                              width: 75.sp,
                              height: 25.sp,
                              child: ListTile(
                                title: Text(
                                  e,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Radio(
                                    value: e,
                                    activeColor: ThemeColor.primaryColor,
                                    groupValue: groupValue,
                                    onChanged: onChanged),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(width: 5.sp),
                ],
              ),
              (groupValue == "Ada")
                  ? FormWidget.textArea(
                      controller: controller,
                      maxLines: 1,
                      hinText: "Keterangan",
                    )
                  : SizedBox()
            ],
          ))
        ],
      ),
    );
  }
}

List<String> golonganDarah = ["A", "B", "AB", "O"];
List<String> tekananDarah = ["Normal", "Hipotensi", "Hipertensi"];
List<String> penyakitJantug = [
  "Tidak Ada",
  "Ada",
];
List<String> alergiMakanan = [
  "Tidak Ada",
  "Ada",
];
