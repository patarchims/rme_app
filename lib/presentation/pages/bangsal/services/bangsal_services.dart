import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/endpoints.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/dto/perawatan_dto.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/pengkajian_keperawatan_persistem_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/vital_sign_keperawatan_repository.dart';

class KeperawatanServices {
  // GET ALL ICD 10
  Future<dynamic> getKtaripResep() {
    return MyDio().getAndToken(endPoint: "/v1/resep-obat");
  }

  // GET PENGKJIAN ANAK REPO
  Future<dynamic> getPengkajianFisikAnakRepo({
    required String noReg,
    required String person,
  }) {
    return MyDio().getAndToken(
      data: DTOKeperawatan.pengkajianFisikAnak(noReg: noReg, person: person),
      endPoint: "/v1/get-pemeriksaan-fisik-anak",
    );
  }

  Future<dynamic> onGetCPPTSBAR({
    required String noreg,
  }) {
    return MyDio().getAndToken(
        data: DTOKeperawatan.onGETCPPTSBAR(noReg: noreg),
        endPoint: "/v1/cppt-sbar-bangsal");
  }

  Future<dynamic> onGetPengkajianNutrisiAnak({
    required String noreg,
  }) {
    return MyDio().getAndToken(
        data: DTOKeperawatan.onGETCPPTSBAR(noReg: noreg),
        endPoint: "/v1/pengkajian-nutrisi-anak");
  }

  Future<dynamic> onGetPengkajianNyeriAnak({
    required String noreg,
  }) {
    return MyDio().getAndToken(
        data: DTOKeperawatan.onGETCPPTSBAR(noReg: noreg),
        endPoint: "/v1/pengkajian-nyeri-anak");
  }

  // SAVE ASESMEN IGD DOKTER
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      savePengkajianAwalKeperawatan({
    required String noreg,
    required String dpjp,
    required String noRM,
    required String person,
    required String pelayanan,
    required String deviceID,
    required String jenPel,
    required String detailJenPel,
    required String keluhanUtama,
    required String rwtPenyakit,
    required String rwtPenyakitDahulu,
    required String reaksiAlergi,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.pengkajianAwalKeperawatan,
      data: DTOKeperawatan.savePengkajianAwalKeperawatan(
          noreg: noreg,
          dpjp: dpjp,
          noRM: noRM,
          person: person,
          pelayanan: pelayanan,
          deviceID: deviceID,
          jenPel: jenPel,
          detailJenPel: detailJenPel,
          keluhanUtama: keluhanUtama,
          rwtPenyakit: rwtPenyakit,
          riwayatPenyakitDahulu: rwtPenyakitDahulu,
          reaksiAlergi: reaksiAlergi),
    );
  }

  // SAVE ASESMEN IGD DOKTER
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePemeriksaanFisikAnak({
    required String deviceID,
    required String pelayanan,
    required String person,
    required String noReg,
    required String mata,
    required String telinga,
    required String hidung,
    required String mulut,
    required String leherDanBahu,
    required String dada,
    required String abdomen,
    required String punggung,
    required String nutrisiDanHidrasi,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.savePemeriksaanFisikAnak,
      data: DTOKeperawatan.onSavePengkajianFisikAnak(
        person: person,
        pelayanan: pelayanan,
        deviceID: deviceID,
        abdomen: abdomen,
        dada: dada,
        hidung: hidung,
        leherDanBahu: leherDanBahu,
        mata: mata,
        mulut: mulut,
        noReg: noReg,
        nutrisiDanHidrasi: nutrisiDanHidrasi,
        punggung: punggung,
        telinga: telinga,
      ),
    );
  }

  Future<dynamic> onUpdateCPPTSBARBangsal({
    required int idCPPT,
    required String situation,
    required String background,
    required String asesmen,
    required String recomendation,
  }) {
    return MyDio().putWithToken(
      endPoint: EndPoint.cpptBangsal,
      data: DTOKeperawatan.updateCPPTSBAR(
          asesmen: asesmen,
          background: background,
          idCPPT: idCPPT,
          recomendation: recomendation,
          situation: situation),
    );
  }

  Future<dynamic> onGetCatatanKeperawatan({
    required String noReg,
  }) {
    return MyDio().putWithToken(
      endPoint: "/v1/catatan-keperawatan",
      data: DTOKeperawatan.onGetCatatanKeperawatan(noReg: noReg),
    );
  }

  Future<dynamic> onGetPengkajianPersistemKeperawatan({
    required String noReg,
    required String noRM,
    required String person,
  }) {
    return MyDio().getAndToken(
        endPoint: EndPoint.pengkajianPersistemKeperawatan,
        data: DTOKeperawatan.pengkajianPersistemKeperawatan(
            noReg: noReg, noRm: noRM, person: person));
  }

  Future<dynamic> onGetSkalaAsesmenNyeri({
    required String noReg,
  }) {
    return MyDio().getAndToken(
        endPoint: "/v1/asesmen-skala-nyeri",
        data: DTOKeperawatan.onGetSkalaNyeri(
          noReg: noReg,
        ));
  }

  Future<dynamic> onDeleteCPTTSBARBangsalEvent({
    required int idCPPT,
  }) {
    return MyDio().deleteWithToken(
      endPoint: EndPoint.cpptBangsal,
      data: DTOKeperawatan.deleteCPPTSBAR(
        idCPPT: idCPPT,
      ),
    );
  }

  Future<dynamic> onReportAsesmenSkalaNyeri({
    required String noReg,
  }) {
    return MyDio().putWithToken(
      endPoint: "/v1/report-asesmen-skala-nyeri",
      data: DTOKeperawatan.onGetSkalaNyeri(
        noReg: noReg,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePengkajianPersistemKeperawatan({
    required PengkajianKeperawatanPesistemModel
        pengkajianKeperawatanPesistemModel,
    required String noReg,
    required String person,
    required String pelayanan,
    required String devicesID,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.pengkajianPersistemKeperawatan,
      data: DTOKeperawatan.onSavePengkajianPersistemKeperawatan(
          devicesID: devicesID,
          noReg: noReg,
          pelayanan: pelayanan,
          pengkajianKeperawatanPesistemModel:
              pengkajianKeperawatanPesistemModel,
          person: person),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveCatatanKeperawatan({
    required String catatan,
    required String noReg,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/catatan-keperawatan",
      data: DTOKeperawatan.onSaveCatatanKeperawatan(
          catatan: catatan, noReg: noReg),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveAsesmenNyeriKeperawatan({
    required String noReg,
    required String person,
    required String pelayanan,
    required String devicesID,
    required int skalaNyeri,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/asesmen-skala-nyeri",
      data: DTOKeperawatan.onSaveAsesmenNyeriKeperawatan(
          skalaNyeri: skalaNyeri,
          pelayanan: pelayanan,
          noReg: noReg,
          deviceID: devicesID,
          person: person),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePengkajianNutrisiAnak({
    required String noReg,
    required String devicesID,
    required String nilai1,
    required String nilai2,
    required String nilai3,
    required String nilai4,
    required int nilai,
  }) {
    return MyDio().postDataWithToken(
      endPoint: "/v1/pengkajian-nutrisi-anak",
      data: DTOKeperawatan.onSavePengkajianNutrisiAnak(
        nilai1: nilai1,
        nilai2: nilai2,
        nilai3: nilai3,
        nilai4: nilai4,
        nilai: nilai,
        noReg: noReg,
        deviceID: devicesID,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveCPPTSBARBangsal({
    required String noReg,
    required String kelompok,
    required String situation,
    required String background,
    required String deviceID,
    required String asesmen,
    required String recomendation,
    required String ppa,
    required String dpjp,
    required String pelayanan,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.cpptBangsal,
      data: DTOKeperawatan.saveCPPTSBAR(
          deviceID: deviceID,
          dpjp: dpjp,
          pelayanan: pelayanan,
          noReg: noReg,
          ppa: ppa,
          kelompok: kelompok,
          situation: situation,
          background: background,
          asesmen: asesmen,
          recomendation: recomendation),
    );
  }

  Future<dynamic> onGetPengkajianAwalKeperawatan({
    required String noreg,
    required String noRM,
    required String person,
    required String tanggal,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.pengkajianAwalKeperawatan,
      data: DTOKeperawatan.onGetPengkajianAwalKeperawatanBangsal(
        tanggal: tanggal,
        noReg: noreg,
        noRM: noRM,
        person: person,
      ),
    );
  }

  Future<dynamic> savePenyakitKeluargaEvent({
    required String noRM,
    required String penyakit,
  }) {
    return MyDio().postAndToken(
      endPoint: EndPoint.riwayatPenyakitKeluarga,
      data: DTOKeperawatan.onSaveRiwayatPenyakitKelurga(
          noRm: noRM, penyakit: penyakit),
    );
  }

  Future<dynamic> onGetTandaVitalIGDDokter({
    required String noReg,
    required String person,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.tandaVitalKeperawatan,
      data: DTOKeperawatan.onGetTandaVitalKeperawatanBangsal(
        noReg: noReg,
        person: person,
      ),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveTandaVitalKeperawatanBangsal({
    required String noReg,
    required String pelayanan,
    required String person,
    required String devicesID,
    required VitalSignKeperawatanModel tandaVitalIgdDokter,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.tandaVitalKeperawatan,
      data: DTOKeperawatan.onSaveTandaVitalKeperawatanBangsal(
        pelayanan: pelayanan,
        devicesID: devicesID,
        tandaVitalIgdDokter: tandaVitalIgdDokter,
        noReg: noReg,
        person: person,
      ),
    );
  }
}

final keperawatanBangsalService = KeperawatanServices();
