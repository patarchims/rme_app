import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/alergi/alergi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/asesmen_intensive/asesmen_intensive_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_awal_keperawatan/pengkajian_awal_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_persistem_keperawatan/pengkajian_persistem_page_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/riwayat_alergi_keperawatan/riwayat_alergi_keperawatan_widget_content.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/riwayat_pengobatan_dirumah/riwayat_pengobatan_dirumah_keperawatan_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class RiwayatKeperawatanIntensiveWidgetPage extends StatefulWidget {
  const RiwayatKeperawatanIntensiveWidgetPage({super.key});

  @override
  State<RiwayatKeperawatanIntensiveWidgetPage> createState() =>
      _RiwayatKeperawatanIntensiveWidgetPageState();
}

class _RiwayatKeperawatanIntensiveWidgetPageState
    extends State<RiwayatKeperawatanIntensiveWidgetPage> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _asesmenController;
  late TextEditingController _caramasukController;
  late TextEditingController _dariController;
  late TextEditingController _keluhanUtamaController;
  late TextEditingController _riwayatPenyakitController;
  late TextEditingController _riwayatPenyakitKeluargaController;
  late TextEditingController _riwayatPenyakitDahuluController;
  late TextEditingController _reaksiYangMunculController;
  late TextEditingController _tranfusiDarahController;
  late TextEditingController _riwayatMerokokController;
  late TextEditingController _riwayatMinumMinumanKerasController;
  late TextEditingController _alcoholController;

  @override
  void initState() {
    _asesmenController = TextEditingController();
    _caramasukController = TextEditingController();
    _riwayatPenyakitKeluargaController = TextEditingController();
    _dariController = TextEditingController();
    _keluhanUtamaController = TextEditingController();
    _riwayatPenyakitController = TextEditingController();
    _riwayatPenyakitDahuluController = TextEditingController();
    _reaksiYangMunculController = TextEditingController();
    _tranfusiDarahController = TextEditingController();
    _riwayatMerokokController = TextEditingController();
    _riwayatMinumMinumanKerasController = TextEditingController();
    _alcoholController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _asesmenController.clear();
    _caramasukController.clear();
    _riwayatPenyakitKeluargaController.clear();
    _dariController.clear();
    _keluhanUtamaController.clear();
    _riwayatPenyakitController.clear();
    _riwayatPenyakitDahuluController.clear();
    _reaksiYangMunculController.clear();
    _tranfusiDarahController.clear();
    _riwayatMerokokController.clear();
    _riwayatMinumMinumanKerasController.clear();
    _alcoholController.clear();

    _asesmenController.dispose();
    _caramasukController.dispose();
    _riwayatPenyakitKeluargaController.dispose();
    _dariController.dispose();
    _keluhanUtamaController.dispose();
    _riwayatPenyakitController.dispose();
    _riwayatPenyakitDahuluController.dispose();
    _reaksiYangMunculController.dispose();
    _tranfusiDarahController.dispose();
    _riwayatMerokokController.dispose();
    _riwayatMinumMinumanKerasController.dispose();
    _alcoholController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenIntensiveBloc, AsesmenIntensiveState>(
      listener: (context, state) {
        //

        if (state.status == AsesmenIntensiveStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != AsesmenIntensiveStatus.loading) {
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
        if (state.status == AsesmenIntensiveStatus.isLoadingGet) {
          HeaderContentWidget(
            isENableAdd: true,
            onPressed: () {},
            widget: Loading.expandedLoading(),
          );
        }
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              // ON SAVE ASESEMEN INTENSIVE KEPERAWATAN ICU
              dynamic data = await deviceInfo.initPlatformState();

              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context
                    .read<AsesmenIntensiveBloc>()
                    .add(OnSaveAsesmenIntensiveEvent(
                      noReg: singlePasien.first.noreg,
                      kdDPJP: singlePasien.first.kdDokter,
                      noRM: singlePasien.first.mrn,
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      deviceID: "ID-${data['id']}-${data['device']}",
                      person: toPerson(person: authState.user.person),
                      asesmen: _asesmenController.text,
                      caraMasuk: _caramasukController.text,
                      keluhanUtama: _keluhanUtamaController.text,
                      dari: _dariController.text,
                      penyakitSekarang: _riwayatPenyakitController.text,
                      penyakitDahulu: _riwayatPenyakitDahuluController.text,
                      reaksiYangMuncul: _reaksiYangMunculController.text,
                      transfusiDarah: _tranfusiDarahController.text,
                      riwayatMerokok: _riwayatMerokokController.text,
                      minumKeras: _riwayatMinumMinumanKerasController.text,
                      alcoholMempegaruhil: _alcoholController.text,
                    ));
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
                            suggestions: asesmen
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
                            controller: _asesmenController
                              ..text = state.asesmenIntensiveIcuModel.asesmen,
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
                          title: "Asesmen",
                        ),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: caraMasuk
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
                            controller: _caramasukController
                              ..text = state.asesmenIntensiveIcuModel.caraMasuk,
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
                          title: "Cara Masuk",
                        ),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: dariMana
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
                            controller: _dariController
                              ..text = state.asesmenIntensiveIcuModel.dari,
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
                          title: "Dari",
                        ),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: FormWidget.textArea(
                            enabled: true,
                            maxLines: 5,
                            controller: _keluhanUtamaController
                              ..text =
                                  state.asesmenIntensiveIcuModel.keluhanUtama,
                          ),
                          title: "Keluhan Utama",
                        ),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: FormWidget.textArea(
                            enabled: true,
                            controller: _riwayatPenyakitController
                              ..text = state
                                  .asesmenIntensiveIcuModel.penyakitSekarang,
                            maxLines: 5,
                          ),
                          title: "Riwayat Penyakit Sekarang",
                        ),

                        TitleWidget.titleContainer(
                            title: "Riwayat Penyakit Dahulu"),

                        Padding(
                          padding: EdgeInsets.all(3.sp),
                          child: Wrap(
                            children: (state.asesmenIntensiveIcuModel.riwayat
                                    .isNotEmpty)
                                ? state.asesmenIntensiveIcuModel.riwayat
                                    .map((e) => Padding(
                                          padding: EdgeInsets.all(1.sp),
                                          child: Card(
                                            margin: EdgeInsets.all(5.sp),
                                            color: ThemeColor.bgColor,
                                            child: Text(
                                              "${e.tglMasuk.toString().substring(0, 10)} - ${e.riwayatPenyakit.toString()},",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                        ))
                                    .toList()
                                : [
                                    Container(
                                      height: 35.sp,
                                    )
                                  ],
                          ),
                        ),

                        TitleWidget.titleContainer(
                            title: "Riwayat Penyakit Keluarga"),

                        const SizedBox(height: 10),

                        Container(
                          width: Get.width,
                          height: 20.sp,
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.sp))),
                            child: const Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                            onPressed: () {
                              CustomDialogWidget.getDialog(
                                  widget: Container(
                                    width: Get.width / 1.5,
                                    height: 65.sp,
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        TitleWidget.titleContentWidget(
                                            title:
                                                "TAMBAH DATA RIWAYAT PENYAKIT KELUARGA"),
                                        Row(
                                          children: [
                                            Container(
                                                height: 35.sp,
                                                width: Get.width / 2,
                                                padding: EdgeInsets.all(5.sp),
                                                child: FormWidget.textForm(
                                                  controller:
                                                      _riwayatPenyakitKeluargaController,
                                                  validator: (value) {
                                                    if (value!.contains("\n")) {
                                                      Get.back();
                                                    }
                                                    return null;
                                                  },
                                                  enable: true,
                                                )),
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.all(5.sp),
                                                height: 22.sp,
                                                width: Get.width,
                                                child: IconButton(
                                                    onPressed: () {
                                                      if (authState
                                                          is Authenticated) {
                                                        // ==== //
                                                        context.read<PengkajianAwalKeperawatanBloc>().add(OnSaveRiwayatPenyakitKeluarga(
                                                            tanggal:
                                                                DateTime.now()
                                                                    .toString()
                                                                    .substring(
                                                                        0, 10),
                                                            noRM: singlePasien
                                                                .first.mrn,
                                                            noReg: singlePasien
                                                                .first
                                                                .noAntrean,
                                                            person: toPerson(
                                                                person: authState
                                                                    .user
                                                                    .person),
                                                            penyakitKeluarga:
                                                                _riwayatPenyakitKeluargaController
                                                                    .text,
                                                            userID: authState
                                                                .user.userId));
                                                      }

                                                      if (authState
                                                          is Authenticated) {
                                                        context
                                                            .read<
                                                                AsesmenIntensiveBloc>()
                                                            .add(OnGetRiwayatKeperawatanIntensive(
                                                                noReg: singlePasien
                                                                    .first
                                                                    .noreg,
                                                                person: toPerson(
                                                                    person: authState
                                                                        .user
                                                                        .person),
                                                                noRM:
                                                                    singlePasien
                                                                        .first
                                                                        .mrn));
                                                      }

                                                      Get.back();
                                                      _riwayatPenyakitController
                                                          .clear();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            ThemeColor
                                                                .primaryColor,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp))),
                                                    color:
                                                        ThemeColor.whiteColor,
                                                    icon: const Icon(
                                                        FontAwesomeIcons
                                                            .circlePlus)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.transparent);
                            },
                          ),
                        ),
                        Container(
                          height: 150.sp,
                          margin: EdgeInsets.all(5.sp),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: ThemeColor.bgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.sp)),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Card(
                            elevation: 1,
                            color: ThemeColor.bgColor,
                            child: SizedBox(
                              width: Get.width,
                              child: Wrap(
                                children:
                                    state.asesmenIntensiveIcuModel
                                        .penyakitKeluarga
                                        .map((e) => SizedBox(
                                              width: 100.sp,
                                              height: 20.sp,
                                              child: Card(
                                                color: ThemeColor.darkColor,
                                                child: ListTile(
                                                    trailing: IconButton(
                                                      onPressed: () {
                                                        // === //
                                                        // TAMPILKAN PESAN DELETE RIWAYAT ALEG
                                                        // todo : delete alergi
                                                        CustomDialogWidget
                                                            .getDialog(
                                                                widget: MessageAlert
                                                                    .deleteAlert(
                                                                        mesage:
                                                                            "Apakah Anda yakin menghapus data ${e.alergi} ini ?",
                                                                        onPressed:
                                                                            () {
                                                                          //  === DELETE DATA ==== /
                                                                          context.read<AlergiBloc>().add(OnRemovePenyakitKeluargaEvent(
                                                                              nomor: e.nomor,
                                                                              noRm: e.noRm,
                                                                              kelompok: e.kelompok));

                                                                          Get.back();
                                                                        }));
                                                      },
                                                      icon: const Icon(
                                                        FontAwesomeIcons
                                                            .circleMinus,
                                                        color: ThemeColor
                                                            .dangerColor,
                                                      ),
                                                    ),
                                                    title: Text(
                                                      e.alergi,
                                                      style: whiteTextStyle,
                                                    )),
                                              ),
                                            ))
                                        .toList(),
                              ),
                            ),
                          ),
                        ),

                        TitleWidget.titleContainer(
                            title: "Riwayat Pengobatan Dirumah"),

                        //=====//
                        Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: ThemeColor.whiteColor,
                                borderRadius: BorderRadius.circular(5.sp)),
                            height: 100.sp,
                            child:
                                const RiwayatPengobatanDirumahKeperawatanWidget()),

                        //=====//
                        SizedBox(height: 5.sp),
                        const RiwayatAlergiKeperawatanContentWidget(),

                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: FormWidget.textArea(
                            enabled: true,
                            maxLines: 5,
                            controller: _reaksiYangMunculController
                              ..text =
                                  state.asesmenIntensiveIcuModel.yangMuncul,
                          ),
                          title: "Reaksi yang mucul",
                        ),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: transfusiDarah
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
                            controller: _tranfusiDarahController
                              ..text =
                                  state.asesmenIntensiveIcuModel.transfusiDarah,
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
                          title: "Riwayat Transfusi darah",
                        ),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: merokok
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
                            controller: _riwayatMerokokController
                              ..text =
                                  state.asesmenIntensiveIcuModel.riwayatMerokok,
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
                          title: "Riwayat Merokok",
                        ),
                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: riwayatPengobatanDiRumah
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
                            controller: _riwayatMinumMinumanKerasController
                              ..text =
                                  state.asesmenIntensiveIcuModel.minumanKeras,
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
                          title: "Riwayat minum-minuman keras",
                        ),

                        TitleWidget.boxPemeriksaanFisikSugestion(
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: riwayatMempengaruhiHidup
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
                            onSubmit: (value) {},
                            onSaved: (a) {},
                            controller: _alcoholController
                              ..text = state
                                  .asesmenIntensiveIcuModel.alcoholMempengaruhi,
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
                          title:
                              "Apakah alcohol/obat-obatan mempegaruhi hidup Anda?",
                        ),

                        SizedBox(height: 15.sp),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}

List<String> caraMasuk = ["Jalan", "Kursi Roda", "Brankar"];
List<String> dariMana = ["IGD", "Rajal"];
List<String> riwayatPenyakitKeluarga = [
  "DM",
  "Jantung",
  "Hipentensi",
  "Asma",
  "Hepatitis",
  "TBC"
];
List<String> asesmen = ["Autoanamnese", "Alloanamnese"];

List<String> riwayatPengobatanDiRumah = ["Tidak Ada", "Ada, yaitu"];
List<String> transfusiDarah = [
  "Tidak",
  "Pernah",
];

List<String> riwayatMempengaruhiHidup = ["Tidak", "Ya"];
List<String> reaksiAlergi = ["Tidak", "Ya, jelaskan"];
List<String> riwayatMinumAirKeras = ["Tidak", "Ya, Jenis"];
List<String> jumlahHari = ["1", "2", "3", "4"];
