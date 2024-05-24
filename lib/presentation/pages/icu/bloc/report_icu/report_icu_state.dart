// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_icu_bloc.dart';

enum ReportIcuStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
  isLoaded,
}

class ReportIcuState extends Equatable {
  final ReportIcuStatus status;
  final List<KartuCairanRepository> kartuCairan;
  final List<KartuObservasiModelRepository> kartuObservasi;
  final ReportPerawatanIntensiveIcuModel reportIntensiveIcuModel;
  const ReportIcuState({
    required this.status,
    required this.reportIntensiveIcuModel,
    required this.kartuObservasi,
    required this.kartuCairan,
  });

  @override
  List<Object?> get props => [
        status,
        reportIntensiveIcuModel,
        kartuObservasi,
        kartuCairan,
      ];

  static ReportIcuState initial() => ReportIcuState(
      kartuObservasi: [],
      kartuCairan: [],
      status: ReportIcuStatus.initial,
      reportIntensiveIcuModel: ReportPerawatanIntensiveIcuModel(
          asuhanKeperawatan: [],
          pengobatanDirumah: [],
          alergi: [],
          pengkajianPersistem: PengkajianPersistem(
            presepsiTerhadapSakit: "",
            pupil: "",
            refleksCahaya: "",
            responseEmosi: "",
            sistemEliminasi: "",
            sistemMakan: "",
            sistemMobilisasi: "",
            sistemSosial: "",
            statusMental: "",
            thermoregulasi: "",
            tingkatBersama: "",
            tingkatPendidikan: "",
            abdomen: "",
            airway: "",
            aktivitas: "",
            aktivitasIstirahat: "",
            belMudaDijangkau: "",
            berjalan: "",
            berpakaian: "",
            bicara: "",
            breathing: "",
            caraBelajarDisukai: "",
            circulation: "",
            eliminasiBab: "",
            eliminasiBak: "",
            hambatanBelajar: "",
            hamil: "",
            kejang: "",
            kenyamanan: "",
            kondisiLingkunganDirumah: "",
            kualitas: "",
            kunjunganPemimpin: "",
            makan: "",
            mamografiTerakhirTanggal: "",
            mandi: "",
            masalahDenganNutrisi: "",
            menjalankanIbadah: "",
            minum: "",
            nilaiAturanKhusus: "",
            nilaiKepercayaan: "",
            nutrisi: "",
            nyeriMempengaruhi: "",
            padaBayi: "",
            pasangPengamanTempatTidur: "",
            pefusiGastroinestinal: "",
            pemeriksaanCervixTerakhir: "",
            pemeriksaanPayudaraSendiri: "",
            pendengaran: "",
            penggunaanAlatBantu: "",
            penggunaanAlatKontrasepsi: "",
            penglihatan: "",
            perfusiRenal: "",
            perfusiSerebral: "",
            perluPenerjemah: "",
            pola: "",
            potensialKebutuhanPembelajaran: "",
            bahasaIsyarat: "",
            bahasaSehariHari: "",
          ),
          pemeriksaanFisik: PemeriksaanFisik(
              kesadaran: "",
              kepala: "",
              rambut: "",
              wajah: "",
              mata: "",
              telinga: "",
              hidung: "",
              mulut: "",
              gigi: "",
              lidah: "",
              tenggorokan: "",
              leher: "",
              dada: "",
              respirasi: "",
              jantung: "",
              integumen: "",
              ekstremitas: "",
              genetalia: ""),
          asesmen: Asesmen(
              nama: "",
              kdDpjp: "",
              asesmen: "",
              rwtDari: "",
              caraMasuk: "",
              asalMasuk: "",
              keluhan: "",
              riwayatPenyakit: "",
              reaksiYangMuncul: "",
              reaksiAlergi: "",
              transfusiDarah: "",
              rwtMerokok: "",
              rwtMinumanKeras: "",
              rwtAlkoholMempegaruhi: "")));

  ReportIcuState copyWith(
      {ReportIcuStatus? status,
      ReportPerawatanIntensiveIcuModel? reportIntensiveIcuModel,
      List<KartuObservasiModelRepository>? kartuObservasi,
      List<KartuCairanRepository>? kartuCairan}) {
    return ReportIcuState(
        kartuObservasi: kartuObservasi ?? this.kartuObservasi,
        kartuCairan: kartuCairan ?? this.kartuCairan,
        status: status ?? this.status,
        reportIntensiveIcuModel:
            reportIntensiveIcuModel ?? this.reportIntensiveIcuModel);
  }
}
