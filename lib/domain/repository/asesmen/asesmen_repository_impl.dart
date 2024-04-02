import 'package:dartz/dartz.dart';
import 'package:hms_app/di/injection.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_bidan_model.dart';
import 'package:hms_app/domain/models/response/intervensi_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/endpoints.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/domain/repository/asesmen/asesmen_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AsesmenRespository)
class AsesmenRepositoryImpl extends AsesmenRespository {
  // DIGUNAKAN UNTUK METHOD HTTP GET ASUHAN KEPERAWATAN
  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsuhanKeperawatan(
      {required String noReg,
      required List<IntervensiModel> intervesiModel,
      required String sdki,
      required String siki}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.asuhanKeperawatan,
        data: DTO.saveAsuhanKeperawatan(
            noReg: noReg,
            intervesiModel: intervesiModel,
            sdki: sdki,
            siki: siki));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsuhanKeperawatanBidan(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.asuhanKeperawatan, data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsesmenKeperawatanBidan(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.asesmenKeperawatanBidan,
        data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      saveAsesmenKeperawatanBidan(
          {required AsesmenKeperawatanBidanModel
              asesmenKeperawatanBidanModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.asesmenKeperawatanBidan,
        data: asesmenKeperawatanBidanModel.toJson());
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDeskripsiSIKI(
      {required String value}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.searchDeskripsiSiki,
        data: DTO.getDeskriptionSIKI(siki: value));
  }
}
