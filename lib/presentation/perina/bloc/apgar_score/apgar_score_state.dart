part of 'apgar_score_bloc.dart';

enum ApgarScoreStatus {
  initial,
  loading,
  loaded,
  error,

  isLoadingGet,
  isLoadingSave,
  onSelected,
}

class ApgarScoreState extends Equatable {
  final ApgarScoreStatus status;
  final ApgarScoreModel socreModel;
  final List<ApgarScoreModel> dataScoreModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  const ApgarScoreState({
    required this.status,
    required this.socreModel,
    required this.saveResult,
    required this.dataScoreModel,
  });
  static ApgarScoreState initial() => ApgarScoreState(
      saveResult: none(),
      status: ApgarScoreStatus.initial,
      dataScoreModel: const [],
      socreModel: ApgarScoreModel(
          otot: 0,
          id: 0,
          jantung: 0,
          nafas: 0,
          refleksi: 0,
          waktu: "",
          warnaKulit: 0,
          total: 0));

  @override
  List<Object?> get props => [status, socreModel, dataScoreModel, saveResult];

  ApgarScoreState copyWith({
    ApgarScoreStatus? status,
    ApgarScoreModel? socreModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    List<ApgarScoreModel>? dataScoreModel,
  }) {
    return ApgarScoreState(
      saveResult: saveResult ?? this.saveResult,
      status: status ?? this.status,
      dataScoreModel: dataScoreModel ?? this.dataScoreModel,
      socreModel: socreModel ?? this.socreModel,
    );
  }
}
