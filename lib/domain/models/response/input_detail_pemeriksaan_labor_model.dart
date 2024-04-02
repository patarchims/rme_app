import 'package:hms_app/domain/models/response/detail_pemeriksaan_labor_model.dart';

class InputDetailPemeriksaanLaborModel {
  final String kodeDokter;
  final String kodeKelas;
  final String umurPasien;
  final String ketPoli;
  final String kdPoli;
  final String noReg;
  final String deviceID;
  final String dokterPengirim;
  final List<PemeriksaanDetailLaborModel> detailLabor;
  InputDetailPemeriksaanLaborModel({
    required this.kodeDokter,
    required this.kodeKelas,
    required this.umurPasien,
    required this.ketPoli,
    required this.kdPoli,
    required this.noReg,
    required this.deviceID,
    required this.dokterPengirim,
    required this.detailLabor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode_dokter': kodeDokter,
      'kode_kelas': kodeKelas,
      'umur_pasien': umurPasien,
      'ket_poli': ketPoli,
      'kd_poli': kdPoli,
      'no_reg': noReg,
      'device_id': deviceID,
      'dokter_pengirim': dokterPengirim,
      'detail_labor': detailLabor.map((x) => x.toJson()).toList(),
    };
  }

  factory InputDetailPemeriksaanLaborModel.fromMap(Map<String, dynamic> map) {
    return InputDetailPemeriksaanLaborModel(
      kdPoli: map["kd_poli"].toString(),
      kodeDokter: map['kode_dokter'].toString(),
      kodeKelas: map['kode_kelas'].toString(),
      umurPasien: map['umur_pasien'].toString(),
      ketPoli: map['ket_poli'].toString(),
      noReg: map['no_reg'].toString(),
      deviceID: map['device_id'].toString(),
      dokterPengirim: map['dokter_pengirim'].toString(),
      detailLabor: List<PemeriksaanDetailLaborModel>.from(
        (map['detail_labor'] as List<int>).map<PemeriksaanDetailLaborModel>(
          (x) =>
              PemeriksaanDetailLaborModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
