// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
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
import 'package:hms_app/presentation/pages/modul/cppt_content_widget/cppt_content_table_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class CpptWidgetBangsal extends StatefulWidget {
  final bool isENableAdd;
  const CpptWidgetBangsal({
    Key? key,
    this.isENableAdd = true,
  }) : super(key: key);

  @override
  State<CpptWidgetBangsal> createState() => _CpptWidgetBangsalState();
}

class _CpptWidgetBangsalState extends State<CpptWidgetBangsal> {
  late TextEditingController _subjektifController;
  late TextEditingController _objektifController;
  late TextEditingController _asesmenController;
  late TextEditingController _planController;
  late TextEditingController _ppaController;
  final ScrollController _scrollController = ScrollController();
  String waktu = "";
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
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
    return Expanded(
        child: BlocConsumer<CpptBloc, CpptState>(
      listener: (context, state) {
        if (state.isLoadingSaveCPPT) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
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

        //=====//
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
                                                  "ID - ${data['id']} - ${data['device']}}",
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
                                "SILAHKAN INPUT PASIEN BERBASIS SOAP",
                                style: whiteTextStyle,
                              ),
                            ),
                            body: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: _keyForm,
                                child: RawScrollbar(
                                  thumbColor: ThemeColor.darkColor,
                                  thumbVisibility: true,
                                  interactive: true,
                                  thickness: 10.sp,
                                  controller: _scrollController,
                                  trackVisibility: false,
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
                                        maxLines: 2,
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
                                          maxLines: 2,
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
                                          maxLines: 2,
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
                                          maxLines: 2,
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
                                          maxLines: 2,
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
            widget: Column(
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
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    padding: EdgeInsets.all(4.sp),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              AppColors.secondaryColor,
                              Color(0xFF143658),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        color: AppColors.secondaryColor),
                    child: const CPPTContentTableWidget(),
                  ),
                )
              ],
            ));
      },
    ));
  }
}
