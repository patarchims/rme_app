class FisioTerapiModel {
  final String kode;
  final String kdBag;
  final String deskripsi;

  FisioTerapiModel({
    required this.kode,
    required this.kdBag,
    required this.deskripsi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode': kode,
      'kd_bag': kdBag,
      'deskripsi': deskripsi,
    };
  }

  factory FisioTerapiModel.fromMap(Map<String, dynamic> map) {
    return FisioTerapiModel(
      kode: map['kode'].toString(),
      kdBag: map['kd_bag'].toString(),
      deskripsi: map['deskripsi'].toString(),
    );
  }
}
