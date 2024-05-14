import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/res/colors.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/cppt_sbar_bangsal/cppt_sbar_bangsal_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/medis/on_update_cppt_sbar_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class CpptSBARBansalWidget extends StatefulWidget {
  const CpptSBARBansalWidget({super.key});

  @override
  State<CpptSBARBansalWidget> createState() => _CpptSBARBansalWidgetState();
}

class _CpptSBARBansalWidgetState extends State<CpptSBARBansalWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _situationController;
  late TextEditingController _backgroundController;
  late TextEditingController _asesmenController;
  late TextEditingController _recomendationController;
  late TextEditingController _ppaController;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _situationController = TextEditingController();
    _backgroundController = TextEditingController();
    _asesmenController = TextEditingController();
    _recomendationController = TextEditingController();
    _ppaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _situationController.clear();
    _backgroundController.clear();
    _asesmenController.clear();
    _recomendationController.clear();
    _ppaController.clear();
    _situationController.dispose();
    _backgroundController.dispose();
    _asesmenController.dispose();
    _recomendationController.dispose();
    _ppaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<CpptSbarBangsalBloc, CpptSbarBangsalState>(
      listener: (context, state) {
        if (state.status == CPPTSbarBangsalStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        // TUTUP LOADING
        if (state.status != CPPTSbarBangsalStatus.isLoadingSave) {
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
                      context.read<CpptSbarBangsalBloc>().add(
                          OnGetCpptBangsal(noReg: singlePasien.first.noreg));
                    })));
      },
      builder: (context, state) {
        // ============ CPPT
        if (state.status == CPPTSbarBangsalStatus.isLoadingGet) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            onPressed: () {
              CustomDialogWidget.getDialog(
                  color: Colors.transparent,
                  widget: Container(
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
                        body: Form(
                          key: _keyForm,
                          child: RawScrollbar(
                            thumbColor: ThemeColor.darkColor,
                            thumbVisibility: true,
                            interactive: true,
                            thickness: 10.sp,
                            controller: _scrollController,
                            trackVisibility: false,
                            radius: Radius.circular(5.sp),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.sp),
                              child: ListView(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ===============
                                  Text(
                                      "Isikan SITUATION Pada Kolom Dibawah Ini :",
                                      style: blackTextStyle),

                                  FormWidget.textArea(
                                    maxLines: 3,
                                    enabled: true,
                                    controller: _situationController,
                                    validator: (value) => value == ''
                                        ? "Tidak boleh kosong"
                                        : null,
                                  ),
                                  const Divider(),
                                  Text(
                                    "Isikan BACKGROUND Pada Kolom Dibawah Ini :",
                                    style: blackTextStyle,
                                  ),
                                  FormWidget.textArea(
                                      maxLines: 3,
                                      enabled: true,
                                      validator: (value) => value == ''
                                          ? "Tidak boleh kosong"
                                          : null,
                                      controller: _backgroundController),
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
                                    "Isikan Recomendation Pada Kolom Dibawah Ini :",
                                    style: blackTextStyle,
                                  ),
                                  FormWidget.textArea(
                                      maxLines: 3,
                                      enabled: true,
                                      validator: (value) => value == ''
                                          ? "Tidak boleh kosong"
                                          : null,
                                      controller: _recomendationController),
                                  Text(
                                    "Isikan PPA Dibawah ini :",
                                    style: blackTextStyle,
                                  ),
                                  FormWidget.textArea(
                                      maxLines: 3,
                                      enabled: true,
                                      validator: (value) => value == ''
                                          ? "Tidak boleh kosong"
                                          : null,
                                      controller: _ppaController),
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
                              dynamic data =
                                  await deviceInfo.initPlatformState();

                              if (authState is Authenticated) {
                                // ignore: use_build_context_synchronously
                                context.read<CpptSbarBangsalBloc>().add(
                                    OnSaveCPPTSBARBangsal(
                                        dpjp: singlePasien.first.kdDokter,
                                        pelayanan: toPelayanan(
                                            poliklinik:
                                                authState.user.poliklinik),
                                        ppa: _ppaController.text,
                                        noReg: singlePasien.first.noreg,
                                        kelompok: toPerson(
                                            person: authState.user.person),
                                        situation: _situationController.text,
                                        background: _backgroundController.text,
                                        asesmen: _asesmenController.text,
                                        recomendation:
                                            _recomendationController.text,
                                        deviceID:
                                            "ID - ${data['id']} - ${data['device']}"));

                                _situationController.clear();
                                _backgroundController.clear();
                                _asesmenController.clear();
                                _recomendationController.clear();
                              }
                              Get.back();
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
                                  "SIMPAN",
                                  style: whiteTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      )));
            },
            isENableAdd: true,
            title: "Tambah",
            widget: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 10.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: SingleChildScrollView(
                controller: _scrollController,
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
                          "Catatan Perkembangan Pasien Terintegrasi CPPT (SBAR)",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ))),
                    SizedBox(
                      child: Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(children: [
                            TitleWidget.headerTitle(title: "Situation"),
                            TitleWidget.headerTitle(title: "Background"),
                            TitleWidget.headerTitle(title: "Asesmen"),
                            TitleWidget.headerTitle(title: "Recomendation"),
                            TitleWidget.headerTitle(title: "Instruksi PPA"),
                            TitleWidget.headerTitle(title: "Action")
                          ])
                        ],
                      ),
                    ),
                    if (state.cppt.isNotEmpty) ...[
                      ...state.cppt.map(
                        (e) => SizedBox(
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.contentTitle(title: e.situation),
                                TitleWidget.contentTitle(title: e.background),
                                TitleWidget.contentTitle(title: e.asesmen),
                                TitleWidget.contentTitle(
                                    title: e.recomendation),
                                TitleWidget.contentTitle(title: e.instruksiPPA),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.sp, vertical: 5.sp),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    runSpacing: 4,
                                    spacing: 5.sp,
                                    children: [
                                      SizedBox(
                                        height: 15.sp,
                                        width: 25.sp,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            CustomDialogWidget.getDialog(
                                                widget:
                                                    MessageAlert.deleteAlert(
                                                        mesage:
                                                            "Apakah Anda yakin menghapus data ${e.situation} ini ?",
                                                        onPressed: () {
                                                          //  === DELETE DATA ==== /
                                                          context
                                                              .read<
                                                                  CpptSbarBangsalBloc>()
                                                              .add(OnDeleteCPPTBangsalEvent(
                                                                  noCppt: e
                                                                      .idCppt));

                                                          Get.back();
                                                          context
                                                              .read<
                                                                  CpptSbarBangsalBloc>()
                                                              .add(OnGetCpptBangsal(
                                                                  noReg: singlePasien
                                                                      .first
                                                                      .noreg));
                                                        }));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.sp)),
                                              backgroundColor:
                                                  ThemeColor.dangerColor),
                                          child: const Icon(
                                            FontAwesomeIcons.trash,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.sp,
                                        width: 25.sp,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            CustomDialogWidget.getDialog(
                                                color: Colors.transparent,
                                                widget: OnUpdateCpptSbarWidget(
                                                    cpptSbarDokterModel: e));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.sp)),
                                              backgroundColor:
                                                  ThemeColor.primaryColor),
                                          child: const Icon(
                                            FontAwesomeIcons.pencil,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ])
                            ],
                          ),
                        ),
                      )
                    ],
                    if (state.cppt.isEmpty) ...[
                      Container(
                        width: Get.width,
                        height: 150.sp,
                        margin: EdgeInsets.only(right: 5.sp, left: 5.sp),
                        child: Card(
                          elevation: 1.sp,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(2.sp),
                          ),
                          margin: EdgeInsets.only(top: 5.sp),
                          color: ThemeColor.primaryColor.withOpacity(0.4),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.sp)),
                            padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                            child: Center(
                                child: SizedBox(
                              height: 100.sp,
                              width: 100.sp,
                              child: Lottie.asset(AppConstant.findAnimation,
                                  height: 20.sp, reverse: true, repeat: true),
                            )),
                          ),
                        ),
                      )
                    ],
                  ],
                ),
              ),
            ));
      },
    );
  }
}

List<SampleRowData> listData = [
  SampleRowData(
      id: "12",
      planet:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
  SampleRowData(
      id: "123",
      planet:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
];

class SampleRowData {
  final String id;
  final String planet;

  SampleRowData({required this.id, required this.planet});
}
