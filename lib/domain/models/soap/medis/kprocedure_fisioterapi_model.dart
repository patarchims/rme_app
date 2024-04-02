class KfisioTerapiModel {
  final String kode;
  final String kdBagian;
  final String? icd9;
  final String deskripsi;
  final int? tarip;
  KfisioTerapiModel(
      {required this.kode,
      required this.kdBagian,
      required this.deskripsi,
      this.icd9,
      this.tarip});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kd_bag': kdBagian,
      'kode': kode,
      'deskripsi': deskripsi,
      'icd9': icd9,
      'tarip': tarip,
    };
  }

  factory KfisioTerapiModel.fromMap(Map<String, dynamic> map) {
    return KfisioTerapiModel(
      kode: map['kode'] as String,
      kdBagian: map['kd_bag'] as String,
      icd9: map['icd9'] ?? map['icd9'] as String,
      deskripsi: map['deskripsi'] as String,
      tarip: map['tarip'] ?? map['tarip'] as int,
    );
  }
}
