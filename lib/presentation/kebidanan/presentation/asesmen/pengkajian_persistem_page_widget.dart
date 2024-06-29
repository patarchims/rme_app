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
import 'package:hms_app/presentation/kebidanan/bloc/pengkajian_persistem/pengkajian_persistem_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PengkajianPersistemPageWidget extends StatefulWidget {
  const PengkajianPersistemPageWidget({super.key});

  @override
  State<PengkajianPersistemPageWidget> createState() =>
      _PengkajianPersistemPageWidgetState();
}

class _PengkajianPersistemPageWidgetState
    extends State<PengkajianPersistemPageWidget> {
  final ScrollController _scrollController = ScrollController();
  //========================
  late TextEditingController _eliminasiBAKController;
  late TextEditingController _eliminasiBABController;
  late TextEditingController _tidurAtauIstirahatController;

  late TextEditingController _aktvitasController;
  late TextEditingController _kardiovaskulerController;
  late TextEditingController _respiratoriController;
  late TextEditingController _perfusiSecebralController;
  late TextEditingController _thermoregulasiController;
  late TextEditingController _sistemPerfusiPerfierController;
  late TextEditingController _sistemPencernaanController;
  late TextEditingController _integumenController;
  late TextEditingController _kenyamananController;
  late TextEditingController _statusMentalController;
  late TextEditingController _papsSmerController;
  late TextEditingController _pendarahanController;
  late TextEditingController _hambatanBahasaController;
  late TextEditingController _caraBelajardisukaiController;
  late TextEditingController _bahasaSehariHariController;
  late TextEditingController _psikologisController;
  late TextEditingController _hambatanSosialController;
  late TextEditingController _hambatanEkonomiController;
  late TextEditingController _hambatanSpiritualController;
  late TextEditingController _responseEmosiController;
  late TextEditingController _menjalankanIbadahController;
  late TextEditingController _presepsiTerhadapSakitController;
  late TextEditingController _nilaiKepercayaanController;
  late TextEditingController _mandiController;
  late TextEditingController _berpakaianController;
  late TextEditingController _makanMinumController;
  late TextEditingController _eliminasiController;
  late TextEditingController _mobilisasiController;

  String mandi = "";
  String berpakaian = "";
  String makan = "";
  String eliminasi = "";
  String mobilisasi = "";

  @override
  void initState() {
    _eliminasiBAKController = TextEditingController();
    _eliminasiBABController = TextEditingController();
    _tidurAtauIstirahatController = TextEditingController();

    _aktvitasController = TextEditingController();
    _kardiovaskulerController = TextEditingController();
    _respiratoriController = TextEditingController();
    _perfusiSecebralController = TextEditingController();
    _thermoregulasiController = TextEditingController();
    _sistemPerfusiPerfierController = TextEditingController();
    _sistemPencernaanController = TextEditingController();
    _integumenController = TextEditingController();
    _kenyamananController = TextEditingController();
    _statusMentalController = TextEditingController();
    _papsSmerController = TextEditingController();
    _pendarahanController = TextEditingController();
    _hambatanBahasaController = TextEditingController();
    _caraBelajardisukaiController = TextEditingController();
    _bahasaSehariHariController = TextEditingController();
    _psikologisController = TextEditingController();
    _hambatanSosialController = TextEditingController();
    _hambatanEkonomiController = TextEditingController();
    _hambatanSpiritualController = TextEditingController();
    _responseEmosiController = TextEditingController();
    _menjalankanIbadahController = TextEditingController();
    _presepsiTerhadapSakitController = TextEditingController();
    _nilaiKepercayaanController = TextEditingController();

    _mandiController = TextEditingController();
    _berpakaianController = TextEditingController();
    _makanMinumController = TextEditingController();
    _eliminasiController = TextEditingController();
    _mobilisasiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _eliminasiBAKController.clear();
    _eliminasiBABController.clear();
    _tidurAtauIstirahatController.clear();

    _aktvitasController.clear();
    _kardiovaskulerController.clear();
    _respiratoriController.clear();
    _perfusiSecebralController.clear();
    _thermoregulasiController.clear();
    _sistemPerfusiPerfierController.clear();
    _sistemPencernaanController.clear();
    _integumenController.clear();
    _kenyamananController.clear();
    _statusMentalController.clear();
    _papsSmerController.clear();
    _pendarahanController.clear();
    _hambatanBahasaController.clear();
    _caraBelajardisukaiController.clear();
    _bahasaSehariHariController.clear();
    _psikologisController.clear();
    _hambatanSosialController.clear();
    _hambatanEkonomiController.clear();
    _hambatanSpiritualController.clear();
    _responseEmosiController.clear();
    _menjalankanIbadahController.clear();
    _presepsiTerhadapSakitController.clear();
    _nilaiKepercayaanController.clear();

    _mandiController.clear();
    _berpakaianController.clear();
    _makanMinumController.clear();
    _eliminasiController.clear();
    _mobilisasiController.clear();

    _eliminasiBAKController.dispose();
    _eliminasiBABController.dispose();
    _tidurAtauIstirahatController.dispose();

    _aktvitasController.dispose();
    _kardiovaskulerController.dispose();
    _respiratoriController.dispose();
    _perfusiSecebralController.dispose();
    _thermoregulasiController.dispose();
    _sistemPerfusiPerfierController.dispose();
    _sistemPencernaanController.dispose();
    _integumenController.dispose();
    _kenyamananController.dispose();
    _statusMentalController.dispose();
    _papsSmerController.dispose();
    _pendarahanController.dispose();
    _hambatanBahasaController.dispose();
    _caraBelajardisukaiController.dispose();
    _bahasaSehariHariController.dispose();
    _psikologisController.dispose();
    _hambatanSosialController.dispose();
    _hambatanEkonomiController.dispose();
    _hambatanSpiritualController.dispose();
    _responseEmosiController.dispose();
    _menjalankanIbadahController.dispose();
    _presepsiTerhadapSakitController.dispose();
    _nilaiKepercayaanController.dispose();

    _mandiController.dispose();
    _berpakaianController.dispose();
    _makanMinumController.dispose();
    _eliminasiController.dispose();
    _mobilisasiController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<PengkajianPersistemBloc, PengkajianPersistemState>(
      listener: (context, state) {
        // TAMPILKAN LOADING
        if (state.status == PengkajianPersistemStatus.isLoadingSavePengkajian) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != PengkajianPersistemStatus.isLoadingSavePengkajian) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                      orElse: () {},
                      loaded: (value) async {
                        // LOADED
                        MetaModel meta =
                            MetaModel.fromJson(value.value["metadata"]);
                        final shouldPop = await Alert.loaded(context,
                            subTitle: meta.message, title: "Pesan");
                        return shouldPop ?? false;
                      },
                    )));
      },
      builder: (context, state) {
        if (state.status == PengkajianPersistemStatus.isLoadingGet) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
          backgroundColor: ThemeColor.softBlue,
          isENableAdd: true,
          onPressed: () async {
            if (authState is Authenticated) {
              dynamic data = await deviceInfo.initPlatformState();

              // ignore: use_build_context_synchronously
              context.read<PengkajianPersistemBloc>().add(
                  OnSavePengkajianPersistemEvent(
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person),
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      deviceID: "ID - ${data['id']} - ${data['device']}",
                      pengkajian: state.penkajianKebidanan.copyWith(
                        aktivitas: _aktvitasController.text,
                        bahasaSehari: _bahasaSehariHariController.text,
                        berpakaian: _berpakaianController.text,
                        caraBelajar: _caraBelajardisukaiController.text,
                        eliminasi: _eliminasiController.text,
                        thermoregulasi: _thermoregulasiController.text,
                        eliminasiBab: _eliminasiBABController.text,
                        eliminasiBak: _eliminasiBAKController.text,
                        hambatanBahasa: _hambatanBahasaController.text,
                        hambatanEkonomi: _hambatanEkonomiController.text,
                        hambatanSosial: _hambatanSosialController.text,
                        integumen: _integumenController.text,
                        istirahat: _tidurAtauIstirahatController.text,
                        kardiovaskuler: _kardiovaskulerController.text,
                        kenyamanan: _kenyamananController.text,
                        khususKepercayaan: _nilaiKepercayaanController.text,
                        makan: _makanMinumController.text,
                        mandi: _mandiController.text,
                        mobilisasi: _mobilisasiController.text,
                        nilaiKepercayaan: _menjalankanIbadahController.text,
                        papsSmer: _papsSmerController.text,
                        pencernaan: _sistemPencernaanController.text,
                        pendarahan: _pendarahanController.text,
                        perfusiPerifer: _perfusiSecebralController.text,
                        spiritual: _hambatanSpiritualController.text,
                        presepsiSakit: _presepsiTerhadapSakitController.text,
                        secebral: _perfusiSecebralController.text,
                        responseEmosi: _responseEmosiController.text,
                        respiratori: _respiratoriController.text,
                        spikologis: _psikologisController.text,
                        proteksi: _statusMentalController.text,
                      )));
            }
          },
          title: "Simpan",
          widget: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            controller: _scrollController,
            trackVisibility: false,
            radius: Radius.circular(5.sp),
            child: Container(
              margin: EdgeInsets.only(
                right: 15.sp,
                left: 10.sp,
              ),
              child: ListView(
                controller: _scrollController,
                children: [
                  TitleWidget.headerTitle(title: "ELIMINASI DAN PELEPASAN"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: ListConstants.eliminasiBAK
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
                      controller: _eliminasiBAKController
                        ..text = state.penkajianKebidanan.eliminasiBak,
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
                      suggestions: ListConstants.eliminasiBAB
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
                      controller: _eliminasiBABController
                        ..text = state.penkajianKebidanan.eliminasiBab,
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
                      suggestions: ListConstants.aktivitasIstirahat
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
                      controller: _tidurAtauIstirahatController
                        ..text = state.penkajianKebidanan.istirahat,
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
                      suggestions: ListConstants.aktivitas
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
                      controller: _aktvitasController
                        ..text = state.penkajianKebidanan.aktivitas,
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
                      suggestions: ListConstants.skorAktivitasMandi
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
                        ..text = state.penkajianKebidanan.mandi,
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
                      suggestions: ListConstants.skorAktivitasMandi
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
                        ..text = state.penkajianKebidanan.berpakaian,
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
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: ListConstants.skorAktivitasMandi
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
                      controller: _makanMinumController
                        ..text = state.penkajianKebidanan.makan,
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
                    title: "Makan/Minum",
                  ),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: ListConstants.skorAktivitasMandi
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
                        ..text = state.penkajianKebidanan.eliminasi,
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
                      suggestions: ListConstants.skorAktivitasMandi
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
                        ..text = state.penkajianKebidanan.mobilisasi,
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
                    title: "Mobilisasi",
                  ),
                  TitleWidget.headerTitle(title: "SISTEM KARDIO-RESPIRATORI"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: ListConstants.kardiovaSkuler
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
                        ..text = state.penkajianKebidanan.kardiovaskuler,
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
                      suggestions: ListConstants.respiratori
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
                        ..text = state.penkajianKebidanan.respiratori,
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
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: ListConstants.perfusiSecebral
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
                      controller: _perfusiSecebralController
                        ..text = state.penkajianKebidanan.secebral,
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
                    title: "PERFUSI SECEBRAL",
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
                      suggestions: ListConstants.thermoregulasi
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
                        ..text = state.penkajianKebidanan.thermoregulasi,
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
                      suggestions: ListConstants.sistemPerfusiPerifer
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
                      controller: _sistemPerfusiPerfierController
                        ..text = state.penkajianKebidanan.perfusiPerifer,
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
                    title: "SISTEM PERFUSI PERIFER",
                  ),
                  TitleWidget.headerTitle(title: "SISTEM PENCERNAAN"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: ListConstants.sistemPencernaan
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
                        ..text = state.penkajianKebidanan.pencernaan,
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
                  TitleWidget.headerTitle(title: "INTEGUMEN"),
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: ListConstants.integumen
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
                        ..text = state.penkajianKebidanan.integumen,
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
                  TitleWidget.boxPemeriksaanFisikSugestion(
                    width: 100.sp,
                    widget: SearchField(
                      searchStyle: blackTextStyle,
                      enabled: true,
                      marginColor: ThemeColor.whiteColor,
                      itemHeight: 15.sp,
                      suggestionStyle: blackTextStyle,
                      suggestions: ListConstants.kenyamanan
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
                        ..text = state.penkajianKebidanan.kenyamanan,
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
                      suggestions: ListConstants.statusMental
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
                        ..text = state.penkajianKebidanan.proteksi,
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
                      suggestions: ListConstants.pAPSSMER
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
                        ..text = state.penkajianKebidanan.papsSmer,
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
                      suggestions: ListConstants.pendarahan
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
                        ..text = state.penkajianKebidanan.pendarahan,
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
                      suggestions: ListConstants.hambatanBahasa
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
                        ..text = state.penkajianKebidanan.hambatanBahasa,
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
                      suggestions: ListConstants.caraBelajarYangDisukai
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
                      controller: _caraBelajardisukaiController
                        ..text = state.penkajianKebidanan.caraBelajar,
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
                      suggestions: ListConstants.bahasaSehariHari
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
                      controller: _bahasaSehariHariController
                        ..text = state.penkajianKebidanan.bahasaSehari,
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
                      suggestions: ListConstants.spikologis
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
                      controller: _psikologisController
                        ..text = state.penkajianKebidanan.spikologis,
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
                      suggestions: ListConstants.hambatanSosial
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
                        ..text = state.penkajianKebidanan.hambatanSosial,
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
                      suggestions: ListConstants.hambatanSosial
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
                        ..text = state.penkajianKebidanan.hambatanEkonomi,
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
                      suggestions: ListConstants.hambatanSpiritual
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
                        ..text = state.penkajianKebidanan.spiritual,
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
                      suggestions: ListConstants.responseEmosi
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
                        ..text = state.penkajianKebidanan.responseEmosi,
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
                      suggestions: ListConstants.menjalankanIbadah
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
                      controller: _menjalankanIbadahController
                        ..text = state.penkajianKebidanan.nilaiKepercayaan,
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
                    title: "Menjalankan Ibadah",
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
                      suggestions: ListConstants.presepsiTerhadapSakit
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
                        ..text = state.penkajianKebidanan.presepsiSakit,
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
                      suggestions: ListConstants.nilaiKepercayaan
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
                        ..text = state.penkajianKebidanan.nilaiKepercayaan,
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
                  SizedBox(
                    height: 25.sp,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container skorAktifivas({
    required String title,
    required Widget widget,
  }) {
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
            widget
          ]),
        ],
      ),
    );
  }
}
