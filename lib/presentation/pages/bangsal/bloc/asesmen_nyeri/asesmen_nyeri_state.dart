part of 'asesmen_nyeri_bloc.dart';

enum AsesmenNyeriStatus {
  initial,
  loading,
  loaded,
  error,
  isChanged,
  isLoadingGet,
  isLoadingUpdate,
  isLoadingSave,
  loadedSave,
}

class AsesmenNyeriState extends Equatable {
  final AsesmenNyeriStatus status;
  final SkalaNyeriResponse skalaNyeri;
  final ReportSkalaNyeri reportSkalaNyeri;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  const AsesmenNyeriState({
    required this.status,
    required this.skalaNyeri,
    required this.reportSkalaNyeri,
    required this.saveResultFailure,
  });

  @override
  List<Object?> get props =>
      [status, skalaNyeri, saveResultFailure, reportSkalaNyeri];

  static AsesmenNyeriState initial() => AsesmenNyeriState(
      saveResultFailure: none(),
      reportSkalaNyeri: ReportSkalaNyeri(
          karyawan: Karyawan(nama: "", jenisKelamin: "", tglLahir: ""),
          skalaNyeri: SkalaNyeri(skalaNyeri: 0)),
      status: AsesmenNyeriStatus.initial,
      skalaNyeri: SkalaNyeriResponse(skalaNyeri: 0));

  AsesmenNyeriState copyWith({
    AsesmenNyeriStatus? status,
    SkalaNyeriResponse? skalaNyeri,
    ReportSkalaNyeri? reportSkalaNyeri,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
  }) {
    return AsesmenNyeriState(
      reportSkalaNyeri: reportSkalaNyeri ?? this.reportSkalaNyeri,
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      status: status ?? this.status,
      skalaNyeri: skalaNyeri ?? this.skalaNyeri,
    );
  }
}
