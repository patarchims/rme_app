import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_persistem_keperawatan/pengkajian_persistem_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/pengkajian_keperawatan_persistem_repository.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PengkajianPersistemKeperawatanPageWidget extends StatefulWidget {
  const PengkajianPersistemKeperawatanPageWidget({super.key});

  @override
  State<PengkajianPersistemKeperawatanPageWidget> createState() =>
      _PengkajianPersistemPageWidgetState();
}

class _PengkajianPersistemPageWidgetState
    extends State<PengkajianPersistemKeperawatanPageWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _eliminasiBAKController;
  late TextEditingController _nutrisiController;
  late TextEditingController _eliminasiBABController;
  late TextEditingController _tidurAtauIstirahatController;
  late TextEditingController _aktivitasController;
  late TextEditingController _mandiController;
  late TextEditingController _berpakaianController;
  late TextEditingController _makanAtauMandiController;
  late TextEditingController _eliminasiController;
  late TextEditingController _mobilisasiController;
  late TextEditingController _kardiovaskulerController;
  late TextEditingController _respiratoriController;
  late TextEditingController _secebralController;
  late TextEditingController _sakitKepalaController;
  late TextEditingController _perubahanStatusMentalController;
  late TextEditingController _thermoregulasiController;
  late TextEditingController _perfusiPrefierController;
  late TextEditingController _sistemPencernaanController;
  late TextEditingController _integumenController;
  late TextEditingController _kenyamananController;
  late TextEditingController _statusMentalController;
  late TextEditingController _papsSmerController;
  late TextEditingController _hamilController;
  late TextEditingController _pendarahanController;
  late TextEditingController _hambatanBahasaController;
  late TextEditingController _caraBelajaryangDisukasiController;
  late TextEditingController _bahasaSeharihariController;
  late TextEditingController _perluPenerjemahController;
  late TextEditingController _spikologisController;
  late TextEditingController _hambatanSosialController;
  late TextEditingController _hambatanEkonomiController;
  late TextEditingController _hambatanSpiritualController;
  late TextEditingController _responseEmosiController;
  late TextEditingController _nilaiKepercayaanController;
  late TextEditingController _presepsiTerhadapSakitController;
  late TextEditingController _aturanKhususDalamKepercayaanController;
  late TextEditingController _pencernaahUsusController;
  late TextEditingController _anggotaGerakController;
  late TextEditingController _bicaraController;
  late TextEditingController _riwayatHipertensiController;
  late TextEditingController _kekuatanOtotController;
  late TextEditingController _akralController;
  late TextEditingController _batukController;
  late TextEditingController _suaraNapasController;
  late TextEditingController _merokokController;

  @override
  void initState() {
    _eliminasiBAKController = TextEditingController();
    _nutrisiController = TextEditingController();
    _riwayatHipertensiController = TextEditingController();
    _perubahanStatusMentalController = TextEditingController();
    _sakitKepalaController = TextEditingController();
    _eliminasiBABController = TextEditingController();
    _pencernaahUsusController = TextEditingController();
    _tidurAtauIstirahatController = TextEditingController();
    _aktivitasController = TextEditingController();
    _mandiController = TextEditingController();
    _berpakaianController = TextEditingController();
    _makanAtauMandiController = TextEditingController();
    _eliminasiController = TextEditingController();
    _mobilisasiController = TextEditingController();
    _kardiovaskulerController = TextEditingController();
    _respiratoriController = TextEditingController();
    _secebralController = TextEditingController();
    _thermoregulasiController = TextEditingController();
    _perfusiPrefierController = TextEditingController();
    _sistemPencernaanController = TextEditingController();
    _integumenController = TextEditingController();
    _kenyamananController = TextEditingController();
    _statusMentalController = TextEditingController();
    _papsSmerController = TextEditingController();
    _hamilController = TextEditingController();
    _pendarahanController = TextEditingController();
    _hambatanBahasaController = TextEditingController();
    _caraBelajaryangDisukasiController = TextEditingController();
    _bahasaSeharihariController = TextEditingController();
    _spikologisController = TextEditingController();
    _hambatanSosialController = TextEditingController();
    _hambatanEkonomiController = TextEditingController();
    _hambatanSpiritualController = TextEditingController();
    _responseEmosiController = TextEditingController();
    _nilaiKepercayaanController = TextEditingController();
    _presepsiTerhadapSakitController = TextEditingController();
    _aturanKhususDalamKepercayaanController = TextEditingController();
    _perluPenerjemahController = TextEditingController();
    _anggotaGerakController = TextEditingController();
    _anggotaGerakController = TextEditingController();
    _bicaraController = TextEditingController();
    _kekuatanOtotController = TextEditingController();

    _akralController = TextEditingController();
    _batukController = TextEditingController();
    _suaraNapasController = TextEditingController();
    _merokokController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _bicaraController.dispose();
    _anggotaGerakController.dispose();
    _perluPenerjemahController.clear();
    _eliminasiBABController.clear();
    _eliminasiBAKController.clear();
    _riwayatHipertensiController.clear();
    _kekuatanOtotController.clear();
    _nutrisiController.clear();

    _perubahanStatusMentalController.clear();
    _sakitKepalaController.clear();
    _pencernaahUsusController.clear();

    _tidurAtauIstirahatController.clear();
    _aktivitasController.clear();
    _mandiController.clear();
    _berpakaianController.clear();
    _makanAtauMandiController.clear();
    _eliminasiController.clear();
    _mobilisasiController.clear();
    _kardiovaskulerController.clear();
    _respiratoriController.clear();
    _secebralController.clear();
    _thermoregulasiController.clear();
    _perfusiPrefierController.clear();
    _sistemPencernaanController.clear();
    _integumenController.clear();
    _kenyamananController.clear();
    _statusMentalController.clear();
    _papsSmerController.clear();
    _hamilController.clear();
    _pendarahanController.clear();
    _hambatanBahasaController.clear();
    _caraBelajaryangDisukasiController.clear();
    _bahasaSeharihariController.clear();
    _spikologisController.clear();
    _hambatanSosialController.clear();
    _hambatanEkonomiController.clear();
    _hambatanSpiritualController.clear();
    _responseEmosiController.clear();
    _nilaiKepercayaanController.clear();
    _presepsiTerhadapSakitController.clear();
    _aturanKhususDalamKepercayaanController.clear();

    _akralController.clear();
    _batukController.clear();
    _suaraNapasController.clear();
    _merokokController.clear();

    // ===============
    _eliminasiBAKController.dispose();
    _nutrisiController.dispose();
    _riwayatHipertensiController.dispose();
    _perubahanStatusMentalController.dispose();
    _sakitKepalaController.dispose();
    _eliminasiBABController.dispose();
    _perluPenerjemahController.dispose();

    _tidurAtauIstirahatController.dispose();
    _aktivitasController.dispose();
    _mandiController.dispose();
    _berpakaianController.dispose();
    _makanAtauMandiController.dispose();
    _eliminasiController.dispose();
    _mobilisasiController.dispose();
    _kardiovaskulerController.dispose();
    _respiratoriController.dispose();
    _secebralController.dispose();
    _thermoregulasiController.dispose();
    _perfusiPrefierController.dispose();
    _sistemPencernaanController.dispose();
    _integumenController.dispose();
    _kenyamananController.dispose();
    _statusMentalController.dispose();
    _papsSmerController.dispose();
    _hamilController.dispose();
    _pendarahanController.dispose();
    _hambatanBahasaController.dispose();
    _caraBelajaryangDisukasiController.dispose();
    _bahasaSeharihariController.dispose();
    _spikologisController.dispose();
    _hambatanSosialController.dispose();
    _hambatanEkonomiController.dispose();
    _hambatanSpiritualController.dispose();
    _responseEmosiController.dispose();
    _nilaiKepercayaanController.dispose();
    _presepsiTerhadapSakitController.dispose();
    _aturanKhususDalamKepercayaanController.dispose();
    _akralController.dispose();
    _batukController.dispose();
    _suaraNapasController.dispose();
    _merokokController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PengkajianPersistemKeperawatanBloc,
        PengkajianPersistemKeperawatanState>(
      listener: (context, state) {
        // ================ //
        if (state.status ==
            PengkajianPersistemKeperawatanStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status ==
            PengkajianPersistemKeperawatanStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResultFailure.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) {
                      // FAILUERE
                    }),
                (r) => r.maybeMap(
                      orElse: () {
                        // ==== //
                      },
                      loaded: (value) async {
                        // LOADED
                        MetaModel meta =
                            MetaModel.fromJson(value.value["metadata"]);

                        if (authState is Authenticated) {
                          context
                              .read<PengkajianPersistemKeperawatanBloc>()
                              .add(OnGetPengkajianPersistem(
                                  noReg: singlePasien.first.noreg,
                                  noRM: singlePasien.first.mrn,
                                  person:
                                      toPerson(person: authState.user.person)));
                        }
                        final shouldPop = await Alert.loaded(context,
                            subTitle: meta.message, title: "Pesan");
                        return shouldPop ?? false;
                      },
                    )));

        /// === ///
      },
      builder: (context, state) {
        if (state.status == PengkajianPersistemKeperawatanStatus.isLoadingGet) {
          return HeaderContentWidget(
            widget: Loading.expandedLoading(),
          );
        }
        return HeaderContentWidget(
          backgroundColor: ThemeColor.softBlue,
          isENableAdd: true,
          onPressed: () async {
            if (authState is Authenticated) {
              dynamic data = await deviceInfo.initPlatformState();
              // ignore: use_build_context_synchronously
              context.read<PengkajianPersistemKeperawatanBloc>().add(
                  OnSavePengkajianPersistemKeperawatan(
                      pengkajianKeperawatanPesistemModel:
                          PengkajianKeperawatanPesistemModel(
                              nutrisi: _nutrisiController.text,
                              akral: _akralController.text,
                              batuk: _batukController.text,
                              merokok: _merokokController.text,
                              suaraNapas: _suaraNapasController.text,
                              kekuatanOtot: _kekuatanOtotController.text,
                              anggotaGerak: _anggotaGerakController.text,
                              bicara: _bicaraController.text,
                              perubahanStatusMental:
                                  _perubahanStatusMentalController.text,
                              riwayatHipertensi:
                                  _riwayatHipertensiController.text,
                              sakitKepala: _sakitKepalaController.text,
                              sistemusus: _pencernaahUsusController.text,
                              penerjemah: _perluPenerjemahController.text,
                              eliminasiBak: _eliminasiBAKController.text,
                              eliminasiBab: _eliminasiBABController.text,
                              istirahat: _tidurAtauIstirahatController.text,
                              aktivitas: _aktivitasController.text,
                              mandi: _mandiController.text,
                              berpakaian: _berpakaianController.text,
                              makan: _makanAtauMandiController.text,
                              eliminasi: _eliminasiController.text,
                              mobilisasi: _mobilisasiController.text,
                              kardiovaskuler: _kardiovaskulerController.text,
                              respiratori: _respiratoriController.text,
                              secebral: _secebralController.text,
                              perfusiPerifer: _perfusiPrefierController.text,
                              pencernaan: _sistemPencernaanController.text,
                              integumen: _integumenController.text,
                              kenyamanan: _kenyamananController.text,
                              proteksi: _statusMentalController.text,
                              papsSmer: _papsSmerController.text,
                              hamil: _hamilController.text,
                              pendarahan: _pendarahanController.text,
                              hambatanBahasa: _hambatanBahasaController.text,
                              caraBelajar:
                                  _caraBelajaryangDisukasiController.text,
                              bahasaSehari: _bahasaSeharihariController.text,
                              spikologis: _spikologisController.text,
                              hambatanSosial: _hambatanSosialController.text,
                              hambatanEkonomi: _hambatanEkonomiController.text,
                              spiritual: _hambatanSpiritualController.text,
                              responseEmosi: _responseEmosiController.text,
                              nilaiKepercayaan:
                                  _nilaiKepercayaanController.text,
                              presepsiSakit:
                                  _presepsiTerhadapSakitController.text,
                              khususKepercayaan:
                                  _aturanKhususDalamKepercayaanController.text,
                              thermoregulasi: _thermoregulasiController.text),
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person),
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      devicesID: "ID-${data['id']}-${data['device']}"));
            }
          },
          title: "Simpan",
          widget: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            radius: Radius.circular(5.sp),
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            trackVisibility: true,
            scrollbarOrientation: ScrollbarOrientation.right,
            controller: _scrollController, // <
            child: Container(
              margin: EdgeInsets.only(right: 10.sp),
              child: ListView(
                controller: _scrollController,
                children: [
                  // PERLEPASAN
                  TitleWidget.headerTitle(title: "NUTRISI DAN HIDRASI"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: nutrisiHidrasi
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
                      // CONTROLLER
                      controller: _nutrisiController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.nutrisi,
                      onSubmit: (value) {},
                      onSaved: (a) {},
                      searchInputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.8)),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    title: "NUTRISI",
                  ),
                  const Divider(),

                  TitleWidget.headerTitle(title: "ELIMINASI DAN PELEPASAN"),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
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
                      // CONTROLLER
                      controller: _eliminasiBAKController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.eliminasiBak,
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
                    title: "Eliminasi BAK",
                  ),
                  const Divider(),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
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
                      // CONTROLLER
                      controller: _eliminasiBABController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.eliminasiBab,
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
                    title: "Eliminasi BAB",
                  ),

                  TitleWidget.headerTitle(title: "AKTIVITAS / ISTIRAHAT"),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: aktivitasIstirahat
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
                      // CONTROLLER
                      controller: _tidurAtauIstirahatController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.istirahat,
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
                    title: "Tidur / Istirahat",
                  ),

                  const Divider(),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
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
                      // CONTROLLER
                      controller: _aktivitasController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.aktivitas,
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
                    title: "Aktivitas",
                  ),

                  const Divider(),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: skorAktivitas
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _mandiController
                        ..text = state.pengkajianKeperawatanPesistemModel.mandi,
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
                    title: "Mandi",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: skorAktivitas
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _berpakaianController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.berpakaian,
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
                    title: "Berpakaian",
                  ),

                  //====//
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: skorAktivitas
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _makanAtauMandiController
                        ..text = state.pengkajianKeperawatanPesistemModel.makan,
                      onSubmit: (value) {},
                      onSaved: (a) {},
                      searchInputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    title: "Makan/mandi",
                  ),

                  // === //
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: skorAktivitas
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _eliminasiController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.eliminasi,
                      onSubmit: (value) {},
                      onSaved: (a) {},
                      searchInputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    title: "Eliminasi",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: skorAktivitas
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _mobilisasiController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.mobilisasi,
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
                    title: "Mobilisasi di TT",
                  ),

                  //
                  TitleWidget.headerTitle(title: "SISTEM KARDIO-RESPIRATORI"),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: kardiovaSkuler
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _kardiovaskulerController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.kardiovaskuler,
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
                    title: "KARDIOVASKULER",
                  ),

                  const Divider(),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: akral
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _akralController
                        ..text = state.pengkajianKeperawatanPesistemModel.akral,
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
                    title: "AKRAL",
                  ),
                  const Divider(),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: kardiovaSkuler
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _batukController
                        ..text = state.pengkajianKeperawatanPesistemModel.batuk,
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
                    title: "BATUK",
                  ),
                  const Divider(),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: suaraNapas
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _suaraNapasController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.suaraNapas,
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
                    title: "SUARA NAPAS",
                  ),
                  const Divider(),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: merokok
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _merokokController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.merokok,
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
                    title: "MEROKOK",
                  ),

                  const Divider(),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: respiratori
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _respiratoriController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.respiratori,
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
                    title: "RESPIRATORI",
                  ),

                  TitleWidget.headerTitle(title: "SISTEM PERFUSI SECEBRAL"),

                  // == //
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: perfusiSecebral
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _secebralController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.secebral,
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
                    title: "SECEBRAL",
                  ),

                  // == //
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: sakitKepala
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _sakitKepalaController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.sakitKepala,
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
                    title: "SAKIT KEPALA",
                  ),

                  // == //
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: sakitKepala
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _perubahanStatusMentalController
                        ..text = state.pengkajianKeperawatanPesistemModel
                            .perubahanStatusMental,
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
                    title: "PERUBAHAN STATUS MENTAL",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: sakitKepala
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _anggotaGerakController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.anggotaGerak,
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
                    title: "LEMAH ANGGOTA GERAK",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: bicara
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _bicaraController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.bicara,
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
                    title: "BICARA",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: riwayatHipertensi
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _riwayatHipertensiController
                        ..text = state.pengkajianKeperawatanPesistemModel
                            .riwayatHipertensi,
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
                    title: "RIWAYAT HIPERTENSI",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: kekuatanOTOT
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _kekuatanOtotController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.kekuatanOtot,
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
                    title: "KEKUATAN OTOT",
                  ),

                  TitleWidget.headerTitle(title: "THERMOREGULASI"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: thermoregulasi
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _thermoregulasiController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.thermoregulasi,
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
                    title: "THERMOREGULASI",
                  ),

                  TitleWidget.headerTitle(title: "SISTEM PERFUSI PERIFER"),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: sistemPerfusiPerifer
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _perfusiPrefierController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.perfusiPerifer,
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
                    title: "PERFUSI PERIFER",
                  ),

                  TitleWidget.headerTitle(title: "SISTEM PENCERNAAN"),

                  // === //
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: sistemPencernaan
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _sistemPencernaanController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.pencernaan,
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
                    title: "SISTEM PENCERNAAN",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: sistemUsus
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _pencernaahUsusController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.sistemusus,
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
                    title: "BISING USUS",
                  ),

                  TitleWidget.headerTitle(title: "INTEGUMEN"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: integumen
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _integumenController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.integumen,
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
                    title: "INTEGUMEN",
                  ),

                  TitleWidget.headerTitle(title: "KENYAMANAN"),
                  // === //
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: kenyamanan
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _kenyamananController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.kenyamanan,
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
                    title: "KENYAMANAN",
                  ),

                  TitleWidget.headerTitle(title: "PROTEKSI"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: statusMental
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _statusMentalController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.proteksi,
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
                    title: "STATUS MENTAL",
                  ),

                  TitleWidget.headerTitle(title: "SEKSUAL & REPRODUKSI"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: pAPSSMER
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _papsSmerController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.papsSmer,
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
                    title: "PAPS SMER",
                  ),

                  const Divider(),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: hamil
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _hamilController
                        ..text = state.pengkajianKeperawatanPesistemModel.hamil,
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
                    title: "HAMIL",
                  ),

                  const Divider(),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: pendarahan
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _pendarahanController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.pendarahan,
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
                    title: "PENDARAHAN",
                  ),

                  TitleWidget.headerTitle(
                      title: "KOMUNIKASI / PENDIDIKAN PENGAJARAN"),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: hambatanBahasa
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _hambatanBahasaController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.hambatanBahasa,
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
                    title: "Hambatan Bahasa",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: caraBelajarYangDisukai
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _caraBelajaryangDisukasiController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.caraBelajar,
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
                    title: "Cara Belajar Yang Disukai",
                  ),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: bahasaSehariHari
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _bahasaSeharihariController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.bahasaSehari,
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
                    title: "Bahasa Sehari Hari",
                  ),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: perluPenerjemah
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _perluPenerjemahController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.penerjemah,
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
                    title: "Perlu Penerjemah",
                  ),

                  TitleWidget.headerTitle(
                      title: "DATA PSIKOLOGIS, SOSIAL , EKONOMI DAN SPIRITUAL"),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: spikologis
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      controller: _spikologisController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.spikologis,
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
                    title: "Psikologis",
                  ),

                  const Divider(),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: hambatanSosial
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _hambatanSosialController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.hambatanSosial,
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
                    title: "Hambatan Sosial",
                  ),

                  const Divider(),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: hambatanEkonomi
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _hambatanEkonomiController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.hambatanEkonomi,
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
                    title: "Hambatan Ekonomi",
                  ),

                  const Divider(),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: hambatanSpiritual
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _hambatanSpiritualController
                        ..text =
                            state.pengkajianKeperawatanPesistemModel.spiritual,
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
                    title: "Hambatan Spiritual",
                  ),

                  TitleWidget.headerTitle(title: "RESPONSE EMOSI"),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: responseEmosi
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _responseEmosiController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.responseEmosi,
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
                    title: "Response Emosi",
                  ),

                  TitleWidget.headerTitle(title: "NILAI KEPERCAYAAN"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: menjalankanIbadah
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _nilaiKepercayaanController
                        ..text = state.pengkajianKeperawatanPesistemModel
                            .nilaiKepercayaan,
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
                    title: "Nilai Kepercayaan\nMenjalankan Ibadah",
                  ),

                  const Divider(),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: presepsiTerhadapSakit
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _presepsiTerhadapSakitController
                        ..text = state
                            .pengkajianKeperawatanPesistemModel.presepsiSakit,
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
                    title: "Persepsi Terhadap Sakit",
                  ),

                  const Divider(),

                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: nilaiKepercayaan
                          .map(
                            (e) => SearchFieldListItem(
                              e.toString(),
                              item: e.toString().toUpperCase(),
                              child: Container(
                                width: Get.width,
                                color: ThemeColor.whiteColor,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  e.toString(),
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
                      // CONTROLLER
                      controller: _aturanKhususDalamKepercayaanController
                        ..text = state.pengkajianKeperawatanPesistemModel
                            .khususKepercayaan,
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
                    title: "Nilai/aturan Khusus dalam kepercayaan",
                  ),

                  SizedBox(height: 35.sp)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container skorAktifivas({required String title}) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(color: ThemeColor.bgColor),
      child: Table(
        border: TableBorder.all(color: ThemeColor.bgColor),
        columnWidths: const {
          1: FlexColumnWidth(3),
        },
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(fontSize: 6.sp),
              ),
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(color: ThemeColor.bgColor),
              child: Wrap(
                children: skorAktivitas.asMap().entries.map((e) {
                  return TitleWidget.boxChoose(
                    width: 50.sp,
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                    ),
                    title: e.value.toString(),
                  );
                }).toList(),
              ),
            )
          ]),
        ],
      ),
    );
  }
}

List<String> eliminasiBAK = [
  "TAK",
  "Sering BAK",
];
List<String> eliminasiBAB = [
  "TAK",
  "Konstipasi",
];
List<String> aktivitasIstirahat = [
  "TAK",
  "Susah Tidur",
];
List<String> aktivitas = [
  "Mandiri",
  "Bantuan Sebagian",
];
List<String> kardiovaSkuler = [
  "TAK",
  "Nyeri Dada",
  "Tidak",
  "Ya",
];
List<String> respiratori = [
  "TAK",
  "Sesak Napas",
  "Tidak",
  "Ya",
];
List<String> perfusiSecebral = [
  "TAK",
  "Kejang",
  "Riwayat Kejang",
  "Sakit Kepala",
];
List<String> thermoregulasi = [
  "TAK",
  "Demam",
  "Riwayat Demam",
];
List<String> sistemPerfusiPerifer = [
  "TAK",
  "Odema",
  "Kesemutan/Kebas",
];
List<String> sistemPencernaan = [
  "TAK",
  "Perut Kembung",
  "Distensi Abdomen",
];
List<String> sistemUsus = [
  "YA",
  "TIDAK",
];
List<String> integumen = [
  "TAK",
  "Luka/Abses",
];
List<String> itegumen = [
  "TAK",
  "Luka",
];
List<String> odema = [
  "Tidak",
  "Ya",
];
List<String> kenyamanan = [
  "TAK",
];
List<String> statusMental = [
  "Orientasi",
  "Agitasi",
  "Menyerang",
  "Tak Ada Response",
  "Letargi",
  "Kooperatif",
  "Disorientasi"
];
List<String> pAPSSMER = [
  "Tidak",
  "Ya",
];
List<String> hambatanBahasa = ["Tidak", "Ya"];

List<String> caraBelajarYangDisukai = [
  "Demontrasi",
  "Diskusi",
  "Menulis",
];
List<String> bahasaSehariHari = [
  "Indonesia",
  "Bahasa Daerah",
];
List<String> perluPenerjemah = ["Tidak", "Ya", "Bahasa"];
List<String> spikologis = [
  "Stabil/Tenang",
  "Cemas/Takut",
  "Marah",
  "Sedih",
];
List<String> hambatanSosial = [
  "Tidak Ada",
];
List<String> hambatanEkonomi = [
  "Tidak Ada",
];
List<String> hambatanSpiritual = [
  "Tidak Ada",
];
List<String> responseEmosi = [
  "TAK",
  "Takut Terhadap Lingkungan/Tindakan di RS",
  "Sedih",
  "Marah",
  "Menangis",
  "Rendah Diri",
  "Cemas",
];
List<String> menjalankanIbadah = [
  "Selalu/Taat",
  "Kadang-kadang",
  "Tidak Pernah",
  "Sedih",
  "Marah",
  "Menangis",
  "Rendah Diri",
  "Cemas",
];
List<String> hamil = [
  "Tidak",
  "Ya",
];
List<String> nilaiKepercayaan = [
  "Tidak Ada",
  "Jelaskan",
];
List<String> presepsiTerhadapSakit = [
  "Perasaan Bersalah",
  "Perasaan Ditinggal Tuhan Nilai/aturan Khusus dalam kepercayaan",
  "Tidak Ada ",
  "Jelaskan"
];
List<String> pendarahan = [
  "Tidak",
  "Ya",
];
List<String> riwayatHipertensi = [
  "Tidak",
  "Ya",
];
List<int> skorAktivitas = [1, 2, 3, 4, 5];

List<String> sakitKepala = ["Tidak", "Ya", "Muntah", "Pusing"];
List<String> kekuatanOTOT = ["0", "1", "2", "3", "4", "5"];

List<String> akral = ["Hangat", "Dingin", "Cyanotik"];
List<String> nutrisiHidrasi = [
  "TAK",
  "Mual",
  "Muntah",
  "Mulas",
  "Tak Nafsu Makan"
];
List<String> batuk = ["Tidak", "Berdahak/Darah", "Ya"];
List<String> suaraNapas = ["Wheezing", "Ronchi", "Stridor", "Vesikuler"];
List<String> merokok = ["Tidak", "Ya", "Riwayat Perokok"];
List<String> bicara = ["Tak", "Pelo", "Tidak Bisa Bicara"];
