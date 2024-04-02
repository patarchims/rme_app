class GiziModel {
  final String kode;
  final String kdBag;
  final String icd;
  final String deskripsi;
  GiziModel({
    required this.kode,
    required this.kdBag,
    required this.icd,
    required this.deskripsi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode': kode,
      'kd_bag': kdBag,
      'icd': icd,
      'deskripsi': deskripsi,
    };
  }

  factory GiziModel.fromMap(Map<String, dynamic> map) {
    return GiziModel(
      kode: map['kode'].toString(),
      kdBag: map['kd_bag'].toString(),
      icd: map['icd'].toString(),
      deskripsi: map['deskripsi'].toString(),
    );
  }
}
