// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'report_asesmen_bayi_bloc.dart';

enum ReportAsesmenBayiStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGet,
  isLoadingSave,
  isLoaded,
}

class ReportAsesmenBayiState extends Equatable {
  final ReportAsesmenBayiStatus status;
  final ReponseResumeMedisPerinatologi responseResumeMedisPerinatologi;
  final List<ReportAnalisaDataResponse> analisaData;
  const ReportAsesmenBayiState({
    required this.status,
    required this.responseResumeMedisPerinatologi,
    required this.analisaData,
  });
  static ReportAsesmenBayiState initial() => ReportAsesmenBayiState(
      status: ReportAsesmenBayiStatus.initial,
      analisaData: const [],
      responseResumeMedisPerinatologi: ReponseResumeMedisPerinatologi(
          identitasBayiResponse: IdentitasBayiResponse(
              namaBayi: "",
              tglLahir: "",
              noRm: "",
              noReg: "",
              umur: "",
              jk: "",
              tglMasuk: "",
              tglKeluar: "",
              dokterAnak: "",
              namaIbu: "",
              ruang: "",
              agama: "",
              alamat: "",
              dokterObgyn: "")));

  @override
  List<Object?> get props => [status, analisaData];

  ReportAsesmenBayiState copyWith({
    ReportAsesmenBayiStatus? status,
    ReponseResumeMedisPerinatologi? responseResumeMedisPerinatologi,
    List<ReportAnalisaDataResponse>? analisaData,
  }) {
    return ReportAsesmenBayiState(
        responseResumeMedisPerinatologi: responseResumeMedisPerinatologi ??
            this.responseResumeMedisPerinatologi,
        status: status ?? this.status,
        analisaData: analisaData ?? this.analisaData);
  }
}
