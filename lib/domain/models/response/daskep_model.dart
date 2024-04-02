class DaskepModel {
  final int noUrut;
  final int nilai;
  final String judul;
  final String defenisi;
  final String ekspetasi;
  final String menurun;
  final String meningkat;
  final String memburuk;
  final String sdki;
  final String siki;
  final String tanggal;
  DaskepModel({
    required this.noUrut,
    required this.nilai,
    required this.judul,
    required this.defenisi,
    required this.ekspetasi,
    required this.menurun,
    required this.meningkat,
    required this.memburuk,
    required this.sdki,
    required this.siki,
    required this.tanggal,
  });

  DaskepModel copyWith({
    int? noUrut,
    int? nilai,
    String? judul,
    String? defenisi,
    String? ekspetasi,
    String? menurun,
    String? meningkat,
    String? memburuk,
    String? sdki,
    String? siki,
    String? tanggal,
  }) {
    return DaskepModel(
      noUrut: noUrut ?? this.noUrut,
      nilai: nilai ?? this.nilai,
      judul: judul ?? this.judul,
      defenisi: defenisi ?? this.defenisi,
      ekspetasi: ekspetasi ?? this.ekspetasi,
      menurun: menurun ?? this.menurun,
      meningkat: meningkat ?? this.meningkat,
      memburuk: memburuk ?? this.memburuk,
      sdki: sdki ?? this.sdki,
      siki: siki ?? this.siki,
      tanggal: tanggal ?? this.tanggal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'no_urut': noUrut,
      'nilai': nilai,
      'judul': judul,
      'defenisi': defenisi,
      'ekspetasi': ekspetasi,
      'menurun': menurun,
      'meningkat': meningkat,
      'memburuk': memburuk,
      'sdki': sdki,
      'siki': siki,
      'tanggal': tanggal,
    };
  }

  factory DaskepModel.fromMap(Map<String, dynamic> map) {
    return DaskepModel(
      noUrut: map['no_urut'] as int,
      nilai: map['nilai'] as int,
      judul: map['judul'] as String,
      defenisi: map['defenisi'] as String,
      ekspetasi: map['ekspetasi'] as String,
      menurun: map['menurun'] as String,
      meningkat: map['meningkat'] as String,
      memburuk: map['memburuk'] as String,
      sdki: map['sdki'] as String,
      siki: map['siki'] as String,
      tanggal: map['tanggal'].toString().substring(0, 10),
    );
  }
}
