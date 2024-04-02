class SDKIModel {
  final String kode;
  final String judul;
  final String slki;
  final String siki;

  SDKIModel({
    required this.kode,
    required this.judul,
    required this.slki,
    required this.siki,
  });

  SDKIModel copyWith({
    String? kode,
    String? judul,
    String? slki,
    String? siki,
  }) {
    return SDKIModel(
        kode: kode ?? this.kode,
        judul: judul ?? this.judul,
        slki: slki ?? this.slki,
        siki: siki ?? this.siki);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode': kode,
      'judul': judul,
    };
  }

  factory SDKIModel.fromMap(Map<String, dynamic> map) {
    return SDKIModel(
      kode: map['kode'] as String,
      slki: map["slki"] as String,
      judul: map['judul'] as String,
      siki: map['siki'] as String,
    );
  }
}
