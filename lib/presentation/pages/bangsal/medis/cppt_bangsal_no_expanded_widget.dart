import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/models/response/list_cppt_pasien_model_response.dart';
import 'package:hms_app/presentation/pages/modul/cppt_content_widget/cppt_edit_content_pasien.dart';
import 'package:hms_app/presentation/pages/modul/cppt_content_widget/on_delete_content_cppt_widget.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/domain/bloc/dashboard/cppt/cppt_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class CpptWidgetNoExpandedBangsal extends StatefulWidget {
  final bool isENableAdd;
  const CpptWidgetNoExpandedBangsal({
    super.key,
    this.isENableAdd = true,
  });

  @override
  State<CpptWidgetNoExpandedBangsal> createState() => _CpptWidgetBangsalState();
}

class _CpptWidgetBangsalState extends State<CpptWidgetNoExpandedBangsal> {
  late TextEditingController _subjektifController;
  late TextEditingController _objektifController;
  late TextEditingController _asesmenController;
  late TextEditingController _planController;
  late TextEditingController _ppaController;
  final ScrollController _scrollController = ScrollController();
  late String waktu;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    waktu = DateTime.now().toString().substring(0, 10);
    _subjektifController = TextEditingController();
    _objektifController = TextEditingController();
    _asesmenController = TextEditingController();
    _planController = TextEditingController();
    _ppaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _subjektifController.clear();
    _objektifController.clear();
    _asesmenController.clear();
    _planController.clear();
    _ppaController.clear();

    _subjektifController.dispose();
    _objektifController.dispose();
    _asesmenController.dispose();
    _planController.dispose();
    _ppaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    return BlocConsumer<CpptBloc, CpptState>(
      listener: (context, state) {
        if (state.isLoadingSaveCPPT) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (!state.isLoadingSaveCPPT) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      log("ERROR FAILURE $e");
                      // TAMPILKAN PESAN KESALAHAN
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString());
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) {
                      final meta = MetaModel.fromJson(e.value["metadata"]);
                      CustomToast.successToast(
                          "Success", meta.message.toString());
                      context.read<CpptBloc>().add(CpptEvent.onGetCPPTPasien(
                          noRM: singlePasien.first.mrn));
                    })));
      },
      builder: (context, state) {
        return HeaderContentWidget(
            isENableAdd: widget.isENableAdd,
            title: "Tambah",
            onPressed: (widget.isENableAdd)
                ? () {
                    // TAMPILKAN SILAHKAN INPUT DATA
                    CustomDialogWidget.getDialog(
                        widget: Container(
                          width: Get.width,
                          height: 250.sp,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Scaffold(
                            floatingActionButton: SizedBox(
                              width: 50.sp,
                              child: FloatingActionButton(
                                elevation: 0,
                                backgroundColor:
                                    AppColors.accent.withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.sp)),
                                onPressed: () async {
                                  if (_keyForm.currentState!.validate()) {
                                    dynamic data =
                                        await deviceInfo.initPlatformState();
                                    // SAVE FISIOTERAPI

                                    // detailFisioterapi
                                    if (authState is Authenticated) {
                                      // ignore: use_build_context_synchronously
                                      context.read<CpptBloc>().add(
                                          CpptEvent.saveCPPTPasien(
                                              waktu: waktu,
                                              ppa: _ppaController.text,
                                              deviceID:
                                                  "ID-${data['id']}-${data['device']}",
                                              kelompok:
                                                  (authState.user.person ==
                                                          Person.dokter)
                                                      ? "Dokter"
                                                      : "Perawat",
                                              kdbagian: authState.user.kodePoli,
                                              noReg: singlePasien.first.noreg,
                                              pelayanan: "ranap",
                                              dpjp: singlePasien.first.kdDokter,
                                              subjetif:
                                                  _subjektifController.text,
                                              objektif:
                                                  _objektifController.text,
                                              asesmen: _asesmenController.text,
                                              plan: _planController.text));

                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        _subjektifController.clear();
                                        _objektifController.clear();
                                        _asesmenController.clear();
                                        _planController.clear();
                                      });

                                      Get.back();
                                    }
                                  }
                                },
                                heroTag: "btn2",
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.save,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "SIMPAN",
                                      style: whiteTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            backgroundColor: ThemeColor.bgColor,
                            appBar: AppBar(
                              automaticallyImplyLeading: false,
                              title: Text(
                                "SILAHKAN INPUT CPPT BERBASIS SOAP",
                                style: whiteTextStyle,
                              ),
                            ),
                            body: RawScrollbar(
                              thumbColor: ThemeColor.darkColor,
                              thumbVisibility: true,
                              interactive: true,
                              thickness: 10.sp,
                              controller: _scrollController,
                              trackVisibility: false,
                              radius: Radius.circular(5.sp),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 15.sp),
                                child: Form(
                                  key: _keyForm,
                                  child: ListView(
                                    controller: _scrollController,
                                    children: [
                                      // ===============
                                      Text("Tanggal :", style: blackTextStyle),
                                      Container(
                                        padding: EdgeInsets.all(5.sp),
                                        color: Colors.white,
                                        child: FormBuilderDateTimePicker(
                                          format: DateFormat('dd/MM/yyyy'),
                                          name: 'date',
                                          inputType: InputType.date,
                                          initialDate: DateTime.now(),
                                          decoration: InputDecoration(
                                            labelText:
                                                'Waktu Terakhir Pemberian',
                                            enabled: true,
                                            fillColor: ThemeColor.bgColor,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              waktu = value.toString();
                                            });
                                          },
                                          initialTime: const TimeOfDay(
                                              hour: 8, minute: 0),
                                          initialValue: DateTime.now(),
                                          enabled: true,
                                        ),
                                      ),

                                      Text(
                                        "Isikan SUBJEKTIF Pada Kolom Dibawah Ini :",
                                        style: blackTextStyle,
                                      ),

                                      FormWidget.textArea(
                                        maxLines: 3,
                                        enabled: true,
                                        controller: _subjektifController,
                                        validator: (value) => value == ''
                                            ? "Tidak boleh kosong"
                                            : null,
                                      ),
                                      const Divider(),
                                      Text(
                                        "Isikan OBJEKTIF Pada Kolom Dibawah Ini :",
                                        style: blackTextStyle,
                                      ),
                                      FormWidget.textArea(
                                          maxLines: 3,
                                          enabled: true,
                                          validator: (value) => value == ''
                                              ? "Tidak boleh kosong"
                                              : null,
                                          controller: _objektifController),
                                      const Divider(),
                                      Text(
                                        "Isikan ASESMEN Pada Kolom Dibawah Ini :",
                                        style: blackTextStyle,
                                      ),
                                      FormWidget.textArea(
                                          maxLines: 3,
                                          enabled: true,
                                          validator: (value) => value == ''
                                              ? "Tidak boleh kosong"
                                              : null,
                                          controller: _asesmenController),
                                      const Divider(),
                                      Text(
                                        "Isikan PLAN Pada Kolom Dibawah Ini :",
                                        style: blackTextStyle,
                                      ),
                                      FormWidget.textArea(
                                          maxLines: 3,
                                          enabled: true,
                                          validator: (value) => value == ''
                                              ? "Tidak boleh kosong"
                                              : null,
                                          controller: _planController),
                                      const Divider(),
                                      Text(
                                        "Isikan Instruksi PPA Pada Kolom Dibawah  :",
                                        style: blackTextStyle,
                                      ),
                                      FormWidget.textArea(
                                          maxLines: 3,
                                          enabled: true,
                                          controller: _ppaController),
                                      const Divider(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        color: Colors.transparent);
                  }
                : null,
            // =================== >
            widget: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    height: 15.sp,
                    decoration:
                        const BoxDecoration(color: Colors.lightBlueAccent),
                    child: Center(
                      child: Text(
                        "Catatan Perkembangan Pasien Terintegrasi CPPT",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5.sp, left: 5.sp),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(0.4),
                      },
                      border: TableBorder.all(color: Colors.black),
                      children: [
                        TableRow(children: [
                          TitleWidget.headerTitle(title: "No"),
                          TitleWidget.headerTitle(title: "Bagian"),
                          TitleWidget.headerTitle(title: "User"),
                          TitleWidget.headerTitle(title: "Tanggal"),
                          TitleWidget.headerTitle(title: "Subjectif"),
                          TitleWidget.headerTitle(title: "Objectif"),
                          TitleWidget.headerTitle(title: "Asesmen"),
                          TitleWidget.headerTitle(title: "Plan"),
                          TitleWidget.headerTitle(title: "PPA"),
                          TitleWidget.headerTitle(title: "Action")
                        ])
                      ],
                    ),
                  ),
                  state.getResult.fold(
                      () => Container(),
                      (a) => a.fold(
                          (l) => l.maybeMap(orElse: () {
                                return Container();
                              }),
                          (r) => r.map(loaded: (e) {
                                List<CpptPasienModel> result =
                                    (e.value['response']["cppt"] as Iterable)
                                        .map((e) => CpptPasienModel.fromJson(e))
                                        .toList();

                                return Column(
                                  children: result
                                      .asMap()
                                      .entries
                                      .map((e) => Container(
                                            padding: EdgeInsets.only(
                                                right: 5.sp, left: 5.sp),
                                            child: Table(
                                              columnWidths: const {
                                                0: FlexColumnWidth(0.4),
                                              },
                                              border: TableBorder.all(
                                                  color: Colors.black),
                                              children: [
                                                TableRow(children: [
                                                  TitleWidget.contentTitle(
                                                      title: (e.key + 1)
                                                          .toString()),
                                                  TitleWidget.contentTitle(
                                                      title: e.value.bagian),
                                                  TitleWidget.contentTitle(
                                                      title: e.value.ppa),
                                                  TitleWidget.contentTitle(
                                                      title:
                                                          "${e.value.tanggal}\n${e.value.insertDttm.substring(11, 19)}"),
                                                  TitleWidget.contentTitle(
                                                      title: e.value.subjektif),
                                                  TitleWidget.contentTitle(
                                                      title: e.value.objectif),
                                                  TitleWidget.contentTitle(
                                                      title: e.value.asesmen),
                                                  TitleWidget.contentTitle(
                                                      title: e.value.plan),
                                                  TitleWidget.contentTitle(
                                                      title:
                                                          e.value.instruksiPpa),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(1.sp),
                                                    child: Wrap(
                                                      runAlignment:
                                                          WrapAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                elevation: 1,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(2
                                                                            .sp)),
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .dangerColor),
                                                            onPressed: () {
                                                              // TAMPILKAN PESAN EDIT
                                                              CustomDialogWidget
                                                                  .getDialog(
                                                                      widget:
                                                                          OnDeleteCppTContentWidget(
                                                                idCppt:
                                                                    e.value.id,
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              FontAwesomeIcons
                                                                  .circleXmark,
                                                              color: ThemeColor
                                                                  .whiteColor,
                                                            )),
                                                        SizedBox(width: 1.sp),
                                                        ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                elevation: 1,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(2
                                                                            .sp)),
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .greenColor),
                                                            onPressed: () {
                                                              // UBAH DATA ----
                                                              CustomDialogWidget.getDialog(
                                                                  widget: CPPTEditContentPasienWidget(
                                                                      key: const Key(
                                                                          "1"),
                                                                      ppa: e
                                                                          .value
                                                                          .instruksiPpa,
                                                                      asesmen: e
                                                                          .value
                                                                          .asesmen,
                                                                      subjetif: e
                                                                          .value
                                                                          .subjektif,
                                                                      id: e
                                                                          .value
                                                                          .id,
                                                                      objectif: e
                                                                          .value
                                                                          .objectif,
                                                                      plan: e
                                                                          .value
                                                                          .plan),
                                                                  color: Colors
                                                                      .transparent);
                                                            },
                                                            child: const Icon(
                                                              FontAwesomeIcons
                                                                  .pen,
                                                              color: ThemeColor
                                                                  .whiteColor,
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                ])
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                );
                              }, auAutorized: (e) {
                                return Container();
                              }, emty: (e) {
                                return Container();
                              })))
                ],
              ),
            ));
      },
    );
  }
}
