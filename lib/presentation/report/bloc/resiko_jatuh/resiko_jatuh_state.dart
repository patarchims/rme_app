part of 'resiko_jatuh_bloc.dart';

enum ReportResikoJatuhStatus {
  initial,
  loading,
  loaded,
  error,

  isLoadingIntervensi,
  loadedIntervensi,
  isLoadingResikoAnak,
  loadedResikoAnak,

  // RESIKO JATUH MORSE
  isLoadingResikoJatuhMorse,
  isLoadedResikojatuhMorse,

  // Resiko Jatuh Pasien dewasa
  isLoadingResikoJatuhPasienDewasa,
  isLoadedResikoJatuhPasienDewasa
}

class ResikoReportJatuhState extends Equatable {
  final ReportIntervensiResikoModel? reportIntervensiResikoModel;
  final ReportResikoJatuhAnak? reportResikoJatuhAnak;
  final ResikoJatuhMorseResponse? resikoJatuhMorseResponse;
  final ResikoJatuhDewasaResponse? resikoJatuhDewasaResponse;
  final ReportResikoJatuhStatus status;
  const ResikoReportJatuhState({
    this.resikoJatuhMorseResponse,
    this.resikoJatuhDewasaResponse,
    required this.status,
    this.reportIntervensiResikoModel,
    this.reportResikoJatuhAnak,
  });
  @override
  List<Object?> get props => [
        status,
        reportIntervensiResikoModel,
        reportResikoJatuhAnak,
        resikoJatuhMorseResponse,
        resikoJatuhDewasaResponse
      ];

  static ResikoReportJatuhState initial() => const ResikoReportJatuhState(
      status: ReportResikoJatuhStatus.initial,
      resikoJatuhMorseResponse: null,
      resikoJatuhDewasaResponse: null,
      reportResikoJatuhAnak: null,
      reportIntervensiResikoModel: null);

  ResikoReportJatuhState copyWith(
      {ReportResikoJatuhStatus? status,
      ReportResikoJatuhAnak? reportResikoJatuhAnak,
      ResikoJatuhMorseResponse? resikoJatuhMorseResponse,
      ResikoJatuhDewasaResponse? resikoJatuhDewasaResponse,
      ReportIntervensiResikoModel? reportIntervensiResikoModel}) {
    return ResikoReportJatuhState(
        status: status ?? this.status,
        resikoJatuhDewasaResponse:
            resikoJatuhDewasaResponse ?? this.resikoJatuhDewasaResponse,
        resikoJatuhMorseResponse:
            resikoJatuhMorseResponse ?? this.resikoJatuhMorseResponse,
        reportResikoJatuhAnak:
            reportResikoJatuhAnak ?? this.reportResikoJatuhAnak,
        reportIntervensiResikoModel:
            reportIntervensiResikoModel ?? this.reportIntervensiResikoModel);
  }
}
