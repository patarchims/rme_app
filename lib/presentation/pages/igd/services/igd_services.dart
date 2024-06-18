// import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/endpoints.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/presentation/pages/igd/repository/igd_triase_igd_dokter_repository.dart';
import 'package:hms_app/presentation/pages/igd/repository/ktaripobat_repository.dart';
import 'package:hms_app/presentation/pages/igd/repository/pemeriksaan_fisik_repository.dart';
import 'package:hms_app/presentation/pages/igd/repository/pemeriksaan_fisik_repository_dokter_methodist.dart';
import 'package:hms_app/presentation/pages/igd/repository/tanda_vital_igd_dokter_repository.dart';

class IGDServices {
  // GET ALL ICD 10
  Future<dynamic> getKtaripResep() {
    return MyDio().getAndToken(endPoint: "/v1/resep-obat");
  }

  // SAVE ASESMEN IGD DOKTER
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsesmenIGD({
    required String keluhanUtama,
    required String deviceID,
    required String riwayatSekarang,
    required String noRM,
    required String noReg,
    required String pelayanan,
    required String person,
    required String tanggal,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.keluhanUtamaDokterIGD,
      data: DTO.keluhanUtamaIGD(
          deviceID: deviceID,
          keluhanUtama: keluhanUtama,
          noRM: noRM,
          noReg: noReg,
          pelayanan: pelayanan,
          person: person,
          riwayatSekarang: riwayatSekarang,
          tanggal: tanggal),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveDiagnosaBanding({
    required String noReg,
    required String person,
    required String diagnosaBanding,
    required String devicesID,
    required String pelayanan,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.diagnosaBandingIGDDokter,
      data: DTO.onSaveDiagnosaBanding(
        devicesID: devicesID,
        pelayanan: pelayanan,
        diagnosaBanding: diagnosaBanding,
        noReg: noReg,
        person: person,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveResepObatV2({
    required String noReg,
    required String namaPasien,
    required String noRM,
    required String catatan,
    required String keterangan,
    required String deviceID,
    required String namaUser,
    required List<KTaripObatModel> selectionResep,
    required String pelayanan,
    required String namaApotik,
    required String kamar,
    required String kasur,
    required String kelas,
  }) async {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.resepObatV2,
      data: DTO.onSaveResepObatV2(
        kamar: kamar,
        kasur: kasur,
        kelas: kelas,
        namaApotik: namaApotik,
        pelayanan: pelayanan,
        catatan: catatan,
        deviceID: deviceID,
        keterangan: keterangan,
        namaUser: namaUser,
        namaPasien: namaPasien,
        noRM: noRM,
        noReg: noReg,
        selectionResep: selectionResep,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveResepObat({
    required String noReg,
    required String namaPasien,
    required String noRM,
    required String catatan,
    required String keterangan,
    required String deviceID,
    required String namaUser,
    required List<KTaripObatModel> selectionResep,
  }) async {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.resepObat,
      data: DTO.onSaveResepObat(
          catatan: catatan,
          deviceID: deviceID,
          keterangan: keterangan,
          namaUser: namaUser,
          namaPasien: namaPasien,
          noRM: noRM,
          noReg: noReg,
          selectionResep: selectionResep),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePemeriksaanFisikIGDDokter({
    required PemeriksaanFisikIgdDokter pemeriksaanFisikIgdDokter,
    required String deviceID,
    required String noReg,
    required String pelayanan,
    required String person,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.pemeriksaanFisikIGDDokter,
        data: DTO.pemeriksaanFisikIGDDokter(
            pemeriksaanFisik: pemeriksaanFisikIgdDokter,
            deviceID: deviceID,
            pelayanan: pelayanan,
            person: person,
            noReg: noReg));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePemeriksaanFisikIGDDokterMethodist({
    required PemeriksaanFisikMethodistDokter pemeriksaanFisikIgdDokter,
    required String deviceID,
    required String noReg,
    required String pelayanan,
    required String person,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.pemeriksaanFisikIGDDokterMethodist,
      data: DTO.pemeriksaanFisikIGDDokterMethodist(
          pemeriksaanFisik: pemeriksaanFisikIgdDokter,
          deviceID: deviceID,
          pelayanan: pelayanan,
          person: person,
          noReg: noReg),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePemeriksaanFisikBangsal({
    required PemeriksaanFisikIgdDokter pemeriksaanFisikIgdDokter,
    required String deviceID,
    required String noReg,
    required String pelayanan,
    required String person,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.pemeriksaanFisikBangsal,
      data: DTO.pemeriksaanFisikIGDDokter(
          pemeriksaanFisik: pemeriksaanFisikIgdDokter,
          deviceID: deviceID,
          pelayanan: pelayanan,
          person: person,
          noReg: noReg),
    );
  }

  // SAVE ASESMEN IGD DOKTER
  Future<dynamic> onGetKeluhanUtama({
    required String noRM,
    required String noReg,
    required String person,
    required String tanggal,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.keluhanUtamaDokterIGD,
      data: DTO.onGetKeluhanUtamaIGD(
          noRM: noRM, noReg: noReg, person: person, tanggal: tanggal),
    );
  }

  // SAVE ASESMEN IGD DOKTER
  Future<dynamic> onGetAsesmenIGD({
    required String noReg,
    required String noRM,
    required String tanggal,
    required String person,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.asesmenIGD,
      data: DTO.onGetKeluhanUtamaIGD(
        noRM: noRM,
        noReg: noReg,
        person: person,
        tanggal: tanggal,
      ),
    );
  }

  Future<dynamic> onGetResikoJatuhGoUpAndGoTest({
    required String noRM,
    required String noReg,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.resikoJatuhGoUPGoTest,
      data: DTO.onGetResikoJatuhGoUpAndGoTest(
        noRM: noRM,
        noReg: noReg,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveResikoJatuhGoUpAndGoTest({
    required String deviceID,
    required String pelayanan,
    required String person,
    required String noreg,
    required String resikoJatuh1,
    required String resikoJatuh2,
    required String tindakan,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.resikoJatuhGoUPGoTest,
      data: DTO.onSaveResikoJatuhGoUpAndGoTest(
        deviceID: deviceID,
        noReg: noreg,
        pelayanan: pelayanan,
        resikoJatuh1: resikoJatuh1,
        resikoJatuh2: resikoJatuh2,
        tindakan: tindakan,
        person: person,
      ),
    );
  }

  Future<dynamic> onSaveRiwayatPenyakitKeluarga({
    required String noRM,
    required String noReg,
    required String person,
    required String tanggal,
    required String namaKeluarga,
  }) {
    return MyDio().postAndToken(
      endPoint: EndPoint.riwayatPenyakitKeluargaIGD,
      data: DTO.onSaveRiwayatPenyakitKeluarga(
          noRM: noRM,
          noReg: noReg,
          person: person,
          tanggal: tanggal,
          namaKeluarga: namaKeluarga),
    );
  }

  Future<dynamic> onGetDataTriaseIGDDokter({
    required String noReg,
    required String person,
    required String pelayanan,
  }) {
    return MyDio().getAndToken(
      endPoint: "/v1/triase-igd-dokter",
      data: DTO.onGetTriaseIGDDokter(
        pelayanan: pelayanan,
        noReg: noReg,
        person: person,
      ),
    );
  }

  Future<dynamic> onGetReportTriaseIGDDokter({
    required String noReg,
    required String noRM,
    required String tanggal,
  }) {
    return MyDio().putWithToken(
      endPoint: "/v1/triase-igd-dokter",
      data: DTO.onGetTriaseIGDReportDokter(
        noRM: noRM,
        tanggal: tanggal,
        noReg: noReg,
      ),
    );
  }

  Future<dynamic> onGetReportTriasePonek({
    required String noReg,
    required String noRM,
    required String tanggal,
  }) {
    return MyDio().putWithToken(
      endPoint: "/v1/triase-ponek",
      data: DTO.onGetTriaseIGDReportDokter(
        noRM: noRM,
        tanggal: tanggal,
        noReg: noReg,
      ),
    );
  }

  Future<dynamic> onGetTandaVitalIGDDokter({
    required String noReg,
    required String person,
    required String pelayanan,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.tandaVitalIGDDokter,
      data: DTO.onGetTandaVitalIGDDokter(
        noReg: noReg,
        pelayanan: pelayanan,
        person: person,
      ),
    );
  }

  //===//
  Future<dynamic> onGetTandaVitalAnakEvent({
    required String noReg,
    required String person,
    required String pelayanan,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.tandaVitalAnak,
      data: DTO.onGetTandaVitalIGDDokter(
        noReg: noReg,
        pelayanan: pelayanan,
        person: person,
      ),
    );
  }

  Future<dynamic> onGetTandaVitalIGDPerawat({
    required String noReg,
    required String person,
    required String pelayanan,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.tandaVitalIGDPerawat,
      data: DTO.onGetTandaVitalIGDDokter(
        noReg: noReg,
        pelayanan: pelayanan,
        person: person,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveTandaVitalIGDDokter({
    required String noReg,
    required String person,
    required String devicesID,
    required String pelayanan,
    required TandaVitalIgdDokter tandaVitalIgdDokter,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.tandaVitalIGDDokter,
      data: DTO.onSaveTandaVitalIGDDokter(
        devicesID: devicesID,
        pelayanan: pelayanan,
        tandaVitalIgdDokter: tandaVitalIgdDokter,
        noReg: noReg,
        person: person,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveTandaVitalAnakEvent({
    required String noReg,
    required String person,
    required String devicesID,
    required String pelayanan,
    required TandaVitalIgdDokter tandaVitalIgdDokter,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.tandaVitalAnak,
      data: DTO.onSaveTandaVitalIGDDokter(
        devicesID: devicesID,
        pelayanan: pelayanan,
        tandaVitalIgdDokter: tandaVitalIgdDokter,
        noReg: noReg,
        person: person,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveAsesmenTriaseIGDDokter({
    required String noReg,
    required String person,
    required String pelayanan,
    required String devicesID,
    required String kategori,
    required TriaseIgdDokterModel triase,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/triase-igd-dokter",
      data: DTO.onSaveTriaseIGDDokter(
        kategori: kategori,
        pelayanan: pelayanan,
        triase: triase,
        noReg: noReg,
        person: person,
      ),
    );
  }

  // SAVE ASESMEN IGD DOKTER
  Future<dynamic> onGetPemeriksaanFisikIGDokter({
    required String person,
    required String noReg,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.pemeriksaanFisikIGDDokter,
      data: DTO.onGetPemeriksaanFisikIGDDokter(
        noReg: noReg,
        person: person,
      ),
    );
  }

  Future<dynamic> onGetPemeriksaanFisikIGDPerawat({
    required String person,
    required String noReg,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.pemeriksaanFisikIGDPerawat,
      data: DTO.onGetPemeriksaanFisikIGDDokter(
        noReg: noReg,
        person: person,
      ),
    );
  }

  Future<dynamic> onGetPemeriksaanFisikIGDokterMethodist({
    required String person,
    required String noReg,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.pemeriksaanFisikIGDDokterMethodist,
      data: DTO.onGetPemeriksaanFisikIGDDokter(
        noReg: noReg,
        person: person,
      ),
    );
  }

  Future<dynamic> onGetPemeriksaanFisikBangsal({
    required String person,
    required String noReg,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.pemeriksaanFisikBangsal,
      data: DTO.onGetPemeriksaanFisikBangsal(
        noReg: noReg,
        person: person,
      ),
    );
  }
}

final igdServices = IGDServices();
