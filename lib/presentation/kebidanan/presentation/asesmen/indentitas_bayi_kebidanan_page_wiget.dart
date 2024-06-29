import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/kebidanan/bloc/identitas_bayi/indentias_bayi_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:signature/signature.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class IdentitasBayiKebidananWidgetPage extends StatefulWidget {
  const IdentitasBayiKebidananWidgetPage({super.key});

  @override
  State<IdentitasBayiKebidananWidgetPage> createState() =>
      _IdentitasBayiKebidananWidgetPageState();
}

class _IdentitasBayiKebidananWidgetPageState
    extends State<IdentitasBayiKebidananWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  ScreenshotController screenshotController1 = ScreenshotController();
  ScreenshotController screenshotController2 = ScreenshotController();
  late TextEditingController _pemberiGelangBayi;
  late TextEditingController _jamKelahiranBayi;
  late TextEditingController _penentuJK;
  late TextEditingController _namaWali;

  final SignatureController _signatureController1 = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.blue,
  );
  final SignatureController _signatureController2 = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.blue,
  );

  @override
  void initState() {
    _pemberiGelangBayi = TextEditingController();
    _jamKelahiranBayi = TextEditingController();
    _penentuJK = TextEditingController();
    _namaWali = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pemberiGelangBayi.clear();
    _jamKelahiranBayi.clear();
    _penentuJK.clear();
    _namaWali.clear();

    _pemberiGelangBayi.dispose();
    _jamKelahiranBayi.dispose();
    _penentuJK.dispose();
    _namaWali.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<IndentiasBayiBloc, IndentiasBayiState>(
      listener: (context, state) {
        // === === //
        if (state.status == IndentiasBayiStatus.isLoadingSaveIdentitas) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != IndentiasBayiStatus.isLoadingSaveIdentitas) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
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
                    loaded: (value) async {
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));

        state.saveResultIdentitas.fold(
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
                    loaded: (value) async {
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == IndentiasBayiStatus.loading) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            onPressed: () async {
              // SIMPAN DATA
              final directory = (await getApplicationDocumentsDirectory()).path;
              final images1 = await screenshotController1.captureAndSave(
                  directory,
                  fileName:
                      "${singlePasien.first.mrn}-${singlePasien.first.noreg}.png");

              final images2 = await screenshotController2.captureAndSave(
                  directory,
                  fileName:
                      "${singlePasien.first.mrn}-${singlePasien.first.noreg}.png");

              dynamic data = await deviceInfo.initPlatformState();

              if (images2 != null && images1 != null) {
                if (authState is Authenticated) {
                  // ignore: use_build_context_synchronously
                  context.read<IndentiasBayiBloc>().add(OnSaveIdentitasBayi(
                      jamKelahiranBayi: _jamKelahiranBayi.text,
                      noReg: singlePasien.first.noreg,
                      noRM: singlePasien.first.mrn,
                      ttd1: images1,
                      ttd2: images2,
                      pemberiGelang: _pemberiGelangBayi.text,
                      penentuJK: _penentuJK.text,
                      namaWali: _namaWali.text,
                      person: toPerson(person: authState.user.person),
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      deviceID: "ID - ${data['id']} - ${data['device']}",
                      kategori: toKategoriString(
                          spesiliasasi: authState.user.spesialisasi),
                      dpjp: singlePasien.first.kdDokter,
                      namaPenentuJK: _penentuJK.text));
                }
              }
            },
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
                      // TAMPILKAN TABEL
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.sp),
                        color: Colors.white,
                        child: TableDesk(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          child: TableDeskRow(
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.weight(),
                              TableGap.weight(),
                            ],
                            children: [
                              Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  padding:
                                      EdgeInsets.only(right: 5.sp, left: 5.sp),
                                  child: FB5Row(
                                    classNames: 'px-xs-0 px-lg-0 gx-0',
                                    children: [
                                      FB5Col(
                                          classNames: 'col-12',
                                          child: Column(
                                            children: [
                                              TitleWidget
                                                  .boxPemeriksaanFisikSugestion(
                                                padding: 0.0,
                                                width: 55.sp,
                                                widget: Text(
                                                  ": ${state.identitasBayi.identitasBayi.namaIbu}",
                                                  style: blackTextStyle,
                                                ),
                                                title: "Nama Ibu",
                                              ),
                                              TitleWidget
                                                  .boxPemeriksaanFisikSugestion(
                                                padding: 0.0,
                                                width: 55.sp,
                                                widget: Text(
                                                  ": ${state.identitasBayi.identitasBayi.id}",
                                                  style: blackTextStyle,
                                                ),
                                                title: "No. Rekam Medis",
                                              ),
                                              TitleWidget
                                                  .boxPemeriksaanFisikSugestion(
                                                padding: 0.0,
                                                width: 55.sp,
                                                widget: Text(
                                                  ": ${state.identitasBayi.identitasBayi.namaAyah}",
                                                  style: blackTextStyle,
                                                ),
                                                title: "Nama Ayah",
                                              ),
                                              TitleWidget
                                                  .boxPemeriksaanFisikSugestion(
                                                padding: 0.0,
                                                width: 55.sp,
                                                widget: Text(
                                                  ": ${state.identitasBayi.identitasBayi.alamat}",
                                                  style: blackTextStyle,
                                                ),
                                                title: "Alamat",
                                              ),
                                              TitleWidget
                                                  .boxPemeriksaanFisikSugestion(
                                                padding: 0.0,
                                                width: 55.sp,
                                                widget: Text(
                                                  ": ${state.identitasBayi.identitasBayi.telp}",
                                                  style: blackTextStyle,
                                                ),
                                                title: "Telp.",
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(8),
                                child: FB5Row(
                                  classNames: 'px-xs-0 px-lg-0 gx-0',
                                  children: [
                                    FB5Col(
                                        classNames: 'col-12',
                                        child: Column(
                                          children: [
                                            TitleWidget
                                                .boxPemeriksaanFisikSugestion(
                                              padding: 0.0,
                                              width: 55.sp,
                                              widget: Text(
                                                ": ${state.identitasBayi.identitasBayi.firstname}",
                                                style: blackTextStyle,
                                              ),
                                              title: "Nama Bayi",
                                            ),
                                            TitleWidget
                                                .boxPemeriksaanFisikSugestion(
                                              padding: 0.0,
                                              width: 55.sp,
                                              widget: Text(
                                                ": ${tglIndo(state.identitasBayi.identitasBayi.tglLahir.substring(0, 10))}",
                                                style: blackTextStyle,
                                              ),
                                              title: "Tanggal Lahir",
                                            ),
                                            TitleWidget
                                                .boxPemeriksaanFisikSugestion(
                                              padding: 0.0,
                                              width: 55.sp,
                                              widget: Text(
                                                ": ${state.identitasBayi.identitasBayi.id}",
                                                style: blackTextStyle,
                                              ),
                                              title: "No. Rekam Medis",
                                            ),
                                            TitleWidget
                                                .boxPemeriksaanFisikSugestion(
                                              padding: 0.0,
                                              width: 55.sp,
                                              widget: Text(
                                                ": ",
                                                style: blackTextStyle,
                                              ),
                                              title: "Ruangan/Kelas",
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              SizedBox(
                                height: 150.sp,
                                child: Scaffold(
                                  backgroundColor: ThemeColor.bgColor,
                                  appBar: AppBar(
                                    automaticallyImplyLeading: false,
                                    title: Text(
                                      "Cap Ibu Jari Tangan Kanan Ibu :",
                                      style: whiteTextStyle,
                                    ),
                                  ),
                                  body: (state.identitasBayi.imageFiles
                                              .tanganKiriIbu ==
                                          "")
                                      ? Container(
                                          height: Get.height,
                                          width: Get.width,
                                          margin: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              color: ThemeColor.darkColor),
                                          child: Icon(
                                            FontAwesomeIcons.solidImage,
                                            size: 55.sp,
                                          ),
                                        )
                                      : Container(
                                          height: Get.height,
                                          width: Get.width,
                                          margin: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              color: ThemeColor.darkColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(AppConstant
                                                          .identitasBayiImage +
                                                      state
                                                          .identitasBayi
                                                          .imageFiles
                                                          .tanganKiriIbu),
                                                  fit: BoxFit.cover)),
                                        ),
                                  floatingActionButton: FloatingActionButton(
                                    backgroundColor: (state.isActive3)
                                        ? ThemeColor.primaryColor
                                        : ThemeColor.darkColor,
                                    heroTag: "btn-kaki",
                                    onPressed: (state.isActive3)
                                        ? () async {
                                            dynamic data = await deviceInfo
                                                .initPlatformState();
                                            // ignore: use_build_context_synchronously
                                            context
                                                .read<IndentiasBayiBloc>()
                                                .add(OnDisableButton3(
                                                    isActive: false));
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();

                                            if (result != null) {
                                              File file = File(
                                                  result.files.single.path!);
                                              // UPLOAD FILE
                                              // ignore: use_build_context_synchronously
                                              context.read<IndentiasBayiBloc>().add(
                                                  OnUploadCapSidikKakikananBayi(
                                                      noRM: singlePasien
                                                          .first.mrn,
                                                      deviceID:
                                                          "ID - ${data['id']} - ${data['device']}",
                                                      dpjp: singlePasien
                                                          .first.kdDokter,
                                                      file: file,
                                                      kategori:
                                                          "TANGAN-KIRI-IBU",
                                                      noReg: singlePasien
                                                          .first.noreg));
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              context
                                                  .read<IndentiasBayiBloc>()
                                                  .add(OnDisableButton3(
                                                      isActive: true));
                                            }
                                          }
                                        : null,
                                    child: const Icon(
                                      FontAwesomeIcons.image,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150.sp,
                                child: Scaffold(
                                  backgroundColor: ThemeColor.bgColor,
                                  appBar: AppBar(
                                    automaticallyImplyLeading: false,
                                    title: Text(
                                      "Cap Sidik Kaki Kiri Bayi :",
                                      style: whiteTextStyle,
                                    ),
                                  ),
                                  body: (state.identitasBayi.imageFiles
                                              .kakiKiriBayi ==
                                          "")
                                      ? Container(
                                          height: Get.height,
                                          width: Get.width,
                                          margin: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              color: ThemeColor.darkColor),
                                          child: Icon(
                                            FontAwesomeIcons.solidImage,
                                            size: 55.sp,
                                          ),
                                        )
                                      : Container(
                                          height: Get.height,
                                          width: Get.width,
                                          margin: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              color: ThemeColor.darkColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(AppConstant
                                                          .identitasBayiImage +
                                                      state
                                                          .identitasBayi
                                                          .imageFiles
                                                          .kakiKiriBayi),
                                                  fit: BoxFit.cover)),
                                        ),
                                  floatingActionButton: FloatingActionButton(
                                    backgroundColor: (state.isActive2)
                                        ? ThemeColor.primaryColor
                                        : ThemeColor.darkColor,
                                    heroTag: "btn-kaki",
                                    onPressed: (state.isActive2)
                                        ? () async {
                                            dynamic data = await deviceInfo
                                                .initPlatformState();
                                            // ignore: use_build_context_synchronously
                                            context
                                                .read<IndentiasBayiBloc>()
                                                .add(OnDisableButton2(
                                                    isActive: false));
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();

                                            if (result != null) {
                                              File file = File(
                                                  result.files.single.path!);
                                              // UPLOAD FILE
                                              // ignore: use_build_context_synchronously
                                              context.read<IndentiasBayiBloc>().add(
                                                  OnUploadCapSidikKakikananBayi(
                                                      noRM: singlePasien
                                                          .first.mrn,
                                                      deviceID:
                                                          "ID-${data['id']}-${data['device']}",
                                                      dpjp: singlePasien
                                                          .first.kdDokter,
                                                      file: file,
                                                      kategori:
                                                          "KAKI-KIRI-BAYI",
                                                      noReg: singlePasien
                                                          .first.noreg));
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              context
                                                  .read<IndentiasBayiBloc>()
                                                  .add(OnDisableButton2(
                                                      isActive: true));
                                            }
                                          }
                                        : null,
                                    child: const Icon(
                                      FontAwesomeIcons.image,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150.sp,
                                child: Scaffold(
                                  backgroundColor: ThemeColor.bgColor,
                                  appBar: AppBar(
                                    automaticallyImplyLeading: false,
                                    title: Text(
                                      "Cap Sidik Kaki Kanan Bayi :",
                                      style: whiteTextStyle,
                                    ),
                                  ),
                                  body: (state.identitasBayi.imageFiles
                                              .kakiKananBayi ==
                                          "")
                                      ? Container(
                                          height: Get.height,
                                          width: Get.width,
                                          margin: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              color: ThemeColor.darkColor),
                                          child: Icon(
                                            FontAwesomeIcons.solidImage,
                                            size: 55.sp,
                                          ),
                                        )
                                      : Container(
                                          height: Get.height,
                                          width: Get.width,
                                          margin: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.sp),
                                              color: ThemeColor.darkColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(AppConstant
                                                          .identitasBayiImage +
                                                      state
                                                          .identitasBayi
                                                          .imageFiles
                                                          .kakiKananBayi),
                                                  fit: BoxFit.cover)),
                                        ),
                                  floatingActionButton: FloatingActionButton(
                                    backgroundColor: (state.isActive1)
                                        ? ThemeColor.primaryColor
                                        : ThemeColor.darkColor,
                                    heroTag: "btn-kaki",
                                    onPressed: (state.isActive1)
                                        ? () async {
                                            dynamic data = await deviceInfo
                                                .initPlatformState();
                                            // ignore: use_build_context_synchronously
                                            context
                                                .read<IndentiasBayiBloc>()
                                                .add(OnDisableButton1(
                                                    isActive: false));
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();

                                            if (result != null) {
                                              File file = File(
                                                  result.files.single.path!);
                                              // UPLOAD FILE
                                              // ignore: use_build_context_synchronously
                                              context.read<IndentiasBayiBloc>().add(
                                                  OnUploadCapSidikKakikananBayi(
                                                      noRM: singlePasien
                                                          .first.mrn,
                                                      deviceID:
                                                          "ID - ${data['id']} - ${data['device']}",
                                                      dpjp: singlePasien
                                                          .first.kdDokter,
                                                      file: file,
                                                      kategori:
                                                          "KAKI-KANAN-BAYI",
                                                      noReg: singlePasien
                                                          .first.noreg));
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              context
                                                  .read<IndentiasBayiBloc>()
                                                  .add(OnDisableButton1(
                                                      isActive: true));
                                            }
                                          }
                                        : null,
                                    child: const Icon(
                                      FontAwesomeIcons.image,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              SizedBox(
                                height: 45.sp,
                                child: Scaffold(
                                  backgroundColor: ThemeColor.bgColor,
                                  appBar: AppBar(
                                    automaticallyImplyLeading: false,
                                    title: Text(
                                      "Pemberian Gelang Pada Bayi Oleh :",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    ),
                                  ),
                                  body: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 25.sp,
                                          child: FormWidget.textForm(
                                              enable: true,
                                              controller: _pemberiGelangBayi
                                                ..text = state
                                                    .identitasBayi
                                                    .imageFiles
                                                    .namaPemberiGelangBayi),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 45.sp,
                                child: Scaffold(
                                  backgroundColor: ThemeColor.bgColor,
                                  appBar: AppBar(
                                    automaticallyImplyLeading: false,
                                    title: Text(
                                      "Jam Kelahiran Bayi :",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    ),
                                  ),
                                  body: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 25.sp,
                                          child: FormWidget.textForm(
                                              enable: true,
                                              controller: _jamKelahiranBayi
                                                ..text = state.identitasBayi
                                                    .imageFiles.jamKelahiran),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              SizedBox(
                                height: 150.sp,
                                child: Scaffold(
                                  backgroundColor: ThemeColor.bgColor,
                                  appBar: AppBar(
                                    automaticallyImplyLeading: false,
                                    title: Text(
                                      "Tanda tangan yang menentukan\njenis kelamin",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    ),
                                  ),
                                  body: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(2.sp),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(2.sp)),
                                                color: ThemeColor.blueColor),
                                            child: Screenshot(
                                              controller: screenshotController1,
                                              child: Signature(
                                                controller:
                                                    _signatureController1,
                                                height: Get.height,
                                                width: Get.width,
                                                backgroundColor:
                                                    ThemeColor.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.sp,
                                        ),
                                        SizedBox(
                                          width: Get.width,
                                          height: 15.sp,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.sp)),
                                                  backgroundColor:
                                                      ThemeColor.primaryColor),
                                              onPressed: () {
                                                _signatureController1.clear();
                                              },
                                              child: const Icon(
                                                FontAwesomeIcons.eraser,
                                                color: ThemeColor.whiteColor,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 2.sp,
                                        ),
                                        SizedBox(
                                          height: 25.sp,
                                          child: FormWidget.textForm(
                                              enable: true,
                                              controller: _penentuJK
                                                ..text = state.identitasBayi
                                                    .imageFiles.namaPenentuJK),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150.sp,
                                child: Scaffold(
                                  backgroundColor: ThemeColor.bgColor,
                                  appBar: AppBar(
                                    automaticallyImplyLeading: false,
                                    title: Text(
                                      "Tanda tangan Ibu/Bapak/Wali",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    ),
                                  ),
                                  body: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          padding: EdgeInsets.all(2.sp),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(2.sp)),
                                              color: ThemeColor.blueColor),
                                          child: Screenshot(
                                            controller: screenshotController2,
                                            child: Signature(
                                              controller: _signatureController2,
                                              height: Get.height,
                                              width: Get.width,
                                              backgroundColor:
                                                  ThemeColor.whiteColor,
                                            ),
                                          ),
                                        )),
                                        SizedBox(
                                          height: 2.sp,
                                        ),
                                        SizedBox(
                                          width: Get.width,
                                          height: 15.sp,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.sp)),
                                                  backgroundColor:
                                                      ThemeColor.primaryColor),
                                              onPressed: () {
                                                _signatureController2.clear();
                                              },
                                              child: const Icon(
                                                FontAwesomeIcons.eraser,
                                                color: ThemeColor.whiteColor,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 2.sp,
                                        ),
                                        SizedBox(
                                          height: 25.sp,
                                          child: FormWidget.textForm(
                                              enable: true,
                                              controller: _namaWali
                                                ..text = state.identitasBayi
                                                    .imageFiles.namaWali),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 15.sp,
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
