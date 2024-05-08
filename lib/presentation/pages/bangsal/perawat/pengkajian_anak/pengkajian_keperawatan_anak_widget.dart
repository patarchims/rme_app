import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
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

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                          suggestions: pilihanMata
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
                          // controller: _airWayController
                          //   ..text = state.pengkajianPersistemICU.airway,
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
                ],
              ),
            )));
  }
}

List<String> pilihanMata = [
  "TAK",
  "Secret",
  "Simetris Kanan Refleks berkedip",
  "Simetris Kiri Refleks berkedip"
];

List<String> telinga = [
  "TAK",
  "Keluar Carian",
  "Terdapat Septum di tengah",
];

List<String> hidung = ["TAK", "Epitaksis", "Terdapat Septum di tengah"];

List<String> mulut = ["TAK", "Mucosa Lembab", "Refleks Menghisap"];

List<String> leherDanBahu = ["TAK", ""];
