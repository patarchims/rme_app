part of 'file_download_bloc.dart';

@freezed
class FileDownloadEvent with _$FileDownloadEvent {
  const factory FileDownloadEvent.started() = _Started;
  const factory FileDownloadEvent.getReport(
      {required String urlReport,
      required String noReg,
      required String nama,
      required String tgLahir,
      required String norm,
      required String jenisKelamin}) = _GetReport;
}
