import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/perina/repository/asesmen_perina_response_model.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class AddRiwayatKehamilanPerinaPageWidget extends StatefulWidget {
  const AddRiwayatKehamilanPerinaPageWidget({super.key});

  @override
  State<AddRiwayatKehamilanPerinaPageWidget> createState() =>
      _AddRiwayatKehamilanPerinaPageWidgetState();
}

class _AddRiwayatKehamilanPerinaPageWidgetState
    extends State<AddRiwayatKehamilanPerinaPageWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _tahunPersalinanController;
  late TextEditingController _jenisKelaminaController;
  late TextEditingController _beratBadanController;
  late TextEditingController _keadaanBayiController;
  late TextEditingController _komplikasiKehamilanController;
  late TextEditingController _komplikasiPersalinanController;
  late TextEditingController _tempatPersalinanController;
  late TextEditingController _jenisPersalinanController;

  @override
  void initState() {
    _tahunPersalinanController = TextEditingController();
    _jenisKelaminaController = TextEditingController();
    _beratBadanController = TextEditingController();
    _keadaanBayiController = TextEditingController();
    _komplikasiKehamilanController = TextEditingController();
    _komplikasiPersalinanController = TextEditingController();
    _tempatPersalinanController = TextEditingController();
    _jenisPersalinanController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    clearText();
    _tahunPersalinanController.dispose();
    _jenisKelaminaController.dispose();
    _beratBadanController.dispose();
    _keadaanBayiController.dispose();
    _komplikasiKehamilanController.dispose();
    _komplikasiPersalinanController.dispose();
    _tempatPersalinanController.dispose();
    _jenisPersalinanController.dispose();

    super.dispose();
  }

  void clearText() {
    _tahunPersalinanController.clear();
    _jenisKelaminaController.clear();
    _beratBadanController.clear();
    _keadaanBayiController.clear();
    _komplikasiKehamilanController.clear();
    _komplikasiPersalinanController.clear();
    _tempatPersalinanController.clear();
    _jenisPersalinanController.clear();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return SizedBox(
      height: 100.sp,
      width: Get.width / 1.5,
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 50.sp,
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: ThemeColor.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp)),
            onPressed: () async {
              dynamic data = await deviceInfo.initPlatformState();
              // ignore: use_build_context_synchronously
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<AsesmenBayiBloc>().add(
                    OnSaveAsesmenKeperawatanBayiEvent(
                        devicesID: "ID - ${data['id']} - ${data['device']}",
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        person: toPerson(person: authState.user.person),
                        noReg: singlePasien.first.noreg,
                        noRM: singlePasien.first.mrn,
                        kehamilanPerinal: RiwayatKehamilanPerinaModel(
                            kdRiwayat: "",
                            tahubPersalinan: _tahunPersalinanController.text,
                            tempatPersalinan: _tempatPersalinanController.text,
                            umurKehamilan: "",
                            jenisPersalinan: _jenisPersalinanController.text,
                            penolong: "",
                            penyulit: "",
                            nifas: "",
                            jk: _jenisKelaminaController.text,
                            bb: _beratBadanController.text,
                            keadaanSekarang: _keadaanBayiController.text,
                            komplikasiHamil:
                                _komplikasiKehamilanController.text,
                            komplikasiPersalinan:
                                _komplikasiPersalinanController.text)));

                clearText();
                Get.back();
              }
            },
            heroTag: "btn2",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 10.sp,
                ),
                SizedBox(
                  width: 5.sp,
                ),
                Text(
                  "SIMPAN",
                  style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            "Tambah Riwayat Kelahiran Yang Lalu",
            style: whiteTextStyle,
          ),
        ),
        backgroundColor: ThemeColor.bgColor,
        body: RawScrollbar(
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
              children: [
                FB5Row(
                  classNames: 'px-xs-0 px-lg-0 gx-0',
                  children: [
                    FB5Col(
                      classNames: 'col-4',
                      child: TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 35.sp,
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: toTahun()
                              .asMap()
                              .entries
                              .map(
                                (e) => SearchFieldListItem(
                                  e.value.toString(),
                                  item: e.value.toString().toUpperCase(),
                                  child: Container(
                                    width: Get.width,
                                    color: ThemeColor.whiteColor,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.value.toString(),
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
                          controller: _tahunPersalinanController,
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
                        title: "Tahun Persalinan",
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-4',
                      child: TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 35.sp,
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: jenisKelamin
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
                          controller: _jenisKelaminaController,
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
                        title: "Jenis Kelamin",
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-4',
                      child: TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 35.sp,
                        widget: FormWidget.textArea(
                            enabled: true,
                            maxLines: 1,
                            controller: _beratBadanController),
                        title: "Berat Badan Lahir",
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-4',
                      child: TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 35.sp,
                        widget: FormWidget.textArea(
                            enabled: true,
                            maxLines: 1,
                            controller: _keadaanBayiController),
                        title: "Keadaan Bayi",
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-4',
                      child: TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 35.sp,
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: komplikasiKehamilan
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
                          controller: _komplikasiKehamilanController,
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
                        title: "Komplikasi Kehamilan",
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-4',
                      child: TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 35.sp,
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: komplikasiPersalinan
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
                          controller: _komplikasiPersalinanController,
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
                        title: "Komplikasi Persalinan",
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-6',
                      child: TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 35.sp,
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: tempatPersalinan
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
                          controller: _tempatPersalinanController,
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
                        title: "Tempat Persalinan",
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-6',
                      child: TitleWidget.boxPemeriksaanFisikSugestion(
                        width: 35.sp,
                        widget: SearchField(
                          searchStyle: blackTextStyle,
                          enabled: true,
                          marginColor: ThemeColor.whiteColor,
                          itemHeight: 15.sp,
                          suggestionStyle: blackTextStyle,
                          suggestions: jenisPersalinan
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
                          controller: _jenisPersalinanController,
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
                        title: "Jenis Persalinan",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<int> toTahun() {
  List<int> b = [];
  for (var i = DateTime.now().year - 25; i < DateTime.now().year; i++) {
    b.add(i);
  }
  return b;
}

List<String> jenisPersalinan = ["Normal", "Caesar"];
List<String> tempatPersalinan = ["Rumah Sakit", "Bidan"];
List<String> jenisKelamin = ["Laki-laki", "Perempuan"];
List<String> komplikasiKehamilan = [
  "Hiperemesis gravidarum",
  "Keguguran",
  "Anemia",
  "Perdarahan",
  "Kurang cairan ketuban"
];
List<String> komplikasiPersalinan = [
  "Distosia",
  "Cephalopelvic disproportion",
  "Prolaps tali pusat",
  "janin terlilit tali pusar",
  "Emboli air ketuban",
  " asfiksia perinatal",
  "Gawat janin (fetal distress)",
  "Rahim robek (ruptur uteri)",
  "Sindrom aspirasi mekonium",
  "Perdarahan postpartum",
  "bayi sungsang (breech birth)",
  "Retensio plasenta",
  "Plasenta akreta",
  "atonia uteri",
  "Infeksi postpartum",
  "Meninggal saat atau setelah melahirkan"
];
