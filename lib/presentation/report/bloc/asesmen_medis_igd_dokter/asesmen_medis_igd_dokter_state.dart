part of 'asesmen_medis_igd_dokter_bloc.dart';

enum AsesmenMedisStatus {
  initial,
  loading,
  loaded,
  error,

  isLoadingIntervensi,
  loadedIntervensi,
  isLoadingResikoAnak,
  loadedResikoAnak,

  // RESIKO JATUH MORSE
  isLoadingResikoJatuhMorse,
  isLoadedResikojatuhMorse,

  // Resiko Jatuh Pasien dewasa
  isLoadingResikoJatuhPasienDewasa,
  isLoadedResikoJatuhPasienDewasa
}

class AsesmenMedisIgdDokterState extends Equatable {
  final AsesmenMedisStatus status;
  final ReponseReportIgdAsesmenMedis reportIGD;
  const AsesmenMedisIgdDokterState({
    required this.status,
    required this.reportIGD,
  });

  @override
  List<Object?> get props => [status, reportIGD];

  static AsesmenMedisIgdDokterState initial() => AsesmenMedisIgdDokterState(
      status: AsesmenMedisStatus.initial,
      reportIGD: ReponseReportIgdAsesmenMedis(
          dPenLab: [],
          radiologi: [],
          vitalSIgn: VitalSign(
              insertDttm: "",
              userId: "",
              pernafasan: "",
              pelayanan: "",
              kdBagian: "",
              deviceId: "",
              kategori: "",
              person: "",
              noreg: "",
              td: "",
              nadi: "",
              suhu: "",
              spo2: ""),
          asesmen: Asesmen(
              diagnosaBanding: "",
              namaDokter: "",
              insertDttm: "",
              person: "",
              userId: "",
              pelayanan: "",
              insertPc: "",
              kdBagian: "",
              noreg: "",
              keluhUtama: "",
              rwtSekarang: "",
              tglMasuk: "",
              jamMasuk: "",
              imageLokalis: "",
              prognosis: "",
              alasanOpname: "",
              terapi: "",
              konsulke: ""),
          riwayat: [],
          alergi: [],
          tindakLanjut: TindakLanjut(
              insertDttm: "",
              kdBagian: "",
              noreg: "",
              alasanKonsul: "",
              terapi: "",
              alasanOpname: "",
              konsulKe: "",
              prognosis: "",
              tglMasuk: "",
              jamMasuk: "",
              kdDpjp: "",
              person: "",
              userId: "",
              deviceId: "",
              pelayanan: ""),
          diagnosa: [],
          fisik: Fisik(
              kepala: "",
              mata: "",
              tht: "",
              mulut: "",
              leher: "",
              dada: "",
              jantung: "",
              paru: "",
              perut: "",
              hati: "",
              limpa: "",
              ginjal: "",
              alatKelamin: "",
              anggotaGerak: "",
              refleks: "",
              kekuatanOtot: "",
              kulit: "",
              getahBening: "",
              kesadaran: "",
              rtvt: "",
              jalanNafas: "",
              sirkulasi: "")));

  AsesmenMedisIgdDokterState copyWith({
    AsesmenMedisStatus? status,
    ReponseReportIgdAsesmenMedis? reportIGD,
  }) {
    return AsesmenMedisIgdDokterState(
      status: status ?? this.status,
      reportIGD: reportIGD ?? this.reportIGD,
    );
  }
}
