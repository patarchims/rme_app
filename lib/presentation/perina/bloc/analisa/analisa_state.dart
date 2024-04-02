// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'analisa_bloc.dart';

enum AnalisaStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadedKebidanan,
  isLoadingGetKebidanan,

  isloadingSaveData,
  isLoadedSaveData,

  isLoadingGetData,
  isLoadingGetAnalisaData,
  isLoadedGetData,

  isLoadingDeleteDiagnosa,
  selected,
}

// validasi-analisa-data
class AnalisaState extends Equatable {
  final AnalisaStatus status;
  final List<DiagnosaKeperawatanModel> diagnosaKeperawatanModel;
  final List<AnalisaDataModel> analisaData;
  final List<DiagnosaKeperawatanModel> selectedDiagnosa;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onValidasi;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onDelete;
  const AnalisaState(
      {required this.status,
      required this.saveResult,
      required this.analisaData,
      required this.onValidasi,
      required this.onDelete,
      required this.diagnosaKeperawatanModel,
      required this.selectedDiagnosa});
  @override
  List<Object?> get props => [
        diagnosaKeperawatanModel,
        onValidasi,
        status,
        selectedDiagnosa,
        onDelete,
        analisaData,
        saveResult,
      ];

  static AnalisaState initial() => const AnalisaState(
      onValidasi: None(),
      onDelete: None(),
      analisaData: [],
      selectedDiagnosa: [],
      saveResult: None(),
      status: AnalisaStatus.initial,
      diagnosaKeperawatanModel: []);

  AnalisaState copyWith({
    AnalisaStatus? status,
    List<AnalisaDataModel>? analisaData,
    List<DiagnosaKeperawatanModel>? diagnosaKeperawatanModel,
    List<DiagnosaKeperawatanModel>? selectedDiagnosa,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? onValidasi,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? onDelete,
  }) {
    return AnalisaState(
      onValidasi: onValidasi ?? this.onValidasi,
      analisaData: analisaData ?? this.analisaData,
      onDelete: onDelete ?? this.onDelete,
      status: status ?? this.status,
      saveResult: saveResult ?? this.saveResult,
      selectedDiagnosa: selectedDiagnosa ?? this.selectedDiagnosa,
      diagnosaKeperawatanModel:
          diagnosaKeperawatanModel ?? this.diagnosaKeperawatanModel,
    );
  }
}
