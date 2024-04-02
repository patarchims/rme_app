// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/cppt/cppt_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/component.dart';

class CPPTEditContentPasienWidget extends StatefulWidget {
  final String subjetif;
  final int id;
  final String objectif;
  final String asesmen;
  final String plan;
  final String ppa;
  const CPPTEditContentPasienWidget({
    Key? key,
    required this.subjetif,
    required this.id,
    required this.objectif,
    required this.asesmen,
    required this.plan,
    required this.ppa,
  }) : super(key: key);

  @override
  State<CPPTEditContentPasienWidget> createState() =>
      _CPPTEditContentPasienWidgetState();
}

class _CPPTEditContentPasienWidgetState
    extends State<CPPTEditContentPasienWidget> {
  final _keyForm = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  late TextEditingController _subjektifController;
  late TextEditingController _objektifController;
  late TextEditingController _asesmenController;
  late TextEditingController _planController;
  late TextEditingController _ppaController;

  @override
  void initState() {
    _subjektifController = TextEditingController(text: widget.subjetif);
    _objektifController = TextEditingController(text: widget.objectif);
    _asesmenController = TextEditingController(text: widget.asesmen);
    _planController = TextEditingController(text: widget.plan);
    _ppaController = TextEditingController(text: widget.ppa);
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
        // TODO: implement listener
        if (state.isLoadingSaveCPPT) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (!state.isLoadingSaveCPPT) {
          EasyLoading.dismiss();
        }

        state.updateResultFailure.fold(
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
        return Container(
            width: Get.width,
            height: Get.height - 100.sp,
            decoration: const BoxDecoration(color: Colors.white),
            child: Scaffold(
              floatingActionButton: SizedBox(
                width: 50.sp,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: AppColors.accent.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.sp)),
                  onPressed: () {
                    // UPDATE DATA
                    if (authState is Authenticated) {
                      context.read<CpptBloc>().add(CpptEvent.onUpdateCPPT(
                          idCppt: widget.id,
                          bagian: authState.user.bagian,
                          subjetif: _subjektifController.text,
                          objektif: _objektifController.text,
                          asesmen: _asesmenController.text,
                          ppa: _ppaController.text,
                          instruksiPPA: _ppaController.text,
                          plan: _planController.text));
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
                    radius: Radius.circular(5.sp),
                    child: ListView(
                      controller: _scrollController,
                      children: [
                        // ===============
                        Text(
                          "Isikan SUBJEKTIF Pada Kolom Dibawah Ini :",
                          style: blackTextStyle,
                        ),
                        FormWidget.textArea(
                          enabled: true,
                          maxLines: 3,
                          controller: _subjektifController,
                          validator: (value) =>
                              value == '' ? "Tidak boleh kosong" : null,
                        ),
                        const Divider(),
                        Text(
                          "Isikan OBJEKTIF Pada Kolom Dibawah Ini :",
                          style: blackTextStyle,
                        ),
                        FormWidget.textArea(
                            enabled: true,
                            maxLines: 3,
                            validator: (value) =>
                                value == '' ? "Tidak boleh kosong" : null,
                            controller: _objektifController),
                        const Divider(),
                        Text(
                          "Isikan ASESMEN Pada Kolom Dibawah Ini :",
                          style: blackTextStyle,
                        ),
                        FormWidget.textArea(
                            maxLines: 3,
                            enabled: true,
                            validator: (value) =>
                                value == '' ? "Tidak boleh kosong" : null,
                            controller: _asesmenController),
                        const Divider(),
                        Text(
                          "Isikan PLAN Pada Kolom Dibawah Ini :",
                          style: blackTextStyle,
                        ),
                        FormWidget.textArea(
                            maxLines: 3,
                            enabled: true,
                            validator: (value) =>
                                value == '' ? "Tidak boleh kosong" : null,
                            controller: _planController),
                        const Divider(),
                        Text(
                          "Isikan Instruksi PPA Pada Kolom Dibawah Ini :",
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
            ));
      },
    );
  }
}
