import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/dto/dto.dart';

part 'file_download_event.dart';
part 'file_download_state.dart';
part 'file_download_bloc.freezed.dart';

class FileDownloadBloc extends Bloc<FileDownloadEvent, FileDownloadState> {
  FileDownloadBloc() : super(const _Initial()) {
    on<FileDownloadEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      FileDownloadEvent event, Emitter<FileDownloadState> emit) async {
    await event.maybeMap(
        orElse: () {},
        started: (e) {},
        getReport: (e) async {
          emit(const FileDownloadState.loading());
          try {
            final Directory appDocumentsDirectory =
                await getApplicationDocumentsDirectory();

            final String fileName = e.urlReport.split('/').last;
            final String filePath = '${appDocumentsDirectory.path}/$fileName';

            final dio = Dio();

            await dio.download(
              e.urlReport,
              filePath,
              queryParameters: DTO.download(
                  noReg: e.noReg,
                  jenisKelamin: e.jenisKelamin,
                  nama: e.nama,
                  norm: e.norm,
                  tgLahir: e.tgLahir),
            );

            emit(FileDownloadState.success(filePath: filePath));
          } catch (e) {
            emit(FileDownloadState.failure(failure: e.toString()));
          }
        });
  }
}
