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
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_fisik_anak/pengkajian_fisik_anak_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PengkajianKeperawatanAnakWidgetPage extends StatefulWidget {
  const PengkajianKeperawatanAnakWidgetPage({super.key});

  @override
  State<PengkajianKeperawatanAnakWidgetPage> createState() =>
      _PengkajianKeperawatanAnakWidgetPageState();
}

class _PengkajianKeperawatanAnakWidgetPageState
    extends State<PengkajianKeperawatanAnakWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _mataController;
  late TextEditingController _telingaController;
  late TextEditingController _hidungController;
  late TextEditingController _mulutController;
  late TextEditingController _leherDanBahuController;
  late TextEditingController _dadaController;
  late TextEditingController _abdomenController;
  late TextEditingController _persitaltikController;
  late TextEditingController _punggungController;
  late TextEditingController _nutrisiDanHidrasiController;

  @override
  void initState() {
    _mataController = TextEditingController();
    _telingaController = TextEditingController();
    _hidungController = TextEditingController();
    _mulutController = TextEditingController();
    _leherDanBahuController = TextEditingController();
    _dadaController = TextEditingController();
    _abdomenController = TextEditingController();
    _persitaltikController = TextEditingController();
    _punggungController = TextEditingController();
    _nutrisiDanHidrasiController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _mataController.clear();
    _telingaController.clear();
    _hidungController.clear();
    _mulutController.clear();
    _leherDanBahuController.clear();
    _dadaController.clear();
    _abdomenController.clear();
    _persitaltikController.clear();
    _punggungController.clear();
    _nutrisiDanHidrasiController.clear();

    _mataController.dispose();
    _telingaController.dispose();
    _hidungController.dispose();
    _mulutController.dispose();
    _leherDanBahuController.dispose();
    _dadaController.dispose();
    _abdomenController.dispose();
    _persitaltikController.dispose();
    _punggungController.dispose();
    _nutrisiDanHidrasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PengkajianFisikAnakBloc, PengkajianFisikAnakState>(
      listener: (context, state) {
        // NOTE
        if (state.status == PengkajianFisikAnakStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }
        if (state.status != PengkajianFisikAnakStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        //===//
        state.saveResultFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // TAMPILKAN PESAN KESALAHAN
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString());
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      final meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == PengkajianFisikAnakStatus.isLoadingGet) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              // SIMPAN DATA
              dynamic data = await deviceInfo.initPlatformState();
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<PengkajianFisikAnakBloc>().add(
                    OnSavePengkajianFisikAnakEvent(
                        devicesID: "ID-${data['id']}-${data['device']}",
                        pelayanan: toPerson(person: authState.user.person),
                        person: toPerson(person: authState.user.person),
                        noReg: singlePasien.first.noreg,
                        pemeriksaanFisik: state.pemeriksaanFisikAnakModel
                            .copyWith(
                                abdomen: _abdomenController.text,
                                dada: _dadaController.text,
                                hidung: _hidungController.text,
                                leherDanBahu: _leherDanBahuController.text,
                                mulut: _mulutController.text,
                                nutrisiDanHidrasi:
                                    _nutrisiDanHidrasiController.text,
                                mata: _mataController.text,
                                peristaltik: _persitaltikController.text,
                                punggung: _punggungController.text,
                                telinga: _telingaController.text)));
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
                        // PENGKAJIAN PERSISTEM ANAK
                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "MATA",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.pemeriksaanFisikMata
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
                                controller: _mataController
                                  ..text = state.pemeriksaanFisikAnakModel.mata,
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
                                ))),

                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "TELINGA",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.telinga
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
                                controller: _telingaController
                                  ..text =
                                      state.pemeriksaanFisikAnakModel.telinga,
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
                                ))),

                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "HIDUNG",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.hidung
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
                                controller: _hidungController
                                  ..text =
                                      state.pemeriksaanFisikAnakModel.hidung,
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
                                ))),

                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "MULUT",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.mulut
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
                                controller: _mulutController
                                  ..text =
                                      state.pemeriksaanFisikAnakModel.mulut,
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
                                ))),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "LEHER DAN BAHU",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.leher
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
                                controller: _leherDanBahuController
                                  ..text = state
                                      .pemeriksaanFisikAnakModel.leherDanBahu,
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
                                ))),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "DADA",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.dada
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
                                controller: _dadaController
                                  ..text = state.pemeriksaanFisikAnakModel.dada,
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
                                ))),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "ABDOMEN",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.abdomen
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
                                controller: _abdomenController
                                  ..text =
                                      state.pemeriksaanFisikAnakModel.abdomen,
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
                                ))),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "PERISTALTIK",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.pemeriksaanFisik
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
                                controller: _persitaltikController
                                  ..text = state
                                      .pemeriksaanFisikAnakModel.peristaltik,
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
                                ))),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "PUNGGUNG",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.punggung
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
                                controller: _punggungController
                                  ..text =
                                      state.pemeriksaanFisikAnakModel.punggung,
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
                                ))),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                            title: "NUTRISI DAN HIDRASI",
                            padding: 5.sp,
                            widget: SearchField(
                                searchStyle: blackTextStyle,
                                enabled: true,
                                marginColor: ThemeColor.whiteColor,
                                itemHeight: 15.sp,
                                suggestionStyle: blackTextStyle,
                                suggestions: ListConstants.nutrisiHidrasi
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
                                controller: _nutrisiDanHidrasiController
                                  ..text = state.pemeriksaanFisikAnakModel
                                      .nutrisiDanHidrasi,
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
                                ))),

                        SizedBox(
                          height: 15.sp,
                        )
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
