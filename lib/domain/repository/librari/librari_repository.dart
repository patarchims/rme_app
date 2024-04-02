import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/models/asesment_keb_edukasi/asesmen_model.dart';
import 'package:hms_app/domain/models/resiko_jatuh/resiko_jatuh_pasien_model.dart';
import 'package:hms_app/domain/models/response/asesmen_bangsal/asesmen_dokter_model.dart';
import 'package:hms_app/domain/models/response/asesmen_bangsal/keadaan_umum_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/informasi_keluhan_response_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/riwayat_kehamilan_response_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/skrining_nyeri_response_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/skrining_resiko_dekubitus_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/tindak_lanjut_response_model.dart';
import 'package:hms_app/domain/models/response/pemerisaan_fisik/pemeriksaan_fisik_bangsal_model.dart';
import 'package:hms_app/domain/models/response/pemerisaan_fisik/pemeriksaan_fisik_igd_model.dart';
import 'package:hms_app/domain/models/response/pemerisaan_fisik/vital_sign_bangsal_model.dart';
import 'package:hms_app/domain/models/response/pemerisaan_fisik/vital_sign_gangguan_perilaku_model.dart';
import 'package:hms_app/domain/models/soap/medis/pemeriksaan_fisik_anak_model.dart';
import '../../network/api_failure_handler.dart';
import '../../network/api_success_handler.dart';

abstract class LibrariRepositori {
  Future<Either<ApiFailureResult, ApiSuccessResult>> getKPelayanan();
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAllKVitalSign();
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDetailPasien(
      {required String noRM});
  Future<Either<ApiFailureResult, ApiSuccessResult>> getListAntreanPasien();
  Future<Either<ApiFailureResult, ApiSuccessResult>> getKaryawan(
      {required String params});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getDokter(
      {required String params});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getBankData(
      {required String kategori});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAnamnesa(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getDiagnosaICD10(
      {required String code, int? page, int? limit});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAllDiagnosaICD10();

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAnamnesa(
      {required AsesmenModel asesmenModel, required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getLabor(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getLaborOldDB(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getRadiologi(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getRadiologiOldDB(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getFisioTerapi(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getFisioTerapiOldDB(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getGizi(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getGiziOldDB(
      {required String noreg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getCPPTPasien(
      {required String noRM});

  Future<Either<ApiFailureResult, ApiSuccessResult>> onDeleteCPPTPasien(
      {required String noRM, required int no});

  Future<Either<ApiFailureResult, ApiSuccessResult>> savePemeriksaanFisikIGD({
    required PemeriksaanFisikIgdModel pemeriksaanFisikIgdModel,
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      savePemeriksaanFisikBangsal(
          {required PemeriksaanFisikBangsalModel pemeriksaanFisikBangsalModel,
          required String kategori,
          required String deviceID,
          required String pelayanan,
          required String noReg,
          required String person});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveGangguanPerilaku(
      {required GangguanPerilakuModel gangguanPerilaku,
      required String deviceID,
      required String pelayanan,
      required String noReg,
      required String person});

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      getPemeriksaanFisikBangsalDokter({required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getGangguanPerilaku(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisikBangsal(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisikIGD(
      {required String noReg, required String person});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisikRanap(
      {required String noReg});

  //============================= SKRINING RESIKO DEKUBITUS
  Future<Either<ApiFailureResult, ApiSuccessResult>> getResikoDekubitus(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveResikoDebuitus({
    required SkriningResikoDekubitusModel skriningResikoDekubitusModel,
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveCPPTPasien({
    required String deviceID,
    required String kelompok,
    required String waktu,
    required String pelayanan,
    required String kdbagian,
    required String noReg,
    required String dpjp,
    required String subjetif,
    required String objektif,
    required String asesmen,
    required String plan,
    required String ppa,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> onUpdateCPPTPasien({
    required int idCPPT,
    required String bagian,
    required String subjetif,
    required String objektif,
    required String asesmen,
    required String plan,
    required String ppa,
    required String instruksiPPA,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsesmenInfoKeluhanIgd(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsesmenInfoKeluhanIgd({
    required AsesmenKeluhanIgdModel asemenKeluhanIgdModel,
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getRiwayatKehamilan(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRiwayatKehamilan({
    required RiwayatKehamilanModel asemenKeluhanIgdModel,
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getSkriningNyeri(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveSkriningNyeri({
    required SkriningNyeriModel skriningNyeriModel,
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  });

  // ===================
  Future<Either<ApiFailureResult, ApiSuccessResult>> getTindakLanjut(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveTindakLanjut({
    required TindakLanjutIgdModel tindakLanjut,
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  });

  // ====================== METHOD PADA ASESMEN DOKTER
  // ====================== GET ASESMEN DOKTER

  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsesmenDokter(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsesmenDokter({
    required AsesmenDokterModel asesmenDokterModel,
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getKeadaanUmum(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveKeadaanUmum({
    required KeadaanUmumModel keadaanUmumModel,
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getVitalSign(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveVitalSign({
    required VitalSignBangsalModel vitalSignmodel,
    required String noreg,
    required String person,
    required String kategori,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisikAnak(
      {required String noReg});

  Future<Either<ApiFailureResult, ApiSuccessResult>> getRisikoJatuh(
      {required String kategori, required String jenis});

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      saveIntervensiRisikoJatuhPasien({
    required List<ResikoJatuhPasienModel> resikoJatuh,
    required String shift,
    required String noreg,
    required String person,
    required String kategori,
    required String deviceID,
    required String pelayanan,
  });

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveResikoJatuhPasien(
      {required List<ResikoJatuhPasienModel> resikoJatuh,
      required String noreg,
      required String person,
      required String kategori,
      required String deviceID,
      required int skor,
      required String jenis,
      required String pelayanan});

  Future<Either<ApiFailureResult, ApiSuccessResult>> savePemeriksaanFisikAnak({
    required PemeriksaanFisikAnakModel pemeriksaanFisikAnak,
    required String noreg,
    required String person,
    required String kategori,
    required String deviceID,
    required String pelayanan,
  });

  // =============
}
