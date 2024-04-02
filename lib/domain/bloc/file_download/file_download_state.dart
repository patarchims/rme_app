part of 'file_download_bloc.dart';

@freezed
class FileDownloadState with _$FileDownloadState {
  const factory FileDownloadState.initial() = _Initial;
  const factory FileDownloadState.loading() = _Loading;
  const factory FileDownloadState.failure({required String failure}) = _Failure;
  const factory FileDownloadState.success({required String filePath}) =
      _Success;
}
