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
import 'package:hms_app/presentation/pages/igd/bloc/pemeriksaan_fisik_igd/pemeriksaan_fisik_igd_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PemeriksaanFisikIGDDokterMethodistWidgetPage extends StatefulWidget {
  const PemeriksaanFisikIGDDokterMethodistWidgetPage({super.key});

  @override
  State<PemeriksaanFisikIGDDokterMethodistWidgetPage> createState() =>
      _PemeriksaanFisikIGDDokterMethodistWidgetPageState();
}

class _PemeriksaanFisikIGDDokterMethodistWidgetPageState
    extends State<PemeriksaanFisikIGDDokterMethodistWidgetPage> {
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
  final TextEditingController _getahBeningController = TextEditingController();
  final TextEditingController _gigiController = TextEditingController();
  final TextEditingController _anusController = TextEditingController();
  final TextEditingController _ususController = TextEditingController();
  final TextEditingController _superiorController = TextEditingController();
  final TextEditingController _inferiorController = TextEditingController();
  final TextEditingController _abdomenLiannyaController =
      TextEditingController();
  String isActive = fisik.first;

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<PemeriksaanFisikIgdBloc, PemeriksaanFisikIgdState>(
      listener: (context, state) {
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
              isENableAdd: true,
              title: "Simpan",
              widget: Loading.expandedLoading());
        }
        return Scaffold(
          backgroundColor: ThemeColor.bgColor,
          body: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 20.sp,
                  padding: EdgeInsets.all(2.sp),
                  decoration: BoxDecoration(
                    color: ThemeColor.darkColor.withOpacity(0.9),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 5.sp),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: fisik.map((e) {
                        return Container(
                          margin: EdgeInsets.only(right: 5.sp, left: 5.sp),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(3.sp)),
                                  backgroundColor: (isActive == e)
                                      ? ThemeColor.greenColor
                                      : ThemeColor.primaryColor),
                              onPressed: () {
                                setState(() {
                                  isActive = e;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        );
                      }).toList())),
              Container(
                color: ThemeColor.bgColor,
                height: Get.height / 1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // PEMERIKSAAN FISIK
                    if (isActive == fisik.first) ...[
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _kepalaController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.kepala,
                        ),
                        title: "Kepala",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _mataController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.mata,
                        ),
                        title: "Mata",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _thtController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.tht,
                        ),
                        title: "THT",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _mulutController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.mulut,
                        ),
                        title: "Mulut",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _gigiController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.gigi,
                        ),
                        title: "Gigi",
                      ),
                    ],

                    if (isActive == "LEHER") ...[
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _leherController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.leher,
                        ),
                        title: "Leher",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _getahBeningController
                            ..text = state
                                .pemeriksaanFisikIgdDokterMethodist.getahBening,
                        ),
                        title: "Kelenjar Getah Bening",
                      ),
                    ],
                    if (isActive == "DADA") ...[
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _dadaController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.dada,
                        ),
                        title: "Dada",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _jantungController
                            ..text = state
                                .pemeriksaanFisikIgdDokterMethodist.jantung,
                        ),
                        title: "Jantung",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _paruController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.paru,
                        ),
                        title: "PARU",
                      ),
                    ],
                    if (isActive == "ABDOMEN") ...[
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _perutController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.perut,
                        ),
                        title: "Perut",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _hatiController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.hati,
                        ),
                        title: "Hati",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _limpaController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.limpa,
                        ),
                        title: "Limpa",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _ususController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.usus,
                        ),
                        title: "Usus",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _abdomenLiannyaController
                            ..text = state.pemeriksaanFisikIgdDokterMethodist
                                .abdomenLainnya,
                        ),
                        title: "Lain-lain",
                      ),
                    ],
                    if (isActive == "PINGGANG") ...[
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _ginjalController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.ginjal,
                        ),
                        title: "Ginjal",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _alatKelaminController
                            ..text = state
                                .pemeriksaanFisikIgdDokterMethodist.alatKelamin,
                        ),
                        title: "Alat Kelamin",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _anusController
                            ..text =
                                state.pemeriksaanFisikIgdDokterMethodist.anus,
                        ),
                        title: "Anus",
                      ),
                    ],
                    if (isActive == "EXTREMITAS") ...[
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _superiorController
                            ..text = state
                                .pemeriksaanFisikIgdDokterMethodist.superior,
                        ),
                        title: "Superior",
                      ),
                      const Divider(),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          suggestionStyle: blackTextStyle,
                          suggestionsDecoration: SuggestionDecoration(
                              selectionColor: ThemeColor.bgColor,
                              hoverColor: ThemeColor.darkColor.withOpacity(0.2),
                              color: ThemeColor.bgColor),
                          suggestions: pemeriksaanFisik
                              .map(
                                (e) => SearchFieldListItem(
                                  e,
                                  item: e.toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.bgColor,
                                    child: Text(
                                      e,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 6.sp),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          controller: _inferiorController
                            ..text = state
                                .pemeriksaanFisikIgdDokterMethodist.inferior,
                        ),
                        title: "Inferior",
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 5.sp),
                width: Get.width,
                color: ThemeColor.bgColor,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 1.sp, color: ThemeColor.bgColor),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      backgroundColor: ThemeColor.primaryColor),
                  onPressed: () async {
                    dynamic data = await deviceInfo.initPlatformState();
                    if (authState is Authenticated) {
                      // ignore: use_build_context_synchronously
                      context.read<PemeriksaanFisikIgdBloc>().add(
                          OnSavePemeriksaanFisikIGDDokterMethodist(
                              pemeriksaanFisik: state
                                  .pemeriksaanFisikIgdDokterMethodist
                                  .copyWith(
                                gigi: _gigiController.text,
                                kepala: _kepalaController.text,
                                alatKelamin: _alatKelaminController.text,
                                dada: _dadaController.text,
                                getahBening: _getahBeningController.text,
                                ginjal: _ginjalController.text,
                                hati: _hatiController.text,
                                jantung: _jantungController.text,
                                leher: _leherController.text,
                                limpa: _limpaController.text,
                                mata: _mataController.text,
                                mulut: _mulutController.text,
                                paru: _paruController.text,
                                perut: _perutController.text,
                                tht: _thtController.text,
                                abdomenLainnya: _abdomenLiannyaController.text,
                                anus: _anusController.text,
                                inferior: _inferiorController.text,
                                superior: _superiorController.text,
                                usus: _ususController.text,
                              ),
                              deviceID: "ID-${data['id']} - ${data['device']}",
                              pelayanan: toPelayanan(
                                  poliklinik: authState.user.poliklinik),
                              noReg: singlePasien.first.noreg,
                              person: toPerson(person: authState.user.person)));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SIMPAN",
                      style: whiteTextStyle,
                    ),
                  ),
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}

List<String> fisik = [
  "KEPALA",
  "LEHER",
  "DADA",
  "ABDOMEN",
  "PINGGANG",
  "EXTREMITAS"
];

List<String> pemeriksaanFisik = ["TAK", "NORMAL", "UPNORMAL"];
