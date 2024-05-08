// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemeriksaan_fisik_icu_bloc.dart';

enum PemeriksaanFisikIcuStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
}

class PemeriksaanFisikIcuState extends Equatable {
  final PemeriksaanFisikIcuModel fisikModel;
  final PemeriksaanFisikIcuStatus status;
  final PengkajianPersistemIcuModel pengkajianPersistemICU;

  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  const PemeriksaanFisikIcuState({
    required this.status,
    required this.fisikModel,
    required this.saveResult,
    required this.pengkajianPersistemICU,
  });
  @override
  List<Object?> get props =>
      [status, fisikModel, saveResult, pengkajianPersistemICU];

  static PemeriksaanFisikIcuState initial() => PemeriksaanFisikIcuState(
      pengkajianPersistemICU: PengkajianPersistemIcuModel(
          berpakaian: "",
          mandi: "",
          sistemEliminasi: "",
          sistemMakan: "",
          sistemMasalahDenganNutrisi: "",
          sistemMobilisasi: "",
          airway: "",
          breathing: "",
          circulation: "",
          nutrisi: "",
          makan: "",
          padaBayi: "",
          minum: "",
          eliminasiBak: "",
          eliminasiBab: "",
          aktivitasIstirahat: "",
          aktivitas: "",
          berjalan: "",
          penggunaanAlatBantu: "",
          perfusiSerebral: "",
          pupil: "",
          refleksCahaya: "",
          perfusiRenal: "",
          pefusiGastroinestinal: "",
          abdomen: "",
          thermoregulasi: "",
          kenyamanan: "",
          kualitas: "",
          pola: "",
          nyeriMempengaruhi: "",
          statusMental: "",
          kejang: "",
          pasangPengamanTempatTidur: "",
          belMudaDijangkau: "",
          penglihatan: "",
          pendengaran: "",
          hamil: "",
          pemeriksaanCervixTerakhir: "",
          pemeriksaanPayudaraSendiri: "",
          mamografiTerakhirTanggal: "",
          penggunaanAlatKontrasepsi: "",
          bicara: "",
          bahasaSehariHari: "",
          perluPenerjemah: "",
          bahasaIsyarat: "",
          hambatanBelajar: "",
          caraBelajarDisukai: "",
          tingkatPendidikan: "",
          potensialKebutuhanPembelajaran: "",
          responseEmosi: "",
          sistemSosial: "",
          tingkatBersama: "",
          kondisiLingkunganDirumah: "",
          nilaiKepercayaan: "",
          menjalankanIbadah: "",
          presepsiTerhadapSakit: "",
          kunjunganPemimpin: "",
          nilaiAturanKhusus: ""),
      saveResult: none(),
      status: PemeriksaanFisikIcuStatus.initial,
      fisikModel: PemeriksaanFisikIcuModel(
        dada: "",
        ekstremitas: "",
        gcsE: "",
        gcsM: "",
        gcsV: "",
        gigi: "",
        hidung: "",
        integumen: "",
        jantung: "",
        kepala: "",
        leher: "",
        lidah: "",
        mata: "",
        mulut: "",
        rambut: "",
        respirasi: "",
        telinga: "",
        tenggorokan: "",
        wajah: "",
        kesadaran: "",
      ));

  PemeriksaanFisikIcuState copyWith({
    PemeriksaanFisikIcuModel? fisikModel,
    PemeriksaanFisikIcuStatus? status,
    PengkajianPersistemIcuModel? pengkajianPersistemICU,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
  }) {
    return PemeriksaanFisikIcuState(
      pengkajianPersistemICU:
          pengkajianPersistemICU ?? this.pengkajianPersistemICU,
      saveResult: saveResult ?? this.saveResult,
      fisikModel: fisikModel ?? this.fisikModel,
      status: status ?? this.status,
    );
  }
}
