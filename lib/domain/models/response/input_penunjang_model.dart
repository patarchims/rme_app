import 'package:hms_app/domain/models/soap/medis/detail_tarip_radiologi_model.dart';

class InputPenunjangModel {
  final String kodeDokter;
  final String kodeKelas;
  final String umurPasien;
  final String ketPoli;
  final String kdPoli;
  final String noReg;
  final String deviceID;
  final String jenisPenunjang;
  final String dokterPengirim;
  final List<DetailTaripRadiologiModel> list;
  InputPenunjangModel({
    required this.kodeDokter,
    required this.kodeKelas,
    required this.umurPasien,
    required this.ketPoli,
    required this.kdPoli,
    required this.noReg,
    required this.jenisPenunjang,
    required this.deviceID,
    required this.dokterPengirim,
    required this.list,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode_dokter': kodeDokter,
      'kode_kelas': kodeKelas,
      'umur_pasien': umurPasien,
      'jenis_penunjang': jenisPenunjang,
      'ket_poli': ketPoli,
      'kd_poli': kdPoli,
      'no_reg': noReg,
      'device_id': deviceID,
      'dokter_pengirim': dokterPengirim,
      'detail_radiologi': list.map((x) => x.toMap()).toList(),
    };
  }

  factory InputPenunjangModel.fromMap(Map<String, dynamic> map) {
    return InputPenunjangModel(
      jenisPenunjang: map['jenis_penunjang'] as String,
      kodeDokter: map['kode_dokter'] as String,
      kodeKelas: map['kode_kelas'] as String,
      umurPasien: map['umur_pasien'] as String,
      ketPoli: map['ket_poli'] as String,
      kdPoli: map['kd_poli'] as String,
      noReg: map['no_reg'] as String,
      deviceID: map['device_id'] as String,
      dokterPengirim: map['dokter_pengirim'] as String,
      list: List<DetailTaripRadiologiModel>.from(
        (map['detail_radiologi'] as List<int>).map<DetailTaripRadiologiModel>(
          (x) => DetailTaripRadiologiModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
