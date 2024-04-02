import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/network/endpoints.dart';
import 'package:hms_app/domain/network/my_dio.dart';

class AnamnesaService {
  // SERVICE UNTUK MENDAPATKAN BANK DATA DARI DATABASE
  Future<dynamic> getBankData(String kategori) {
    return MyDio().get(endPoint: "${EndPoint.bankData}/$kategori");
  }

  // GET DATA PENUNJANG MEDIK
  Future<dynamic> getPenunjangMedik(String noReg) {
    return MyDio().getAndToken(
        endPoint: EndPoint.penunjangMedik, data: DTO.getNoreg(noReg: noReg));
  }

  // GET DIAGNOSA
  Future<dynamic> getDiagnosa(String noReg) {
    return MyDio().getAndToken(
        endPoint: EndPoint.diagnosa, data: DTO.getNoreg(noReg: noReg));
  }

  Future<dynamic> getDiagnosaDokter(String noReg) {
    return MyDio().getAndToken(
        endPoint: EndPoint.diagnosaPerawatForDokter,
        data: DTO.getNoreg(noReg: noReg));
  }

  // DELETE DIAGNOSA
  Future<dynamic> deleteDiagnosa(String noReg, String table) {
    return MyDio().deleteWithToken(
        endPoint: EndPoint.diagnosa,
        data: DTO.deleteDiagnosa(noReg: noReg, table: table));
  }

  // SAVE DIAGNOSA
  Future<dynamic> saveDiagnosa(
    String noReg,
    String code,
    String type,
    String table, {
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) {
    return MyDio().postAndToken(
        endPoint: EndPoint.diagnosa,
        data: DTO.saveDiagnosa(
            noReg: noReg,
            table: table,
            code: code,
            type: type,
            deviceID: deviceID,
            pelayanan: pelayanan,
            person: person,
            userID: userID));
  }

  // GET DATA ASESMEN ANAMNESA
  Future<dynamic> getAnamnesa(String noReg) {
    return MyDio().getDataWithToken(
        endPoint: EndPoint.asesmentAnamnesa, data: DTO.getNoreg(noReg: noReg));
  }

  Future<dynamic> getDataMedik(String noReg) {
    return MyDio().getDataWithToken(
        endPoint: EndPoint.dataMedik, data: DTO.getNoreg(noReg: noReg));
  }

  Future<dynamic> saveDataMedik({
    required String noReg,
    required String golDarah,
    required String tekananDarah,
    required String tekananDarahDetail,
    required String penyJantung,
    required String penyJantungDetail,
    required String diabet,
    required String diabetDetail,
    required String haemop,
    required String haemopDetail,
    required String hepat,
    required String hepatDetail,
    required String penyLain,
    required String penyLainDetail,
    required String alergiObat,
    required String alergiObatDetail,
    required String alergiMakanan,
    required String alergiMakananDetail,
    required String kebiasaanBuruk,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.dataMedik,
        data: DTO.saveDataMedik(
            noReg: noReg,
            golDarah: golDarah,
            tekananDarah: tekananDarah,
            tekananDarahDetail: tekananDarahDetail,
            penyJantung: penyJantung,
            penyJantungDetail: penyJantungDetail,
            diabet: diabet,
            diabetDetail: diabetDetail,
            haemop: haemop,
            haemopDetail: haemopDetail,
            hepat: hepat,
            hepatDetail: hepatDetail,
            penyLain: penyLain,
            penyLainDetail: penyLainDetail,
            alergiObat: alergiObat,
            alergiObatDetail: alergiObatDetail,
            alergiMakanan: alergiMakanan,
            alergiMakananDetail: alergiMakananDetail,
            kebiasaanBuruk: kebiasaanBuruk));
  }

  // SAVE ASESMENT ANAMNESA
  Future<dynamic> saveAsemenAnamnesa({
    required String noReg,
    required String kelUtama,
    required String penyakitKeluarga,
    required String riwayatAlergi,
    required String riwayatSekarang,
    required String riwayatAlergiDetail,
    required String jenisPelayanan,
    required String gigi1,
    required String gigi2,
    required String gigi3,
    required String gigi4,
    required String gigi5,
    required String gigi5Detail,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.asesmentAnamnesa,
        data: DTO.saveAsesmentAnamnesa(
            noReg: noReg,
            kelUtama: kelUtama,
            penyakitKeluarga: penyakitKeluarga,
            riwayatAlergi: riwayatAlergi,
            riwayatSekarang: riwayatSekarang,
            riwayatAlergiDetail: riwayatAlergiDetail,
            jenisPelayanan: jenisPelayanan,
            gigi1: gigi1,
            gigi2: gigi2,
            gigi3: gigi3,
            gigi4: gigi4,
            gigi5: gigi5,
            gigi5Detail: gigi5Detail));
  }
}

final anamnesaService = AnamnesaService();
