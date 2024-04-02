part of 'resep_bloc.dart';

enum ResepStatus {
  initial,
  loading,
  loaded,
  isChange,
  error,
  onSelected,
  onSave,
  isLoadingSave,
  isLoadingSaveResep,
  loadedSaveResep,
  isLoadingGet,
}

class ResepState extends Equatable {
  final ResepStatus status;
  final String informasiResep;
  final List<KTaripObatModel> ktaripObat;
  final List<KTaripObatModel> ktaripObatSelection;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      saveResultResepFailure;
  const ResepState({
    required this.status,
    required this.informasiResep,
    required this.saveResultResepFailure,
    required this.ktaripObat,
    required this.ktaripObatSelection,
  });
  @override
  List<Object?> get props =>
      [status, saveResultResepFailure, ktaripObat, ktaripObatSelection];

  static ResepState initial() => ResepState(
        informasiResep: "",
        saveResultResepFailure: none(),
        ktaripObat: const [],
        ktaripObatSelection: const [],
        status: ResepStatus.initial,
      );

  ResepState copyWith(
      {ResepStatus? status,
      List<KTaripObatModel>? ktaripObat,
      List<KTaripObatModel>? ktaripObatSelection,
      String? informasiResep,
      Option<Either<ApiFailureResult, ApiSuccessResult>>?
          saveResultResepFailure}) {
    return ResepState(
      saveResultResepFailure:
          saveResultResepFailure ?? this.saveResultResepFailure,
      ktaripObat: ktaripObat ?? this.ktaripObat,
      informasiResep: informasiResep ?? this.informasiResep,
      ktaripObatSelection: ktaripObatSelection ?? this.ktaripObatSelection,
      status: status ?? this.status,
    );
  }
}
