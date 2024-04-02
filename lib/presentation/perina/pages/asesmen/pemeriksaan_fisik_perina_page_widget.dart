import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/perina/bloc/pemeriksaan_fisik_perina/pemeriksaan_fisik_perina_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PemeriksaanFisikPerinaPageWidget extends StatefulWidget {
  const PemeriksaanFisikPerinaPageWidget({super.key});

  @override
  State<PemeriksaanFisikPerinaPageWidget> createState() =>
      _PemeriksaanFisikPerinaPageWidgetState();
}

class _PemeriksaanFisikPerinaPageWidgetState
    extends State<PemeriksaanFisikPerinaPageWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _kepalaController;
  late TextEditingController _wajahController;
  late TextEditingController _telingaController;
  late TextEditingController _hidungController;
  late TextEditingController _mulutController;
  late TextEditingController _refleksController;
  late TextEditingController _leherDanBahuController;
  late TextEditingController _dadaController;
  late TextEditingController _abdomenController;
  late TextEditingController _punggungController;
  late TextEditingController _integumenController;
  late TextEditingController _ekstremistasController;
  late TextEditingController _genitaliaController;
  late TextEditingController _anusController;
  late TextEditingController _kesadaranController;
  late TextEditingController _tonickNeckController;
  late TextEditingController _kelainanController;
  late TextEditingController _gcsEController;
  late TextEditingController _gcsVController;
  late TextEditingController _gcsMController;

  @override
  void initState() {
    _gcsEController = TextEditingController();
    _gcsVController = TextEditingController();
    _gcsMController = TextEditingController();

    _kepalaController = TextEditingController();
    _kelainanController = TextEditingController();
    _tonickNeckController = TextEditingController();
    _wajahController = TextEditingController();
    _telingaController = TextEditingController();
    _hidungController = TextEditingController();
    _mulutController = TextEditingController();
    _refleksController = TextEditingController();
    _leherDanBahuController = TextEditingController();
    _dadaController = TextEditingController();
    _abdomenController = TextEditingController();
    _punggungController = TextEditingController();
    _integumenController = TextEditingController();
    _ekstremistasController = TextEditingController();
    _genitaliaController = TextEditingController();
    _anusController = TextEditingController();
    _kesadaranController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _kepalaController.clear();
    _kelainanController.clear();
    _tonickNeckController.clear();
    _wajahController.clear();
    _telingaController.clear();
    _hidungController.clear();
    _mulutController.clear();
    _refleksController.clear();
    _leherDanBahuController.clear();
    _dadaController.clear();
    _abdomenController.clear();
    _punggungController.clear();
    _integumenController.clear();
    _ekstremistasController.clear();
    _genitaliaController.clear();
    _anusController.clear();
    _kesadaranController.clear();
    _gcsEController.clear();
    _gcsVController.clear();
    _gcsMController.clear();

    _kepalaController.dispose();
    _wajahController.dispose();
    _telingaController.dispose();
    _hidungController.dispose();
    _mulutController.dispose();
    _refleksController.dispose();
    _leherDanBahuController.dispose();
    _dadaController.dispose();
    _abdomenController.dispose();
    _punggungController.dispose();
    _integumenController.dispose();
    _ekstremistasController.dispose();
    _genitaliaController.dispose();
    _anusController.dispose();
    _kesadaranController.dispose();
    _tonickNeckController.dispose();
    _kelainanController.dispose();
    _gcsEController.dispose();
    _gcsVController.dispose();
    _gcsMController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PemeriksaanFisikPerinaBloc,
        PemeriksaanFisikPerinaState>(
      listener: (context, state) {
        // IS LOADING SAVE DATA
        if (state.status == PemeriksaanFisikPerinaStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != PemeriksaanFisikPerinaStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
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
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == PemeriksaanFisikPerinaStatus.isLoadingGet) {
          return HeaderContentWidget(
            widget: Loading.circleLoading(),
          );
        }

        return HeaderContentWidget(
            backgroundColor: ThemeColor.whiteColor,
            isENableAdd: true,
            onPressed: () async {
              dynamic data = await deviceInfo.initPlatformState();

              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<PemeriksaanFisikPerinaBloc>().add(
                    OnSavePemeriksaanFisikPerina(
                        fisik: state.fisikPerinaModel.copyWith(
                            gcsE: _gcsEController.text,
                            gcsM: _gcsMController.text,
                            gcsV: _gcsVController.text,
                            kelainan: _kelainanController.text,
                            tonickNeck: _tonickNeckController.text,
                            kesadaran: _kesadaranController.text,
                            abdomen: _abdomenController.text,
                            anus: _anusController.text,
                            dada: _dadaController.text,
                            ekstremitas: _ekstremistasController.text,
                            genetalia: _genitaliaController.text,
                            hidung: _hidungController.text,
                            integumen: _integumenController.text,
                            kepala: _kepalaController.text,
                            leherDahBahu: _leherDanBahuController.text,
                            mulut: _mulutController.text,
                            punggung: _punggungController.text,
                            refleks: _refleksController.text,
                            telinga: _telingaController.text,
                            wajah: _wajahController.text),
                        devicesID: "ID - ${data['id']} - ${data['device']}",
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        person: toPerson(person: authState.user.person),
                        noReg: singlePasien.first.noreg));
              }
            },
            title: "SIMPAN",
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
                child: Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // =================== KEPALA
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: kesadaran
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          controller: _tonickNeckController
                            ..text = state.fisikPerinaModel.tonickNeck,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Tonick Neck",
                      ),
                      FB5Col(
                        classNames: 'col-12',
                        child: TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "GCS",
                            widget: formBoxGSC(
                                valueE: state.fisikPerinaModel.gcsE,
                                valueM: state.fisikPerinaModel.gcsM,
                                valueV: state.fisikPerinaModel.gcsV,
                                controllerE: _gcsEController
                                  ..text = state.fisikPerinaModel.gcsE,
                                controllerM: _gcsMController
                                  ..text = state.fisikPerinaModel.gcsM,
                                controllerV: _gcsVController
                                  ..text = state.fisikPerinaModel.gcsV)),
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: kesadaran
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          controller: _kelainanController
                            ..text = state.fisikPerinaModel.kelainan,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Kelainan yang ditemukan",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: kesadaran
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          controller: _kesadaranController
                            ..text = state.fisikPerinaModel.kesadaran,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Kesadaran",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: kepala
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          controller: _kepalaController
                            ..text = state.fisikPerinaModel.kepala,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Kepala",
                      ),

                      // =============== WAJAH
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: wajah
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _wajahController
                            ..text = state.fisikPerinaModel.wajah,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Wajah",
                      ),

                      // TELINGA
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: telinga
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _telingaController
                            ..text = state.fisikPerinaModel.telinga,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Telinga",
                      ),

                      // HIDUNG
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: hidung
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _hidungController
                            ..text = state.fisikPerinaModel.hidung,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Hidung",
                      ),

                      // MULUT
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: mulut
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _mulutController
                            ..text = state.fisikPerinaModel.mulut,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Mulut",
                      ),

                      // REFLEKS
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: refleks
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _refleksController
                            ..text = state.fisikPerinaModel.refleks,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Refleks",
                      ),

                      // ==== LEHER DAN BAHU
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: leherDanBahu
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _leherDanBahuController
                            ..text = state.fisikPerinaModel.leherDahBahu,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Leher dan Bahu",
                      ),

                      // ========== DADA
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: dada
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _dadaController
                            ..text = state.fisikPerinaModel.dada,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Dada",
                      ),

                      // ABDOMEN
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: abDomen
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _abdomenController
                            ..text = state.fisikPerinaModel.abdomen,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Abdomen",
                      ),

                      //== PUNGUNG
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: punggung
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _punggungController
                            ..text = state.fisikPerinaModel.punggung,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Punggung",
                      ),

                      //====INTEGUMEN
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: integumen
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _integumenController
                            ..text = state.fisikPerinaModel.integumen,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Integumen",
                      ),

                      // EKSTREMITAS
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: ekstermitas
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _ekstremistasController
                            ..text = state.fisikPerinaModel.ekstremitas,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Ekstremitas",
                      ),

                      // GENITALIA
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: genitalia
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _genitaliaController
                            ..text = state.fisikPerinaModel.genetalia,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Genitalia",
                      ),

                      // Anus
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: anus
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          validator: (x) {
                            return null;
                          },
                          // CONTROLLER
                          controller: _anusController
                            ..text = state.fisikPerinaModel.anus,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Anus",
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Row formBoxGSC({
    String? labelText,
    String? valueE,
    String? valueV,
    String? valueM,
    dynamic Function(String)? onChangedE,
    dynamic Function(String)? onChangedV,
    dynamic Function(String)? onChangedM,
    TextEditingController? controllerE,
    TextEditingController? controllerV,
    TextEditingController? controllerM,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          child: Text(
            "E :",
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
          child: FormWidget.numberForm(
            controller: controllerE,
            enable: true,
          ),
        ),
        Container(
            padding: EdgeInsets.only(right: 5.sp),
            child: Text(
              "V :",
              style: blackTextStyle.copyWith(fontSize: 6.sp),
            )),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
          child: FormWidget.numberForm(
            controller: controllerV,
            enable: true,
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          child: Text(
            "M :",
            style: blackTextStyle.copyWith(fontSize: 6.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 5.sp),
          width: 30.sp,
          child: FormWidget.numberForm(controller: controllerM, enable: true),
        ),
      ],
    );
  }
}

List<String> kepala = [
  "TIDAK ADA KELAINAN",
  "MIKROCEFAL",
  "HYDROCEPALUS",
  "CEPAL HEMATOM",
  "KAPUT",
  "CHIGNON",
  "PERDARAHAN SUB GALEAL",
  "TANDA FORCEF",
  "LASERASI SCAPEL"
];

List<String> mata = [
  "Tidak Ada Kelainan",
  "Katarak Congenital",
  "Kelopak Membengkak",
  "Sekret",
  "Perdarahan Sub Kongjungtiva",
  "Kongjugtivitis"
];
List<String> wajah = [
  "Tidak Ada Kelainan",
  "Palsifasial",
  "Plehoral",
  "Menangis",
  "Asimetris",
  "Gambaran Disformik (trisomi 21)",
  "Sianotik Traumatic"
];

List<String> telinga = [
  "Tidak Ada Kelainan",
  "Anomali Telinga",
  "Keluar Cairan"
];

List<String> hidung = ["Tidak Ada Kelainan", "Epistaksis", "Cuping Hidung"];

List<String> mulut = [
  "Tidak Ada Kelainan",
  "Labio Schisis",
  "Labio Palato Schisis",
  "Busa Secret Oral",
  "Atresia Koana",
  "Sianotik Lidah",
  "Mutiara Epstein",
  "Epulis",
  "Ranula",
  "Bibir Sianotik"
];

List<String> refleks = [
  "Roating Refleks",
  "Refleks Mengisap",
  "Refleks Moro",
  "Refleks Moro",
  "Refleks Mengenggam",
  "Refleks Babinski",
  "Tepping Refleks",
  "Asymetric Jonic Neck Refleks"
];

List<String> leherDanBahu = ["Tidak Ada Kelainan", "Fractur Clavikula"];

List<String> dada = [
  "Tidak Ada Kelainan",
  "Pernafasan Grunting",
  "Retrasi Dada",
  "Ronchi",
  "Pembesaran Payudara",
  "Mur-mur",
  "Gallop",
];

List<String> abDomen = ["Peristaltik", "Gembung", "Supel", "Distensi"];

List<String> punggung = [
  "Tidak Ada Kelainan",
  "Spina Bifida Okulta",
  "Kelainan Vertebrae"
];

List<String> integumen = [
  "Tidak Ada Kelainan",
  "Pertumbungah Rambut Abnormal",
  "Haematom",
  "Memar",
  "Pucat",
  "Dingin",
  "Diphoresis",
  "Turgor",
];

List<String> kesadaran = [
  "Compose Mentis",
  "Apatis",
  "Somnolen",
  "Soporo",
  "Soporo Coma",
  "Coma"
];

List<String> ekstermitas = [
  "Tidak Ada Kelainan",
  "Talipes",
  "Kulit Mengelupas",
  "Polidactili",
  "Akrosianotik",
  "Tonus Otot"
];

List<String> genitalia = [
  "Tidak Ada Kelainan",
  "Testis Tidak Turun",
  "Scret Vagina",
  "Hydrokel",
  "Hypospadia",
  "Herma Proditisme"
];

List<String> anus = [
  "Tidak Ada Kelainan",
  "BAK",
  "Aresia Ani",
  "Meconium",
  "Tidak Ada"
];
