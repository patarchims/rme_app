// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tanda_vital_igd_dokter_bloc.dart';

enum TandaVitalIgdDokterStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  onSave,
  isLoadingGet,
  isLoadingSave,
  isLoadedSave,
  isLoadedGet,
  isChanged,
}

class TandaVitalIgdDokterState extends Equatable {
  final TandaVitalIgdDokterStatus status;
  final TandaVitalIgdDokter tandaVitalIgdDokter;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  const TandaVitalIgdDokterState({
    required this.status,
    required this.saveResultFailure,
    required this.tandaVitalIgdDokter,
  });
  @override
  List<Object?> get props => [status, tandaVitalIgdDokter, saveResultFailure];

  static TandaVitalIgdDokterState initial() => TandaVitalIgdDokterState(
      saveResultFailure: none(),
      status: TandaVitalIgdDokterStatus.initial,
      tandaVitalIgdDokter: TandaVitalIgdDokter(
          akral: "",
          pupil: "",
          beratBadan: "",
          tinggiBadan: "",
          gcsE: "0",
          gcsV: "0",
          gcsM: "0",
          td: "",
          nadi: "",
          suhu: "",
          kesadaran: "",
          pernafasan: "",
          spo2: ""));

  TandaVitalIgdDokterState copyWith(
      {TandaVitalIgdDokterStatus? status,
      TandaVitalIgdDokter? tandaVitalIgdDokter,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure}) {
    return TandaVitalIgdDokterState(
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      status: status ?? this.status,
      tandaVitalIgdDokter: tandaVitalIgdDokter ?? this.tandaVitalIgdDokter,
    );
  }
}
