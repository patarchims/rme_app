import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/presentation/kebidanan/repository/asesmen_kebidanan_model_response.dart';
import 'package:hms_app/presentation/kebidanan/repository/diagnosa_kebidanan_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/diagnosa_kebidanan_model_response.dart';
import 'package:hms_app/presentation/kebidanan/repository/pengkajian_response_persistem_kebidanan_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/resiko_jatuh_kebidanan_response_model.dart';

class KebidananService {
  // GET ALL ICD 10
  Future<dynamic> getRiwayatPengobatanDirumah({required String noReg}) {
    return MyDio().getAndToken(
        data: DTO.getNoreg(noReg: noReg),
        endPoint: "/v1/riwayat-pengobatan-dirumah");
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

  Future<dynamic> getAsesmenKebidananV2(
      {required String noReg, required String person}) {
    return MyDio().getAndToken(
        data: DTO.onGetAsesmenKebidananEvent(noReg: noReg, person: person),
        endPoint: "/v1/asesmen-kebidanan");
  }

  Future<dynamic> getAllDiagnosaKeperawatan() {
    return MyDio().getAndToken(endPoint: "/v1/diagnosa-keperawatan");
  }

  Future<dynamic> getTandaVitalKebidanan({
    required String noReg,
    required String person,
  }) {
    return MyDio().getAndToken(
        data: DTO.getVitalSignBidan(noReg: noReg, person: person),
        endPoint: "/v1/dvital-sign-bidan");
  }

  Future<dynamic> onGetPengkajianNutrisiKebidanan({required String noReg}) {
    return MyDio().getAndToken(
        data: DTO.getNoreg(noReg: noReg), endPoint: "/v1/pengkajian-nutrisi");
  }

  Future<dynamic> getResikoJatuhKebidanan({required String noReg}) {
    return MyDio().getAndToken(
        data: DTO.getNoreg(noReg: noReg),
        endPoint: "/v1/resiko-jatuh-kebidanan");
  }

  Future<dynamic> getAsesmenKebidanan(
      {required String noReg, required String person}) {
    return MyDio().getAndToken(
        data: DTO.getAsesmenKebidanan(noReg: noReg, person: person),
        endPoint: "/v1/pengkajian-awal-kebidanan");
  }

  Future<dynamic> onGetPengkajianPersistem(
      {required String noReg, required String person}) {
    return MyDio().getAndToken(
        data: DTO.onGetPengkajianPersistem(noReg: noReg, person: person),
        endPoint: "/v1/pengkajian-persistem-kebidanan");
  }

  Future<dynamic> getDiagnosaKebidanan() {
    return MyDio().get(endPoint: "/v1/data-diagnosa-kebidanan");
  }

  Future<dynamic> onGetDataDiagnosaKebidanan({required String noReg}) {
    return MyDio().dynamicPatchWithToken(
        data: DTO.getNoreg(noReg: noReg),
        endPoint: "/v1/data-diagnosa-kebidanan");
  }

  Future<dynamic> onDeleteDiagnosaKebidanan({required int noDiganosa}) {
    return MyDio().deleteWithToken(
        data: DTO.onDeleteDiagnosaKebidanan(noDiagnosa: noDiganosa),
        endPoint: "/v1/data-diagnosa-kebidanan");
  }

  Future<dynamic> onDeletePengobatanDirumah(
      {required String noRiwayat, required String noReg}) {
    return MyDio().deleteWithToken(
        data: DTO.noRiwayat(noRiwayat: noRiwayat, noReg: noReg),
        endPoint: "/v1/riwayat-pengobatan-dirumah");
  }

  Future<dynamic> onDeleteRiwayatKehamilan(
      {required int no, required String noReg}) {
    return MyDio().deleteWithToken(
        data: DTO.deleteRiwayatKehamilan(iD: no, noReg: noReg),
        endPoint: "/v1/riwayat-kehamilan-kebidanan");
  }

  Future<dynamic> onGetPengkajianFungsional({required String noReg}) {
    return MyDio().getAndToken(
        data: DTO.getNoreg(noReg: noReg),
        endPoint: "/v1/pengkajian-fungsional");
  }

  Future<dynamic> onGetRiwayatKehamilanKebidanan({required String noReg}) {
    return MyDio().getAndToken(
        data: DTO.getNoreg(noReg: noReg),
        endPoint: "/v1/riwayat-kehamilan-kebidanan");
  }

  Future<dynamic> getVitalSignKebidanan({required String noReg}) {
    return MyDio().getAndToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: "/v1/dvital-sign-bidan",
    );
  }

  Future<dynamic> onGetAnalisaData({required String noReg}) {
    return MyDio().getAndToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: "/v1/analisa-data",
    );
  }

  Future<dynamic> onValidasiAnalisaData({
    required String noReg,
    required String jam,
    required String tgl,
    required String kodeAnalisa,
  }) {
    return MyDio().postAndToken(
      data: DTO.onValidasiAnalisaData(
          noReg: noReg, jam: jam, tanggal: tgl, kodeAnalisa: kodeAnalisa),
      endPoint: "/v1/validasi-analisa-data",
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveAsesmenKebidananEvent(
          {required String noReg, required String person}) {
    return MyDio().postDataWithToken(
        data: DTO.onGetAsesmenKebidananEvent(noReg: noReg, person: person),
        endPoint: "/v1/asesmen-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onDeleteAnalisaData({
    required String kodeAnalisa,
  }) {
    return MyDio().deleteWithToken(
        data: DTO.onDeleteAnalisaData(kodeAnalisa: kodeAnalisa),
        endPoint: "/v1/analisa-data");
  }

  // SAVE PENGKAJIAN KEBIDANAN
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePengkajianKebidananEvent({
    required String noReg,
    required String pelayanan,
    required String kdDPJP,
    required String person,
    required String devicesID,
    required AsesmenKebidananModel asemenKebidanan,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSaveAsesmenKebidananEvent(
            dpjp: kdDPJP,
            pelayanan: pelayanan,
            asesmenKebidanan: asemenKebidanan,
            deviceID: devicesID,
            noReg: noReg,
            person: person),
        endPoint: "/v1/asesmen-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveAnalisaData(
      {required String noReg,
      required String data,
      required List<DiagnosaKeperawatanModel> diagnosa}) {
    return MyDio().postDataWithToken(
        data: DTO.onSaveAnalisaData(
          diagnosaKeperawatanModel: diagnosa,
          noReg: noReg,
          data: data,
        ),
        endPoint: "/v1/analisa-data");
  }

  Future<dynamic> onInsertRiwayatPengobatan({
    required String noReg,
    required String deviceID,
    required String userID,
    required String namaObat,
    required String dosis,
    required String caraPemberian,
    required String frekuensi,
    required String waktuPemberian,
  }) {
    return MyDio().getAndToken(
        data: DTO.onInsertRiwayatPengobatan(
            noReg: noReg,
            caraPemberian: caraPemberian,
            deviceID: deviceID,
            dosis: dosis,
            frekuensi: frekuensi,
            namaObat: namaObat,
            userID: userID,
            waktuPemberian: waktuPemberian),
        endPoint: "/v1/riwayat-pengobatan-dirumah");
  }

  Future<dynamic> onGetIdentitasBayi({
    required String noReg,
    required String noRM,
  }) {
    return MyDio().getAndToken(
        data: DTO.getIdentitasBayi(noReg: noReg, noRM: noRM),
        endPoint: "/v1/identitas-bayi");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRiwayatPengobatan({
    required String noReg,
    required String deviceID,
    required String userID,
    required String namaObat,
    required String dosis,
    required String caraPemberian,
    required String frekuensi,
    required String waktuPemberian,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onInsertRiwayatPengobatan(
            noReg: noReg,
            caraPemberian: caraPemberian,
            deviceID: deviceID,
            dosis: dosis,
            frekuensi: frekuensi,
            namaObat: namaObat,
            userID: userID,
            waktuPemberian: waktuPemberian),
        endPoint: "/v1/riwayat-pengobatan-dirumah");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      savePengkajianPersistemKebisanan({
    required String noReg,
    required String deviceID,
    required String pelayanan,
    required String person,
    required PengkajianPersistemKebidananResponse pengkajianKebidanan,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSavePengkajianPersistemKebidanan(
            noReg: noReg,
            deviceID: deviceID,
            pengkajianKebidanan: pengkajianKebidanan,
            person: person,
            pelayanan: pelayanan),
        endPoint: "/v1/pengkajian-persistem-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsesmenKebidanan({
    required String noReg,
    required String deviceID,
    required String keluhanUtama,
    required String penyakitSekarang,
    required String keluhanMenyertai,
    required String riwayatMenstruasi,
    required String siklusHaid,
    required String riwayataPernikahan,
    required String riwayatDahulu,
    required String person,
    required String pelayanan,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSaveAsesmenAwalKebidanan(
            riwayatDahulu: riwayatDahulu,
            noReg: noReg,
            deviceID: deviceID,
            keluhanUtama: keluhanUtama,
            penyakitSekarang: penyakitSekarang,
            keluhanMenyertai: keluhanMenyertai,
            riwayatMenstruasi: riwayatMenstruasi,
            siklusHaid: siklusHaid,
            riwayataPernikahan: riwayataPernikahan,
            person: person,
            pelayanan: pelayanan),
        endPoint: "/v1/pengkajian-awal-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> saveDiagnosaKebidanan(
      {required String noReg,
      required String deviceID,
      required String userID,
      required Iterable<DiagnosaKebidananModel> diagnosa}) {
    return MyDio().postDataWithToken(
        data: DTO.onSaveDiagnosaKebidanan(
          noReg: noReg,
          deviceID: deviceID,
          diagnosa: diagnosa,
          userID: userID,
        ),
        endPoint: "/v1/data-diagnosa-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveRiwayatKehamilanBidan({
    required String deviceID,
    required String tahun,
    required String tempat,
    required String noReg,
    required String umur,
    required String jenisPersalinan,
    required String penolong,
    required String penyulit,
    required String nifas,
    required String jenisKelamin,
    required String beratBadan,
    required String keadaanSekarang,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSaveRiwayatKehamilanBidan(
          beratBadan: beratBadan,
          deviceID: deviceID,
          jenisKelamin: jenisKelamin,
          jenisPersalinan: jenisPersalinan,
          keadaanSekarang: keadaanSekarang,
          nifas: nifas,
          penolong: penolong,
          penyulit: penyulit,
          tahun: tahun,
          tempat: tempat,
          umur: umur,
          noReg: noReg,
        ),
        endPoint: "/v1/riwayat-kehamilan-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveTandaVitalKebidanan({
    required String deviceID,
    required String pelayanan,
    required String person,
    required String noReg,
    required String tekananDarah,
    required String nadi,
    required String pernapasan,
    required String suhu,
    required String tinggiBadan,
    required String beratBadan,
    required String gcsE,
    required String gcsV,
    required String gcsM,
    required String ddj,
    required String tfu,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSaveTandaVitalKebidanan(
            tfu: tfu,
            noReg: noReg,
            beratBadan: beratBadan,
            deviceID: deviceID,
            gcsE: gcsE,
            ddj: ddj,
            gcsM: gcsM,
            gcsV: gcsV,
            nadi: nadi,
            pelayanan: pelayanan,
            pernapasan: pernapasan,
            person: person,
            suhu: suhu,
            tekananDarah: tekananDarah,
            tinggiBadan: tinggiBadan),
        endPoint: "/v1/dvital-sign-bidan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveIdentitasBayiPerina({
    required String noReg,
    required File imageURL,
    required String dpjp,
    required String deviceID,
    required String kategori,
  }) async {
    return MyDio().formData(
        endPoint: "/v1/upload-identitas-bayi",
        data: await DTO.uploadIdentitasBayi(
            noReg: noReg,
            dpjp: dpjp,
            imageURL: imageURL.path,
            kategori: kategori));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveDataEWS({
    required String kesadaran,
    required String noreg,
    required int td,
    required int td2,
    required int nadi,
    required int pernapasan,
    required String reaksiOtot,
    required String keterangan,
    required String kategori,
    required String obsigenTambahan,
    required int suhu,
    required int spo2,
    required int crt,
    required int skalaNyeri,
    required int totalSkor,
  }) async {
    return MyDio().postDataWithToken(
        data: DTO.onSaveDataEWS(
            totalSkor: totalSkor,
            kategori: kategori,
            obsigenTambahan: obsigenTambahan,
            keterangan: keterangan,
            td2: td2,
            noreg: noreg,
            crt: crt,
            kesadaran: kesadaran,
            nadi: nadi,
            pernapasan: pernapasan,
            reaksiOtot: reaksiOtot,
            skalaNyeri: skalaNyeri,
            spo2: spo2,
            suhu: suhu,
            td: td),
        endPoint: "/v1/early-warning-system");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onDelete({
    required int id,
  }) async {
    return MyDio().deleteWithToken(
        data: DTO.onDelete(iD: id), endPoint: "/v1/early-warning-system");
  }

  Future<dynamic> getEwsSystem({required String noReg}) {
    return MyDio().getAndToken(
      data: DTO.getNoreg(noReg: noReg),
      endPoint: "/v1/early-warning-system",
    );
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveDataIdentitasBayi({
    required String noReg,
    required String picturePath1,
    required String picturePath2,
    required String person,
    required String deviceID,
    required String pelayanan,
    required String kategori,
    required String dpjp,
    required String pemberiGelang,
    required String namaPenentuJK,
    required String namaWali,
    required String jamKelahiranBayi,
  }) async {
    return MyDio().formData(
        endPoint: "/v1/identitas-bayi",
        data: await DTO.saveIdentitasBayi(
          noReg: noReg,
          dpjp: dpjp,
          jamKelahiranBayi: jamKelahiranBayi,
          kategori: kategori,
          deviceID: deviceID,
          namaPenentuJK: namaPenentuJK,
          namaWali: namaWali,
          pelayanan: pelayanan,
          pemberiGelang: pemberiGelang,
          person: person,
          picturePath1: picturePath1,
          picturePath2: picturePath2,
        ));
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveRiwayatKehamilan({
    required String deviceID,
    required String tahun,
    required String tempat,
    required String noReg,
    required String umur,
    required String jenisPersalinan,
    required String penolong,
    required String penyulit,
    required String nifas,
    required String jKelamin,
    required String beratBadan,
    required String keadaanSekarang,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSaveRiwayatKehamilanBidan(
            noReg: noReg,
            beratBadan: beratBadan,
            deviceID: deviceID,
            jenisKelamin: jKelamin,
            jenisPersalinan: jenisPersalinan,
            keadaanSekarang: keadaanSekarang,
            nifas: nifas,
            penolong: penolong,
            penyulit: penyulit,
            tahun: tahun,
            tempat: tempat,
            umur: umur),
        endPoint: "/v1/riwayat-kehamilan-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSaveResikoJatuhKebidanan({
    required String noReg,
    required String inserPC,
    required String pelayanan,
    required ResikoJatuhKebidananModel resikoJatuh,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSaveResikoJatuhKebidanan(
            noReg: noReg,
            inserPC: inserPC,
            pelayanan: pelayanan,
            resikoJatuh: resikoJatuh),
        endPoint: "/v1/resiko-jatuh-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePengkajianFungsional({
    required String deviceID,
    required String noReg,
    required String f1,
    required String f2,
    required String f3,
    required String f4,
    required String f5,
    required String f6,
    required String f7,
    required String f8,
    required String f9,
    required String f10,
    required int nilai,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSavePengkajianFungsional(
            deviceID: deviceID,
            noReg: noReg,
            f10: f10,
            f1: f1,
            f2: f2,
            f3: f3,
            f4: f4,
            f5: f5,
            f6: f6,
            f7: f7,
            f8: f8,
            f9: f9,
            nilai: nilai),
        endPoint: "/v1/pengkajian-fungsional");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>>
      onSavePemeriksaanFisikKebidanan({
    required String deviceID,
    required String person,
    required String pelayanan,
    required String noReg,
    required String kepala,
    required String mata,
    required String telinga,
    required String mulut,
    required String gigi,
    required String hidung,
    required String tenggorokan,
    required String payudara,
    required String leherDanBahu,
    required String mucosaMulut,
    required String abdomen,
    required String nutrisiDanHidrasi,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSavePemeriksaanFisikKebidanan(
            deviceID: deviceID,
            noReg: noReg,
            abdomen: abdomen,
            gigi: gigi,
            hidung: hidung,
            kepala: kepala,
            leherDanBahu: leherDanBahu,
            mata: mata,
            mucosaMulut: mucosaMulut,
            mulut: mulut,
            nutrisiDanHidrasi: nutrisiDanHidrasi,
            payudara: payudara,
            pelayanan: pelayanan,
            person: person,
            telinga: telinga,
            tenggorokan: tenggorokan),
        endPoint: "/v1/pemeriksaan-fisik-kebidanan");
  }

  Future<Either<ApiFailureResult, ApiSuccessResult>> onSavePengkajianNutrisi({
    required String noReg,
    required String deviceID,
    required String n1,
    required String n2,
    required int nilai,
  }) {
    return MyDio().postDataWithToken(
        data: DTO.onSavePengkajianNutrisi(
            deviceID: deviceID, noReg: noReg, n1: n1, n2: n2, nilai: nilai),
        endPoint: "/v1/pengkajian-nutrisi");
  }
}

final kebidananService = KebidananService();
