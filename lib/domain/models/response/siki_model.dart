class SikiModel {
  final String kode;
  final String judul;
  final String observasi;
  final String terapeutik;
  final String edukasi;
  final String kolaborasi;

  SikiModel({
    required this.kode,
    required this.judul,
    required this.observasi,
    required this.terapeutik,
    required this.edukasi,
    required this.kolaborasi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode': kode,
      'judul': judul,
      'observasi': observasi,
      'terapeutik': terapeutik,
      'edukasi': edukasi,
      'kolaborasi': kolaborasi,
    };
  }

  factory SikiModel.fromMap(Map<String, dynamic> map) {
    return SikiModel(
      kode: map['kode'].toString(),
      judul: map['judul'].toString(),
      observasi: map['observasi'].toString(),
      terapeutik: map['terapeutik'].toString(),
      edukasi: map['edukasi'].toString(),
      kolaborasi: map['kolaborasi'].toString(),
    );
  }
}
