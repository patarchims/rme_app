part of 'early_warning_system_bloc.dart';

enum EarlyWarningSystemStatus {
  initial,
  loading,
  isLoadingGetData,
  loaded,
  error,
  isChanged,
}

class EarlyWarningSystemState extends Equatable {
  final EarlyWarningSystemStatus status;
  final EarlyWarningSystemModel earlyWarningSystemModel;
  final List<EarlyWarningSystem> earlyWarningSystem;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> onDeleteResult;
  const EarlyWarningSystemState({
    required this.status,
    required this.earlyWarningSystem,
    required this.saveResult,
    required this.earlyWarningSystemModel,
    required this.onDeleteResult,
  });

  @override
  List<Object?> get props => [
        status,
        saveResult,
        earlyWarningSystem,
        onDeleteResult,
        earlyWarningSystemModel
      ];

  static EarlyWarningSystemState initial() => EarlyWarningSystemState(
      earlyWarningSystemModel: EarlyWarningSystemModel(
          nilaiCRT: 0,
          nilaiDarah: 0,
          nilaiKesadaran: 0,
          nilaiNadi: 0,
          nilaiNafas: 0,
          nilaiObsigen: 0,
          nilaiSuhu: 0,
          nilaiTd: 0,
          kategori: "Dewasa",
          tingkatKesadaran: 'Alert',
          td: 10,
          td2: 10,
          nadi: 10,
          pernapasan: 10,
          reaksiOtot: "Ringan",
          suhu: 10,
          spo2: 10,
          crt: 10,
          skalaNyeri: 10,
          obsigenTambahan: "Tidak",
          keterangan: "-",
          totalSkor: 0),
      earlyWarningSystem: const [],
      saveResult: const None(),
      status: EarlyWarningSystemStatus.initial,
      onDeleteResult: const None());

  EarlyWarningSystemState copyWith(
      {EarlyWarningSystemStatus? status,
      List<EarlyWarningSystem>? earlyWarningSystem,
      EarlyWarningSystemModel? earlyWarningSystemModel,
      final Option<Either<ApiFailureResult, ApiSuccessResult>>? onDeleteResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>? saveResult}) {
    return EarlyWarningSystemState(
      earlyWarningSystemModel:
          earlyWarningSystemModel ?? this.earlyWarningSystemModel,
      earlyWarningSystem: earlyWarningSystem ?? this.earlyWarningSystem,
      saveResult: saveResult ?? this.saveResult,
      onDeleteResult: onDeleteResult ?? this.onDeleteResult,
      status: status ?? this.status,
    );
  }
}
