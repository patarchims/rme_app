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
import 'package:hms_app/presentation/pages/icu/bloc/asesmen_nyeri_icu/asesmen_nyeri_icu_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/asesmen/triase_igd_dokter_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PengkajianNyeriICUWidgetPage extends StatefulWidget {
  const PengkajianNyeriICUWidgetPage({super.key});

  @override
  State<PengkajianNyeriICUWidgetPage> createState() =>
      _PengkajianNyeriICUWidgetPageState();
}

class _PengkajianNyeriICUWidgetPageState
    extends State<PengkajianNyeriICUWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _frekuensiNyeri;
  late TextEditingController _lokasiNyeri;
  late TextEditingController _kualitasNyeri;
  late TextEditingController _menjalar;

  @override
  void initState() {
    _frekuensiNyeri = TextEditingController();
    _lokasiNyeri = TextEditingController();
    _kualitasNyeri = TextEditingController();
    _menjalar = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _frekuensiNyeri.clear();
    _lokasiNyeri.clear();
    _kualitasNyeri.clear();
    _menjalar.clear();

    _frekuensiNyeri.dispose();
    _lokasiNyeri.dispose();
    _kualitasNyeri.dispose();
    _menjalar.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<AsesmenNyeriIcuBloc, AsesmenNyeriIcuState>(
      listener: (context, state) {
        if (state.status == AsesmenNyeriICUStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != AsesmenNyeriICUStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (value) async {
                      final shouldPop = await Alert.loaded(context,
                          subTitle: value.meta.message, title: "Pesan");

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
        if (state.status == AsesmenNyeriICUStatus.isLoadingGet) {
          return HeaderContentWidget(
              backgroundColor: ThemeColor.bgColor,
              isENableAdd: true,
              onPressed: () {},
              title: "SIMPAN",
              widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
          backgroundColor: ThemeColor.bgColor,
          isENableAdd: true,
          onPressed: () async {
            // LAKUKAN SIMPAN DATA DI SINI
            if (authState is Authenticated) {
              dynamic data = await deviceInfo.initPlatformState();

              // ignore: use_build_context_synchronously
              context.read<AsesmenNyeriIcuBloc>().add(
                  OnSaveAsesmenNyeriIcuEvent(
                      kdDokter: singlePasien.first.kdDokter,
                      devicesID: "ID-${data['id']}-${data['device']}",
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      person: toPerson(person: authState.user.person),
                      noReg: singlePasien.first.noreg,
                      kategori: toKategoriString(
                          spesiliasasi: authState.user.spesialisasi),
                      nyeri: state.nyeriIcuModel.nyeri,
                      lokasiNyeri: _lokasiNyeri.text,
                      frekuensiNyeri: _frekuensiNyeri.text,
                      nyeriMenjalar: _menjalar.text,
                      kualitasNyeri: _kualitasNyeri.text));
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
                margin: EdgeInsets.only(right: 15.sp),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Slider(
                      value: state.nyeriIcuModel.nyeri.toDouble(),
                      max: 10,
                      divisions: 10,
                      label: state.nyeriIcuModel.nyeri.toString(),
                      onChanged: (double value) {
                        context.read<AsesmenNyeriIcuBloc>().add(
                            OnChangedAsesmenNyeriEvent(value: value.toInt()));
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriIcuBloc>()
                                  .add(OnChangedAsesmenNyeriEvent(value: 1));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/1.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriIcuBloc>()
                                  .add(OnChangedAsesmenNyeriEvent(value: 3));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/2.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriIcuBloc>()
                                  .add(OnChangedAsesmenNyeriEvent(value: 5));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/3.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriIcuBloc>()
                                  .add(OnChangedAsesmenNyeriEvent(value: 7));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/4.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriIcuBloc>()
                                  .add(OnChangedAsesmenNyeriEvent(value: 8));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/5.png")),
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<AsesmenNyeriIcuBloc>()
                                  .add(OnChangedAsesmenNyeriEvent(value: 10));
                            },
                            child: SizedBox(
                                height: 20.sp,
                                child:
                                    Image.asset("assets/images/nyeri/6.png")),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 2.5,
                            child: Text(
                              "Skala\nNyeri\n",
                              style: blackTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 50.sp,
                                    child: Image.asset(toNyeri(
                                        nyeri: state.nyeriIcuModel.nyeri
                                            .toDouble()))),
                                Text(
                                  toNyeriText(
                                      nyeri:
                                          state.nyeriIcuModel.nyeri.toDouble()),
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),

                    // ===== LOKASI NYERI
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
                        suggestions: kualitasNyeri
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
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        validator: (x) {
                          return null;
                        },
                        controller: _frekuensiNyeri
                          ..text = state.nyeriIcuModel.frekuensiNyeri,
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
                      title: "Frekuensi Nyeri",
                    ),
                    const Divider(),

                    TitleWidget.boxPemeriksaanFisikSugestion(
                      widget: FormWidget.textArea(
                        controller: _lokasiNyeri
                          ..text = state.nyeriIcuModel.lokasiNyeri,
                        enabled: true,
                        maxLines: 5,
                      ),
                      title: "Lokasi Nyeri",
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
                        suggestions: frekuensiNyeri
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
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        validator: (x) {
                          return null;
                        },
                        controller: _kualitasNyeri
                          ..text = state.nyeriIcuModel.kualitasNyeri,
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
                      title: "Kualitas Nyeri",
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
                        suggestions: menjalar
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
                                    style:
                                        blackTextStyle.copyWith(fontSize: 6.sp),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        validator: (x) {
                          return null;
                        },
                        controller: _menjalar
                          ..text = state.nyeriIcuModel.nyeriMenjalar,
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
                      title: "Menjalar",
                    ),
                    const Divider(),

                    SizedBox(
                      height: 20.sp,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

List<String> frekuensiNyeri = ["Jarang", "Hilang Timbul", "Menetap"];
List<String> kualitasNyeri = ["Tumpul", "Tajam", "Panas/Terbakar"];
List<String> lokasiNyeri = ["Tidak", "Ya ke"];
List<String> menjalar = ["Tidak", "Ya ke"];
