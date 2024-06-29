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
import 'package:hms_app/presentation/pages/bangsal/bloc/nyeri_anak/asesmen_nyeri_anak_bloc.dart';
import 'package:hms_app/presentation/pages/igd/dokter/asesmen/triase_igd_dokter_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class PengkajianNyeriAnakWigetPage extends StatefulWidget {
  const PengkajianNyeriAnakWigetPage({super.key});

  @override
  State<PengkajianNyeriAnakWigetPage> createState() =>
      _PengkajianNyeriAnakWigetPageState();
}

class _PengkajianNyeriAnakWigetPageState
    extends State<PengkajianNyeriAnakWigetPage> {
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
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenNyeriAnakBloc, AsesmenNyeriAnakState>(
      listener: (context, state) {
        if (state.status == AsesmenNyeriAnakStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != AsesmenNyeriAnakStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
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
        if (state.status == AsesmenNyeriAnakStatus.isLoadingGet) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            onPressed: () async {
              // ON SAVE DATA
              if (authState is Authenticated) {
                dynamic data = await deviceInfo.initPlatformState();

                // ignore: use_build_context_synchronously
                context.read<AsesmenNyeriAnakBloc>().add(
                    OnSaveAssesmenNyeriAnakEvent(
                        noReg: singlePasien.first.noreg,
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        person: toPerson(person: authState.user.person),
                        deviceID: "ID-${data['id']}-${data['device']}",
                        ekspresiWajah: state.penkajianNyeri.ekspresiWajah,
                        kdDokter: singlePasien.first.kdDokter,
                        tangisan: state.penkajianNyeri.tangisan,
                        polaNapas: state.penkajianNyeri.polaNapas,
                        tangan: state.penkajianNyeri.tangan,
                        kaki: state.penkajianNyeri.kaki,
                        kesadaran: state.penkajianNyeri.kesadaran,
                        total: state.penkajianNyeri.total,
                        nyeri: state.penkajianNyeri.nyeri,
                        lokasiNyeri: _lokasiNyeri.text,
                        frekuensiNyeri: _frekuensiNyeri.text,
                        nyeriMenjalar: _menjalar.text,
                        kualitasNyeri: _kualitasNyeri.text));
              }
            },
            isENableAdd: true,
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
                  margin: EdgeInsets.only(right: 5.sp),
                  child: Column(
                    children: [
                      SizedBox(height: 5.sp),
                      TitleWidget.titleContainer(title: "ASESMEN NYERI NIPS"),
                      SizedBox(height: 5.sp),
                      Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(left: 5.sp, right: 5.sp),
                          child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black, width: 1)),
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.black),
                                gaps: [
                                  TableGap.weight(),
                                  TableGap.width(220),
                                ],
                                children: [
                                  Container(
                                    color: ThemeColor.primaryColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.sp),
                                      child: Center(
                                        child: Text(
                                          "KATEGORI",
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 5.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: ThemeColor.primaryColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.sp),
                                      child: Center(
                                        child: Text(
                                          "SCORE",
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 5.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))),

                      //PENGKAJIAN NUTRISI,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: TitleWidget.headerCenterTitle2(
                            title: "Ekspresi Wajah"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.sp, vertical: 1.sp),
                        child: Card(
                          elevation: 0,
                          color: ThemeColor.bgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Column(
                            children: [
                              cardMethod(
                                skor: "0",
                                title: "Otot wajah rileks, ekspresi netral",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangeEkspresiWajahEvent(
                                          value:
                                              "Otot wajah rileks, ekspresi netral"));
                                },
                                color: (state.penkajianNyeri.ekspresiWajah
                                        .contains(
                                            "Otot wajah rileks, ekspresi netral"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                              cardMethod(
                                skor: "1",
                                title:
                                    "Otot wajah tegang, alis berkerut, rahan dan dagu mengunci",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangeEkspresiWajahEvent(
                                          value:
                                              "Otot wajah tegang, alis berkerut, rahan dan dagu mengunci"));
                                },
                                color: (state.penkajianNyeri.ekspresiWajah.contains(
                                        "Otot wajah tegang, alis berkerut, rahan dan dagu mengunci"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //PENGKAJIAN NUTRISI,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child:
                            TitleWidget.headerCenterTitle2(title: "Tangisan"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.sp, vertical: 1.sp),
                        child: Card(
                          elevation: 0,
                          color: ThemeColor.bgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Column(
                            children: [
                              cardMethod(
                                skor: "0",
                                title: "Tenang, tidak menangis",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedTangisanEvent(
                                          value: "Tenang, tidak menangis"));
                                },
                                color: (state.penkajianNyeri.tangisan
                                        .contains("Tenang, tidak menangis"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                              cardMethod(
                                skor: "1",
                                title: "Mengerang, sebentar sebentar menangis",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedTangisanEvent(
                                          value:
                                              "Mengerang, sebentar sebentar menangis"));
                                },
                                color: (state.penkajianNyeri.tangisan.contains(
                                        "Mengerang, sebentar sebentar menangis"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                              cardMethod(
                                skor: "2",
                                title:
                                    "Terus menerus menangis, menangis kencang, melengking",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedTangisanEvent(
                                          value:
                                              "Terus menerus menangis, menangis kencang, melengking"));
                                },
                                color: (state.penkajianNyeri.tangisan.contains(
                                        "Terus menerus menangis, menangis kencang, melengking"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child:
                            TitleWidget.headerCenterTitle2(title: "Pola Napas"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.sp, vertical: 1.sp),
                        child: Card(
                          elevation: 0,
                          color: ThemeColor.bgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Column(
                            children: [
                              cardMethod(
                                skor: "0",
                                title: "Rileks, napas regular",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedPolaNapasEvent(
                                          value: "Rileks, napas regular"));
                                },
                                color: (state.penkajianNyeri.polaNapas
                                        .contains("Rileks, napas regular"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                              cardMethod(
                                skor: "1",
                                title:
                                    "Pola napas berubah: tidak teratur cepat dari biasanya, tersedak, menahan napas",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedPolaNapasEvent(
                                          value:
                                              "Pola napas berubah: tidak teratur cepat dari biasanya, tersedak, menahan napas"));
                                },
                                color: (state.penkajianNyeri.polaNapas.contains(
                                        "Pola napas berubah: tidak teratur cepat dari biasanya, tersedak, menahan napas"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: TitleWidget.headerCenterTitle2(title: "TANGAN"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.sp, vertical: 1.sp),
                        child: Card(
                          elevation: 0,
                          color: ThemeColor.bgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Column(
                            children: [
                              cardMethod(
                                skor: "0",
                                title:
                                    "Tidak ada kekuatan otot, gerakan tangan acak sekali-kali",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnchangedTanganEvent(
                                          value:
                                              "Tidak ada kekuatan otot, gerakan tangan acak sekali-kali"));
                                },
                                color: (state.penkajianNyeri.tangan.contains(
                                        "Tidak ada kekuatan otot, gerakan tangan acak sekali-kali"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                              cardMethod(
                                skor: "1",
                                title:
                                    "Tegang, lengan lurus, kaku dan ekstensi, cepat ekstensi dan fleksi",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnchangedTanganEvent(
                                          value:
                                              "Tegang, lengan lurus, kaku dan ekstensi, cepat ekstensi dan fleksi"));
                                },
                                color: (state.penkajianNyeri.tangan.contains(
                                        "Tegang, lengan lurus, kaku dan ekstensi, cepat ekstensi dan fleksi"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: TitleWidget.headerCenterTitle2(title: "KAKI"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.sp, vertical: 1.sp),
                        child: Card(
                          elevation: 0,
                          color: ThemeColor.bgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Column(
                            children: [
                              cardMethod(
                                skor: "0",
                                title:
                                    "Tidak ada kekuatan otot, gerakan kaki acak sekali-sekali",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedKakiEvent(
                                          value:
                                              "Tidak ada kekuatan otot, gerakan kaki acak sekali-sekali"));
                                },
                                color: (state.penkajianNyeri.kaki.contains(
                                        "Tidak ada kekuatan otot, gerakan kaki acak sekali-sekali"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                              cardMethod(
                                skor: "1",
                                title:
                                    "Tegang, kaki lurus, kaku dan atau ekstensi, cepat ekstensi dan fleksi",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedKakiEvent(
                                          value:
                                              "Tegang, kaki lurus, kaku dan atau ekstensi, cepat ekstensi dan fleksi"));
                                },
                                color: (state.penkajianNyeri.kaki.contains(
                                        "Tegang, kaki lurus, kaku dan atau ekstensi, cepat ekstensi dan fleksi"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child:
                            TitleWidget.headerCenterTitle2(title: "KESADARAN"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.sp, vertical: 1.sp),
                        child: Card(
                          elevation: 0,
                          color: ThemeColor.bgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp)),
                          child: Column(
                            children: [
                              cardMethod(
                                skor: "0",
                                title:
                                    "Tenang, tidur damai atau gerakan kaki acak yang terjaga",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedKesadaraEvent(
                                          value:
                                              "Tenang, tidur damai atau gerakan kaki acak yang terjaga"));
                                },
                                color: (state.penkajianNyeri.kesadaran.contains(
                                        "Tenang, tidur damai atau gerakan kaki acak yang terjaga"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),
                              cardMethod(
                                skor: "1",
                                title: "Terjaga, gelisah dan meronta-ronta",
                                onPressed: () {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedKesadaraEvent(
                                          value:
                                              "Terjaga, gelisah dan meronta-ronta"));
                                },
                                color: (state.penkajianNyeri.kesadaran.contains(
                                        "Terjaga, gelisah dan meronta-ronta"))
                                    ? ThemeColor.greenColor.withOpacity(0.5)
                                    : ThemeColor.bgColor.withOpacity(0.5),
                              ),

                              SizedBox(
                                height: 5.sp,
                              ),

                              // TODO : NYERI
                              TitleWidget.titleContainer(
                                  title:
                                      "Keterangan :Skor 0-2: Nyeri ringan tidak nyeri\nSkor >4 Nyeri sedang-nyeri ringan skor: 3-4"),

                              Slider(
                                value: state.penkajianNyeri.nyeri.toDouble(),
                                max: 10,
                                divisions: 10,
                                label: state.penkajianNyeri.nyeri.toString(),
                                onChanged: (double value) {
                                  context.read<AsesmenNyeriAnakBloc>().add(
                                      OnChangedSkalaNyeriEvent(
                                          skalaNyeri: value.toInt()));
                                },
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<AsesmenNyeriAnakBloc>()
                                            .add(OnChangedSkalaNyeriEvent(
                                                skalaNyeri: 1));
                                        // context
                                        //     .read<AsesmenNyeriBloc>()
                                        //     .add(OnCHangedAsesmenNyeri(skalaNyeri: 1));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/1.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<AsesmenNyeriAnakBloc>()
                                            .add(OnChangedSkalaNyeriEvent(
                                                skalaNyeri: 3));
                                        // context
                                        //     .read<AsesmenNyeriBloc>()
                                        //     .add(OnCHangedAsesmenNyeri(skalaNyeri: 3));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/2.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<AsesmenNyeriAnakBloc>()
                                            .add(OnChangedSkalaNyeriEvent(
                                                skalaNyeri: 5));
                                        // context
                                        //     .read<AsesmenNyeriBloc>()
                                        //     .add(OnCHangedAsesmenNyeri(skalaNyeri: 5));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/3.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<AsesmenNyeriAnakBloc>()
                                            .add(OnChangedSkalaNyeriEvent(
                                                skalaNyeri: 7));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/4.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<AsesmenNyeriAnakBloc>()
                                            .add(OnChangedSkalaNyeriEvent(
                                                skalaNyeri: 8));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/5.png")),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<AsesmenNyeriAnakBloc>()
                                            .add(OnChangedSkalaNyeriEvent(
                                                skalaNyeri: 10));
                                      },
                                      child: SizedBox(
                                          height: 20.sp,
                                          child: Image.asset(
                                              "assets/images/nyeri/6.png")),
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
                                                  nyeri: state
                                                      .penkajianNyeri.nyeri
                                                      .toDouble()))),
                                          Text(
                                            toNyeriText(
                                                nyeri: state
                                                    .penkajianNyeri.nyeri
                                                    .toDouble()),
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
                                  suggestions: ListConstants.kualitasNyeri
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
                                  controller: _frekuensiNyeri
                                    ..text =
                                        state.penkajianNyeri.frekuensiNyeri,
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
                                  suggestions: ListConstants.lokasiNyeri
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

                                  controller: _lokasiNyeri
                                    ..text = state.penkajianNyeri.lokasiNyeri,
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
                                  suggestions: ListConstants.kualitasNyeri
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
                                  controller: _kualitasNyeri
                                    ..text = state.penkajianNyeri.kualitasNyeri,
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
                                  suggestions: ListConstants.menjalar
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
                                  controller: _menjalar
                                    ..text = state.penkajianNyeri.nyeriMenjalar,
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
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Card cardMethod({
    Function()? onPressed,
    Color? color,
    required String title,
    required String skor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
      color: color,
      child: ListTile(
        enabled: true,
        title: Text(
          title,
          style: blackTextStyle,
        ),
        trailing: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: ThemeColor.primaryColor.withOpacity(0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
          child: Text(
            skor,
            style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 6.sp),
          ),
        ),
      ),
    );
  }
}
