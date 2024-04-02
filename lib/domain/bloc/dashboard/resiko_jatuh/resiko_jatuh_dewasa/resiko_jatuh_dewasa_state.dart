// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'resiko_jatuh_dewasa_bloc.dart';

enum ResikoJatuhDewasaStatus {
  initial,
  loading,
  loaded,
  error,
  onSelected,
  onSave,
  isLoadingSave,
  changedShift,
}

class ResikoJatuhDewasaState extends Equatable {
  final ResikoJatuhDewasaStatus status;
  final List<ResikoJatuhPasienModel> resikoJatuh;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveData;
  final int total;
  const ResikoJatuhDewasaState(
      {required this.status,
      required this.resikoJatuh,
      required this.saveData,
      required this.total});

  static ResikoJatuhDewasaState initial() => ResikoJatuhDewasaState(
      saveData: none(),
      total: 0,
      status: ResikoJatuhDewasaStatus.initial,
      resikoJatuh: const []);

  @override
  List<Object?> get props => [status, resikoJatuh, saveData];

  ResikoJatuhDewasaState copyWith({
    ResikoJatuhDewasaStatus? status,
    List<ResikoJatuhPasienModel>? resikoJatuh,
    int? total,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveData,
  }) {
    return ResikoJatuhDewasaState(
      total: total ?? this.total,
      status: status ?? this.status,
      resikoJatuh: resikoJatuh ?? this.resikoJatuh,
      saveData: saveData ?? this.saveData,
    );
  }
}
