// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pemeriksaan_fisik_igd_bloc.dart';

enum PemeriksaanFisikIgdStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  onSave,
  isLoadingGet,
  isLoadingSave,
  isLoadedSave,
  isLoadingSavePemeriksaanFisikBangsal,
  isLoadedPemeriksaanFisikBangsal,
}

class PemeriksaanFisikIgdState extends Equatable {
  final PemeriksaanFisikIgdStatus status;
  final PemeriksaanFisikIgdDokter pemeriksaanFisikIgdDokter;
  final PemeriksaanFisikMethodistDokter pemeriksaanFisikIgdDokterMethodist;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  const PemeriksaanFisikIgdState({
    required this.pemeriksaanFisikIgdDokter,
    required this.pemeriksaanFisikIgdDokterMethodist,
    required this.status,
    required this.saveResultFailure,
  });
  @override
  List<Object?> get props => [
        pemeriksaanFisikIgdDokter,
        status,
        saveResultFailure,
      ];

  static PemeriksaanFisikIgdState initial() => PemeriksaanFisikIgdState(
        pemeriksaanFisikIgdDokterMethodist: PemeriksaanFisikMethodistDokter(
            kepala: "",
            mata: "",
            tht: "",
            mulut: "",
            gigi: "",
            leher: "",
            getahBening: "",
            dada: "",
            jantung: "",
            paru: "",
            perut: "",
            hati: "",
            limpa: "",
            usus: "",
            abdomenLainnya: "",
            ginjal: "",
            alatKelamin: "",
            anus: "",
            superior: "",
            inferior: ""),
        saveResultFailure: none(),
        pemeriksaanFisikIgdDokter: PemeriksaanFisikIgdDokter(
            hidung: "",
            telinga: "",
            abdomen: "",
            gigi: "",
            jalanNafas: "",
            sirkulasi: "",
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
            rtvt: ""),
        status: PemeriksaanFisikIgdStatus.initial,
      );

  PemeriksaanFisikIgdState copyWith({
    PemeriksaanFisikIgdStatus? status,
    PemeriksaanFisikIgdDokter? pemeriksaanFisikIgdDokter,
    PemeriksaanFisikMethodistDokter? pemeriksaanFisikIgdDokterMethodist,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
  }) {
    return PemeriksaanFisikIgdState(
      pemeriksaanFisikIgdDokterMethodist: pemeriksaanFisikIgdDokterMethodist ??
          this.pemeriksaanFisikIgdDokterMethodist,
      status: status ?? this.status,
      pemeriksaanFisikIgdDokter:
          pemeriksaanFisikIgdDokter ?? this.pemeriksaanFisikIgdDokter,
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
    );
  }
}
