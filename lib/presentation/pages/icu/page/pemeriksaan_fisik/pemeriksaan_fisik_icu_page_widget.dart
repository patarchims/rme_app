import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/icu/bloc/pemeriksaan_fisik_icu/pemeriksaan_fisik_icu_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/perina/pages/asesmen/pemeriksaan_fisik_perina_page_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PemeriksaanFisikIcuPageWidget extends StatefulWidget {
  const PemeriksaanFisikIcuPageWidget({super.key});

  @override
  State<PemeriksaanFisikIcuPageWidget> createState() =>
      _PemeriksaanFisikIcuPageWidgetState();
}

class _PemeriksaanFisikIcuPageWidgetState
    extends State<PemeriksaanFisikIcuPageWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _gcsEController;
  late TextEditingController _gcsMController;
  late TextEditingController _gcsVController;
  late TextEditingController _kesadaranController;
  late TextEditingController _kepalaController;
  late TextEditingController _rambutController;
  late TextEditingController _wajahController;
  late TextEditingController _mataController;
  late TextEditingController _telingaController;
  late TextEditingController _hidungController;
  late TextEditingController _mulutController;
  late TextEditingController _gigiController;
  late TextEditingController _lidahController;
  late TextEditingController _tenggorokanController;
  late TextEditingController _leherController;
  late TextEditingController _dadaController;
  late TextEditingController _respirasiController;
  late TextEditingController _jantungController;
  late TextEditingController _integumenController;
  late TextEditingController _ekstremitasController;

  @override
  void initState() {
    _gcsEController = TextEditingController();
    _gcsMController = TextEditingController();
    _gcsVController = TextEditingController();
    _kesadaranController = TextEditingController();
    _kepalaController = TextEditingController();
    _rambutController = TextEditingController();
    _wajahController = TextEditingController();
    _mataController = TextEditingController();
    _telingaController = TextEditingController();
    _hidungController = TextEditingController();
    _mulutController = TextEditingController();
    _gigiController = TextEditingController();
    _lidahController = TextEditingController();
    _tenggorokanController = TextEditingController();
    _leherController = TextEditingController();
    _dadaController = TextEditingController();
    _respirasiController = TextEditingController();
    _jantungController = TextEditingController();
    _integumenController = TextEditingController();
    _ekstremitasController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _gcsEController.clear();
    _gcsMController.clear();
    _gcsVController.clear();
    _kesadaranController.clear();
    _kepalaController.clear();
    _rambutController.clear();
    _wajahController.clear();
    _mataController.clear();
    _telingaController.clear();
    _hidungController.clear();
    _mulutController.clear();
    _gigiController.clear();
    _lidahController.clear();
    _tenggorokanController.clear();
    _leherController.clear();
    _dadaController.clear();
    _respirasiController.clear();
    _jantungController.clear();
    _integumenController.clear();
    _ekstremitasController.clear();

    _gcsEController.dispose();
    _gcsMController.dispose();
    _gcsVController.dispose();
    _kesadaranController.dispose();
    _kepalaController.dispose();
    _rambutController.dispose();
    _wajahController.dispose();
    _mataController.dispose();
    _telingaController.dispose();
    _hidungController.dispose();
    _mulutController.dispose();
    _gigiController.dispose();
    _lidahController.dispose();
    _tenggorokanController.dispose();
    _leherController.dispose();
    _dadaController.dispose();
    _respirasiController.dispose();
    _jantungController.dispose();
    _integumenController.dispose();
    _ekstremitasController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<PemeriksaanFisikIcuBloc, PemeriksaanFisikIcuState>(
      listener: (context, state) {
        if (state.status == PemeriksaanFisikIcuStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != PemeriksaanFisikIcuStatus.isLoadingSave) {
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
                      if (e.meta.code == 202) {
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
        if (state.status == PemeriksaanFisikIcuStatus.isLoadingGet) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Loading.expandedLoading(),
            ),
          );
        }

        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              // SIMPAN DATA
              if (authState is Authenticated) {
                dynamic data = await deviceInfo.initPlatformState();

                // ignore: use_build_context_synchronously
                context.read<PemeriksaanFisikIcuBloc>().add(
                    OnSavePemeriksaanFisikICU(
                        devicesID: "ID:${data['id']}-${data['device']}",
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person),
                        pemeriksaanFisikModel: state.fisikModel.copyWith(
                            dada: _dadaController.text,
                            ekstremitas: _ekstremitasController.text,
                            gcsE: _gcsEController.text,
                            gcsM: _gcsMController.text,
                            gcsV: _gcsVController.text,
                            gigi: _gigiController.text,
                            hidung: _hidungController.text,
                            integumen: _integumenController.text,
                            jantung: _jantungController.text,
                            kepala: _kepalaController.text,
                            kesadaran: _kesadaranController.text,
                            leher: _leherController.text,
                            lidah: _lidahController.text,
                            mata: _mataController.text,
                            mulut: _mulutController.text,
                            rambut: _rambutController.text,
                            respirasi: _respirasiController.text,
                            telinga: _telingaController.text,
                            tenggorokan: _tenggorokanController.text,
                            wajah: _wajahController.text)));
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
                child: Container(
                  margin: EdgeInsets.only(right: 10.sp),
                  child: Column(
                    children: [
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: gcs
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
                          controller: _gcsEController
                            ..text = state.fisikModel.gcsE,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "GCS E",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: gcs
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
                          controller: _gcsMController
                            ..text = state.fisikModel.gcsM,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "GCS M",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: gcs
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
                          controller: _gcsVController
                            ..text = state.fisikModel.gcsV,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "GCS V",
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
                          // CONTROLLER
                          controller: _kesadaranController
                            ..text = state.fisikModel.kesadaran,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
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
                          // CONTROLLER
                          controller: _kepalaController
                            ..text = state.fisikModel.kepala,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Kepala",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: rambut
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
                          controller: _rambutController
                            ..text = state.fisikModel.rambut,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Rambut",
                      ),
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
                            ..text = state.fisikModel.wajah,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Wajah",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: mata
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
                          controller: _mataController
                            ..text = state.fisikModel.mata,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Mata",
                      ),
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
                            ..text = state.fisikModel.telinga,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Telinga",
                      ),
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
                            ..text = state.fisikModel.hidung,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Hidung",
                      ),
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
                            ..text = state.fisikModel.mulut,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Mulut",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: gigi
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
                          controller: _gigiController
                            ..text = state.fisikModel.gigi,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Gigi",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: lidah
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
                          controller: _lidahController
                            ..text = state.fisikModel.lidah,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Lidah",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: tenggorokan
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
                          controller: _tenggorokanController
                            ..text = state.fisikModel.tenggorokan,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Tenggorokan",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: leher
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
                          controller: _leherController
                            ..text = state.fisikModel.leher,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Leher",
                      ),
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
                            ..text = state.fisikModel.dada,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Dada",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: respirasi
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
                          controller: _respirasiController
                            ..text = state.fisikModel.respirasi,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Respirasi",
                      ),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: jantung
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
                          controller: _jantungController
                            ..text = state.fisikModel.jantung,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Jantung",
                      ),
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
                            ..text = state.fisikModel.integumen,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Integumen",
                      ),
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
                          controller: _ekstremitasController
                            ..text = state.fisikModel.ekstremitas,
                          onSubmit: (value) {},
                          onSaved: (a) {},
                          searchInputDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        title: "Ekstremitas",
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}

List<String> kesadaran = [
  "Komposmentis",
  "Apatis",
  "Somnolent",
  "Sopor",
  "Soporocoma",
  "Koma"
];

List<String> kepala = ["Tak Ada Masalah", "Mesosefal", "Asimetris", "Hematom"];

List<String> rambut = [
  "Tak Ada Masalah",
  "Kotor",
  "Berminyak",
  "Kering",
  "Rontok",
];

List<String> wajah = [
  "Tak Ada Masalah",
  "Sklera Anemis",
  "Konjugtivitis",
  "Anisokor",
  "Tidak Ada Reaksi Cahaya",
  "Midriasis",
  "Miosis"
];

List<String> telinga = [
  "Tak Ada Masalah",
  "Berdengung",
  "Nyeri",
  "Tuli",
  "Keluar Cairan"
];

List<String> hidung = ["Tak Ada Masalah", "Asimetris", "Epistaksis"];

List<String> mulut = [
  "Tak Ada Masalah",
  "Simetris",
  "Asimetris",
  "Bibir Pucat",
  "Kelainan Kongenital"
];

List<String> gigi = ["Tak Ada Masalah", "Karies", "Goyang", "Gigi Palsu"];

List<String> lidah = ["Tak Ada Masalah", "Kotor", "Gerakan Asimetris"];

List<String> tenggorokan = [
  "Tak Ada Masalah",
  "Tosil Membesar",
  "Faring Membesar",
  "Nyeri Telan"
];

List<String> leher = [
  "Tak Ada Masalah",
  "Pembesaran Tiroid",
  "Pembesaran Vena Jugularis",
  "Kaku Kuduk",
  "Keterbatasan Gerak",
];

List<String> dada = [
  "Tak Ada Masalah",
  "Retraksi",
  "Asimetris",
];

List<String> respirasi = [
  "Tak Ada Masalah",
  "Nyeri",
  "Batuk",
  "Napas Pendek",
  "Hemaoptoe",
  "Bradipnea",
  "Takipnea",
  "Sleep Apnea"
];

List<String> jantung = [
  "Tak Ada Masalah",
  "Murmur",
  "Gallop",
  "Aritmia",
  "Takikardia",
  "Bradikardi",
  "Palpitasi",
  "Pacemaker",
];

List<String> integumen = [
  "Tak Ada Masalah",
  "Bula, di ",
  "Fistula, di ",
  "Luka di",
  "Memmar, di",
  "Indikasi Kekerasan Fisik",
  "Pucat",
  "Dingin",
  "Baal",
  "RL Positif",
  "Dekubitus, Lokasi ...."
];

List<String> mata = [
  "Tak Ada Masalah",
  "Sklera Anemis",
  "Kongjugtivitas",
  "Anisokor",
  "Tidak Ada Reaksi Cahaya",
  "Midirasis",
  "Miosis",
  "Reaksi Cahaya: kanan...../kiri.....",
  "Gangguan Penglihatan"
];

List<String> gcs = ["1", "2", "3", "4", "5"];
