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
  isLoadingGetHistoryResep,
}

class ResepState extends Equatable {
  final ResepStatus status;
  final String informasiResep;
  final List<KTaripObatModel> ktaripObat;
  final List<KTaripObatModel> ktaripObatSelection;
  final List<HistoryResepObatModel> historyResep;
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      saveResultResepFailure;
  const ResepState({
    required this.status,
    required this.informasiResep,
    required this.saveResultResepFailure,
    required this.ktaripObat,
    required this.ktaripObatSelection,
    required this.historyResep,
  });
  @override
  List<Object?> get props => [
        status,
        saveResultResepFailure,
        ktaripObat,
        ktaripObatSelection,
        historyResep
      ];

  static ResepState initial() => ResepState(
        informasiResep: "",
        historyResep: const [],
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
      List<HistoryResepObatModel>? historyResep,
      Option<Either<ApiFailureResult, ApiSuccessResult>>?
          saveResultResepFailure}) {
    return ResepState(
      historyResep: historyResep ?? this.historyResep,
      saveResultResepFailure:
          saveResultResepFailure ?? this.saveResultResepFailure,
      ktaripObat: ktaripObat ?? this.ktaripObat,
      informasiResep: informasiResep ?? this.informasiResep,
      ktaripObatSelection: ktaripObatSelection ?? this.ktaripObatSelection,
      status: status ?? this.status,
    );
  }
}
