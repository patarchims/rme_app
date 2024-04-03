import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/presentation/pages/icu/repository/pemeriksaan_fisik_icu_repository.dart';

class ICUServices {
  // GET ALL ICD 10
  Future<dynamic> getPemeriksaanFisikICU(
      {required String noReg, required String person}) {
    return MyDio().getAndToken(
        data: DTO.getFisikICU(noReg: noReg, person: person),
        endPoint: "/v1/pemeriksaan-fisik-icu");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveStatusLokalis({
    required String noReg,
    required String imageURL,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) async {
    return MyDio().formData(
        endPoint: "/v1/upload-identitas-bayi",
        data: await DTO.saveImageLokalis(
            noReg: noReg,
            picturePath: imageURL,
            deviceID: deviceID,
            pelayanan: pelayanan,
            person: person,
            userID: userID));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSavePemeriksaanFisikICU({
    required PemeriksaanFisikIcuModel pemeriksaanFisikICU,
    required String deviceID,
    required String pelayanan,
    required String person,
    required String noreg,
  }) async {
    return MyDio().formData(
        endPoint: "/v1/pemeriksaan-fisik-icu",
        data: pemeriksaanFisikICU.toJson(
            deviceID: deviceID,
            pelayanan: pelayanan,
            person: person,
            noreg: noreg));
  }
}

final icuServices = ICUServices();
