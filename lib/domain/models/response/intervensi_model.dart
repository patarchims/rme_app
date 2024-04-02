class IntervensiModel {
  final String kode;
  final String ekspetasi;
  final String judul;
  final List<Slki> slki;

  IntervensiModel({
    required this.kode,
    required this.ekspetasi,
    required this.judul,
    required this.slki,
  });

  factory IntervensiModel.fromJson(Map<String, dynamic> json) =>
      IntervensiModel(
        judul: json["judul"],
        kode: json["kode"],
        ekspetasi: json["ekspetasi"],
        slki: List<Slki>.from(json["slki"].map((x) => Slki.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "kode": kode,
        "ekspetasi": ekspetasi,
        "slki": List<dynamic>.from(slki.map((x) => x.toJson())),
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kode': kode,
      'ekspetasi': ekspetasi,
      'judul': judul,
      'slki': slki.map((x) => x.toJson()).toList(),
    };
  }

  factory IntervensiModel.fromMap(Map<String, dynamic> map) {
    return IntervensiModel(
      kode: map['kode'] as String,
      ekspetasi: map['ekspetasi'] as String,
      judul: map['judul'] as String,
      slki: List<Slki>.from(
        (map['slki'] as List<int>).map<Slki>(
          (x) => Slki.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  IntervensiModel copyWith({
    String? kode,
    String? ekspetasi,
    String? judul,
    List<Slki>? slki,
  }) {
    return IntervensiModel(
      kode: kode ?? this.kode,
      ekspetasi: ekspetasi ?? this.ekspetasi,
      judul: judul ?? this.judul,
      slki: slki ?? this.slki,
    );
  }
}

class Slki {
  final int no;
  final int noUrut;
  final String tanda;
  final String menurun;
  final String meningkat;
  final String memburuk;
  final String kode;
  final String ekspektasi;
  final String judul;
  final List<String> kriteria;
  final int selectedNumber;

  Slki({
    required this.no,
    required this.noUrut,
    required this.tanda,
    required this.menurun,
    required this.meningkat,
    required this.memburuk,
    required this.kode,
    required this.ekspektasi,
    required this.judul,
    required this.kriteria,
    required this.selectedNumber,
  });

  factory Slki.fromJson(Map<String, dynamic> json) => Slki(
        judul: json["judul"],
        no: json["no"],
        noUrut: json["no_urut"],
        tanda: json["tanda"],
        menurun: json["menurun"],
        meningkat: json["meningkat"],
        memburuk: json["memburuk"],
        kode: json["kode"],
        ekspektasi: json["ekspektasi"],
        selectedNumber: json["selected_number"],
        kriteria: List<String>.from(json["kriteria"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "no": no,
        "no_urut": noUrut,
        "tanda": tanda,
        "menurun": menurun,
        "meningkat": meningkat,
        "memburuk": memburuk,
        "kode": kode,
        "selected_number": selectedNumber,
        "ekspektasi": ekspektasi,
      };

  Slki copyWith({
    int? no,
    int? noUrut,
    String? tanda,
    String? menurun,
    String? meningkat,
    String? memburuk,
    String? kode,
    String? ekspektasi,
    String? judul,
    List<String>? kriteria,
    int? selectedNumber,
  }) {
    return Slki(
      no: no ?? this.no,
      noUrut: noUrut ?? this.noUrut,
      tanda: tanda ?? this.tanda,
      menurun: menurun ?? this.menurun,
      meningkat: meningkat ?? this.meningkat,
      memburuk: memburuk ?? this.memburuk,
      kode: kode ?? this.kode,
      ekspektasi: ekspektasi ?? this.ekspektasi,
      judul: judul ?? this.judul,
      kriteria: kriteria ?? this.kriteria,
      selectedNumber: selectedNumber ?? this.selectedNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'no': no,
      'no_urut': noUrut,
      'tanda': tanda,
      'menurun': menurun,
      'meningkat': meningkat,
      'memburuk': memburuk,
      'kode': kode,
      'ekspektasi': ekspektasi,
      'judul': judul,
      'kriteria': kriteria,
      'selected_number': selectedNumber,
    };
  }

  factory Slki.fromMap(Map<String, dynamic> map) {
    return Slki(
        no: map['no'] as int,
        noUrut: map['no_urut'] as int,
        tanda: map['tanda'] as String,
        menurun: map['menurun'] as String,
        meningkat: map['meningkat'] as String,
        memburuk: map['memburuk'] as String,
        kode: map['kode'] as String,
        ekspektasi: map['ekspektasi'] as String,
        judul: map['judul'] as String,
        selectedNumber: map['selected_number'] as int,
        kriteria: List<String>.from(
          (map['kriteria'] as List<String>),
        ));
  }
}
