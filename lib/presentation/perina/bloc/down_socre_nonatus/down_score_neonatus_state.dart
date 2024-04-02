// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'down_score_neonatus_bloc.dart';

enum DownScoreStatus {
  initial,
  loading,
  loaded,
  error,

  isLoadingGet,
  isLoadingSave,
  onSelected,
}

class DownScoreNeonatusState extends Equatable {
  final DownScoreStatus status;
  final DDownScorePerinaModel score;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  const DownScoreNeonatusState({
    required this.status,
    required this.saveResult,
    required this.score,
  });
  @override
  List<Object?> get props => [status, score];

  DownScoreNeonatusState copyWith({
    DownScoreStatus? status,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
    DDownScorePerinaModel? score,
  }) {
    return DownScoreNeonatusState(
      status: status ?? this.status,
      saveResult: saveResult ?? this.saveResult,
      score: score ?? this.score,
    );
  }

  static DownScoreNeonatusState initial() => DownScoreNeonatusState(
      saveResult: none(),
      status: DownScoreStatus.initial,
      score: DDownScorePerinaModel(
          sianosis: 0,
          total: 0,
          airEntry: 0,
          merintih: 0,
          nifas: 0,
          retraksi: 0));
}
