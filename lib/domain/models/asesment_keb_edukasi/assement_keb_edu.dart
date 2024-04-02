import 'dart:convert';

class AssementKebEdukasiModel {
  AssementKebEdukasiModel({
    required this.edukasi,
    required this.hambatan,
    required this.hasil,
    required this.intervensi,
    required this.kemampuanBelajar,
    required this.motivasiBelajar,
    required this.nilaiPasien,
    required this.rencanaEdukasi,
    required this.tujuan,
    this.noReg,
    this.jam,
    this.tgl,
    this.user,
  });

  final Edukasi edukasi;
  final Hambatan hambatan;
  final Hasil hasil;
  final Intervensi intervensi;
  final Belajar kemampuanBelajar;
  final MotiveBelajar motivasiBelajar;
  final NilaiPasien nilaiPasien;
  final String rencanaEdukasi;
  final String? noReg;
  final String? user;
  final String? tgl;
  final String? jam;

  final Tujuan tujuan;

  factory AssementKebEdukasiModel.fromMap(Map<String, dynamic> json) =>
      AssementKebEdukasiModel(
        edukasi: Edukasi.fromMap(json["edukasi"]),
        hambatan: Hambatan.fromMap(json["hambatan"]),
        hasil: Hasil.fromMap(json["hasil"]),
        intervensi: Intervensi.fromMap(json["intervensi"]),
        kemampuanBelajar: Belajar.fromMap(json["kemampuanBelajar"]),
        motivasiBelajar: MotiveBelajar.fromMap(json["motivasiBelajar"]),
        nilaiPasien: NilaiPasien.fromMap(json["nilaiPasien"]),
        rencanaEdukasi: json["rencanaEdukasi"],
        user: json["aseseduUser"],
        jam: json["aseseduJam"],
        tgl: json["aseseduTgl"],
        tujuan: Tujuan.fromMap(json["tujuan"]),
      );

  Map<String, dynamic> toMap() => {
        "edukasi": edukasi.toMap(),
        "hambatan": hambatan.toMap(),
        "hasil": hasil.toMap(),
        "intervensi": intervensi.toMap(),
        "kemampuanBelajar": kemampuanBelajar.toMap(),
        "motivasiBelajar": motivasiBelajar.toMap(),
        "nilaiPasien": nilaiPasien.toMap(),
        "noReg": noReg ?? "",
        "aseseduUser": user ?? "",
        "aseseduJam": jam ?? "",
        "aseseduTgl": tgl ?? "",
        "rencanaEdukasi": rencanaEdukasi,
        "tujuan": tujuan.toMap(),
      };

  AssementKebEdukasiModel copyWith({
    Edukasi? edukasi,
    Hambatan? hambatan,
    Hasil? hasil,
    Intervensi? intervensi,
    Belajar? kemampuanBelajar,
    MotiveBelajar? motivasiBelajar,
    NilaiPasien? nilaiPasien,
    String? rencanaEdukasi,
    String? noReg,
    Tujuan? tujuan,
  }) {
    return AssementKebEdukasiModel(
      edukasi: edukasi ?? this.edukasi,
      hambatan: hambatan ?? this.hambatan,
      hasil: hasil ?? this.hasil,
      intervensi: intervensi ?? this.intervensi,
      kemampuanBelajar: kemampuanBelajar ?? this.kemampuanBelajar,
      motivasiBelajar: motivasiBelajar ?? this.motivasiBelajar,
      nilaiPasien: nilaiPasien ?? this.nilaiPasien,
      rencanaEdukasi: rencanaEdukasi ?? this.rencanaEdukasi,
      tujuan: tujuan ?? this.tujuan,
      noReg: noReg ?? this.noReg,
    );
  }
}

class Edukasi {
  Edukasi({
    required this.kebEdu1,
    required this.kebEdu2,
    required this.kebEdu3,
    required this.kebEdu4,
    required this.kebEdu5,
    required this.kebEdu6,
    required this.kebEdu7,
    required this.kebEdu8,
    required this.kebEdu9,
    required this.kebEdu10,
    required this.kebEdu11,
    required this.kebEdu11Detail,
  });

  final String kebEdu1;
  final String kebEdu2;
  final String kebEdu3;
  final String kebEdu4;
  final String kebEdu5;
  final String kebEdu6;
  final String kebEdu7;
  final String kebEdu8;
  final String kebEdu9;
  final String kebEdu10;
  final String kebEdu11;
  final String kebEdu11Detail;

  factory Edukasi.fromJson(String str) => Edukasi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Edukasi.fromMap(Map<String, dynamic> json) => Edukasi(
        kebEdu1: json["kebEdu1"],
        kebEdu2: json["kebEdu2"],
        kebEdu3: json["kebEdu3"],
        kebEdu4: json["kebEdu4"],
        kebEdu5: json["kebEdu5"],
        kebEdu6: json["kebEdu6"],
        kebEdu7: json["kebEdu7"],
        kebEdu8: json["kebEdu8"],
        kebEdu9: json["kebEdu9"],
        kebEdu10: json["kebEdu10"],
        kebEdu11: json["kebEdu11"],
        kebEdu11Detail: json["kebEdu11Detail"],
      );

  Map<String, dynamic> toMap() => {
        "kebEdu1": kebEdu1,
        "kebEdu2": kebEdu2,
        "kebEdu3": kebEdu3,
        "kebEdu4": kebEdu4,
        "kebEdu5": kebEdu5,
        "kebEdu6": kebEdu6,
        "kebEdu7": kebEdu7,
        "kebEdu8": kebEdu8,
        "kebEdu9": kebEdu9,
        "kebEdu10": kebEdu10,
        "kebEdu11": kebEdu11,
        "kebEdu11Detail": kebEdu11Detail,
      };

  Edukasi copyWith({
    String? kebEdu1,
    String? kebEdu2,
    String? kebEdu3,
    String? kebEdu4,
    String? kebEdu5,
    String? kebEdu6,
    String? kebEdu7,
    String? kebEdu8,
    String? kebEdu9,
    String? kebEdu10,
    String? kebEdu11,
    String? kebEdu11Detail,
  }) {
    return Edukasi(
      kebEdu1: kebEdu1 ?? this.kebEdu1,
      kebEdu2: kebEdu2 ?? this.kebEdu2,
      kebEdu3: kebEdu3 ?? this.kebEdu3,
      kebEdu4: kebEdu4 ?? this.kebEdu4,
      kebEdu5: kebEdu5 ?? this.kebEdu5,
      kebEdu6: kebEdu6 ?? this.kebEdu6,
      kebEdu7: kebEdu7 ?? this.kebEdu7,
      kebEdu8: kebEdu8 ?? this.kebEdu8,
      kebEdu9: kebEdu9 ?? this.kebEdu9,
      kebEdu10: kebEdu10 ?? this.kebEdu10,
      kebEdu11: kebEdu11 ?? this.kebEdu11,
      kebEdu11Detail: kebEdu11Detail ?? this.kebEdu11Detail,
    );
  }
}

class Hambatan {
  Hambatan({
    required this.hambatan1,
    required this.hambatan2,
    required this.hambatan3,
    required this.hambatan4,
    required this.hambatan5,
    required this.hambatan6,
    required this.hambatan7,
    required this.hambatan8,
    required this.hambatan9,
    required this.hambatan9Detail,
  });

  final String hambatan1;
  final String hambatan2;
  final String hambatan3;
  final String hambatan4;
  final String hambatan5;
  final String hambatan6;
  final String hambatan7;
  final String hambatan8;
  final String hambatan9;
  final String hambatan9Detail;

  factory Hambatan.fromJson(String str) => Hambatan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hambatan.fromMap(Map<String, dynamic> json) => Hambatan(
        hambatan1: json["hambatan1"],
        hambatan2: json["hambatan2"],
        hambatan3: json["hambatan3"],
        hambatan4: json["hambatan4"],
        hambatan5: json["hambatan5"],
        hambatan6: json["hambatan6"],
        hambatan7: json["hambatan7"],
        hambatan8: json["hambatan8"],
        hambatan9: json["hambatan9"],
        hambatan9Detail: json["hambatan9Detail"],
      );

  Map<String, dynamic> toMap() => {
        "hambatan1": hambatan1,
        "hambatan2": hambatan2,
        "hambatan3": hambatan3,
        "hambatan4": hambatan4,
        "hambatan5": hambatan5,
        "hambatan6": hambatan6,
        "hambatan7": hambatan7,
        "hambatan8": hambatan8,
        "hambatan9": hambatan9,
        "hambatan9Detail": hambatan9Detail,
      };
}

class Hasil {
  Hasil({
    required this.hasil1,
    required this.hasil2,
  });

  final String hasil1;
  final String hasil2;

  factory Hasil.fromJson(String str) => Hasil.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hasil.fromMap(Map<String, dynamic> json) => Hasil(
        hasil1: json["hasil1"],
        hasil2: json["hasil2"],
      );

  Map<String, dynamic> toMap() => {
        "hasil1": hasil1,
        "hasil2": hasil2,
      };
}

class Intervensi {
  Intervensi({
    required this.intervensi1,
    required this.intervensi2,
    required this.intervensi3,
    required this.intervensi4,
    required this.intervensi5,
  });

  final String intervensi1;
  final String intervensi2;
  final String intervensi3;
  final String intervensi4;
  final String intervensi5;

  factory Intervensi.fromJson(String str) =>
      Intervensi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Intervensi.fromMap(Map<String, dynamic> json) => Intervensi(
        intervensi1: json["intervensi1"],
        intervensi2: json["intervensi2"],
        intervensi3: json["intervensi3"],
        intervensi4: json["intervensi4"],
        intervensi5: json["intervensi5"],
      );

  Map<String, dynamic> toMap() => {
        "intervensi1": intervensi1,
        "intervensi2": intervensi2,
        "intervensi3": intervensi3,
        "intervensi4": intervensi4,
        "intervensi5": intervensi5,
      };
}

class MotiveBelajar {
  MotiveBelajar({
    required this.motivasiBelajar1,
    required this.motivasiBelajar2,
    required this.motivasiBelajar3,
  });
  final String motivasiBelajar1;
  final String motivasiBelajar2;
  final String motivasiBelajar3;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'motivasiBelajar1': motivasiBelajar1,
      'motivasiBelajar2': motivasiBelajar2,
      'motivasiBelajar3': motivasiBelajar3,
    };
  }

  factory MotiveBelajar.fromMap(Map<String, dynamic> map) {
    return MotiveBelajar(
      motivasiBelajar1: map['motivasiBelajar1'] as String,
      motivasiBelajar2: map['motivasiBelajar2'] as String,
      motivasiBelajar3: map['motivasiBelajar3'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MotiveBelajar.fromJson(String source) =>
      MotiveBelajar.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Belajar {
  Belajar({
    required this.kempBelajar1,
    required this.kempBelajar2,
    required this.kempBelajar3,
  });

  final String kempBelajar1;
  final String kempBelajar2;
  final String kempBelajar3;

  factory Belajar.fromJson(String str) => Belajar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Belajar.fromMap(Map<String, dynamic> json) => Belajar(
        kempBelajar1: json["kempBelajar1"],
        kempBelajar2: json["kempBelajar2"],
        kempBelajar3: json["kempBelajar3"],
      );

  Map<String, dynamic> toMap() => {
        "kempBelajar1": kempBelajar1,
        "kempBelajar2": kempBelajar2,
        "kempBelajar3": kempBelajar3,
      };
}

class NilaiPasien {
  NilaiPasien({
    required this.nilaiPasien1,
    required this.nilaiPasien2,
    required this.nilaiPasien3,
    required this.nilaiPasien4,
    required this.nilaiPasien5,
    required this.nilaiPasien6,
    required this.nilaiPasien6Detail,
  });

  final String nilaiPasien1;
  final String nilaiPasien2;
  final String nilaiPasien3;
  final String nilaiPasien4;
  final String nilaiPasien5;
  final String nilaiPasien6;
  final String nilaiPasien6Detail;

  factory NilaiPasien.fromJson(String str) =>
      NilaiPasien.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NilaiPasien.fromMap(Map<String, dynamic> json) => NilaiPasien(
        nilaiPasien1: json["nilaiPasien1"],
        nilaiPasien2: json["nilaiPasien2"],
        nilaiPasien3: json["nilaiPasien3"],
        nilaiPasien4: json["nilaiPasien4"],
        nilaiPasien5: json["nilaiPasien5"],
        nilaiPasien6: json["nilaiPasien6"],
        nilaiPasien6Detail: json["nilaiPasien6Detail"],
      );

  Map<String, dynamic> toMap() => {
        "nilaiPasien1": nilaiPasien1,
        "nilaiPasien2": nilaiPasien2,
        "nilaiPasien3": nilaiPasien3,
        "nilaiPasien4": nilaiPasien4,
        "nilaiPasien5": nilaiPasien5,
        "nilaiPasien6": nilaiPasien6,
        "nilaiPasien6Detail": nilaiPasien6Detail,
      };
}

class Tujuan {
  Tujuan({
    required this.tujuan1,
    required this.tujuan2,
  });

  final String tujuan1;
  final String tujuan2;

  factory Tujuan.fromJson(String str) => Tujuan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tujuan.fromMap(Map<String, dynamic> json) => Tujuan(
        tujuan1: json["tujuan1"],
        tujuan2: json["tujuan2"],
      );

  Map<String, dynamic> toMap() => {
        "tujuan1": tujuan1,
        "tujuan2": tujuan2,
      };
}
