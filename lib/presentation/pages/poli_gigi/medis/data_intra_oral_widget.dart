import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/asesmen/medis/intra_oral/intra_oral_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/soap/medis/data_intra_oral_model.dart';
import 'package:hms_app/presentation/component/alert/alert.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class DataIntraOralWidget extends StatefulWidget {
  const DataIntraOralWidget({super.key});

  @override
  State<DataIntraOralWidget> createState() => _DataIntraOralWidgetState();
}

class _DataIntraOralWidgetState extends State<DataIntraOralWidget> {
  late TextEditingController _lainLainController = TextEditingController();
  late TextEditingController _gigiAnamaliController = TextEditingController();
  late TextEditingController _diastemaController = TextEditingController();
  late TextEditingController _superNumeraryController = TextEditingController();
  late TextEditingController _mandibularisController = TextEditingController();
  late TextEditingController _palatinusController = TextEditingController();
  late TextEditingController _palatumController = TextEditingController();

  late String hubMolarValue;
  late String oklusiPosteriorValue;
  late String anteriorValue;

  String palatumValue = "";
  String palatinusValue = "";
  String mandiBularisValue = "";
  String superNumeryValue = "";
  String diastemaValue = "";
  String gigiAnomaliValue = "";

  @override
  void initState() {
    _lainLainController = TextEditingController();
    _gigiAnamaliController = TextEditingController();
    _diastemaController = TextEditingController();
    _superNumeraryController = TextEditingController();
    _mandibularisController = TextEditingController();
    _palatinusController = TextEditingController();
    _palatumController = TextEditingController();

    hubMolarValue = hubMolar[0];
    oklusiPosteriorValue = posterior[0];
    anteriorValue = anterior[0];

    super.initState();
  }

  @override
  void dispose() {
    _lainLainController.clear();
    _gigiAnamaliController.clear();
    _diastemaController.clear();
    _superNumeraryController.clear();
    _mandibularisController.clear();
    _palatinusController.clear();
    _palatumController.clear();

    _gigiAnamaliController.dispose();
    _diastemaController.dispose();
    _superNumeraryController.dispose();
    _mandibularisController.dispose();
    _lainLainController.dispose();
    super.dispose();
  }

  void setGigiAnomali(String value) {
    setState(() {
      gigiAnomaliValue = value;
    });
  }

  void setDiastema(String value) {
    setState(() {
      diastemaValue = value;
    });
  }

  void setSuperNumery(String value) {
    setState(() {
      superNumeryValue = value;
    });
  }

  void setTorusMandiBularis(String value) {
    setState(() {
      mandiBularisValue = value;
    });
  }

  void setPalatinus(String value) {
    setState(() {
      palatinusValue = value;
    });
  }

  void setPalatum(String value) {
    setState(() {
      palatumValue = value;
    });
  }

  void setHubMolar(String value) {
    setState(() {
      hubMolarValue = value;
    });
  }

  void setPosterior(String value) {
    setState(() {
      oklusiPosteriorValue = value;
    });
  }

  void setAnterior(String value) {
    setState(() {
      anteriorValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return HeaderContentWidget(
        onPressed: () {
          DataIntraOralModel data = DataIntraOralModel(
              anterior: anteriorValue,
              posterior: oklusiPosteriorValue,
              molar: hubMolarValue,
              palatum: palatumValue,
              torusP: palatinusValue,
              torusM: mandiBularisValue,
              torusMDetail: mandiBularisValue,
              superTeeth: superNumeryValue,
              superTeethDetail: _superNumeraryController.text,
              diastema: diastemaValue,
              diastemaDetail: _diastemaController.text,
              gigiAnomali: gigiAnomaliValue,
              gigiAnomaliDetail: _gigiAnamaliController.text,
              khusOralLain: _lainLainController.text,
              noReg: singlePasien.first.noreg);

          // LAKUKAN SIMPAN DATA
          context
              .read<IntraOralBloc>()
              .add(IntraOralEvent.saveData(dataIntraOralModel: data));
        },
        widget: BlocConsumer<IntraOralBloc, IntraOralState>(
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
                          // TAMPILKAN PESAN KESALAHAN JIKA PESAN GAGAL
                          final shouldPop = await Alert.warningMessage(context,
                              subTitle: e.meta.message.toString(),
                              title: "Pesan");
                          return shouldPop ?? false;
                        }),
                    (r) => r.maybeMap(
                        orElse: () {},
                        loaded: (e) async {
                          // Tampilkan Pesan Bahwa data berhasil disimpan
                          MetaModel metaModel =
                              MetaModel.fromJson(e.value["metadata"]);

                          // if (metaModel.code == 201) {
                          final shouldPop = await Alert.warningMessage(context,
                              subTitle: metaModel.message.toString(),
                              title: "Pesan");
                          return shouldPop ?? false;
                        })));

            state.getResult.fold(
                () => null,
                (a) => a.fold(
                    (l) => null,
                    (r) => r.maybeMap(
                        orElse: () {},
                        loaded: (e) {
                          // AMBIL DATA DARI API
                          // TAMPILKAN PADA LAYAR
                          final data =
                              DataIntraOralModel.fromMap(e.value["response"]);

                          setState(() {
                            mandiBularisValue = data.torusM;
                            palatumValue = data.palatum;
                            anteriorValue = data.anterior;
                            oklusiPosteriorValue = data.posterior;
                            hubMolarValue = data.molar;
                            palatinusValue = data.torusP;

                            _lainLainController =
                                TextEditingController(text: data.khusOralLain);
                            _gigiAnamaliController = TextEditingController(
                                text: data.gigiAnomaliDetail);
                            gigiAnomaliValue = data.gigiAnomali;
                            diastemaValue = data.diastema;
                            _diastemaController = TextEditingController(
                                text: data.diastemaDetail);
                            superNumeryValue = data.superTeeth;
                            _superNumeraryController = TextEditingController(
                                text: data.superTeethDetail);
                          });
                        })));
          },
          builder: (context, state) {
            return (state.isLoadingGetResult)
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
                          cardSelectBox(context,
                              list: anterior,
                              value: anteriorValue, onChanged: (value) {
                            setAnterior(value.toString());
                          }, title: "Anterior"),
                          cardSelectBox(context,
                              list: posterior,
                              value: oklusiPosteriorValue, onChanged: (value) {
                            setPosterior(value.toString());
                          }, title: "Oklusi Posterior"),
                          cardSelectBox(context,
                              list: hubMolar,
                              value: hubMolarValue, onChanged: (value) {
                            setHubMolar(value.toString());
                          }, title: "Hub Molar"),
                          cardOptions(
                            option: palatum,
                            title: "Palatum",
                            groupValue: palatumValue,
                            onChanged: (value) {
                              setPalatum(value.toString());
                            },
                          ),
                          cardOptions(
                            option: torusPalatinus,
                            title: "Torus Palatinus",
                            groupValue: palatinusValue,
                            onChanged: (value) {
                              setPalatinus(value.toString());
                            },
                          ),
                          cardOptions(
                            option: torusMandibularis,
                            title: "Torus Mandibularis",
                            groupValue: mandiBularisValue,
                            onChanged: (value) {
                              setTorusMandiBularis(value.toString());
                            },
                          ),
                          cardBox(
                            hinText: "Keterangan Supernumerary\n Teeth",
                            controller: _superNumeraryController,
                            title: "Supernumerary\n Teeth",
                            groupValue: superNumeryValue,
                            list: tidakAda,
                            onChanged: (value) {
                              setSuperNumery(value.toString());
                            },
                          ),
                          cardBox(
                            hinText: "Keterangan Diastema",
                            controller: _diastemaController,
                            title: "Diastema",
                            list: tidakAda,
                            groupValue: diastemaValue,
                            onChanged: (value) {
                              setDiastema(value.toString());
                            },
                          ),
                          cardBox(
                            hinText: "Keterangan Gigi Anomali",
                            controller: _gigiAnamaliController,
                            groupValue: gigiAnomaliValue,
                            list: tidakAda,
                            title: "Gigi Anomali",
                            onChanged: (value) {
                              setGigiAnomali(value.toString());
                            },
                          ),
                          lainLainCard(),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }

  Card cardSelectBox(BuildContext context,
      {required String title,
      String? value,
      required List<String> list,
      required void Function(String?)? onChanged}) {
    log("Value DropDown$value");
    return Card(
      borderOnForeground: true,
      color: ThemeColor.lightGrey,
      elevation: 0,
      child: Row(
        children: [
          SizedBox(
            width: Get.width / 7,
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(
              bottom: 6.sp,
            ),
            child: (list.isNotEmpty)
                ? DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    focusColor: Colors.black,
                    value: value!.isNotEmpty ? value : list.first,
                    items: list
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: onChanged,
                    decoration: FormWidget.styleDropdown(context),
                    style: blackTextStyle.copyWith(
                        overflow: TextOverflow.ellipsis),
                  )
                : Container(),
          ))
        ],
      ),
    );
  }

  Card cardOptions(
      {required String title,
      required List<String> option,
      required void Function(Object?)? onChanged,
      required Object? groupValue}) {
    return Card(
      borderOnForeground: true,
      color: ThemeColor.lightGrey,
      elevation: 0,
      child: Row(
        children: [
          SizedBox(
              width: Get.width / 7,
              child: Text(
                title,
                style: blackTextStyle,
              )),
          Expanded(
            child: Wrap(
              children: option
                  .map((e) => SizedBox(
                        width: 100.sp,
                        height: 25.sp,
                        child: ListTile(
                          title: Text(
                            e,
                            style: blackTextStyle.copyWith(
                                fontSize: 6.sp, fontWeight: FontWeight.bold),
                          ),
                          leading: Radio(
                              activeColor: ThemeColor.primaryColor,
                              value: e,
                              groupValue: groupValue,
                              onChanged: onChanged),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Card cardBox(
      {TextEditingController? controller,
      required String hinText,
      required void Function(Object?)? onChanged,
      required String title,
      required Object? groupValue,
      required List<String> list}) {
    if (groupValue == "Tidak Ada") {
      controller!.clear();
    }
    return Card(
      borderOnForeground: true,
      color: ThemeColor.lightGrey,
      elevation: 0,
      child: Row(
        children: [
          SizedBox(
            width: Get.width / 7,
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
                    children: list
                        .map((e) => SizedBox(
                              width: 75.sp,
                              height: 25.sp,
                              child: ListTile(
                                title: Text(
                                  e,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 6.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Radio(
                                    activeColor: ThemeColor.primaryColor,
                                    value: e,
                                    groupValue: groupValue,
                                    onChanged: onChanged),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
              (groupValue == "Ada")
                  ? FormWidget.textArea(
                      controller: controller, maxLines: 1, hinText: hinText)
                  : const SizedBox()
            ],
          ))
        ],
      ),
    );
  }

  Card lainLainCard({TextEditingController? controller}) {
    return Card(
      borderOnForeground: true,
      color: ThemeColor.lightGrey,
      elevation: 0,
      child: Row(
        children: [
          SizedBox(
            width: Get.width / 7,
            child: Text("Lain-lain", style: blackTextStyle),
          ),
          Expanded(
              child: FormWidget.textArea(
                  controller: controller, maxLines: 3, hinText: "Lain-lain"))
        ],
      ),
    );
  }
}

List<String> palatum = ["Dalam", "Sendang", "Rendah"];
List<String> torusPalatinus = ["Tidak Ada", "Ada"];
List<String> supernumerary = ["Tidak Ada", "Ada"];
List<String> tidakAda = ["Tidak Ada", "Ada"];

List<String> torusMandibularis = [
  "Tidak Ada",
  "Kiri",
  "Ada",
  "Kanan",
  "Kedua Sisi"
];

List<String> anterior = [
  "Normal",
  "Cross Bite",
  "Open Bite",
  "Deep Bite",
  "Edge To Edge"
];

List<String> posterior = [
  "Normal",
  "Cross Bite",
  "Open Bite",
  "Deep Bite",
  "Scrizzor Bite"
];
List<String> hubMolar = [
  "Kanan Kelas I",
  "Kanan Kelas II",
  "Kanan Kelas III",
  "Kiri Kelas I"
];
