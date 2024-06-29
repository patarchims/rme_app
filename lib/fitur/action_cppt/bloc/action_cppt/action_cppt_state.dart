part of 'action_cppt_bloc.dart';

enum ActionStatus {
  initial,
  loading,
  loaded,
  error,
}

class ActionCpptState extends Equatable {
  final ActionStatus status;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;

  const ActionCpptState({
    required this.status,
    required this.getResult,
    required this.saveResult,
  });
  @override
  List<Object?> get props => [
        status,
        saveResult,
        getResult,
      ];

  static ActionCpptState initial() => const ActionCpptState(
        status: ActionStatus.initial,
        getResult: None(),
        saveResult: None(),
      );
}
