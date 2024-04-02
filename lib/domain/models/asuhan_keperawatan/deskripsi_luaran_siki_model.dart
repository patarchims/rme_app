// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeskripsiLuaranSikiModel {
  Diagnosa diagnosa;
  List<Slki> slki;
  List<Siki> siki;

  DeskripsiLuaranSikiModel({
    required this.diagnosa,
    required this.slki,
    required this.siki,
  });

  factory DeskripsiLuaranSikiModel.fromJson(Map<String, dynamic> json) =>
      DeskripsiLuaranSikiModel(
        diagnosa: Diagnosa.fromJson(json["diagnosa"]),
        slki: List<Slki>.from(json["slki"].map((x) => Slki.fromJson(x))),
        siki: List<Siki>.from(json["siki"].map((x) => Siki.fromJson(x))),
      );

  // LAKUKAN MAMPING

  Map<String, dynamic> toJson({
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
  }) =>
      {
        "person": person,
        "noreg": noReg,
        "device_id": deviceID,
        "pelayanan": pelayanan,
        "diagnosa": diagnosa.toJson(),
        "slki": List<dynamic>.from(slki.map((x) => x.toJson())),
        "siki": List<dynamic>.from(siki.map((x) => x.toJson())),
      };

  DeskripsiLuaranSikiModel copyWith({
    Diagnosa? diagnosa,
    List<Slki>? slki,
    List<Siki>? siki,
  }) {
    return DeskripsiLuaranSikiModel(
      diagnosa: diagnosa ?? this.diagnosa,
      slki: slki ?? this.slki,
      siki: siki ?? this.siki,
    );
  }
}

class Diagnosa {
  String kode;
  String judul;
  String defenisi;
  String slki;
  String siki;

  Diagnosa({
    required this.kode,
    required this.judul,
    required this.defenisi,
    required this.slki,
    required this.siki,
  });

  factory Diagnosa.fromJson(Map<String, dynamic> json) => Diagnosa(
        kode: json["kode"],
        judul: json["judul"],
        defenisi: json["defenisi"],
        slki: json["slki"],
        siki: json["siki"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "judul": judul,
        "defenisi": defenisi,
        "slki": slki,
        "siki": siki,
      };
}

class Siki {
  String kode;
  String judul;
  List<Edukasi> observasi;
  List<Edukasi> terapetutik;
  List<Edukasi> edukasi;
  List<Edukasi> kolaborasi;

  Siki({
    required this.kode,
    required this.judul,
    required this.observasi,
    required this.terapetutik,
    required this.edukasi,
    required this.kolaborasi,
  });

  factory Siki.fromJson(Map<String, dynamic> json) => Siki(
        kode: json["kode"],
        judul: json["judul"],
        observasi: List<Edukasi>.from(
            json["observasi"].map((x) => Edukasi.fromJson(x))),
        terapetutik: List<Edukasi>.from(
            json["terapetutik"].map((x) => Edukasi.fromJson(x))),
        edukasi:
            List<Edukasi>.from(json["edukasi"].map((x) => Edukasi.fromJson(x))),
        kolaborasi: List<Edukasi>.from(
            json["kolaborasi"].map((x) => Edukasi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "judul": judul,
        "observasi": List<dynamic>.from(observasi.map((x) => x.toJson())),
        "terapetutik": List<dynamic>.from(terapetutik.map((x) => x.toJson())),
        "edukasi": List<dynamic>.from(edukasi.map((x) => x.toJson())),
        "kolaborasi": List<dynamic>.from(kolaborasi.map((x) => x.toJson())),
      };
}

class Edukasi {
  int idSiki;
  int noUrut;
  String kodeSiki;
  String deskripsi;
  bool isSelected;

  Edukasi({
    required this.idSiki,
    required this.noUrut,
    required this.kodeSiki,
    required this.deskripsi,
    required this.isSelected,
  });

  factory Edukasi.fromJson(Map<String, dynamic> json) => Edukasi(
        idSiki: json["id_siki"],
        noUrut: json["no_urut"],
        kodeSiki: json["kode_siki"],
        deskripsi: json["deskripsi"],
        isSelected: json["is_selected"],
      );

  Map<String, dynamic> toJson() => {
        "id_siki": idSiki,
        "no_urut": noUrut,
        "kode_siki": kodeSiki,
        "deskripsi": deskripsi,
        "is_selected": isSelected,
      };

  Edukasi copyWith({
    int? noUrut,
    int? idSiki,
    String? kodeSiki,
    String? deskripsi,
    bool? isSelected,
  }) {
    return Edukasi(
      idSiki: idSiki ?? this.idSiki,
      noUrut: noUrut ?? this.noUrut,
      kodeSiki: kodeSiki ?? this.kodeSiki,
      deskripsi: deskripsi ?? this.deskripsi,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Slki {
  String kodeSlki;
  String judul;
  String defenisi;
  String ekspetasi;
  List<KriteriaSlki> menurun;
  List<KriteriaSlki> meningkat;
  List<KriteriaSlki> memburuk;

  Slki({
    required this.kodeSlki,
    required this.judul,
    required this.defenisi,
    required this.ekspetasi,
    required this.menurun,
    required this.meningkat,
    required this.memburuk,
  });

  factory Slki.fromJson(Map<String, dynamic> json) => Slki(
        kodeSlki: json["kode_slki"],
        judul: json["judul"],
        defenisi: json["defenisi"],
        ekspetasi: json["ekspetasi"],
        menurun: List<KriteriaSlki>.from(
            json["menurun"].map((x) => KriteriaSlki.fromJson(x))),
        meningkat: List<KriteriaSlki>.from(
            json["meningkat"].map((x) => KriteriaSlki.fromJson(x))),
        memburuk: List<KriteriaSlki>.from(
            json["memburuk"].map((x) => KriteriaSlki.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kode_slki": kodeSlki,
        "judul": judul,
        "defenisi": defenisi,
        "ekspetasi": ekspetasi,
        "menurun": List<dynamic>.from(menurun.map((x) => x.toJson())),
        "meningkat": List<dynamic>.from(meningkat.map((x) => x.toJson())),
        "memburuk": List<dynamic>.from(memburuk.map((x) => x.toJson())),
      };
}

class KriteriaSlki {
  int idKriteria;
  String kodeSlki;
  String nama;
  bool tanda;
  bool isSelected;
  Kategori kategori;
  int noUrut;
  int waktu;
  int target;
  List<int> skor;

  KriteriaSlki({
    required this.nama,
    required this.idKriteria,
    required this.kodeSlki,
    required this.tanda,
    required this.waktu,
    required this.isSelected,
    required this.kategori,
    required this.noUrut,
    required this.target,
    required this.skor,
  });

  factory KriteriaSlki.fromJson(Map<String, dynamic> json) => KriteriaSlki(
        waktu: json["waktu"],
        isSelected: json["is_selected"],
        nama: json["nama"],
        idKriteria: json["id_kriteria"],
        kodeSlki: json["kode_slki"],
        tanda: json["tanda"],
        kategori: kategoriValues.map[json["kategori"]]!,
        noUrut: json["no_urut"],
        target: json["target"],
        skor: List<int>.from(json["skor"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id_kriteria": idKriteria,
        "nama": nama,
        "kode_slki": kodeSlki,
        "tanda": tanda,
        "is_selected": isSelected,
        "kategori": kategoriValues.reverse[kategori],
        "no_urut": noUrut,
        "waktu": waktu,
        "target": target,
        "skor": List<dynamic>.from(skor.map((x) => x)),
      };

  KriteriaSlki copyWith({
    int? idKriteria,
    String? kodeSlki,
    String? nama,
    bool? tanda,
    bool? isSelected,
    Kategori? kategori,
    int? noUrut,
    int? target,
    List<int>? skor,
    int? waktu,
  }) {
    return KriteriaSlki(
      waktu: waktu ?? this.waktu,
      idKriteria: idKriteria ?? this.idKriteria,
      kodeSlki: kodeSlki ?? this.kodeSlki,
      nama: nama ?? this.nama,
      tanda: tanda ?? this.tanda,
      isSelected: isSelected ?? this.isSelected,
      kategori: kategori ?? this.kategori,
      noUrut: noUrut ?? this.noUrut,
      target: target ?? this.target,
      skor: skor ?? this.skor,
    );
  }
}

enum Kategori { memburuk, meningkat, menurun }

final kategoriValues = EnumValues({
  "Memburuk": Kategori.memburuk,
  "Meningkat": Kategori.meningkat,
  "Menurun": Kategori.menurun
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
