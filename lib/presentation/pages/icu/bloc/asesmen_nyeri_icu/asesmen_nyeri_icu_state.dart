// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'asesmen_nyeri_icu_bloc.dart';

enum AsesmenNyeriICUStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
  isLoaded,
  isChanged,
}

class AsesmenNyeriIcuState extends Equatable {
  final AsesmenNyeriICUStatus status;
  final NyeriIcuModel nyeriIcuModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;

  const AsesmenNyeriIcuState({
    required this.status,
    required this.nyeriIcuModel,
    required this.saveResult,
  });

  static AsesmenNyeriIcuState initial() => AsesmenNyeriIcuState(
      status: AsesmenNyeriICUStatus.initial,
      saveResult: const None(),
      nyeriIcuModel: NyeriIcuModel(
          frekuensiNyeri: "",
          kualitasNyeri: "",
          lokasiNyeri: "",
          nyeri: 0,
          nyeriMenjalar: ""));

  @override
  List<Object?> get props => [status, saveResult, nyeriIcuModel];

  AsesmenNyeriIcuState copyWith({
    AsesmenNyeriICUStatus? status,
    NyeriIcuModel? nyeriIcuModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult,
  }) {
    return AsesmenNyeriIcuState(
      status: status ?? this.status,
      nyeriIcuModel: nyeriIcuModel ?? this.nyeriIcuModel,
      saveResult: saveResult ?? this.saveResult,
    );
  }
}
