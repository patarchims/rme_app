// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'diagnosa_kebidanan_bloc.dart';

enum DiagnosaKebidananStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadedKebidanan,
  isLoadingGetKebidanan,

  isloadingSaveData,
  isLoadedSaveData,

  isLoadingGetData,
  isLoadedGetData,

  isLoadingDeleteDiagnosa,
}

class DiagnosaKebidananState extends Equatable {
  final DiagnosaKebidananStatus status;
  final List<DiagnosaKebidananModel> diagnosaKebidanan;
  final List<DiagnosaKebidananResponse> diagnosaKebidananResponse;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> deleteData;

  const DiagnosaKebidananState({
    required this.status,
    required this.deleteData,
    required this.diagnosaKebidanan,
    required this.diagnosaKebidananResponse,
    required this.getResult,
    required this.saveResult,
  });

  static DiagnosaKebidananState initial() => DiagnosaKebidananState(
        diagnosaKebidanan: const [],
        deleteData: none(),
        diagnosaKebidananResponse: const [],
        getResult: none(),
        saveResult: none(),
        status: DiagnosaKebidananStatus.initial,
      );

  @override
  List<Object?> get props =>
      [status, getResult, saveResult, diagnosaKebidanan, deleteData];

  DiagnosaKebidananState copyWith({
    DiagnosaKebidananStatus? status,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? getResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? deleteData,
    List<DiagnosaKebidananModel>? diagnosaKebidanan,
    List<DiagnosaKebidananResponse>? diagnosaKebidananResponse,
  }) {
    return DiagnosaKebidananState(
      deleteData: deleteData ?? this.deleteData,
      diagnosaKebidananResponse:
          diagnosaKebidananResponse ?? this.diagnosaKebidananResponse,
      diagnosaKebidanan: diagnosaKebidanan ?? this.diagnosaKebidanan,
      status: status ?? this.status,
      getResult: getResult ?? this.getResult,
      saveResult: saveResult ?? this.saveResult,
    );
  }
}
