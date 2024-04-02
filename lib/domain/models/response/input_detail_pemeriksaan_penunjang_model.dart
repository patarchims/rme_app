import 'package:hms_app/domain/models/soap/medis/kprocedure_fisioterapi_model.dart';

class InputPemeriksaanPenunjangModel {
  final String kodeDokter;
  final String kodeKelas;
  final String umurPasien;
  final String ketPoli;
  final String kdPoli;
  final String noReg;
  final String deviceID;
  final String dokterPengirim;
  final List<KfisioTerapiModel> list;

  InputPemeriksaanPenunjangModel({
    required this.kodeDokter,
    required this.kodeKelas,
    required this.umurPasien,
    required this.ketPoli,
    required this.kdPoli,
    required this.noReg,
    required this.deviceID,
    required this.dokterPengirim,
    required this.list,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode_dokter': kodeDokter,
      'kode_kelas': kodeKelas,
      'umur_pasien': umurPasien,
      'ket_poli': ketPoli,
      'kd_poli': kdPoli,
      'no_reg': noReg,
      'devide_id': deviceID,
      'dokter_pengirim': dokterPengirim,
      'detail_radiologi': list.map((x) => x.toMap()).toList(),
    };
  }

  factory InputPemeriksaanPenunjangModel.fromMap(Map<String, dynamic> map) {
    return InputPemeriksaanPenunjangModel(
      kodeDokter: map['kode_dokter'].toString(),
      kodeKelas: map['kode_kelas'].toString(),
      umurPasien: map['umur_pasien'].toString(),
      ketPoli: map['ket_poli'].toString(),
      kdPoli: map['kd_poli'].toString(),
      noReg: map['no_reg'].toString(),
      deviceID: map['devide_id'].toString(),
      dokterPengirim: map['dokter_pengirim'].toString(),
      list: List<KfisioTerapiModel>.from(
        (map['detail_radiologi'] as List<int>).map<KfisioTerapiModel>(
          (x) => KfisioTerapiModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
