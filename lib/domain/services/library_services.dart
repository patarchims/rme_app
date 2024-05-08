import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/deskripsi_luaran_siki_model.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/hasil_asuhan_keperawatan_model.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_labor_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/my_dio.dart';

import '../network/endpoints.dart';

class LibraryService {
  // GET ALL ICD 10
  Future<dynamic> getAllICD10() {
    return MyDio().get(endPoint: EndPoint.getAllICD10);
  }

  Future<dynamic> getKProcedure() {
    return MyDio().get(endPoint: EndPoint.kProcedure);
  }

  // GET DETAIL PEMERIKSAAN LABOR
  Future<dynamic> getDetailPemeriksaanLabor({required String nameGrup}) {
    return MyDio().postAndToken(
        endPoint: EndPoint.detailPemeriksaanLabor,
        data: DTO.getNameGrup(nameGrup: nameGrup));
  }

  Future<dynamic> getRingkasanPulangIGD(
      {required String noReg, required String noRM}) {
    return MyDio().putWithToken(
        endPoint: "/v1/report-ringkasan-masuk-dan-keluar",
        data: DTO.ringkasanMasukDanKeluar(noRM: noRM, noReg: noReg));
  }

  // INPUT DETAIL   // PEMERIKSAAN LABOR
  Future<dynamic> inputPemeriksaanLaborDetail(
      {required InputDetailPemeriksaanLaborModel
          inputDetailPemeriksaanLaborModel}) {
    return MyDio().postAndToken(
        endPoint: EndPoint.inputPemeriksaanLabor,
        data: DTO.inputPemeriksaanLaborDetail(
            inputDetailPemeriksaanLaborModel:
                inputDetailPemeriksaanLaborModel));
  }

  Future<dynamic> onDeleteALergi({
    required String noRm,
    required int no,
    required String kelompok,
  }) {
    return MyDio().deleteWithToken(
        data: DTO.onDeleteAlergi(no: no, kelompok: kelompok, noRm: noRm),
        endPoint: EndPoint.alergi);
  }

  // GET KFISIOTERAPI MODEL
  Future<dynamic> getKFisioTerapi() {
    return MyDio().get(
      endPoint: "${EndPoint.kProcedureFisioTerapi}FIS001",
    );
  }

  // GET GIZI
  Future<dynamic> getGizi() {
    return MyDio().get(
      endPoint: "${EndPoint.kProcedureFisioTerapi}GIZ001",
    );
  }

  // GET RADIOLOGI
  Future<dynamic> getRadiologi() {
    return MyDio().get(
      endPoint: "${EndPoint.kProcedureFisioTerapi}RAD",
    );
  }

  // Detail Radiologi
  Future<dynamic> getDetailRadiologi(
      {required String kdBagian,
      required String debitur,
      required String kode}) {
    return MyDio().postPrivate(
        endPoint: EndPoint.detailRad,
        data: DTO.detailRadiologi(
            kdBagian: kdBagian, debitur: debitur, kode: kode));
  }

  Future<dynamic> getDeteksiResikoJatuh({required String noreg}) {
    return MyDio().postPrivate(
        endPoint: EndPoint.deteksiResikoJatuh,
        data: DTO.getNoreg(noReg: noreg));
  }

  Future<dynamic> getPerkembanganPasienReport({required String noreg}) {
    return MyDio().getAndToken(
        endPoint: EndPoint.reportPerkembanganPasien,
        data: DTO.getNoreg(noReg: noreg));
  }

  Future<dynamic> getIntervensiPasien({required String noRM}) {
    return MyDio().getAndToken(
        endPoint: EndPoint.reportIntervensi, data: DTO.getNoRM(noRM: noRM));
  }

  // DETEKSI RESIKO JATUH PASIEN
  Future<Either<ApiFailureResult, ApiSuccessResult>> deteksiResikoJatuhPasien(
      {required String noreg}) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.deteksiResikoJatuh,
      data: DTO.getNoreg(noReg: noreg),
    );
  }

  // GET DESKRIPSI SIKI
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDeskripsiSIKI(
      {required String siki}) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.searchDeskripsiSiki,
      data: DTO.getDeskriptionSIKI(siki: siki),
    );
  }

  // ON GET DESKRIPSI DIAGNOSA ASUHAN KEPERAWATAN
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onGetDeskripsiDiagnosaKeperawatan({required String kodeDiagnosa}) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.searchDeskripsiLuaranSiki,
      data: DTO.getDeskripsiDiagnosa(kodeDiagnosa: kodeDiagnosa),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onGetHasilAsuhanKeperawatan(
          {required String noReg, required String status}) {
    return MyDio().getDataWithToken(
      endPoint: EndPoint.hasilAsuhanKeperawatanV2,
      data: DTO.onGetAsuhanKeperawatan(noReg: noReg, status: status),
    );
  }

  // ON GET DESKRIPSI DIAGNOSA ASUHAN KEPERAWATAN
  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveAsuhanKeperawatan({
    required DeskripsiLuaranSikiModel deskripsiLuaranSikiModel,
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.saveDeskripsiLuaran,
      data: deskripsiLuaranSikiModel.toJson(
          deviceID: deviceID,
          pelayanan: pelayanan,
          noReg: noReg,
          person: person),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onDeleteAsuhanKeperawatan({
    required String noDaskep,
  }) {
    return MyDio().deleteWithToken(
        endPoint: EndPoint.hasilAsuhanKeperawatan,
        data: DTO.onDeleteAsuhanKeperawatan(noDaskep: noDaskep));
  }

// ON GET DESKRIPSI DIAGNOSA ASUHAN KEPERAWATAN
  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveDataDaskepSLKI({
    required String noDaskep,
    required String kodeSLKI,
    required int idKriteria,
    required int hasil,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.saveDaskepSLKI,
      data: DTO.onSaveDaskepSLKI(
          noDaskep: noDaskep,
          kodeSLKI: kodeSLKI,
          idKriteria: idKriteria,
          hasil: hasil),
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onGetRiwayatAlergiPasien({
    required String noRM,
    required String noReg,
  }) {
    return MyDio().getDataWithToken(
        endPoint: EndPoint.alergi,
        data: DTO.onGetRiwayatAlergi(noReg: noReg, noRM: noRM));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> insertAlergi({
    required String noRM,
    required String kelompok,
    required String alergi,
    required String namaUser,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.alergi,
        data: DTO.onSaveDataAlergi(
            alergi: alergi,
            kelompok: kelompok,
            namaUser: namaUser,
            noRM: noRM));
  }

  Future<dynamic> onGetRiwayatAlergi({
    required String noRM,
    required String noReg,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.alergi,
        data: DTO.onGetRiwayatAlergi(noReg: noReg, noRM: noRM));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> ringkasanPulangReport({
    required String noRM,
    required String noReg,
  }) {
    return MyDio().getDataWithToken(
        endPoint: EndPoint.ringkasanpulang,
        data: DTO.getReport(noReg: noReg, noRM: noRM));
  }

  Future<dynamic> onDeletePenyakitKeluarga({
    required String noRM,
    required int nomor,
    required String kelompok,
  }) {
    return MyDio().deleteWithToken(
        endPoint: EndPoint.alergiKeluarga,
        data: DTO.onDeleteRiwayatPenyakitKeluarga(
            kelompok: kelompok, nomor: nomor, noRM: noRM));
  }

  Future<dynamic> onGetPenyakitKeluarga({
    required String noRM,
    required String noReg,
  }) {
    return MyDio().getAndToken(
        endPoint: EndPoint.alergiKeluarga,
        data: DTO.onGetPenyakitKeluarga(noRM: noRM, noReg: noReg));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> triaseReport({
    required String noRM,
    required String noReg,
  }) {
    return MyDio().getDataWithToken(
        endPoint: EndPoint.triaseReport,
        data: DTO.getReport(noReg: noReg, noRM: noRM));
  }

  // REPORT RESIKO JATUH ANAK
  Future<Either<ApiFailureResult, ApiSuccessResult>> resikoJatuhAnak({
    required String noReg,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.reportResikoJatuhAnak,
        data: DTO.report(noReg: noReg));
  }

  // ====================== RESIKO JATUH ANAK
  Future<Either<ApiFailureResult, ApiSuccessResult>> reAsesmenResikoJatuhAnak({
    required String noReg,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.reportReAsesmenResikoJatuhAnak,
        data: DTO.report(noReg: noReg));
  }

  Future<dynamic> onGetResikoJatuhMorse({required String noReg}) {
    return MyDio().postAndToken(
        endPoint: EndPoint.reportResikoJatuhMorse,
        data: DTO.getReportTriase(noReg: noReg));
  }

  Future<dynamic> onGetRisikoJatuhDewasa({required String noReg}) {
    return MyDio().postAndToken(
        endPoint: EndPoint.reportResikoJatuhDewasa,
        data: DTO.getReportTriase(noReg: noReg));
  }

  // REPORT INTERVENSI RESIKO JATU
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      intervensiResikoJatuhReport({
    required String noRM,
    required String noReg,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.reportIntervensiResikoJatuh,
        data: DTO.getReport(noReg: noReg, noRM: noRM));
  }

  Future reportCPPTPasien({
    required String noRM,
  }) {
    return MyDio().putWithToken(
        endPoint: EndPoint.cpptPasien,
        data: DTO.getReportCPTTPasien(noRM: noRM));
  }

  Future reportPengkajianRawatInapDokter({
    required String noReg,
    required String tanggal,
    required String noRM,
  }) {
    return MyDio().putWithToken(
        endPoint: EndPoint.reportPengkajianRawatInapDokter,
        data: DTO.getReportPengkajianRawatInap(
            noRM: noRM, tanggal: tanggal, noReg: noReg));
  }

  Future reportPengkajianRawatInapPerawat({
    required String noReg,
    required String tanggal,
    required String noRM,
  }) {
    return MyDio().putWithToken(
        endPoint: EndPoint.reportPengkajianRawatInapPerawat,
        data: DTO.getReportPengkajianRawatInap(
            noRM: noRM, tanggal: tanggal, noReg: noReg));
  }

  Future<dynamic> insertPenyakitKeluarga({
    required String noRM,
    required String alergi,
    required String namaUser,
  }) {
    return MyDio().postPrivate(
        endPoint: EndPoint.alergiKeluarga,
        data: DTO.onSavePenyakitKeluarga(
            alergi: alergi, namaUser: namaUser, noRM: noRM));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> insertPenyakitKeluargaV2({
    required String noRM,
    required String alergi,
    required String namaUser,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.alergiKeluarga,
        data: DTO.onSavePenyakitKeluarga(
            alergi: alergi, namaUser: namaUser, noRM: noRM));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> reportRawatInapAnak({
    required String noRM,
    required String noReg,
  }) {
    return MyDio().getDataWithToken(
        endPoint: EndPoint.pengkajianRawatInapAnak,
        data: DTO.getReport(noReg: noReg, noRM: noRM));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveAllDaskep({
    required HasilAsuhanKeperawatanModel hasilAsuhan,
    required String noReg,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.saveDaskepSLKIAll,
        data: DTO.saveAllDaskep(noReg: noReg, hasilAsuhan: hasilAsuhan));
  }

  // ON UPDATE STATUS DASKEP
  Future<Either<ApiFailureResult, ApiSuccessResult>> onUpdateStatusDaskep({
    required String noDaskep,
    required String noReg,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.onClosedSLKI,
        data: DTO.onClonseSILKI(noDaskep: noDaskep, noReg: noReg));
  }
}

final libraryService = LibraryService();
