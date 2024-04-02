import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_bidan_model.dart';
import 'package:hms_app/domain/models/response/intervensi_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';

abstract class AsesmenRespository {
  //====
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsuhanKeperawatan(
      {required String noReg,
      required List<IntervensiModel> intervesiModel,
      required String sdki,
      required String siki});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsuhanKeperawatanBidan(
      {required String noReg});

  // ASESMEN KEPERAWATAN BIDAN
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsesmenKeperawatanBidan(
      {required String noReg});

  // ====
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      saveAsesmenKeperawatanBidan(
          {required AsesmenKeperawatanBidanModel asesmenKeperawatanBidanModel});

  // ==== GET DESKRIPSI SIKI
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDeskripsiSIKI(
      {required String value});
}
