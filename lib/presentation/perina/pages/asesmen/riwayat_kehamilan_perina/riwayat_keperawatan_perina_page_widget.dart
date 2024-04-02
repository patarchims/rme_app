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
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/perina/pages/asesmen/riwayat_kehamilan_perina/add_riwayat_kehamilan_perina_page_widget.dart';
import 'package:hms_app/presentation/perina/pages/asesmen/riwayat_kehamilan_perina/edit_riwayat_kehamilan_perina_page_widget.dart';
import 'package:hms_app/presentation/perina/repository/asesmen_perina_response_model.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class RiwayatKeperawatanPerinaPageWidget extends StatefulWidget {
  const RiwayatKeperawatanPerinaPageWidget({super.key});

  @override
  State<RiwayatKeperawatanPerinaPageWidget> createState() =>
      _RiwayatKeperawatanPerinaPageWidgetState();
}

class _RiwayatKeperawatanPerinaPageWidgetState
    extends State<RiwayatKeperawatanPerinaPageWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _bayiLahirDengan;
  late TextEditingController _jenisKelaminBayi;
  late TextEditingController _menangisBayi;
  late TextEditingController _keteranganBayi;
  late TextEditingController _dokterObgynController;
  late TextEditingController _dokterAnakController;
  late TextEditingController _namaAyahController;
  late TextEditingController _pekerjaanAyahController;
  late TextEditingController _perkawinanAyahKeController;
  late TextEditingController _riwayatPenyakitAyahController;
  late TextEditingController _usiaKehamilanController;

  // PENANGUNG JAWA
  late TextEditingController _namaPJawabController;
  late TextEditingController _usiaPJawabController;
  late TextEditingController _pekerjaanPJawabController;
  late TextEditingController _rwtTaksiranUsiaPersalinanController;
  late TextEditingController _rwtBayiLahirDenganController;
  late TextEditingController _rwtJenisKelaminController;
  late TextEditingController _rwtTanggalKelahiranBayiController;

  // IBU
  late TextEditingController _namaIbuController;
  late TextEditingController _pekerjaanIbuController;
  late TextEditingController _perkawinanIbuController;
  late TextEditingController _penyakitIbuController;

  // PRENATAL
  late TextEditingController _pretanalUsiaKehamilanController;
  late TextEditingController _prenatalKomplikasiController;
  late TextEditingController _prenatalKebiasaanIbuController;
  late TextEditingController _hisPrenatalController;
  late TextEditingController _ttpPrenatalController;
  late TextEditingController _ketubanPrenatalController;
  late TextEditingController _jamPrenatalController;
  late TextEditingController _lamanyaPrenatalController;
  late TextEditingController _pendarahanPrenatalController;
  late TextEditingController _kejangPrenatalController;
  late TextEditingController _rasaMengejamPrentalController;
  late TextEditingController _nyeriPadaPrentalController;
  late TextEditingController _obatObatanPrentalController;
  late TextEditingController _kebiasaanIbuPrentalController;
  late TextEditingController _jumlahHariPrenatalController;
  late TextEditingController _rwtPerasalinanPrenatalController;

  // ==== RIWAYAT NATAL
  late TextEditingController _natalLahirUmurKehamilanController;
  late TextEditingController _natalPersalinanController;
  late TextEditingController _natalKDPController;
  late TextEditingController _natalLetakController;
  late TextEditingController _natalKetubanController;
  late TextEditingController _natalVolumeController;
  late TextEditingController _natalKomplikasiController;
  late TextEditingController _natalDitolongOlehController;
  late TextEditingController _natalPresentasiBayiController;
  late TextEditingController _natalRiwayatPostController;
  late TextEditingController _natalTindakanController;
  late TextEditingController _natalKeadaanBayiController;

  @override
  void initState() {
    _bayiLahirDengan = TextEditingController();
    _jenisKelaminBayi = TextEditingController();
    _menangisBayi = TextEditingController();
    _keteranganBayi = TextEditingController();
    _dokterObgynController = TextEditingController();
    _dokterAnakController = TextEditingController();
    _namaAyahController = TextEditingController();
    _pekerjaanAyahController = TextEditingController();
    _perkawinanAyahKeController = TextEditingController();
    _riwayatPenyakitAyahController = TextEditingController();
    _usiaKehamilanController = TextEditingController();
    _prenatalKebiasaanIbuController = TextEditingController();

    _namaIbuController = TextEditingController();
    _pekerjaanIbuController = TextEditingController();
    _perkawinanIbuController = TextEditingController();
    _penyakitIbuController = TextEditingController();

    _namaPJawabController = TextEditingController();
    _usiaPJawabController = TextEditingController();
    _pekerjaanPJawabController = TextEditingController();
    _rwtTaksiranUsiaPersalinanController = TextEditingController();
    _rwtBayiLahirDenganController = TextEditingController();
    _rwtJenisKelaminController = TextEditingController();
    _rwtTanggalKelahiranBayiController = TextEditingController();

    // PRENATAL
    _pretanalUsiaKehamilanController = TextEditingController();
    _prenatalKomplikasiController = TextEditingController();
    _hisPrenatalController = TextEditingController();
    _ttpPrenatalController = TextEditingController();
    _ketubanPrenatalController = TextEditingController();
    _jamPrenatalController = TextEditingController();
    _lamanyaPrenatalController = TextEditingController();
    _pendarahanPrenatalController = TextEditingController();
    _kejangPrenatalController = TextEditingController();
    _rasaMengejamPrentalController = TextEditingController();
    _nyeriPadaPrentalController = TextEditingController();
    _obatObatanPrentalController = TextEditingController();
    _kebiasaanIbuPrentalController = TextEditingController();
    _jumlahHariPrenatalController = TextEditingController();
    _rwtPerasalinanPrenatalController = TextEditingController();

    _natalLahirUmurKehamilanController = TextEditingController();
    _natalPersalinanController = TextEditingController();
    _natalKDPController = TextEditingController();
    _natalLetakController = TextEditingController();
    _natalKetubanController = TextEditingController();
    _natalVolumeController = TextEditingController();
    _natalKomplikasiController = TextEditingController();
    _natalDitolongOlehController = TextEditingController();
    _natalPresentasiBayiController = TextEditingController();
    _natalRiwayatPostController = TextEditingController();
    _natalTindakanController = TextEditingController();
    _natalKeadaanBayiController = TextEditingController();

    // ======================================= //

    super.initState();
  }

  @override
  void dispose() {
    _bayiLahirDengan.clear();
    _jenisKelaminBayi.clear();
    _menangisBayi.clear();
    _keteranganBayi.clear();
    _namaIbuController.clear();
    _prenatalKebiasaanIbuController.clear();

    _dokterObgynController.clear();
    _dokterAnakController.clear();
    _namaAyahController.clear();
    _pekerjaanAyahController.clear();
    _perkawinanAyahKeController.clear();
    _riwayatPenyakitAyahController.clear();

    _pekerjaanIbuController.clear();
    _perkawinanIbuController.clear();
    _penyakitIbuController.clear();
    _usiaKehamilanController.clear();

    _namaPJawabController.clear();
    _usiaPJawabController.clear();
    _pekerjaanPJawabController.clear();
    _rwtTaksiranUsiaPersalinanController.clear();
    _rwtBayiLahirDenganController.clear();
    _rwtJenisKelaminController.clear();
    _rwtTanggalKelahiranBayiController.clear();

    // PRENATAL
    _pretanalUsiaKehamilanController.clear();
    _prenatalKomplikasiController.clear();
    _hisPrenatalController.clear();
    _ttpPrenatalController.clear();
    _ketubanPrenatalController.clear();
    _jamPrenatalController.clear();
    _lamanyaPrenatalController.clear();
    _pendarahanPrenatalController.clear();
    _kejangPrenatalController.clear();
    _rasaMengejamPrentalController.clear();
    _nyeriPadaPrentalController.clear();
    _obatObatanPrentalController.clear();
    _kebiasaanIbuPrentalController.clear();
    _jumlahHariPrenatalController.clear();
    _rwtPerasalinanPrenatalController.clear();

    _natalLahirUmurKehamilanController.clear();
    _natalPersalinanController.clear();
    _natalKDPController.clear();
    _natalLetakController.clear();
    _natalKetubanController.clear();
    _natalVolumeController.clear();
    _natalKomplikasiController.clear();
    _natalDitolongOlehController.clear();
    _natalPresentasiBayiController.clear();
    _natalRiwayatPostController.clear();
    _natalTindakanController.clear();
    _natalKeadaanBayiController.clear();

    _menangisBayi.dispose();
    _keteranganBayi.dispose();
    _bayiLahirDengan.dispose();
    _jenisKelaminBayi.dispose();
    _namaIbuController.dispose();
    _usiaKehamilanController.dispose();

    _dokterObgynController.dispose();
    _dokterAnakController.dispose();
    _namaAyahController.dispose();
    _pekerjaanAyahController.dispose();
    _perkawinanAyahKeController.dispose();
    _riwayatPenyakitAyahController.dispose();
    _prenatalKebiasaanIbuController.dispose();

    _namaPJawabController.dispose();
    _usiaPJawabController.dispose();
    _pekerjaanPJawabController.dispose();
    _rwtTaksiranUsiaPersalinanController.dispose();
    _rwtBayiLahirDenganController.dispose();
    _rwtJenisKelaminController.dispose();
    _rwtTanggalKelahiranBayiController.dispose();

    _pretanalUsiaKehamilanController.dispose();
    _prenatalKomplikasiController.dispose();
    _hisPrenatalController.dispose();
    _ttpPrenatalController.dispose();
    _ketubanPrenatalController.dispose();
    _jamPrenatalController.dispose();
    _lamanyaPrenatalController.dispose();
    _pendarahanPrenatalController.dispose();
    _kejangPrenatalController.dispose();
    _rasaMengejamPrentalController.dispose();
    _nyeriPadaPrentalController.dispose();
    _obatObatanPrentalController.dispose();
    _kebiasaanIbuPrentalController.dispose();
    _jumlahHariPrenatalController.dispose();
    _rwtPerasalinanPrenatalController.dispose();

    _natalLahirUmurKehamilanController.dispose();
    _natalPersalinanController.dispose();
    _natalKDPController.dispose();
    _natalLetakController.dispose();
    _natalKetubanController.dispose();
    _natalVolumeController.dispose();
    _natalKomplikasiController.dispose();
    _natalDitolongOlehController.dispose();
    _natalPresentasiBayiController.dispose();
    _natalRiwayatPostController.dispose();
    _natalTindakanController.dispose();
    _natalKeadaanBayiController.dispose();

    _pekerjaanIbuController.dispose();
    _perkawinanIbuController.dispose();
    _penyakitIbuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<AsesmenBayiBloc, AsesmenBayiState>(
      listener: (context, state) {
        // DETEKSI KEADAAN
        if (state.status == AsesmenBayiStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != AsesmenBayiStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == AsesmenBayiStatus.isLoadingAsesmen) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            isENableAdd: true,
            onPressed: () async {
              // ON SAVE
              dynamic data = await deviceInfo.initPlatformState();
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context.read<AsesmenBayiBloc>().add(
                    OnSaveDataAsesmenKeperawatanBayiEvent(
                        kdDPJP: singlePasien.first.kdDokter,
                        devicesID: "ID - ${data['id']} - ${data['device']}",
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        person: toPerson(person: authState.user.person),
                        noReg: singlePasien.first.noreg,
                        noRM: singlePasien.first.mrn,
                        asesmen: AsesmenBayiModel(
                            pendarahanPrenatal:
                                _pendarahanPrenatalController.text,
                            obatObatanYangdikomsumsi:
                                _obatObatanPrentalController.text,
                            rwtPrenatalPersalinan:
                                _rwtPerasalinanPrenatalController.text,
                            rwtPersalinan:
                                _rwtPerasalinanPrenatalController.text,
                            prenatalJumlahHari:
                                _jumlahHariPrenatalController.text,
                            prenatalKebiasaanIbu:
                                _prenatalKebiasaanIbuController.text,
                            prenatalJam: _jamPrenatalController.text,
                            natalKomplikasi: _natalKomplikasiController.text,
                            natalVolume: _natalVolumeController.text,
                            pekerjaanIbu: _pekerjaanIbuController.text,
                            riwayatPenyakitAyah:
                                _riwayatPenyakitAyahController.text,
                            namaAyah: _namaAyahController.text,
                            dokterObgyn: _dokterObgynController.text,
                            dokterAnak: _dokterAnakController.text,
                            pekerjaanAyah: _pekerjaanAyahController.text,
                            perkawinanAyah: _perkawinanAyahKeController.text,
                            usiaKehamilan: "",
                            namaIbu: _namaIbuController.text,
                            perkawinanIbu: _perkawinanIbuController.text,
                            penyakitIbu: _penyakitIbuController.text,
                            namaPjawab: _namaPJawabController.text,
                            usiaPjawab: _usiaPJawabController.text,
                            pekerjaanPjawab: _pekerjaanPJawabController.text,
                            usiaPersalinan:
                                _rwtTaksiranUsiaPersalinanController.text,
                            rwtTglLahir:
                                _rwtTaksiranUsiaPersalinanController.text,
                            menangis: _menangisBayi.text,
                            jenisKelamin: _jenisKelaminBayi.text,
                            keterangan: _keteranganBayi.text,
                            prenatalUsiaKehamilan:
                                _pretanalUsiaKehamilanController.text,
                            prenatalKomplikasi:
                                _prenatalKomplikasiController.text,
                            prenatalHis: _hisPrenatalController.text,
                            prenatalTtp: _ttpPrenatalController.text,
                            prenatalKetuban: _ketubanPrenatalController.text,
                            prenatalPersalinan:
                                _rwtPerasalinanPrenatalController.text,
                            rwtUsiaPersalinan:
                                _rwtTaksiranUsiaPersalinanController.text,
                            rwtLahirDengan: _bayiLahirDengan.text,
                            rwtJenisKelamin: _rwtJenisKelaminController.text,
                            rwtKelahiranBayi:
                                _rwtTanggalKelahiranBayiController.text,
                            rwtMenangis: _menangisBayi.text,
                            rwtKeterangan: _keteranganBayi.text,
                            prenatalUsiaPersalinan: "",
                            natalPersalinan: _natalPersalinanController.text,
                            natalKpd: _natalKDPController.text,
                            natalKeadaan: _natalKeadaanBayiController.text,
                            natalTindakanDiberikan:
                                _natalTindakanController.text,
                            natalPost: _natalRiwayatPostController.text,
                            natalPrestasi: _natalPresentasiBayiController.text,
                            natalDitolongOleh:
                                _natalDitolongOlehController.text,
                            natalKetuban: _natalKetubanController.text,
                            natalLetak: _natalLetakController.text,
                            natalLahirUmur: _natalLahirUmurKehamilanController.text)));
              }
            },
            backgroundColor: ThemeColor.bgColor,
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
                child: Column(
                  children: [
                    TitleWidget.titleContainer(title: "Dokter"),
                    FB5Row(
                      classNames: 'px-xs-0 px-lg-0 gx-0',
                      children: [
                        FB5Col(
                          classNames: 'col-6',
                          child: Column(
                            children: [
                              TitleWidget.boxPemeriksaanFisikSugestion(
                                width: 35.sp,
                                widget: SearchField(
                                  searchStyle: blackTextStyle,
                                  enabled: true,
                                  marginColor: ThemeColor.whiteColor,
                                  itemHeight: 15.sp,
                                  suggestionStyle: blackTextStyle,
                                  suggestions: state.asesmen.dokter
                                      .where((element) => element.spesialisasi
                                          .contains(
                                              "Spesialis Kandungan ( Obgyn )"))
                                      .map(
                                        (e) => SearchFieldListItem(
                                          e.namaDokter,
                                          item: e.namaDokter.toUpperCase(),
                                          child: Container(
                                            width: Get.width,
                                            color: ThemeColor.whiteColor,
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              e.namaDokter,
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
                                  controller: _dokterObgynController
                                    ..text =
                                        state.asesmen.asesmenBayi.dokterObgyn,
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
                                title: "Dokter\nObgyn",
                              ),
                            ],
                          ),
                        ),
                        FB5Col(
                            classNames: 'col-6',
                            child: Column(
                              children: [
                                TitleWidget.boxPemeriksaanFisikSugestion(
                                  width: 35.sp,
                                  widget: SearchField(
                                    searchStyle: blackTextStyle,
                                    enabled: true,
                                    marginColor: ThemeColor.whiteColor,
                                    itemHeight: 15.sp,
                                    suggestionStyle: blackTextStyle,
                                    suggestions: state.asesmen.dokter
                                        .where((element) => element.spesialisasi
                                            .contains("Spesialis Anak"))
                                        .map(
                                          (e) => SearchFieldListItem(
                                            e.namaDokter,
                                            item: e.namaDokter.toUpperCase(),
                                            child: Container(
                                              width: Get.width,
                                              color: ThemeColor.whiteColor,
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.namaDokter,
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
                                    controller: _dokterAnakController
                                      ..text =
                                          state.asesmen.asesmenBayi.dokterAnak,
                                    onSubmit: (value) {},
                                    onSaved: (a) {},
                                    searchInputDecoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                      ),
                                      border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  title: "Dokter\nAnak",
                                ),
                              ],
                            )),
                      ],
                    ),
                    TitleWidget.titleContainer(title: "Ayah"),
                    FB5Row(
                      classNames: 'px-xs-0 px-lg-0 gx-0',
                      children: [
                        FB5Col(
                          classNames: 'col-6',
                          child: Column(
                            children: [
                              TitleWidget.boxPemeriksaanFisikSugestion(
                                width: 35.sp,
                                widget: FormWidget.textArea(
                                    controller: _namaAyahController
                                      ..text =
                                          state.asesmen.asesmenBayi.namaAyah,
                                    enabled: true,
                                    maxLines: 1),
                                title: "Nama\nAyah",
                              ),
                              TitleWidget.boxPemeriksaanFisikSugestion(
                                width: 35.sp,
                                widget: FormWidget.textArea(
                                    controller: _pekerjaanAyahController
                                      ..text = state
                                          .asesmen.asesmenBayi.pekerjaanAyah,
                                    enabled: true,
                                    maxLines: 1),
                                title: "Pekerjaan",
                              ),
                            ],
                          ),
                        ),
                        FB5Col(
                            classNames: 'col-6',
                            child: Column(
                              children: [
                                TitleWidget.boxPemeriksaanFisikSugestion(
                                  width: 35.sp,
                                  widget: FormWidget.textArea(
                                      controller: _perkawinanAyahKeController
                                        ..text = state
                                            .asesmen.asesmenBayi.perkawinanAyah,
                                      enabled: true,
                                      maxLines: 1),
                                  title: "Perkawinan Ke",
                                ),
                                TitleWidget.boxPemeriksaanFisikSugestion(
                                  width: 35.sp,
                                  widget: FormWidget.textArea(
                                      controller: _riwayatPenyakitAyahController
                                        ..text = state.asesmen.asesmenBayi
                                            .riwayatPenyakitAyah,
                                      enabled: true,
                                      maxLines: 1),
                                  title: "Riwayat Penyakit",
                                ),
                              ],
                            )),
                      ],
                    ),
                    TitleWidget.titleContainer(title: "Ibu"),
                    FB5Row(
                      classNames: 'px-xs-0 px-lg-0 gx-0',
                      children: [
                        FB5Col(
                          classNames: 'col-6',
                          child: Column(
                            children: [
                              TitleWidget.boxPemeriksaanFisikSugestion(
                                width: 35.sp,
                                widget: FormWidget.textArea(
                                    controller: _namaIbuController
                                      ..text =
                                          state.asesmen.asesmenBayi.namaIbu,
                                    enabled: true,
                                    maxLines: 1),
                                title: "Nama\nIbu",
                              ),
                              TitleWidget.boxPemeriksaanFisikSugestion(
                                width: 35.sp,
                                widget: FormWidget.textArea(
                                    controller: _pekerjaanIbuController
                                      ..text = state
                                          .asesmen.asesmenBayi.pekerjaanIbu,
                                    enabled: true,
                                    maxLines: 1),
                                title: "Pekerjaan",
                              ),
                            ],
                          ),
                        ),
                        FB5Col(
                            classNames: 'col-6',
                            // child: const Containers(),
                            child: Column(
                              children: [
                                TitleWidget.boxPemeriksaanFisikSugestion(
                                  width: 35.sp,
                                  widget: FormWidget.textArea(
                                      controller: _perkawinanIbuController
                                        ..text = state
                                            .asesmen.asesmenBayi.perkawinanIbu,
                                      enabled: true,
                                      maxLines: 1),
                                  title: "Perkawinan Ke",
                                ),
                                TitleWidget.boxPemeriksaanFisikSugestion(
                                  width: 35.sp,
                                  widget: FormWidget.textArea(
                                      controller: _penyakitIbuController
                                        ..text = state
                                            .asesmen.asesmenBayi.penyakitIbu,
                                      enabled: true,
                                      maxLines: 1),
                                  title: "Riwayat Penyakit",
                                ),
                              ],
                            )),
                      ],
                    ),
                    TitleWidget.titleContainer(title: "Penanggung Jawab"),
                    FB5Row(
                      classNames: 'px-xs-0 px-lg-0 gx-0',
                      children: [
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                              controller: _namaPJawabController
                                ..text = state.asesmen.asesmenBayi.namaPjawab,
                              enabled: true,
                              maxLines: 1,
                            ),
                            title: "Nama",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _usiaPJawabController
                                  ..text =
                                      state.asesmen.asesmenBayi.usiaPjawab),
                            title: "Usia",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _pekerjaanPJawabController
                                  ..text = state
                                      .asesmen.asesmenBayi.pekerjaanPjawab),
                            title: "Pekerjaan",
                          ),
                        ),
                      ],
                    ),
                    TitleWidget.titleContainer(
                        title: "Riwayat kelahiran yang lalu"),
                    FB5Row(
                      classNames: 'px-xs-0 px-lg-0 gx-0',
                      children: [
                        FB5Col(
                          classNames: 'col-12 px-lg-5',
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.sp, horizontal: 5.sp),
                            height: 15.sp,
                            padding: const EdgeInsets.all(2),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.sp)),
                                    backgroundColor: ThemeColor.primaryColor),
                                onPressed: () {
                                  // TAMBAHKAN DATA RIWAYAT KEHAMILAN PERINA
                                  CustomDialogWidget.getDialog(
                                      widget:
                                          const AddRiwayatKehamilanPerinaPageWidget(),
                                      color: ThemeColor.blueColor);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.plus,
                                      size: 5.sp,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 2.sp,
                                    ),
                                    Text(
                                      "Tambah Data",
                                      style: whiteTextStyle,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-12',
                          child: Padding(
                            padding: EdgeInsets.all(2.sp),
                            child: Container(
                              width: Get.width,
                              decoration: const BoxDecoration(),
                              margin: EdgeInsets.only(right: 10.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    child: Table(
                                      columnWidths: const {
                                        0: FlexColumnWidth(0.3),
                                      },
                                      border:
                                          TableBorder.all(color: Colors.black),
                                      children: [
                                        TableRow(children: [
                                          TitleWidget.headerLeftTitle(
                                            title: "No.",
                                          ),
                                          TitleWidget.headerLeftTitle(
                                              title: "Tahun\nKelahiran"),
                                          TitleWidget.headerLeftTitle(
                                              title: "SEX"),
                                          TitleWidget.headerLeftTitle(
                                              title: "BB\nLahir"),
                                          TitleWidget.headerLeftTitle(
                                              title: "Keadaan\nBayi"),
                                          TitleWidget.headerLeftTitle(
                                              title: "Komplikasi\nKehamilan"),
                                          TitleWidget.headerLeftTitle(
                                              title: "Komplikasi\nPersalinan"),
                                          TitleWidget.headerLeftTitle(
                                              title: "Jenis\nPersalinan"),
                                          TitleWidget.headerLeftTitle(
                                              title: "Action"),
                                        ]),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Table(
                                      border: TableBorder.all(),
                                      columnWidths: const {
                                        0: FlexColumnWidth(0.3),
                                      },
                                      children:
                                          (state.asesmen.riwayatKehamilan
                                                  .isNotEmpty)
                                              ? state.asesmen.riwayatKehamilan
                                                  .asMap()
                                                  .entries
                                                  .map(
                                                    (e) => TableRow(children: [
                                                      TitleWidget.textBox(
                                                          title: (e.key + 1)
                                                              .toString()),
                                                      TitleWidget.textBox(
                                                          title: e.value
                                                              .tahubPersalinan),
                                                      TitleWidget.textBox(
                                                          title: e.value.jk),
                                                      TitleWidget.textBox(
                                                          title: e.value.bb),
                                                      TitleWidget.textBox(
                                                          title: e.value
                                                              .keadaanSekarang),
                                                      TitleWidget.textBox(
                                                          title: e.value
                                                              .komplikasiHamil),
                                                      TitleWidget.textBox(
                                                          title: e.value
                                                              .komplikasiPersalinan),
                                                      TitleWidget.textBox(
                                                          title: e.value
                                                              .jenisPersalinan),
                                                      TitleWidget.widgetBox(
                                                          widget: Wrap(
                                                        alignment: WrapAlignment
                                                            .spaceAround,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2),
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(1
                                                                                .sp)),
                                                                        backgroundColor:
                                                                            ThemeColor
                                                                                .dangerColor),
                                                                    onPressed:
                                                                        () {
                                                                      CustomDialogWidget.getDialog(
                                                                          widget: MessageAlert.deleteAlert(
                                                                              mesage: "Apakah Anda yakin menghapus data ${e.value.keadaanSekarang} ini?",
                                                                              onPressed: () {
                                                                                context.read<AsesmenBayiBloc>().add(OnDeleteRiwayatKelahiranLaluEvent(nomor: e.value.kdRiwayat, noReg: singlePasien.first.noreg, noRM: singlePasien.first.mrn));
                                                                                Get.back();
                                                                              }));
                                                                    },
                                                                    child: Icon(
                                                                      size:
                                                                          5.sp,
                                                                      FontAwesomeIcons
                                                                          .trash,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2),
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(1
                                                                                .sp)),
                                                                        backgroundColor:
                                                                            ThemeColor
                                                                                .greenColor),
                                                                    onPressed:
                                                                        () {
                                                                      // TODO: EDIT DATA
                                                                      CustomDialogWidget.getDialog(
                                                                          widget: EditRiwayatKehamilanPerinaPageWidget(
                                                                            riwayatKehamilan:
                                                                                e.value,
                                                                          ),
                                                                          color: ThemeColor.blueColor);
                                                                    },
                                                                    child: Icon(
                                                                      FontAwesomeIcons
                                                                          .pencil,
                                                                      size:
                                                                          5.sp,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                          ),
                                                        ],
                                                      )),
                                                    ]),
                                                  )
                                                  .toList()
                                              : [],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TitleWidget.titleContainer(title: "Riwayat Keperawatan"),
                    FB5Row(
                      classNames: 'px-xs-0 px-lg-0 gx-0',
                      children: [
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _rwtTaksiranUsiaPersalinanController
                                  ..text = state
                                      .asesmen.asesmenBayi.rwtUsiaPersalinan),
                            title: "Taksiran Usia Persalinan",
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
                              suggestions: bayiLahir
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
                              controller: _bayiLahirDengan
                                ..text =
                                    state.asesmen.asesmenBayi.rwtLahirDengan,
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
                            title: "Bayi lahir dengan",
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
                              suggestions: jenisKelaminBayi
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
                              controller: _jenisKelaminBayi
                                ..text = state.asesmen.asesmenBayi.jenisKelamin,
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
                                controller: _rwtTanggalKelahiranBayiController
                                  ..text = state
                                      .asesmen.asesmenBayi.rwtKelahiranBayi),
                            title: "Tanggal Kelahiran Bayi",
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
                              suggestions: menangisBayi
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
                              controller: _menangisBayi
                                ..text = state.asesmen.asesmenBayi.menangis,
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
                            title: "Menangis",
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
                              suggestions: keteranganBayi
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
                              controller: _keteranganBayi
                                ..text =
                                    state.asesmen.asesmenBayi.rwtKeterangan,
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
                            title: "Keterangan",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-12',
                          child: TitleWidget.headerTitle(
                            title: "Riwayat Prenatal",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                              controller: _pretanalUsiaKehamilanController
                                ..text =
                                    state.asesmen.asesmenBayi.usiaKehamilan,
                              enabled: true,
                              maxLines: 1,
                            ),
                            title: "Usia Kehamilan",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _prenatalKomplikasiController
                                  ..text = state
                                      .asesmen.asesmenBayi.prenatalKomplikasi),
                            title: "Komplikasi",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _hisPrenatalController
                                  ..text =
                                      state.asesmen.asesmenBayi.prenatalHis),
                            title: "HIS",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _ttpPrenatalController
                                  ..text =
                                      state.asesmen.asesmenBayi.prenatalTtp),
                            title: "TTP",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                              enabled: true,
                              maxLines: 1,
                              controller: _ketubanPrenatalController
                                ..text = state.asesmen.asesmenBayi.natalKetuban,
                            ),
                            title: "Ketuban",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _jamPrenatalController
                                  ..text =
                                      state.asesmen.asesmenBayi.prenatalJam),
                            title: "Jam",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _lamanyaPrenatalController
                                  ..text = state
                                      .asesmen.asesmenBayi.prenatalKomplikasi),
                            title: "Lamanya",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _pendarahanPrenatalController
                                  ..text = state
                                      .asesmen.asesmenBayi.pendarahanPrenatal),
                            title: "Pendarahan Antepartum Sejak Tanggal",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _kejangPrenatalController
                                  ..text =
                                      state.asesmen.asesmenBayi.keterangan),
                            title: "Kejang",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _rasaMengejamPrentalController
                                  ..text =
                                      state.asesmen.asesmenBayi.rwtMenangis),
                            title: "Rasa Mengejam Sejak",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _nyeriPadaPrentalController
                                  ..text =
                                      state.asesmen.asesmenBayi.prenatalTtp),
                            title: "Nyeri Pada",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-3',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _obatObatanPrentalController
                                  ..text = state.asesmen.asesmenBayi
                                      .obatObatanYangdikomsumsi),
                            title:
                                "Obat-obatan yang dikomsumsi selama kehamilan",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _prenatalKebiasaanIbuController
                                  ..text = state.asesmen.asesmenBayi
                                      .prenatalKebiasaanIbu),
                            title: "Kebiasaan Ibu",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _jumlahHariPrenatalController
                                  ..text = state
                                      .asesmen.asesmenBayi.prenatalJumlahHari),
                            title: "Jumlah/Hari",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _rwtPerasalinanPrenatalController
                                  ..text = state
                                      .asesmen.asesmenBayi.prenatalPersalinan),
                            title: "Riwayat persalinan sebelumnya",
                          ),
                        ),
                      ],
                    ),
                    FB5Col(
                      classNames: 'col-12',
                      child: TitleWidget.headerTitle(title: "Riwayat Natal"),
                    ),
                    FB5Row(
                      classNames: 'px-xs-0 px-lg-0 gx-0',
                      children: [
                        ///===================== RIWAYAT NATAL
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalLahirUmurKehamilanController
                                  ..text =
                                      state.asesmen.asesmenBayi.natalLahirUmur),
                            title: "Lahir umur kehamilan",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalPersalinanController
                                  ..text = state
                                      .asesmen.asesmenBayi.natalPersalinan),
                            title: "Persalinan",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalKDPController
                                  ..text = state.asesmen.asesmenBayi.natalKpd),
                            title: "KPD",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalLetakController
                                  ..text =
                                      state.asesmen.asesmenBayi.natalLetak),
                            title: "Letak",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalKetubanController
                                  ..text =
                                      state.asesmen.asesmenBayi.natalKetuban),
                            title: "Ketuban",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalVolumeController
                                  ..text =
                                      state.asesmen.asesmenBayi.natalVolume),
                            title: "Volume",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalKomplikasiController
                                  ..text = state
                                      .asesmen.asesmenBayi.prenatalKomplikasi),
                            title: "Kompilasi selama kehamilan/persalinan",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalDitolongOlehController
                                  ..text = state
                                      .asesmen.asesmenBayi.natalDitolongOleh),
                            title: "Ditolong oleh",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalPresentasiBayiController
                                  ..text =
                                      state.asesmen.asesmenBayi.natalPrestasi),
                            title: "Presentasi bayi",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalRiwayatPostController
                                  ..text = state.asesmen.asesmenBayi.natalPost),
                            title: "Riwayat Post Natal",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalTindakanController
                                  ..text = state.asesmen.asesmenBayi
                                      .natalTindakanDiberikan),
                            title: "Tindakan yang diberikan",
                          ),
                        ),
                        FB5Col(
                          classNames: 'col-4',
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            width: 35.sp,
                            widget: FormWidget.textArea(
                                enabled: true,
                                maxLines: 1,
                                controller: _natalKeadaanBayiController
                                  ..text =
                                      state.asesmen.asesmenBayi.natalKeadaan),
                            title: "Keadaan bayi",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

List<String> tindakanYangDiberikan = [
  "Hisap Lendir",
  "Nafas Buatan",
  "ET",
  "CPAP",
  "Kortion/oradekson"
];

List<String> riwayatPostNatal = [
  "Prematur",
  "Aterm",
  "Post Date",
  "KMK/SMK/BMK",
  "Post NICU/PICU"
];

List<String> keadaanBayi = [
  "Normal",
  "Mati",
  "Cacat",
  "Aspiksia Ringan",
  "Aspiksia Sedang",
  "Aspiksia Berat"
];

List<String> bayiLahir = [
  "SC",
  "PARTUS SPONTAN",
  "VACUM",
];
List<String> jenisKelaminBayi = [
  "LAKI-LAKI",
  "PEREMPUAN",
];
List<String> menangisBayi = [
  "KUAT",
  "LEMAH",
  "MERINTIH",
  "TIDAK RESPON",
];
List<String> keteranganBayi = [
  "Lahir Hidup",
  "Lahir Mati",
  "Abortus",
  "Lain-lain",
];
