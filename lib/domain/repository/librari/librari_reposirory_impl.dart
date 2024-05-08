import 'package:hms_app/domain/models/asesment_keb_edukasi/asesmen_model.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
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
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/endpoints.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../di/injection.dart';
import '../../network/my_dio.dart';

@LazySingleton(as: LibrariRepositori)
class LibrariRepositoriImpl implements LibrariRepositori {
  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getKPelayanan() {
    return getIt<MyDio>().getData(endPoint: EndPoint.kPelayanan);
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getKaryawan(
      {required String params}) {
    return getIt<MyDio>().getData(
        endPoint: EndPoint.cariKaryawan,
        data: DTO.cariKaryawan(params: params));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getListAntreanPasien() {
    return getIt<MyDio>()
        .getDataWithToken(endPoint: EndPoint.listAntreanPasien);
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDetailPasien(
      {required String noRM}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.noRM(noRM: noRM),
      endPoint: EndPoint.detailPasien,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAllKVitalSign() {
    return getIt<MyDio>().getData(
      endPoint: EndPoint.kVitalSign,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getBankData(
      {required String kategori}) {
    return getIt<MyDio>().getData(
      endPoint: EndPoint.bankData + kategori,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAnamnesa(
      {required String noReg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.noReg(noReg: noReg),
      endPoint: EndPoint.getAnamnesa,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAnamnesa(
      {required AsesmenModel asesmenModel, required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: asesmenModel.toJson(noreg: noreg),
      endPoint: EndPoint.saveAnamnesa,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDiagnosaICD10(
      {required String code, int? page, int? limit}) {
    return getIt<MyDio>().getData(
      queryParameters: DTO.getDiagnosa(code: code, page: page, limit: limit),
      endPoint: EndPoint.getICD10,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAllDiagnosaICD10() {
    return getIt<MyDio>().getData(
      endPoint: EndPoint.getAllICD,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getRadiologi(
      {required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.getNoreg(noReg: noreg),
      endPoint: EndPoint.hasilRadiologi,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getLabor(
      {required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.getNoreg(noReg: noreg),
      endPoint: EndPoint.dHasilLabor,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getFisioTerapi(
      {required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.getNoreg(noReg: noreg),
      endPoint: EndPoint.dHasilLabor,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getGizi(
      {required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.getNoreg(noReg: noreg),
      endPoint: EndPoint.hasilGizi,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDokter(
      {required String params}) {
    return getIt<MyDio>().getData(
        endPoint: EndPoint.cariDokter, data: DTO.cariDokter(params: params));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getCPPTPasien(
      {required String noRM}) {
    return getIt<MyDio>().getData(
        endPoint: EndPoint.cpptPasien, data: DTO.getCPPTPasien(noRm: noRM));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveCPPTPasien(
      {required String deviceID,
      required String kelompok,
      required String kdbagian,
      required String noReg,
      required String dpjp,
      required String pelayanan,
      required String subjetif,
      required String objektif,
      required String asesmen,
      required String waktu,
      required String ppa,
      required String plan}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.cpptPasien,
        data: DTO.saveCPPTPasien(
            ppa: ppa,
            waktu: waktu,
            pelayanan: pelayanan,
            deviceID: deviceID,
            asesmen: asesmen,
            dpjp: dpjp,
            kdbagian: kdbagian,
            kelompok: kelompok,
            noReg: noReg,
            objektif: objektif,
            plan: plan,
            subjetif: subjetif));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getLaborOldDB(
      {required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.getNoreg(noReg: noreg),
      endPoint: EndPoint.dHasilLaborOldDB,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getRadiologiOldDB(
      {required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.getNoreg(noReg: noreg),
      endPoint: EndPoint.dhasilRadiologiOldDB,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getFisioTerapiOldDB(
      {required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.getNoreg(noReg: noreg),
      endPoint: EndPoint.dhasilFisioterapiOldDB,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getGiziOldDB(
      {required String noreg}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.getNoreg(noReg: noreg),
      endPoint: EndPoint.dhasilGiziOldDB,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> savePemeriksaanFisikIGD({
    required PemeriksaanFisikIgdModel pemeriksaanFisikIgdModel,
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
  }) {
    return getIt<MyDio>().postDataWithToken(
      data: pemeriksaanFisikIgdModel.toJson(
          deviceID: deviceID,
          pelayanan: pelayanan,
          noReg: noReg,
          person: person),
      endPoint: EndPoint.asesmenPemeriksaanFisik,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisikIGD(
      {required String noReg, required String person}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.gerPemeriksaanFisik(noReg: noReg, person: person),
      endPoint: EndPoint.asesmenPemeriksaanFisik,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisikRanap(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.asesmenPemeriksaanFisikBangsal,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      savePemeriksaanFisikBangsal(
          {required PemeriksaanFisikBangsalModel pemeriksaanFisikBangsalModel,
          required String deviceID,
          required String kategori,
          required String pelayanan,
          required String noReg,
          required String person}) {
    return getIt<MyDio>().postDataWithToken(
      data: pemeriksaanFisikBangsalModel.toJson(
          kategori: kategori,
          deviceID: deviceID,
          pelayanan: pelayanan,
          noReg: noReg,
          person: person),
      endPoint: EndPoint.asesmenPemeriksaanFisikBangsal,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisikBangsal(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.asesmenPemeriksaanFisikBangsal,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getGangguanPerilaku(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        data: DTO.getNoreg(noReg: noReg), endPoint: EndPoint.gangguanPerilaku);
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveGangguanPerilaku(
      {required GangguanPerilakuModel gangguanPerilaku,
      required String deviceID,
      required String pelayanan,
      required String noReg,
      required String person}) {
    return getIt<MyDio>().postDataWithToken(
      data: gangguanPerilaku.toJson(
          deviceID: deviceID,
          pelayanan: pelayanan,
          noReg: noReg,
          person: person),
      endPoint: EndPoint.gangguanPerilaku,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsesmenInfoKeluhanIgd(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        data: DTO.getNoreg(noReg: noReg), endPoint: EndPoint.informasiKeluhan);
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsesmenInfoKeluhanIgd({
    required AsesmenKeluhanIgdModel asemenKeluhanIgdModel,
    required String noreg,
    required String person,
    required String deviceID,
    required String pelayanan,
  }) {
    return getIt<MyDio>().postDataWithToken(
      endPoint: EndPoint.informasiKeluhan,
      data: asemenKeluhanIgdModel.toJson(
          deviceID: deviceID,
          pelayanan: pelayanan,
          noReg: noreg,
          person: person),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getResikoDekubitus(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        data: DTO.getNoreg(noReg: noReg),
        endPoint: EndPoint.skriningResikoDekubitus);
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveResikoDebuitus(
      {required SkriningResikoDekubitusModel skriningResikoDekubitusModel,
      required String noreg,
      required String person,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
      endPoint: EndPoint.skriningResikoDekubitus,
      data: skriningResikoDekubitusModel.toJson(
          deviceID: deviceID,
          noReg: noreg,
          pelayanan: pelayanan,
          person: person),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getRiwayatKehamilan(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        data: DTO.getNoreg(noReg: noReg), endPoint: EndPoint.riwayatKehamilan);
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRiwayatKehamilan(
      {required RiwayatKehamilanModel asemenKeluhanIgdModel,
      required String noreg,
      required String person,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
      endPoint: EndPoint.riwayatKehamilan,
      data: asemenKeluhanIgdModel.toJson(
          deviceID: deviceID,
          noReg: noreg,
          pelayanan: pelayanan,
          person: person),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getSkriningNyeri(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.skriningNyeri,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveSkriningNyeri(
      {required SkriningNyeriModel skriningNyeriModel,
      required String noreg,
      required String person,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
      endPoint: EndPoint.skriningNyeri,
      data: skriningNyeriModel.toJson(
          deviceID: deviceID,
          noReg: noreg,
          pelayanan: pelayanan,
          person: person),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getTindakLanjut(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.tindakLanjut,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveTindakLanjut(
      {required TindakLanjutIgdModel tindakLanjut,
      required String noreg,
      required String person,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
      endPoint: EndPoint.tindakLanjut,
      data: tindakLanjut.toJson(
          deviceID: deviceID,
          noReg: noreg,
          pelayanan: pelayanan,
          person: person),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsesmenDokter(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.asesmenDokter,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsesmenDokter(
      {required AsesmenDokterModel asesmenDokterModel,
      required String noreg,
      required String person,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.asesmenDokter,
        data: asesmenDokterModel.toJson(
            deviceID: deviceID,
            noReg: noreg,
            pelayanan: pelayanan,
            person: person));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getKeadaanUmum(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.keadaanUmumBangsal,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveKeadaanUmum(
      {required KeadaanUmumModel keadaanUmumModel,
      required String noreg,
      required String person,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.keadaanUmumBangsal,
        data: keadaanUmumModel.toJson(
            deviceID: deviceID,
            noReg: noreg,
            pelayanan: pelayanan,
            person: person));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getVitalSign(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.vitalSignBangsal,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveVitalSign(
      {required VitalSignBangsalModel vitalSignmodel,
      required String noreg,
      required String person,
      required String kategori,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.vitalSignBangsal,
        data: vitalSignmodel.toJson(
            kategori: kategori,
            deviceID: deviceID,
            noReg: noreg,
            pelayanan: pelayanan,
            person: person));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisikAnak(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.pemeriksaanFisikAnak,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> savePemeriksaanFisikAnak(
      {required PemeriksaanFisikAnakModel pemeriksaanFisikAnak,
      required String noreg,
      required String person,
      required String kategori,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.pemeriksaanFisikAnak,
        data: pemeriksaanFisikAnak.toMap(
            kategori: kategori,
            deviceID: deviceID,
            noReg: noreg,
            pelayanan: pelayanan,
            person: person));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getRisikoJatuh(
      {required String kategori, required String jenis}) {
    return getIt<MyDio>().getData(
      data: DTO.getResikoJatuh(jenis: jenis, kategori: kategori),
      endPoint: EndPoint.resikoJatuh,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      saveIntervensiRisikoJatuhPasien(
          {required List<ResikoJatuhPasienModel> resikoJatuh,
          required String shift,
          required String noreg,
          required String person,
          required String kategori,
          required String deviceID,
          required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.saveIntervensiResikoJatuh(
          deviceID: deviceID,
          kategori: kategori,
          newResikoJatuh: resikoJatuh,
          noreg: noreg,
          pelayanan: pelayanan,
          person: person,
          shift: shift),
      endPoint: EndPoint.intervensiResikoJatuh,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveResikoJatuhPasien({
    required List<ResikoJatuhPasienModel> resikoJatuh,
    required String noreg,
    required String person,
    required String kategori,
    required String deviceID,
    required int skor,
    required String jenis,
    required String pelayanan,
  }) {
    return getIt<MyDio>().postDataWithToken(
      endPoint: EndPoint.resikoJatuh,
      data: DTO.saveResikoJatuhPasien(
        deviceID: deviceID,
        kategori: kategori,
        newResikoJatuh: resikoJatuh,
        noreg: noreg,
        pelayanan: pelayanan,
        jenis: jenis,
        skor: skor,
        person: person,
      ),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      getPemeriksaanFisikBangsalDokter({required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: EndPoint.asesmenPemeriksaanFisikBangsalDokter,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> onDeleteCPPTPasien(
      {required String noRM, required int no}) {
    return getIt<MyDio>().deleteWithToken(
      data: DTO.onDeleteCPPTPasien(no: no, noRM: noRM),
      endPoint: EndPoint.cpptPasien,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> onUpdateCPPTPasien(
      {required int idCPPT,
      required String bagian,
      required String subjetif,
      required String objektif,
      required String asesmen,
      required String plan,
      required String ppa,
      required String instruksiPPA}) {
    return getIt<MyDio>().patchWithToken(
      data: DTO.onUpdateCPPTPasien(
          asesmen: asesmen,
          bagian: bagian,
          idCPPT: idCPPT,
          instruksiPPA: instruksiPPA,
          objektif: objektif,
          plan: plan,
          ppa: ppa,
          subjektif: subjetif),
      endPoint: EndPoint.cpptPasien,
    );
  }
}
