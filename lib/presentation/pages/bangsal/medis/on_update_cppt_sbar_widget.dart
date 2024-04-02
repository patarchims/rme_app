// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/cppt_sbar_bangsal/cppt_sbar_bangsal_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/cppt_sbar_bangsal_repository.dart';

class OnUpdateCpptSbarWidget extends StatefulWidget {
  final CpptSbarDokterModel cpptSbarDokterModel;
  const OnUpdateCpptSbarWidget({
    Key? key,
    required this.cpptSbarDokterModel,
  }) : super(key: key);

  @override
  State<OnUpdateCpptSbarWidget> createState() => _OnUpdateCpptSbarWidgetState();
}

class _OnUpdateCpptSbarWidgetState extends State<OnUpdateCpptSbarWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _situationController;
  late TextEditingController _backgroundController;
  late TextEditingController _asesmenController;
  late TextEditingController _recomendationController;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _situationController = TextEditingController();
    _backgroundController = TextEditingController();
    _asesmenController = TextEditingController();
    _recomendationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _situationController.clear();
    _backgroundController.clear();
    _asesmenController.clear();
    _recomendationController.clear();
    _situationController.dispose();
    _backgroundController.dispose();
    _asesmenController.dispose();
    _recomendationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return Container(
        width: Get.width,
        height: 250.sp,
        decoration: const BoxDecoration(color: Colors.white),
        child: Scaffold(
          backgroundColor: ThemeColor.bgColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "SILAHKAN INPUT PASIEN BERBASIS SBAR",
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
                thickness: 5.sp,
                controller: _scrollController,
                trackVisibility: false,
                radius: Radius.circular(5.sp),
                child: ListView(
                  controller: _scrollController,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===============
                    Text("Isikan SITUATION Pada Kolom Dibawah Ini :",
                        style: blackTextStyle),

                    FormWidget.textArea(
                      maxLines: 3,
                      enabled: true,
                      controller: _situationController
                        ..text =
                            widget.cpptSbarDokterModel.situation.toString(),
                      validator: (value) =>
                          value == '' ? "Tidak boleh kosong" : null,
                    ),
                    const Divider(),
                    Text(
                      "Isikan BACKGROUND Pada Kolom Dibawah Ini :",
                      style: blackTextStyle,
                    ),
                    FormWidget.textArea(
                        // value: widget.cpptSbarDokterModel.background,
                        maxLines: 3,
                        enabled: true,
                        validator: (value) =>
                            value == '' ? "Tidak boleh kosong" : null,
                        controller: _backgroundController
                          ..text = widget.cpptSbarDokterModel.background),
                    const Divider(),
                    Text(
                      "Isikan ASESMEN Pada Kolom Dibawah Ini :",
                      style: blackTextStyle,
                    ),
                    FormWidget.textArea(
                        // value: widget.cpptSbarDokterModel.asesmen,
                        maxLines: 3,
                        enabled: true,
                        validator: (value) =>
                            value == '' ? "Tidak boleh kosong" : null,
                        controller: _asesmenController
                          ..text = widget.cpptSbarDokterModel.asesmen),
                    const Divider(),
                    Text(
                      "Isikan Recomendation Pada Kolom Dibawah Ini :",
                      style: blackTextStyle,
                    ),
                    FormWidget.textArea(
                        // value: widget.cpptSbarDokterModel.recomendation,
                        maxLines: 3,
                        enabled: true,
                        validator: (value) =>
                            value == '' ? "Tidak boleh kosong" : null,
                        controller: _recomendationController
                          ..text = widget.cpptSbarDokterModel.recomendation),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            width: 50.sp,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: AppColors.accent.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp)),
              onPressed: () async {
                if (_keyForm.currentState!.validate()) {}
                if (authState is Authenticated) {
                  context.read<CpptSbarBangsalBloc>().add(
                      OnUpdateCpptSBARBangsalEvent(
                          situation: _situationController.text,
                          background: _backgroundController.text,
                          asesmen: _asesmenController.text,
                          recomendation: _recomendationController.text,
                          noCppt: widget.cpptSbarDokterModel.idCppt));

                  _situationController.clear();
                  _backgroundController.clear();
                  _asesmenController.clear();
                  _recomendationController.clear();
                }
                Get.back();

                context
                    .read<CpptSbarBangsalBloc>()
                    .add(OnGetCpptBangsal(noReg: singlePasien.first.noreg));
              },
              heroTag: "btn22",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  Text(
                    "UPDATE",
                    style: whiteTextStyle,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
