// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'early_warning_system_bloc.dart';

enum EarlyWarningSystemStatus {
  initial,
  loading,
  isLoadingGetData,
  loaded,
  error,
}

class EarlyWarningSystemState extends Equatable {
  final EarlyWarningSystemStatus status;
  final List<EarlyWarningSystem> earlyWarningSystem;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onDeleteResult;
  const EarlyWarningSystemState({
    required this.status,
    required this.saveResult,
    required this.earlyWarningSystem,
    required this.onDeleteResult,
  });

  @override
  List<Object?> get props =>
      [status, saveResult, earlyWarningSystem, onDeleteResult];

  static EarlyWarningSystemState initial() => const EarlyWarningSystemState(
      earlyWarningSystem: [],
      saveResult: None(),
      status: EarlyWarningSystemStatus.initial,
      onDeleteResult: None());

  EarlyWarningSystemState copyWith(
      {EarlyWarningSystemStatus? status,
      List<EarlyWarningSystem>? earlyWarningSystem,
      final Option<Either<ApiFailureResult, ApiSuccessResult>>? onDeleteResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult}) {
    return EarlyWarningSystemState(
      earlyWarningSystem: earlyWarningSystem ?? this.earlyWarningSystem,
      saveResult: saveResult ?? this.saveResult,
      onDeleteResult: onDeleteResult ?? this.onDeleteResult,
      status: status ?? this.status,
    );
  }
}
