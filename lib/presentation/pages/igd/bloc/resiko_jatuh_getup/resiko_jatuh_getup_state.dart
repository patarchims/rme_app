// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_getup_bloc.dart';

enum ResikoJatuhGetupStatus {
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

class ResikoJatuhGetupState extends Equatable {
  final ResikoJatuhGetupStatus status;
  final ResikoJatuhGetUpAndGoTestRepository resikoJatuh;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;

  const ResikoJatuhGetupState({
    required this.status,
    required this.resikoJatuh,
    required this.saveResult,
  });
  @override
  List<Object?> get props => [
        status,
        resikoJatuh,
        saveResult,
      ];

  static ResikoJatuhGetupState initial() => ResikoJatuhGetupState(
        resikoJatuh: ResikoJatuhGetUpAndGoTestRepository(
            resikoJatuh1: "", resikoJatuh2: "", tindakan: ""),
        saveResult: none(),
        status: ResikoJatuhGetupStatus.initial,
      );

  ResikoJatuhGetupState copyWith({
    ResikoJatuhGetupStatus? status,
    ResikoJatuhGetUpAndGoTestRepository? resikoJatuh,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
  }) {
    return ResikoJatuhGetupState(
      resikoJatuh: resikoJatuh ?? this.resikoJatuh,
      status: status ?? this.status,
      saveResult: saveResult ?? this.saveResult,
    );
  }
}
