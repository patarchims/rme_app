part of 'pengkajian_nutrisi_anak_bloc.dart';

enum PengkajianNutrisiStatus {
  initial,
  loading,
  loaded,
  error,
  isChanged,
  isLoadingGet,
  isLoadingSave,
  loadedSave,
}

class PengkajianNutrisiAnakState extends Equatable {
  final PengkajianNutrisiAnak pengkajianNutrisiAnak;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final PengkajianNutrisiStatus status;

  const PengkajianNutrisiAnakState({
    required this.status,
    required this.pengkajianNutrisiAnak,
    required this.saveResultFailure,
  });

  @override
  List<Object?> get props => [status, pengkajianNutrisiAnak, saveResultFailure];

  static PengkajianNutrisiAnakState initial() => PengkajianNutrisiAnakState(
      saveResultFailure: none(),
      status: PengkajianNutrisiStatus.initial,
      pengkajianNutrisiAnak: PengkajianNutrisiAnak(
          total: 0,
          keterangan: "",
          n1: "",
          n2: "",
          n3: "",
          n4: "",
          nilai: 0,
          nilaiN1: 0,
          nilaiN2: 0,
          nilaiN3: 0,
          nilaiN4: 0,
          noreg: ""));

  PengkajianNutrisiAnakState copyWith(
      {PengkajianNutrisiStatus? status,
      PengkajianNutrisiAnak? pengkajianNutrisiAnak,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure}) {
    return PengkajianNutrisiAnakState(
        status: status ?? this.status,
        saveResultFailure: saveResultFailure ?? this.saveResultFailure,
        pengkajianNutrisiAnak:
            pengkajianNutrisiAnak ?? this.pengkajianNutrisiAnak);
  }
}
