import 'dart:io';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_bidan_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_labor_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_penunjang_model.dart';
import 'package:hms_app/domain/models/response/input_penunjang_model.dart';
import 'package:hms_app/domain/models/response/intervensi_model.dart';
import 'package:hms_app/domain/models/response/skala/skala_nyeri_model.dart';
import 'package:hms_app/domain/models/soap/medis/data_intra_oral_model.dart';
import 'package:hms_app/domain/models/soap/medis/pemeriksaan_fisik_model.dart';
import 'package:hms_app/domain/models/triase/triase_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import '../../models/asesment_keb_edukasi/assement_keb_edu.dart';
import '../../models/asesment_keb_edukasi/assement_rawat_jalan_dokter_model.dart';
import '../../models/soap/medis/anamnesa_igd_model.dart';

abstract class SoapRepository {
  // UNTUK MENYIMPAN DATA INFORMASI MEDIS
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveInformasiMedis({
    required String noReg,
    required String kdBagian,
    required String masalahMedis,
    required String terapi,
    required String pemeriksaanFisik,
    required String anjuran,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> skriningReport();

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAnatomi({
    required String picturePath,
    http.MultipartRequest? request,
    required String nama,
    required String norm,
    required String keterangan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> simpanDataAnatomi({
    required File pictureFile,
    http.MultipartRequest? request,
    required String nama,
    required String norm,
    required String keterangan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getSkrining(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getOdontogram(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAssesRawatJalanPerawat(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAssesRawatJalanDokter({
    required String noReg,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> publishOdontogram(
      {required String noReg,
      required String picturePath,
      required String kdBagian});

  // NEW UPLOAD ODONTOGRAM
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRencanaTindakLanjut({
    required String noreg,
    required String anjuran,
    required String alasanOpname,
    required String konsulKe,
    required String prognosis,
    // PENAMBAHAN DATA USER ID, DEVICE ID,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
    required String alasanKonsul,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getRencanaTindakLanjut(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> uploadOdontogram(
      {required String noReg, required String picturePath});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsesRawatJalanPerawat({
    required String kdBagian,
    required String noReg,
    required String kelUtama,
    required String riwayatPenyakit,
    required String riwayatPenyakitDetail,
    required String riwayatSaatDirumah,
    required String riwayatObat,
    required String riwayatObatDetail,
    required String tekananDarah,
    required String nadi,
    required String suhu,
    required String pernapasan,
    required String beratBadan,
    required String tinggiBadan,
    required String skriningNyeri,
    required String psikologis,
    required String fungsional,
    required String perencanaanPemulangan,
    required String masalahKeperawatan,
    required String rencanaKeperawatan,
    required String aseskepHasilKajiRj,
    required String aseskepHasilKajiRjDetail,
    required String aseskepHasilKajiRjTindakan,
    required String aseskepNyeri,
    required String aseskepPulang1,
    required String aseskepPulang1Detail,
    required String aseskepPulang2,
    required String aseskepPulang2Detail,
    required String aseskepPulang3,
    required String aseskepPulang3Detail,
    required String aseskepRj1,
    required String aseskepRj2,
    required String fungsionalDetail,
    required String psikologisDetail,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveOdontogram(
      {required String noReg,
      required String noGigi,
      required String keterangan});

  Future<Either<ApiFailureResult, ApiSuccessResult>> deleteOdontogram(
      {required String noReg, required String noGigi});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getKebEdukasi(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveTriase(
      {required TriaseModel triaseModel});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveSkalaTirase({
    required String person,
    required String userID,
    required String deviceID,
    required String noReg,
    required String pelayanan,
    required SkalaTriaseModel skalaTriaseModel,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getSkalaTriase(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getTriase(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRiwayatAlergi({
    required String noReg,
    required String keluhanUtama,
    required String statusAlergi,
    required String statusAlergiDetail,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  });

  // GET RIWAYAT ALERGI
  Future<Either<ApiFailureResult, ApiSuccessResult>> getRiwayatAlergi({
    required String noReg,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAssesKebEdukasi(
      {required AssementKebEdukasiModel assementKebEdukasiModel});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRawatJalanDokter(
      {required AssementRawatJalanModel assementRawatJalanModel});

  // Save Data Intra Oral
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveDataIntraOral(
      {required DataIntraOralModel dataIntraOralModel});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveSkrining({
    required String kdBagian,
    required String noReg,
    required String k1,
    required String k2,
    required String k3,
    required String k4,
    required String k5,
    required String k6,
    required String kF1,
    required String kF2,
    required String kF3,
    required String kF4,
    required String b1,
    required String b2,
    required String rJ,
    required String iV1,
    required String iV2,
    required String iV3,
    required String iV4,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getDataIntraOral(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getRiwayatDetailPasien(
      {required String noRM});

  // IMAGE STATUS LOKALIS
  Future<Either<ApiFailureResult, ApiSuccessResult>> getStatusLokalis(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveStatusLokalis({
    required String noReg,
    required String imageURL,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAnamnesaIGD(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAnamnesaIGD({
    required AnamnesaIgdModel anamnesaIgdModel,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  });

  // ================= pemeriksaan fisik
  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisik(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> savePemeriksaanFisik({
    required PemeriksaanFisikModel pemeriksaanFisikModel,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveDetailPemeriksaanFisik(
      {required InputDetailPemeriksaanLaborModel
          inputDetailPemeriksaanLaborModel});

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      saveDetailPemeriksaanPenunjang(
          {required InputPemeriksaanPenunjangModel
              inputPemeriksaanPenunjangModel});

  Future<Either<ApiFailureResult, ApiSuccessResult>> savePenunjangMedik(
      {required InputPenunjangModel inputPenunjangModel});

  Future<Either<ApiFailureResult, ApiSuccessResult>> cariSDKI(
      {required String value});

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      saveAsesmedKeperawatanBidan(
          {required AsesmenKeperawatanBidanModel asesmenKeperawatanBidanModel});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsesmedKeperawatanBidan(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getIntervensi(
      {required String value});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getSLKI(
      {required String value});

  Future<Either<ApiFailureResult, ApiSuccessResult>> cariSIKI(
      {required String value});

  // SIMPAN DATA
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      simpanAsesmenKeperawatanBidan(
          {required AsesmenKeperawatanBidanModel asesmenKeperawatanBidanModel,
          required List<IntervensiModel> intervesiModel,
          required String sdki,
          required String siki});

  // GET ASUHAN KEPERAWATAN
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsuhanKeperawatan(
      {required String noReg});
}
