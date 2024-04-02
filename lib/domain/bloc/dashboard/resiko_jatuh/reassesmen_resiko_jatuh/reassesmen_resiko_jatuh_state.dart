// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reassesmen_resiko_jatuh_bloc.dart';

enum ReassesmenResikoJatuhStatus {
  initial,
  loading,
  loaded,
  onSelected,
  error,
  isLoadingSave,
}

class ReassesmenResikoJatuhState extends Equatable {
  final ReassesmenResikoJatuhStatus status;
  final List<ResikoJatuhPasienModel> resikoJatuh;
  final int total;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveData;

  const ReassesmenResikoJatuhState({
    required this.status,
    required this.resikoJatuh,
    required this.saveData,
    required this.total,
  });

  static ReassesmenResikoJatuhState initial() => ReassesmenResikoJatuhState(
      saveData: none(),
      status: ReassesmenResikoJatuhStatus.initial,
      resikoJatuh: const [],
      total: 0);

  @override
  List<Object?> get props => [status, resikoJatuh];

  ReassesmenResikoJatuhState copyWith({
    ReassesmenResikoJatuhStatus? status,
    List<ResikoJatuhPasienModel>? resikoJatuh,
    int? total,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveData,
  }) {
    return ReassesmenResikoJatuhState(
        saveData: saveData ?? this.saveData,
        status: status ?? this.status,
        total: total ?? this.total,
        resikoJatuh: resikoJatuh ?? this.resikoJatuh);
  }
}
