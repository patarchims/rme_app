// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_anak_bloc.dart';

enum ResikoJatuhAnakStatus {
  initial,
  loading,
  loaded,
  onSelected,
  error,
  isLoadingSave,
}

class ResikoJatuhAnakState extends Equatable {
  final ResikoJatuhAnakStatus status;
  final List<ResikoJatuhPasienModel> resikoJatuh;
  final int? total;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveData;

  const ResikoJatuhAnakState({
    required this.status,
    required this.saveData,
    required this.resikoJatuh,
    this.total,
  });

  static ResikoJatuhAnakState initial() => ResikoJatuhAnakState(
      status: ResikoJatuhAnakStatus.initial,
      resikoJatuh: const [],
      saveData: none(),
      total: 0);

  @override
  List<Object?> get props => [status, resikoJatuh, total];

  ResikoJatuhAnakState copyWith(
      {ResikoJatuhAnakStatus? status,
      List<ResikoJatuhPasienModel>? resikoJatuh,
      int? total,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveData}) {
    return ResikoJatuhAnakState(
        saveData: saveData ?? this.saveData,
        total: total ?? this.total,
        status: status ?? this.status,
        resikoJatuh: resikoJatuh ?? this.resikoJatuh);
  }
}
