// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/igd/bloc/pemeriksaan_fisik_igd/pemeriksaan_fisik_igd_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class PemeriksaanFisikIGDDokterWidget extends StatefulWidget {
  final bool isENableAdd;
  const PemeriksaanFisikIGDDokterWidget({
    super.key,
    required this.isENableAdd,
  });

  @override
  State<PemeriksaanFisikIGDDokterWidget> createState() =>
      _PemeriksaanFisikIGDDokterWidgetState();
}

class _PemeriksaanFisikIGDDokterWidgetState
    extends State<PemeriksaanFisikIGDDokterWidget> {
  final TextEditingController _kepalaController = TextEditingController();
  final TextEditingController _mataController = TextEditingController();
  final TextEditingController _thtController = TextEditingController();
  final TextEditingController _mulutController = TextEditingController();
  final TextEditingController _leherController = TextEditingController();
  final TextEditingController _dadaController = TextEditingController();
  final TextEditingController _jantungController = TextEditingController();
  final TextEditingController _paruController = TextEditingController();
  final TextEditingController _perutController = TextEditingController();
  final TextEditingController _hatiController = TextEditingController();
  final TextEditingController _limpaController = TextEditingController();
  final TextEditingController _ginjalController = TextEditingController();
  final TextEditingController _alatKelaminController = TextEditingController();
  final TextEditingController _anggotaGerakController = TextEditingController();
  final TextEditingController _reflekController = TextEditingController();
  final TextEditingController _kekuatanOtotController = TextEditingController();
  final TextEditingController _kulitController = TextEditingController();
  final TextEditingController _getahBeningController = TextEditingController();
  final TextEditingController _rtRVController = TextEditingController();
  final TextEditingController _jalanNafasController = TextEditingController();
  final TextEditingController _gigiController = TextEditingController();
  final TextEditingController _abdomenController = TextEditingController();
  final TextEditingController _sirkulasiController = TextEditingController();
  final TextEditingController _hidungController = TextEditingController();
  final TextEditingController _telingaController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<PemeriksaanFisikIgdBloc, PemeriksaanFisikIgdState>(
      listener: (context, state) {
        // SIMPAN PEMERIKSAAN FISIK IGD
        if (state.status == PemeriksaanFisikIgdStatus.loading) {
          EasyLoading.show();
        }

        if (state.status != PemeriksaanFisikIgdStatus.loading) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      log(e.toString());
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
        if (state.status == PemeriksaanFisikIgdStatus.isLoadingGet) {
          return HeaderContentWidget(
              isENableAdd: widget.isENableAdd,
              title: "Simpan",
              widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
          backgroundColor: ThemeColor.whiteColor,
          onPressed: widget.isENableAdd
              ? () async {
                  dynamic data = await deviceInfo.initPlatformState();
                  if (authState is Authenticated) {
                    // ignore: use_build_context_synchronously
                    context.read<PemeriksaanFisikIgdBloc>().add(
                        OnSavePemeriksaanFisikIGDDokter(
                            pemeriksaanFisik: state.pemeriksaanFisikIgdDokter
                                .copyWith(
                                    abdomen: _abdomenController.text,
                                    gigi: _gigiController.text,
                                    kepala: _kepalaController.text,
                                    alatKelamin: _alatKelaminController.text,
                                    anggotaGerak: _anggotaGerakController.text,
                                    dada: _dadaController.text,
                                    getahBening: _getahBeningController.text,
                                    ginjal: _ginjalController.text,
                                    hati: _hatiController.text,
                                    jantung: _jantungController.text,
                                    kekuatanOtot: _kekuatanOtotController.text,
                                    kulit: _kulitController.text,
                                    leher: _leherController.text,
                                    limpa: _limpaController.text,
                                    mata: _mataController.text,
                                    mulut: _mulutController.text,
                                    paru: _paruController.text,
                                    perut: _perutController.text,
                                    refleks: _reflekController.text,
                                    rtvt: _rtRVController.text,
                                    hidung: _hidungController.text,
                                    telinga: _telingaController.text,
                                    tht: _thtController.text,
                                    jalanNafas: _jalanNafasController.text,
                                    sirkulasi: _sirkulasiController.text),
                            deviceID: "ID-${data['id']}-${data['device']}",
                            pelayanan: toPelayanan(
                                poliklinik: authState.user.poliklinik),
                            noReg: singlePasien.first.noreg,
                            person: toPerson(person: authState.user.person)));
                  }
                }
              : null,
          isENableAdd: widget.isENableAdd,
          title: "Simpan",
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
                  width: Get.width,
                  child: Card(
                    color: ThemeColor.bgColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.sp,
                          color: ThemeColor.blackColor,
                        ),
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              // CONTROLLER
                              controller: _kepalaController
                                ..text = state.pemeriksaanFisikIgdDokter.kepala,
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
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              suggestions: pemeriksaanFisik
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
                                ..text = state.pemeriksaanFisikIgdDokter.mata,
                              onSubmit: (value) {},
                              suggestionState: Suggestion.expand,
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
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              controller: _thtController
                                ..text = state.pemeriksaanFisikIgdDokter.tht,
                              onSubmit: (value) {},
                              onSaved: (a) {},
                              searchInputDecoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.8),
                                )),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            title: "THT",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                                ..text = state.pemeriksaanFisikIgdDokter.mulut,
                              onSubmit: (value) {},
                              onSaved: (a) {},
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
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
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              suggestions: pemeriksaanFisik
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
                                ..text = state.pemeriksaanFisikIgdDokter.leher,
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
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              suggestions: pemeriksaanFisik
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
                                ..text = state.pemeriksaanFisikIgdDokter.dada,
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
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              suggestions: pemeriksaanFisik
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
                                ..text =
                                    state.pemeriksaanFisikIgdDokter.jantung,
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
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              suggestions: pemeriksaanFisik
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
                              controller: _paruController
                                ..text = state.pemeriksaanFisikIgdDokter.paru,

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
                            title: "Paru",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _perutController
                                ..text = state.pemeriksaanFisikIgdDokter.perut,
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
                            title: "Perut",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              suggestions: pemeriksaanFisik
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
                              controller: _hatiController
                                ..text = state.pemeriksaanFisikIgdDokter.hati,
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
                            title: "Hati",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _limpaController
                                ..text = state.pemeriksaanFisikIgdDokter.limpa,
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
                            title: "Limpa",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _ginjalController
                                ..text = state.pemeriksaanFisikIgdDokter.ginjal,
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
                            title: "Ginjal",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _alatKelaminController
                                ..text =
                                    state.pemeriksaanFisikIgdDokter.alatKelamin,
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
                            title: "Alat Kelamin",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _anggotaGerakController
                                ..text = state
                                    .pemeriksaanFisikIgdDokter.anggotaGerak,
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
                            title: "Anggota Gerak",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _reflekController
                                ..text =
                                    state.pemeriksaanFisikIgdDokter.refleks,
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
                            title: "Paru",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _kekuatanOtotController
                                ..text = state
                                    .pemeriksaanFisikIgdDokter.kekuatanOtot,
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
                            title: "Kekuatan Otot",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _kulitController
                                ..text = state.pemeriksaanFisikIgdDokter.kulit,
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
                            title: "Kulit",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _getahBeningController
                                ..text =
                                    state.pemeriksaanFisikIgdDokter.getahBening,
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
                            title: "Kelenjar Getah Bening",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _rtRVController
                                ..text = state.pemeriksaanFisikIgdDokter.rtvt,
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
                            title: "RT/RV",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _jalanNafasController
                                ..text =
                                    state.pemeriksaanFisikIgdDokter.jalanNafas,
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
                            title: "Jalan Nafas",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                              controller: _sirkulasiController
                                ..text =
                                    state.pemeriksaanFisikIgdDokter.sirkulasi,
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
                            title: "Sirkulasi",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                                ..text = state.pemeriksaanFisikIgdDokter.gigi,
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
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                                ..text =
                                    state.pemeriksaanFisikIgdDokter.abdomen,
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
                            title: "Abdomen",
                          ),
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                                ..text = state.pemeriksaanFisikIgdDokter.hidung,
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
                          const Divider(),
                          TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                selectionColor: Colors.grey.shade100,
                                hoverColor: Colors.black,
                              ),
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: pemeriksaanFisik
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
                                ..text =
                                    state.pemeriksaanFisikIgdDokter.telinga,
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
                          SizedBox(
                            height: 15.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}

List<String> pemeriksaanFisik = ["TAK", "DBN", "UPNORMAL"];
