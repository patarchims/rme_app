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
import 'package:hms_app/presentation/component/shimer/shimer_loading.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/pemeriksaan_fisik_kebidanan_content_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/pengkajian_persistem_keperawatan/pengkajian_persistem_page_widget.dart';
import 'package:hms_app/presentation/pages/icu/bloc/pemeriksaan_fisik_icu/pemeriksaan_fisik_icu_bloc.dart';
import 'package:hms_app/presentation/pages/icu/repository/pengkajian_persistem_icu_repository.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PengkajianICUPersistemPageWidget extends StatefulWidget {
  const PengkajianICUPersistemPageWidget({super.key});

  @override
  State<PengkajianICUPersistemPageWidget> createState() =>
      _PengkajianICUPersistemPageWidgetState();
}

class _PengkajianICUPersistemPageWidgetState
    extends State<PengkajianICUPersistemPageWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _airWayController;
  late TextEditingController _brethingController;
  late TextEditingController _circulationController;
  late TextEditingController _nutrisiDanHidrasiController;
  late TextEditingController _masalahYangBerhubunganController;
  late TextEditingController _makanController;
  late TextEditingController _padaBayiController;
  late TextEditingController _minumController;
  late TextEditingController _eliminasiBakController;
  late TextEditingController _eliminasiBabController;
  late TextEditingController _tidurAtauIstirahatController;
  late TextEditingController _aktivitasController;
  late TextEditingController _berjalanController;
  late TextEditingController _penggunaanAlatBantuController;
  late TextEditingController _perfusiSerebralController;
  late TextEditingController _pupilController;
  late TextEditingController _reflekCahayaController;
  late TextEditingController _perfusiRenalController;
  late TextEditingController _gastroitestinalController;
  late TextEditingController _abdomenController;
  late TextEditingController _kenyamananController;
  late TextEditingController _statusMentalController;
  late TextEditingController _kejangController;
  late TextEditingController _pasangPengamatanController;
  late TextEditingController _bicaraController;
  late TextEditingController _responseEmosiController;
  late TextEditingController _penglihatanController;
  late TextEditingController _belMudahDijangkauController;
  late TextEditingController _hambatanBahasaController;
  late TextEditingController _caraBelajarDisukaiController;
  late TextEditingController _hamilController;
  late TextEditingController _kondisiLingkunganDirumahController;
  late TextEditingController _kualitasController;
  late TextEditingController _kunjunganPemimpinController;
  late TextEditingController _mamoTerakhirController;
  late TextEditingController _menjalankanIbadahController;
  late TextEditingController _nilaiAturanKhususController;
  late TextEditingController _nyeriMempegaruhiController;
  late TextEditingController _pemeriksaanCervixTerakhir;
  late TextEditingController _pemeriksaanPayudaraSendiri;
  late TextEditingController _pendengaranController;
  late TextEditingController _penggunaAlatKontrasepsiController;
  late TextEditingController _perluPenerjemahController;
  late TextEditingController _polaController;
  late TextEditingController _potensialKebutuhanPembelajaranController;
  late TextEditingController _presepsiTerhadapSakitController;
  late TextEditingController _sistemSosialController;
  late TextEditingController _thermoregulasiController;
  late TextEditingController _tingkatBersamaController;
  late TextEditingController _tingkatPendidikanController;
  late TextEditingController _mandiController;
  late TextEditingController _berpakaianController;
  late TextEditingController _makanAtauMinumController;
  late TextEditingController _eliminasiController;
  late TextEditingController _mobilisasiController;

  late TextEditingController _sistemEliminasiController;
  late TextEditingController _sistemMakanController;
  late TextEditingController _sistemMobilisasiController;
  late TextEditingController _masalahDenganNutrisiController;

  @override
  void dispose() {
    _mandiController.clear();
    _berpakaianController.clear();
    _makanAtauMinumController.clear();
    _eliminasiController.clear();
    _mobilisasiController.clear();

    _sistemEliminasiController.clear();
    _sistemMakanController.clear();
    _sistemMobilisasiController.clear();
    _masalahDenganNutrisiController.clear();

    _airWayController.clear();
    _tingkatPendidikanController.clear();
    _tingkatBersamaController.clear();
    _thermoregulasiController.clear();
    _potensialKebutuhanPembelajaranController.clear();
    _sistemSosialController.clear();
    _presepsiTerhadapSakitController.clear();
    _polaController.clear();
    _perluPenerjemahController.clear();
    _penggunaAlatKontrasepsiController.clear();
    _pemeriksaanPayudaraSendiri.clear();
    _pendengaranController.clear();
    _pemeriksaanCervixTerakhir.clear();
    _nyeriMempegaruhiController.clear();
    _nilaiAturanKhususController.clear();
    _menjalankanIbadahController.clear();
    _kunjunganPemimpinController.clear();
    _mamoTerakhirController.clear();
    _kualitasController.clear();
    _kondisiLingkunganDirumahController.clear();
    _hamilController.clear();
    _caraBelajarDisukaiController.clear();
    _belMudahDijangkauController.clear();
    _hambatanBahasaController.clear();
    _penglihatanController.clear();
    _brethingController.clear();
    _circulationController.clear();
    _nutrisiDanHidrasiController.clear();
    _masalahYangBerhubunganController.clear();
    _makanController.clear();
    _padaBayiController.clear();
    _minumController.clear();
    _eliminasiBakController.clear();
    _eliminasiBabController.clear();
    _tidurAtauIstirahatController.clear();
    _aktivitasController.clear();
    _berjalanController.clear();
    _penggunaanAlatBantuController.clear();
    _perfusiSerebralController.clear();
    _pupilController.clear();
    _reflekCahayaController.clear();
    _perfusiRenalController.clear();
    _gastroitestinalController.clear();
    _abdomenController.clear();
    _kenyamananController.clear();
    _statusMentalController.clear();
    _kejangController.clear();
    _pasangPengamatanController.clear();
    _bicaraController.clear();
    _responseEmosiController.clear();
    _thermoregulasiController.dispose();
    _penglihatanController.dispose();
    _brethingController.dispose();
    _circulationController.dispose();
    _nutrisiDanHidrasiController.dispose();
    _masalahYangBerhubunganController.dispose();
    _makanController.dispose();
    _padaBayiController.dispose();
    _minumController.dispose();
    _eliminasiBakController.dispose();
    _eliminasiBabController.dispose();
    _tidurAtauIstirahatController.dispose();
    _aktivitasController.dispose();
    _berjalanController.dispose();
    _penggunaanAlatBantuController.dispose();
    _perfusiSerebralController.dispose();
    _pupilController.dispose();
    _hamilController.dispose();
    _reflekCahayaController.dispose();
    _perfusiRenalController.dispose();
    _gastroitestinalController.dispose();
    _abdomenController.dispose();
    _kenyamananController.dispose();
    _statusMentalController.dispose();
    _kejangController.dispose();
    _pasangPengamatanController.dispose();
    _bicaraController.dispose();
    _responseEmosiController.dispose();
    _belMudahDijangkauController.dispose();
    _caraBelajarDisukaiController.dispose();
    _kondisiLingkunganDirumahController.dispose();
    _kualitasController.dispose();
    _kunjunganPemimpinController.dispose();
    _mamoTerakhirController.dispose();
    _menjalankanIbadahController.dispose();
    _nilaiAturanKhususController.dispose();
    _nyeriMempegaruhiController.dispose();
    _pemeriksaanCervixTerakhir.dispose();
    _pemeriksaanPayudaraSendiri.dispose();
    _pendengaranController.dispose();
    _penggunaAlatKontrasepsiController.dispose();
    _perluPenerjemahController.dispose();
    _polaController.dispose();
    _potensialKebutuhanPembelajaranController.dispose();
    _presepsiTerhadapSakitController.dispose();
    _sistemSosialController.dispose();
    _tingkatBersamaController.dispose();
    _tingkatPendidikanController.dispose();

    _mandiController.dispose();
    _berpakaianController.dispose();
    _makanAtauMinumController.dispose();
    _eliminasiController.dispose();
    _mobilisasiController.dispose();

    _sistemEliminasiController.dispose();
    _sistemMakanController.dispose();
    _sistemMobilisasiController.dispose();
    _masalahDenganNutrisiController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _sistemEliminasiController = TextEditingController();
    _sistemMakanController = TextEditingController();
    _sistemMobilisasiController = TextEditingController();
    _masalahDenganNutrisiController = TextEditingController();

    _mandiController = TextEditingController();
    _berpakaianController = TextEditingController();
    _makanAtauMinumController = TextEditingController();
    _eliminasiController = TextEditingController();
    _mobilisasiController = TextEditingController();

    _responseEmosiController = TextEditingController();
    _airWayController = TextEditingController();
    _brethingController = TextEditingController();
    _circulationController = TextEditingController();
    _nutrisiDanHidrasiController = TextEditingController();
    _masalahYangBerhubunganController = TextEditingController();
    _makanController = TextEditingController();

    _padaBayiController = TextEditingController();
    _minumController = TextEditingController();
    _eliminasiBakController = TextEditingController();
    _eliminasiBabController = TextEditingController();
    _tidurAtauIstirahatController = TextEditingController();
    _aktivitasController = TextEditingController();
    _berjalanController = TextEditingController();
    _penggunaanAlatBantuController = TextEditingController();
    _perfusiSerebralController = TextEditingController();
    _pupilController = TextEditingController();
    _reflekCahayaController = TextEditingController();
    _perfusiRenalController = TextEditingController();
    _gastroitestinalController = TextEditingController();
    _abdomenController = TextEditingController();
    _kenyamananController = TextEditingController();
    _statusMentalController = TextEditingController();
    _kejangController = TextEditingController();
    _pasangPengamatanController = TextEditingController();
    _bicaraController = TextEditingController();

    _penglihatanController = TextEditingController();
    _belMudahDijangkauController = TextEditingController();
    _hambatanBahasaController = TextEditingController();
    _caraBelajarDisukaiController = TextEditingController();
    _hamilController = TextEditingController();
    _kondisiLingkunganDirumahController = TextEditingController();
    _kualitasController = TextEditingController();
    _kunjunganPemimpinController = TextEditingController();
    _mamoTerakhirController = TextEditingController();
    _menjalankanIbadahController = TextEditingController();
    _nilaiAturanKhususController = TextEditingController();
    _nyeriMempegaruhiController = TextEditingController();
    _pemeriksaanCervixTerakhir = TextEditingController();
    _pemeriksaanPayudaraSendiri = TextEditingController();
    _pendengaranController = TextEditingController();
    _penggunaAlatKontrasepsiController = TextEditingController();
    _perluPenerjemahController = TextEditingController();
    _polaController = TextEditingController();
    _potensialKebutuhanPembelajaranController = TextEditingController();
    _presepsiTerhadapSakitController = TextEditingController();
    _sistemSosialController = TextEditingController();
    _thermoregulasiController = TextEditingController();
    _tingkatBersamaController = TextEditingController();
    _tingkatPendidikanController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PemeriksaanFisikIcuBloc, PemeriksaanFisikIcuState>(
      listener: (context, state) {
        if (state.status == PemeriksaanFisikIcuStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != PemeriksaanFisikIcuStatus.isLoadingSave) {
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
        if (state.status == PemeriksaanFisikIcuStatus.isLoadingGet) {
          return SizedBox(
              width: Get.width,
              height: Get.height,
              child: ShimerLoading.loadingExpandCard(
                  baseColor: Colors.white.withOpacity(0.5),
                  highLightColor: Colors.lightBlue.withOpacity(0.1)));
        }
        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              // SIMPAN DART
              dynamic data = await deviceInfo.initPlatformState();

              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context
                    .read<PemeriksaanFisikIcuBloc>()
                    .add(OnSavePengkajianPersistemICU(
                      kodeDokter: singlePasien.first.kdDokter,
                      deviceID: "ID-${data['id']}-${data['device']}",
                      pengkajianPersistemIcuModel: PengkajianPersistemIcuModel(
                        berpakaian: _berpakaianController.text,
                        mandi: _mandiController.text,
                        sistemEliminasi: _sistemEliminasiController.text,
                        sistemMakan: _sistemMakanController.text,
                        sistemMasalahDenganNutrisi:
                            _masalahDenganNutrisiController.text,
                        sistemMobilisasi: _sistemMobilisasiController.text,
                        abdomen: _abdomenController.text,
                        airway: _airWayController.text,
                        aktivitas: _aktivitasController.text,
                        aktivitasIstirahat: _aktivitasController.text,
                        circulation: _circulationController.text,
                        bahasaSehariHari: _circulationController.text,
                        berjalan: _berjalanController.text,
                        bicara: _bicaraController.text,
                        eliminasiBab: _eliminasiBabController.text,
                        eliminasiBak: _eliminasiBakController.text,
                        makan: _makanController.text,
                        breathing: _brethingController.text,
                        kenyamanan: _kenyamananController.text,
                        minum: _minumController.text,
                        nutrisi: _nutrisiDanHidrasiController.text,
                        nilaiKepercayaan: _nutrisiDanHidrasiController.text,
                        bahasaIsyarat: _tidurAtauIstirahatController.text,
                        kejang: _kejangController.text,
                        padaBayi: _padaBayiController.text,
                        pasangPengamanTempatTidur:
                            _pasangPengamatanController.text,
                        pefusiGastroinestinal: _perfusiRenalController.text,
                        pupil: _pupilController.text,
                        statusMental: _statusMentalController.text,
                        refleksCahaya: _reflekCahayaController.text,
                        responseEmosi: _responseEmosiController.text,
                        penglihatan: _penglihatanController.text,
                        belMudaDijangkau: _belMudahDijangkauController.text,
                        hambatanBelajar: _hambatanBahasaController.text,
                        caraBelajarDisukai: _caraBelajarDisukaiController.text,
                        hamil: _hamilController.text,
                        kondisiLingkunganDirumah:
                            _kondisiLingkunganDirumahController.text,
                        kualitas: _kualitasController.text,
                        kunjunganPemimpin: _kunjunganPemimpinController.text,
                        mamografiTerakhirTanggal: _mamoTerakhirController.text,
                        menjalankanIbadah: _menjalankanIbadahController.text,
                        nilaiAturanKhusus: _nilaiAturanKhususController.text,
                        nyeriMempengaruhi: _nyeriMempegaruhiController.text,
                        pemeriksaanCervixTerakhir:
                            _pemeriksaanCervixTerakhir.text,
                        pemeriksaanPayudaraSendiri:
                            _pemeriksaanPayudaraSendiri.text,
                        pendengaran: _pendengaranController.text,
                        penggunaanAlatBantu:
                            _penggunaanAlatBantuController.text,
                        penggunaanAlatKontrasepsi:
                            _penggunaAlatKontrasepsiController.text,
                        perfusiRenal: _perfusiRenalController.text,
                        perfusiSerebral: _perfusiRenalController.text,
                        perluPenerjemah: _perluPenerjemahController.text,
                        pola: _polaController.text,
                        potensialKebutuhanPembelajaran:
                            _potensialKebutuhanPembelajaranController.text,
                        presepsiTerhadapSakit:
                            _presepsiTerhadapSakitController.text,
                        sistemSosial: _sistemSosialController.text,
                        thermoregulasi: _thermoregulasiController.text,
                        tingkatBersama: _tingkatBersamaController.text,
                        tingkatPendidikan: _tingkatPendidikanController.text,
                      ),
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person),
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                    ));

                // ngasih hp sama BENDA TAJAM AJA
                context.read<PemeriksaanFisikIcuBloc>().add(
                    OnGetPemeriksaanFisikICU(
                        noReg: singlePasien.first.noreg,
                        person: toPerson(person: authState.user.person)));
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
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 10.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // PERNKAJIAN
                      TitleWidget.headerTitle(title: "PENGKAJIAN PRIMER"),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "AIRWAY",
                          padding: 5.sp,
                          widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              itemHeight: 15.sp,
                              suggestionStyle: blackTextStyle,
                              suggestions: airWay
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
                              controller: _airWayController
                                ..text = state.pengkajianPersistemICU.airway,
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
                          title: "BREATHING",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: breathing
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
                            controller: _brethingController
                              ..text = state.pengkajianPersistemICU.breathing,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "CIRCULATION",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: circulation
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
                            controller: _circulationController
                              ..text = state.pengkajianPersistemICU.circulation,
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
                          )),

                      TitleWidget.headerTitle(title: "PENGKAJIAN SEKUNDER"),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Nutrisi & Hidrasi",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: nutrisiDanHidrasi
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
                              ..text = state.pengkajianPersistemICU.nutrisi,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Masalah yang berhubungan dengan nutrisi",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: masalahYangBerhubunganDenganNutrisi
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _masalahDenganNutrisiController
                              ..text = state.pengkajianPersistemICU
                                  .sistemMasalahDenganNutrisi,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Makan",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: makan
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _makanController
                              ..text = state.pengkajianPersistemICU.makan,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Pada Bayi",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: padaBayi
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _padaBayiController
                              ..text = state.pengkajianPersistemICU.padaBayi,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Minum",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: minum
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _minumController
                              ..text = state.pengkajianPersistemICU.minum,
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
                          )),

                      TitleWidget.headerTitle(title: "ELIMINASI DAN PELEPASAN"),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Eliminasi BAK",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: eliminasiBAK
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _eliminasiBakController
                              ..text =
                                  state.pengkajianPersistemICU.eliminasiBak,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Eliminasi BAB",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: eliminasiBAB
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _eliminasiBabController
                              ..text =
                                  state.pengkajianPersistemICU.eliminasiBab,
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
                          )),

                      TitleWidget.headerTitle(title: "AKTIVITAS / ISTIRAHAT"),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Tidur/Istirahat",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: tidurAtauIstrirahat
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _tidurAtauIstirahatController
                              ..text = state.pengkajianPersistemICU
                                  .pasangPengamanTempatTidur,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Aktivitas",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: aktivitas
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _aktivitasController
                              ..text = state.pengkajianPersistemICU.aktivitas,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Berjalan",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: berjalan
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _berjalanController
                              ..text = state.pengkajianPersistemICU.berjalan,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Penggunaan\nAlat Bantu",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: penggunaanAlatBantu
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _penggunaanAlatBantuController
                              ..text = state
                                  .pengkajianPersistemICU.penggunaanAlatBantu,
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
                          )),

                      TitleWidget.headerTitle(title: "SKOR AKTIVITAS"),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Mandi",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: skorAktifitas
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _mandiController
                              ..text = state.pengkajianPersistemICU.mandi,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Berpakaian",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: skorAktifitas
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _berpakaianController
                              ..text = state.pengkajianPersistemICU.berpakaian,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Makan/minum",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: skorAktifitas
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _makanAtauMinumController
                              ..text = state.pengkajianPersistemICU.makan,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Eliminasi",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: skorAktifitas
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _sistemEliminasiController
                              ..text =
                                  state.pengkajianPersistemICU.sistemEliminasi,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Mobilisasi di TT",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: skorAktifitas
                                .map(
                                  (e) => SearchFieldListItem(
                                    e,
                                    item: e.toUpperCase(),
                                    child: Container(
                                      width: Get.width,
                                      color: ThemeColor.whiteColor,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp)),
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (x) {
                              return null;
                            },
                            controller: _sistemMobilisasiController
                              ..text =
                                  state.pengkajianPersistemICU.sistemMobilisasi,
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
                          )),

                      TitleWidget.headerTitle(title: "PERFUSI SEREBRAL"),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Perfusi Serebral",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: perfusiSecebral
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
                            controller: _perfusiSerebralController
                              ..text =
                                  state.pengkajianPersistemICU.perfusiSerebral,
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
                          )),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Pupil",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: circulation
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
                            controller: _pupilController
                              ..text = state.pengkajianPersistemICU.pupil,
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
                          )),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Reflek Cahaya",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: reflekCahaya
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
                            controller: _reflekCahayaController
                              ..text =
                                  state.pengkajianPersistemICU.refleksCahaya,
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
                          )),
                      TitleWidget.headerTitle(title: "PERFUSI RENAL"),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Perfusi Renal",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: perfusiRenal
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
                            controller: _perfusiRenalController
                              ..text =
                                  state.pengkajianPersistemICU.perfusiRenal,
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
                          )),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "PERFUSI GASTROINTESTINAL",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: perfusiRenal
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
                            controller: _gastroitestinalController
                              ..text = state
                                  .pengkajianPersistemICU.pefusiGastroinestinal,
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
                          )),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Abdomen",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: abdomen
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
                              ..text = state.pengkajianPersistemICU.abdomen,
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
                          )),
                      TitleWidget.headerTitle(title: "KENYAMANAN"),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Kenyamanan",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: perfusiRenal
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
                            controller: _kenyamananController
                              ..text = state.pengkajianPersistemICU.kenyamanan,
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
                          )),

                      TitleWidget.headerTitle(title: "PROTEKSI"),
                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Status Mental",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: statusMental
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
                            controller: _statusMentalController
                              ..text =
                                  state.pengkajianPersistemICU.statusMental,
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
                          )),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Kejang",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: kejang
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
                            controller: _kejangController
                              ..text = state.pengkajianPersistemICU.kejang,
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
                          )),

                      TitleWidget.headerTitle(title: "Keamanan"),

                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Pasang pengamanan tempat tidur",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: kejang
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
                            controller: _pasangPengamatanController
                              ..text = state.pengkajianPersistemICU
                                  .pasangPengamanTempatTidur,
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
                          )),

                      TitleWidget.headerTitle(
                          title:
                              "KEBUTUHAN KOMUNIKASI/PENDIDIKAN DAN PENGAJARAN"),
                      //===bicara
                      TitleWidget.boxPemeriksaanFisikSugestion(
                          title: "Bicara",
                          padding: 5.sp,
                          widget: SearchField(
                            searchStyle: blackTextStyle,
                            enabled: true,
                            marginColor: ThemeColor.whiteColor,
                            itemHeight: 15.sp,
                            suggestionStyle: blackTextStyle,
                            suggestions: bicara
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
                            controller: _bicaraController
                              ..text = state.pengkajianPersistemICU.bicara,
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
                          )),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}

List<String> bicara = ["Normal", "Serangan awal gangguan bicara, kapan"];

List<String> bahasaSehariHari = [
  "Indonesia: aktif",
  "Bahasa Indonesia pasif",
  "Inggris aktif",
  "Inggris pasif"
];

List<String> perluPenerjemah = ["Tidak", "Ya; bahasa"];

List<String> bahasaIsyarat = ["Tidak", "Ya"];

List<String> hambatanBelajar = [
  "Bahasa",
  "Pendengaran",
  "Hilang memori",
  "Kognitif"
];

List<String> caraBelajarYangdisukai = [
  "Menulis",
  "Audio-visual/gambar",
  "Diskusi"
];

List<String> tingkatPendidikan = [
  "TK",
  "SD",
  "SMP",
  "SMA",
  "Akademi",
  "Sarjana",
  "Lainnya:......"
];

List<String> potensiKebutuhanPembelajaran = [
  "Proses penyakit",
  "Pengobatan/tindakan",
  "Therapi/Obat",
  "Nutrisi",
  "Lainnya"
];

List<String> responseEmosi = [
  "Takut terhadap theraphy/pembedahan/lingkungan RS",
  "Sedih",
  "Menangis",
  "Senang",
  "Tidak mampu menahan diri",
  "Cemas",
  "Rendah diri",
  "Gelisah",
  "Tenang",
  "Mudah tersinggung"
];

List<String> sistemSosial = [""];

List<String> pekerjaan = [
  "Wiraswasta",
  "Swasta",
  "PNS",
  "Pensiun",
];

List<String> tinggalBersama = [
  "Suami/Istri",
  "Orang tua",
  "Anak",
  "Teman",
  "Sendiri"
];

List<String> lingkunganDirumah = [
  "1 Lantai",
  "2 Lantai",
];

List<String> aksesMasukKeRumahAtauKamar = ["Ya", "Tidak"];

List<String> kamarMandiPadaSatuLantai = ["Ya", "Tidak"];

List<String> nilaiKepercayaan = ["Tidak Ada Keluhan"];

List<String> menjalankanIbadah = [
  "Selalu/Taat",
  "Kadang-kadang",
  "Tidak pernah"
];

List<String> presepsiTergadapSakit = [
  "Perasaan Bersalah",
  "Perasaan ditinggalkan Tuhan",
  ""
];

List<String> kunjunganPemimpinAgamaSpiritual = ["Menerima", "Menolak"];

List<String> nilaiAturanKhusus = ["Tidak ada", "Ada, jelaskan ......"];

List<String> pasangPengamanTempatTidur = ["Tidak", "Ya Keterangan"];

List<String> belMudahDijangkau = ["Ya", "Tidak keterangan"];

List<String> penglihatan = [
  "Tidak ada masalah",
  "Kacamata",
  "Lensa Kontak",
  "Buta",
  "Glaukoma",
  "Diplopia",
  "Mata Palsu"
];

List<String> pendengaran = [
  "Tidak ada masalah",
  "Tuli",
  "Terbatas",
  "Nyeri",
  "Tinitus",
  "Alat Bantu",
  "Pengeluaran cairan dari telinga",
  "Kapan terjadinya kehilangan pendengaran"
];

List<String> hamil = [
  "Tidak",
  "Ya",
  "Tidak tahu      Tanggal haid terakhir : ......"
];

List<String> pemeriksaanCervixTerakhir = [""];

List<String> pemeriksaanPayudaraSendiri = ["Tidak", "Ya"];

List<String> mamografiTerakhirTanggal = [];

List<String> penggunaanAlatKontrasepsi = ["Tidak", "Ya Jenis"];

List<String> airWay = [
  "Tidak ada keluhan",
  "Sumbatan Total",
  "Sumbatan Parsial",
  "Benda Asing",
  "Sputum",
  "Darah",
  "Lendir",
  "Batuk Tidak Efektif",
  "Ronchi",
  "Rales",
  "Wheezing",
  "Stridor",
  "Grugling",
  "Terpasang alat bantu nafas"
];

List<String> breathing = [
  "Tidak Ada Keluhan",
  "SPO2  ",
  "Respirasi Rate ",
  "Chyne stoke",
  "Biot",
  "Kusmaul",
  "Orthopnea",
  "Apnea",
  "Mengeluh sesak nafas",
  "Penggunaan Otot bantu nafas",
  "Perubahan irama dan frekuensi pernafasan",
  "Untuk bayi : Nilai APGAR  ",
  "Peningkatan penggunaan otot bantu nafas",
  "Penurunan tekanan inspirasi/ekspirasi",
  "Peningkatan denyut jantung",
  "Peningkatan kegelisahan",
  "Sianosis (pada neonatus)",
  "Penggunaan alat bantu nafas (ABN) hari ke    Mode    FiO2...     VT...   PEEP .... RR ..... PS .....",
  "Menyatakan nafas tidak nyaman",
  "Pengungkapan perasaan tentang meningkatnya kebutuhan oksigen",
  "Keletihan",
  "Gelisah",
  "Diaforesis",
  "Tidak ada koordinasi"
];

List<String> circulation = ["Tidak ada keluhan"];

List<String> perubahanDenyutJantung = [
  "Denyut nadi lemah",
  "Disritmia",
];

List<String> perubahanPreload = ["Distensi JVP", "Edema"];

List<String> perubahanAfterLoad = [
  "Kulit dingin/lembab",
  "Pengisian Kapiler >3 dt",
  "Sianosis",
  "Dispnea",
  "Oliguria"
];

List<String> masalahYangBerhubunganDenganNutrisi = [
  "Malnutrisi",
  "Obesitas",
  "Nausea",
  "Vomitus",
  "Hamil/menyusui",
  "Mendapat kemotherapi"
];

List<String> makan = [
  "Sulit menelan",
  "Tak nafsu makan",
  "Tidak mampu mengunyah",
  "Nutrisi pengganti",
  "Diet saat ini",
  "Makanan kesukaan"
];

List<String> padaBayi = [
  "Refleks hisap/menelan lemah",
  "Tak nafsu makan",
  "Tidak mampu mengunyah",
  "Nutrisi pengganti",
  "Makan melalui NGT, No",
  "Diet saat ini",
  "Makanan kesukaan"
];

List<String> minum = [
  "Air Putih Jumlah :    cc/hari",
  "Merasa haus",
  "Penurunan jumlah urine",
  "Tugor kulit, ...",
  "Membran mukosa",
  "Luka bakar %derajat",
  "Edema"
];

List<String> eliminasiBAK = [
  "Tidak ada keluhan",
  "Inkontinesia urine",
  "Frekuensi berkemih .......x/hari",
  "Nyeri saat berkemih",
  "Jumlah Urine  .....c",
  "Warna Urine",
  "Hematuria",
  "Disuria",
  "Nokturia",
  "Urine menetes",
  "Distensi blader",
  "Perasaan penuh pada kandung kemih",
  "Cathether no"
];

List<String> eliminasiBAB = [
  "Tidak ada keluhan",
  "Konstipasi",
  "Diare",
  "Melena",
  "Frekuensi",
  "Konsitensi",
  "Peristaltik",
  "Teraba massa pada abdomen dan rektum"
];

List<String> perfusiSerebral = [
  "Tidak ada keluhan",
  "Pusing",
  "Nyeri kepala",
  "Gelisah",
  "Mual",
  "Muntah",
  "Penurunan Kesadaran"
];

List<String> pupil = [
  "Ka ....mm/Ki....mm",
  "Isokor",
  "Anisokor",
];

List<String> reflekCahaya = [
  "Kanan Positif",
  "Kanan Negatif",
  "Kiri Positif",
  "Kiri Negatif"
];

List<String> perfusiRenal = [
  "Tidak ada keluhan",
  "Perubahan B.A.K",
  "Diuresis",
  "Oliguri",
  "Anuri",
  "Peningkatan BUN/Kreatinin"
];

List<String> tidurAtauIstrirahat = [
  "Tidak ada keluhan",
  "Jumlah tidur ..... jam",
  "Sering terbangun karena ....."
];

List<String> aktivitas = [
  "Mandiri",
  "Bantu sebagian",
  "Perlu pengawasan",
  "Bantu total"
];

List<String> berjalan = [
  "Tidak ada masalah",
  "Penurunan Kekuatan",
  "Penurunan ROM",
  "Sering Fraktur Lokasi"
];

List<String> penggunaanAlatBantu = [
  "Tidak",
  "Ya, jika menggunakan Walker",
  "Ya, jika menggunakan Tongkat",
  "Ya, jika menggunakan Kursi roda"
];

List<String> skorAktifitas = ["1", "2", "3", "4"];

List<String> kualitas = [
  "Terbakar",
  "Tumpul",
  "Tertelan",
  "Kram",
  "Berat",
  "Tajam"
];

List<String> pola = ["Menetap", "Hilang timbul"];

List<String> nyeriMempengaruhi = [
  "Tidur",
  "Aktivitas fisik",
  "Emosi",
  "Nafsu makan",
  "Konsentrasi"
];

List<String> statusMental = [
  "Orientasi",
  "Agitasi",
  "Menyerang",
  "Tak ada respon",
  "Letargi",
  "Kooperatif",
  "Disorientasi"
];

List<String> kejang = ["Tidak", "Ya, type ....... frekuensi......"];
