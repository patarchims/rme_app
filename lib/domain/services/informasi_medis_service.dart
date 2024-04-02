import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/network/my_dio.dart';

import '../network/endpoints.dart';

class InfomrasiMedisService {
  // SERVICE UNTUK MENDAPATKAN BANK DATA DARI DATABASE
  Future<dynamic> saveData({
    required String noReg,
    required String kdBagian,
    required String masalahMedis,
    required String terapi,
    required String pemeriksaanFisik,
    required String anjuran,
  }) {
    return MyDio().postDataWithToken(
        endPoint: EndPoint.informasiMedis,
        data: DTO.saveInformasiMedis(
            anjuran: anjuran,
            kdBagian: kdBagian,
            masalahMedis: masalahMedis,
            noReg: noReg,
            pemeriksaanFisik: pemeriksaanFisik,
            terapi: terapi));
  }

  // GET DATA PENUNJANG MEDIK
  Future<dynamic> getData({
    required String noReg,
    required String kdBagian,
  }) {
    return MyDio().getAndToken(
        endPoint: EndPoint.informasiMedis,
        data: DTO.getInformasiMedis(noReg: noReg, kdBagian: kdBagian));
  }

  Future<dynamic> getDataDokterSpesialis() {
    return MyDio().getAndToken(
      endPoint: EndPoint.dokterSpesialis,
    );
  }
}

final informasiMedisService = InfomrasiMedisService();
