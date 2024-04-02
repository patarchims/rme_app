part of 'diagnosa_banding_bloc.dart';

enum DiagnosaBandingStatus {
  initial,
  loading,
  loaded,
  error,

  isLodingGetData,
  isLodingGetDiagnosaBanding,
  isLoadingSave,

  isChanged
}

class DiagnosaBandingState extends Equatable {
  final DiagnosaBandingResponseModel diagnosaBandingResponseModel;
  final DiagnosaBandingResponse diagnosaBandingResponse;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResultFailure;
  final DiagnosaBandingStatus status;
  const DiagnosaBandingState({
    required this.diagnosaBandingResponseModel,
    required this.diagnosaBandingResponse,
    required this.saveResultFailure,
    required this.status,
  });

  @override
  List<Object?> get props => [
        status,
        diagnosaBandingResponseModel,
        saveResultFailure,
        diagnosaBandingResponse
      ];

  DiagnosaBandingState copyWith({
    DiagnosaBandingResponseModel? diagnosaBandingResponseModel,
    DiagnosaBandingResponse? diagnosaBandingResponse,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResultFailure,
    DiagnosaBandingStatus? status,
  }) {
    return DiagnosaBandingState(
      diagnosaBandingResponse:
          diagnosaBandingResponse ?? this.diagnosaBandingResponse,
      diagnosaBandingResponseModel:
          diagnosaBandingResponseModel ?? this.diagnosaBandingResponseModel,
      saveResultFailure: saveResultFailure ?? this.saveResultFailure,
      status: status ?? this.status,
    );
  }

  static DiagnosaBandingState initial() => DiagnosaBandingState(
      diagnosaBandingResponse:
          DiagnosaBandingResponse(diagnosa: "", description: ""),
      diagnosaBandingResponseModel:
          DiagnosaBandingResponseModel(diagnosaBanding: "", noreg: ""),
      saveResultFailure: none(),
      status: DiagnosaBandingStatus.initial);
}
