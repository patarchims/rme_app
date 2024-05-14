import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/presentation/pages/icu/repository/pemeriksaan_fisik_icu_repository.dart';
import 'package:hms_app/presentation/pages/icu/repository/pengkajian_persistem_icu_repository.dart';
import 'package:hms_app/presentation/pages/icu/repository/vital_sign_icu_repository.dart';

class ICUServices {
  // GET ALL ICD 10
  Future<dynamic> getPemeriksaanFisikICU(
      {required String noReg, required String person}) {
    return MyDio().getAndToken(
        data: DTO.getFisikICU(noReg: noReg, person: person),
        endPoint: "/v1/pemeriksaan-fisik-icu");
  }

  Future<dynamic> onGetAsesmenPerawatanIntensiveICU({
    required String noReg,
    required String person,
    required String pelayanan,
    required String tanggal,
  }) {
    return MyDio().putWithToken(
        data: DTO.onGetAsesmenPerawatanIntensive(
            noReg: noReg,
            person: person,
            pelayanan: pelayanan,
            tanggal: tanggal),
        endPoint: "/v1/asesmen-perawatan-intensive");
  }

  Future<dynamic> onGetAsesmenNyeriICU({required String noReg}) {
    return MyDio().getAndToken(
        endPoint: "/v1/asesmen-nyeri-icu", data: DTO.getNoreg(noReg: noReg));
  }

  Future<dynamic> onGetPengkajianPersistemICU(
      {required String noReg,
      required String person,
      required String norM,
      required String tanggal}) {
    return MyDio().getAndToken(
        data: DTO.onGetPengkajianPerSistemICU(
            noReg: noReg, person: person, noRM: norM),
        endPoint: "/v1/pengkajian-persistem-icu");
  }

  //===//
  Future<dynamic> onGetVitalSignICU(
      {required String noReg,
      required String person,
      required String pelayanan}) {
    return MyDio().getAndToken(
        data: DTO.getVitalSignICU(
            noReg: noReg, person: person, pelayanan: pelayanan),
        endPoint: "/v1/vital-sign-icu");
  }

  Future<dynamic> onGetAsesmenUlangIntensive(
      {required String noReg, required String person, required String noRM}) {
    return MyDio().getAndToken(
        data:
            DTO.onGetAsesmenIntensive(noReg: noReg, person: person, noRM: noRM),
        endPoint: "/v1/asesmen-intensive-icu");
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

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveAsesmenIntensive({
    required String noReg,
    required String person,
    required String noRM,
    required String kdDPJP,
    required String pelayanan,
    required String deviceID,
    required String asesmen,
    required String caraMasuk,
    required String keluhanUtama,
    required String dari,
    required String penyakitSekarang,
    required String penyakitDahulu,
    required String yangMuncul,
    required String transfusiDarah,
    required String riwayatMerokok,
    required String minumanKeras,
    required String alchodolMempegaruhi,
  }) async {
    return MyDio().postDataWithToken(
        endPoint: "/v1/asesmen-intensive-icu",
        data: DTO.onSaveAsesmenUlangIntensive(
            noReg: noReg,
            person: person,
            noRM: noRM,
            kdDPJP: kdDPJP,
            pelayanan: pelayanan,
            deviceID: deviceID,
            asesmen: asesmen,
            caraMasuk: caraMasuk,
            keluhanUtama: keluhanUtama,
            dari: dari,
            penyakitSekarang: penyakitSekarang,
            penyakitDahulu: penyakitDahulu,
            yangMuncul: yangMuncul,
            transfusiDarah: transfusiDarah,
            riwayatMerokok: riwayatMerokok,
            minumanKeras: minumanKeras,
            alchodolMempegaruhi: alchodolMempegaruhi));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveAsesmenNyeriICU({
    required String kdDokter,
    required String devicesID,
    required String pelayanan,
    required String person,
    required String noReg,
    required String kategori,
    required int nyeri,
    required String lokasiNyeri,
    required String frekuensiNyeri,
    required String nyeriMenjalar,
    required String kualitasNyeri,
  }) async {
    return MyDio().postDataWithToken(
        endPoint: "/v1/asesmen-nyeri-icu",
        data: DTO.onSaveAsesmenNyeriICU(
            devicesID: devicesID,
            frekuensiNyeri: frekuensiNyeri,
            kategori: kategori,
            kdDokter: kdDokter,
            kualitasNyeri: kualitasNyeri,
            lokasiNyeri: lokasiNyeri,
            noReg: noReg,
            nyeri: nyeri,
            nyeriMenjalar: nyeriMenjalar,
            pelayanan: pelayanan,
            person: person));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePengkajianPersistemICU({
    required String noReg,
    required String person,
    required String deviceID,
    required String pelayanan,
    required String kodeDokter,
    required PengkajianPersistemIcuModel pengkajianPersistemIcuModel,
  }) async {
    return MyDio().postDataWithToken(
        endPoint: "/v1/pengkajian-persistem-icu",
        data: DTO.onSavePengkajianPersistemICU(
            noReg: noReg,
            person: person,
            deviceID: deviceID,
            pelayanan: pelayanan,
            kodeDokter: kodeDokter,
            penkajianPersistemICU: pengkajianPersistemIcuModel));
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

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveVitalSignICU({
    required VitalSignIcuModel vitalSignICU,
    required String deviceID,
    required String pelayanan,
    required String kategori,
    required String person,
    required String noreg,
  }) async {
    return MyDio().postDataWithToken(
        endPoint: "/v1/vital-sign-icu",
        data: DTO.onSaveVitalSignICU(
            kategori: kategori,
            noReg: noreg,
            person: person,
            devicesID: deviceID,
            pelayanan: pelayanan,
            tekananDarah: vitalSignICU.tekananDarah,
            nadi: vitalSignICU.nadi,
            beratBadan: vitalSignICU.beratBadan,
            suhu: vitalSignICU.suhu,
            pernapasan: vitalSignICU.pernapasan,
            tinggiBadan: vitalSignICU.tinggiBadan));
  }
}

final icuServices = ICUServices();
