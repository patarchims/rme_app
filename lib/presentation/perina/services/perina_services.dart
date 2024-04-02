import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/presentation/perina/repository/apgar_score_response_model.dart';
import 'package:hms_app/presentation/perina/repository/asesmen_perina_response_model.dart';
import 'package:hms_app/presentation/perina/repository/ddown_score_perina_response_model.dart';
import 'package:hms_app/presentation/perina/repository/dvital_sign_perina_respone_model.dart';
import 'package:hms_app/presentation/perina/repository/pemeriksaan_fisik_perina_reponse_model.dart';
import 'package:hms_app/presentation/perina/repository/tindak_lajut_perin_dokter_response_model.dart';

class PerinaServices {
  Future<dynamic> getAsesmenBayi({
    required String noreg,
    required String person,
    required String noRM,
  }) {
    return MyDio().getAndToken(
        data: DTO.onGetAsesmenPerina(
          noReg: noreg,
          noRM: noRM,
          person: person,
        ),
        endPoint: "/v1/asesmen-bayi");
  }

  Future<dynamic> getTindakLanjut({
    required String noreg,
    required String noRM,
  }) {
    return MyDio().getAndToken(
        data: DTO.onGetTindakLanjutDokter(
          noReg: noreg,
          noRM: noRM,
        ),
        endPoint: "/v1/tindak-lanjut-perina");
  }

  Future<dynamic> getReportAsesmenAwalBayi({
    required String noreg,
    required String noRM,
  }) {
    return MyDio().putWithToken(
        data: DTO.onGetReportAsesmenPerina(
          noReg: noreg,
          noRM: noRM,
        ),
        endPoint: "/v1/report-asesmen-bayi");
  }

  Future<dynamic> onGetPemeriksaanFisikPerina({
    required String noreg,
    required String person,
  }) {
    return MyDio().getAndToken(
        data: DTO.onGetPemeriksaanFisikPerina(
          noReg: noreg,
          person: person,
        ),
        endPoint: "/v1/pemeriksaan-fisik-perina");
  }

  Future<dynamic> onDeleteRiwayatKelahiranYangLalu({
    required String nomor,
    required String noReg,
    required String noRM,
  }) {
    return MyDio().deleteWithToken(
        data: DTO.onDeleteRiwayatKehamilanLalu(
            nomor: nomor, noRM: noRM, noReg: noReg),
        endPoint: "/v1/riwayat-kelahiran-lalu-perina");
  }

  Future<dynamic> onGetDVitalSignPerina({
    required String noreg,
    required String person,
    required String pelayanan,
  }) {
    return MyDio().getAndToken(
        data: DTO.onGetDVitalSingPerina(
            noReg: noreg, person: person, pelayanan: pelayanan),
        endPoint: "/v1/dvital-sign-perina");
  }

  Future<dynamic> onGetNeoNatusPerina({
    required String noreg,
  }) {
    return MyDio().getAndToken(
        data: DTO.onGetScoreNeoNatus(
          noReg: noreg,
        ),
        endPoint: "/v1/ddown_score_neonatus-perina");
  }

  Future<dynamic> onGetReportAnalisaData({
    required String noreg,
  }) {
    return MyDio().putWithToken(
        data: DTO.noRegV2(
          noReg: noreg,
        ),
        endPoint: "/v1/report-analisa-data");
  }

  Future<dynamic> onGetResumeMedisPerina({
    required String noreg,
    required String noRM,
  }) {
    return MyDio().putWithToken(
        data: DTO.getResumeMedis(noReg: noreg, noRM: noRM),
        endPoint: "/v1/report-resume-medis-perinatologi");
  }

  Future<dynamic> onGetApgarScore({
    required String noreg,
  }) {
    return MyDio().getAndToken(
        data: DTO.onGetScoreNeoNatus(
          noReg: noreg,
        ),
        endPoint: "/v1/dapgar-score-perina");
  }

  // SAVE ASESMEN IGD DOKTER
  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveApgarScore({
    required String noReg,
    required ApgarScoreModel score,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/dapgar-score-perina",
      data: DTO.onSaveApgarScore(
        score: score,
        noReg: noReg,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveAsesmenKeperawatanBayi({
    required String devicesID,
    required String pelayanan,
    required String person,
    required String noReg,
    required String noRM,
    required RiwayatKehamilanPerinaModel kehamilanPerinal,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/riwayat-kelahiran-lalu-perina",
      data: DTO.onSaveKeperawatanBayi(
          noReg: noReg,
          devicesID: devicesID,
          kehamilanPerinal: kehamilanPerinal,
          noRM: noRM,
          pelayanan: pelayanan,
          person: person),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveTindakLajutPerina({
    required String devicesID,
    required String pelayanan,
    required String person,
    required String noReg,
    required TindakLajutModel tindakLajut,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/tindak-lanjut-perina",
      data: DTO.onSaveTindakLajutPerinaDokter(
          deviceID: devicesID,
          tindakLanjut: tindakLajut,
          noReg: noReg,
          pelayanan: pelayanan,
          person: person),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveAsesmenBayi({
    required String devicesID,
    required String person,
    required String noReg,
    required String noRM,
    required String dpjp,
    required String pelayanan,
    required AsesmenBayiModel asesmen,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/asesmen-bayi",
      data: DTO.onSaveAsesmenBayi(
          dpjp: dpjp,
          asesmen: asesmen,
          pelayanan: pelayanan,
          noReg: noReg,
          devicesID: devicesID,
          noRM: noRM,
          person: person),
    );
  }

  // SAVE ASESMEN IGD DOKTER
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePemeriksaanFisikPerina({
    required String deviceID,
    required String noReg,
    required String pelayanan,
    required String person,
    required FisikPerinaModel fisik,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/pemeriksaan-fisik-perina",
      data: DTO.onSavePemeriksaanFisikPerina(
          devicesID: deviceID,
          noReg: noReg,
          pelayanan: pelayanan,
          person: person,
          fisik: fisik),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveScoreNeonatus({
    required String noReg,
    required String person,
    required DDownScorePerinaModel neoNatus,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/ddown_score_neonatus-perina",
      data: DTO.onSaveScoreNeoNatus(
          noReg: noReg, person: person, score: neoNatus),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveDVitalSignPerina({
    required String deviceID,
    required String noReg,
    required String pelayanan,
    required String person,
    required String kategori,
    required VItalSignPerina vitalSign,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/dvital-sign-perina",
      data: DTO.onSaveDVitalSignPerina(
        kategori: kategori,
        devicesID: deviceID,
        vitalSign: vitalSign,
        noReg: noReg,
        pelayanan: pelayanan,
        person: person,
      ),
    );
  }
}

final perinaServices = PerinaServices();
