// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/perina/repository/asesmen_perina_response_model.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/component.dart';

class EditRiwayatKehamilanPerinaPageWidget extends StatefulWidget {
  final RiwayatKehamilanPerinaModel riwayatKehamilan;
  const EditRiwayatKehamilanPerinaPageWidget({
    Key? key,
    required this.riwayatKehamilan,
  }) : super(key: key);

  @override
  State<EditRiwayatKehamilanPerinaPageWidget> createState() =>
      _EditRiwayatKehamilanPerinaPageWidgetState();
}

class _EditRiwayatKehamilanPerinaPageWidgetState
    extends State<EditRiwayatKehamilanPerinaPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
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
            "Edit Riwayat Kelahiran Yang Lalu",
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
                                    height: 50.sp,
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
                                    height: 50.sp,
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
                          // controller: _kepalaController
                          //   ..text = state.pemeriksaanFisikIgdDokter.kepala,
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
                        widget: FormWidget.textArea(enabled: true, maxLines: 1),
                        title: "Berat Badan Lahir",
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
                                    height: 50.sp,
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
                          // controller: _kepalaController
                          //   ..text = state.pemeriksaanFisikIgdDokter.kepala,
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
                                    height: 50.sp,
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
                          // controller: _kepalaController
                          //   ..text = state.pemeriksaanFisikIgdDokter.kepala,
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
                                    height: 50.sp,
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
                          // controller: _kepalaController
                          //   ..text = state.pemeriksaanFisikIgdDokter.kepala,
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
                                    height: 50.sp,
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
                          // controller: _kepalaController
                          //   ..text = state.pemeriksaanFisikIgdDokter.kepala,
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
                                    height: 50.sp,
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
                          // controller: _kepalaController
                          //   ..text = state.pemeriksaanFisikIgdDokter.kepala,
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

List<String> keadaanBayi = [
  "Normal",
  "Mati",
  "Cacat",
  "Aspiksia Ringan",
  "Aspiksia Sedang",
  "Aspiksia Berat"
];

List<String> jenisPersalinan = ["Normal", "Caesar"];
List<String> beratBadan = ["1 Kg", "1,5 Kg", "2 Kg", "2,5 Kg"];
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

List<int> toTahun() {
  List<int> b = [];
  for (var i = DateTime.now().year - 25; i < DateTime.now().year; i++) {
    b.add(i);
  }
  return b;
}
