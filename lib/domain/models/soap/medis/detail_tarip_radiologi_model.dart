class DetailTaripRadiologiModel {
  final String kdBag;
  final String kode;
  final String deskripsi;
  final int tarip;

  DetailTaripRadiologiModel({
    required this.kdBag,
    required this.kode,
    required this.deskripsi,
    required this.tarip,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kd_bag': kdBag,
      'kode': kode,
      'deskripsi': deskripsi,
      'tarip': tarip,
    };
  }

  factory DetailTaripRadiologiModel.fromMap(Map<String, dynamic> map) {
    return DetailTaripRadiologiModel(
      kdBag: map['kd_bag'].toString(),
      kode: map['kode'].toString(),
      deskripsi: map['deskripsi'].toString(),
      tarip: map['tarip'] as int,
    );
  }
}
