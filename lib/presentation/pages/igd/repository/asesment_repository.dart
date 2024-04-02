// ignore_for_file: public_member_api_docs, sort_constructors_first
class KeluhanUtamaDokterIgd {
  List<RiwayatTerdahulu> riwayatTerdahulu;
  List<RiwayatKeluarga> riwayatKeluarga;
  Asesmen asesmen;

  KeluhanUtamaDokterIgd({
    required this.riwayatTerdahulu,
    required this.riwayatKeluarga,
    required this.asesmen,
  });

  factory KeluhanUtamaDokterIgd.fromJson(Map<String, dynamic> json) =>
      KeluhanUtamaDokterIgd(
        riwayatTerdahulu: List<RiwayatTerdahulu>.from(
            json["riwayat_terdahulu"].map((x) => RiwayatTerdahulu.fromJson(x))),
        riwayatKeluarga: List<RiwayatKeluarga>.from(
            json["riwayat_keluarga"].map((x) => RiwayatKeluarga.fromJson(x))),
        asesmen: Asesmen.fromJson(json["asesmen"]),
      );

  Map<String, dynamic> toJson() => {
        "riwayat_terdahulu":
            List<dynamic>.from(riwayatTerdahulu.map((x) => x.toJson())),
        "riwayat_keluarga":
            List<dynamic>.from(riwayatKeluarga.map((x) => x.toJson())),
        "asesmen": asesmen.toJson(),
      };

  KeluhanUtamaDokterIgd copyWith({
    List<RiwayatTerdahulu>? riwayatTerdahulu,
    List<RiwayatKeluarga>? riwayatKeluarga,
    Asesmen? asesmen,
  }) {
    return KeluhanUtamaDokterIgd(
      riwayatTerdahulu: riwayatTerdahulu ?? this.riwayatTerdahulu,
      riwayatKeluarga: riwayatKeluarga ?? this.riwayatKeluarga,
      asesmen: asesmen ?? this.asesmen,
    );
  }
}

class Asesmen {
  String noreg;
  String keluhUtama;
  String rwtSekarang;

  Asesmen({
    required this.noreg,
    required this.keluhUtama,
    required this.rwtSekarang,
  });

  factory Asesmen.fromJson(Map<String, dynamic> json) => Asesmen(
        noreg: json["noreg"],
        keluhUtama: json["keluh_utama"],
        rwtSekarang: json["rwt_sekarang"],
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "keluh_utama": keluhUtama,
        "rwt_sekarang": rwtSekarang,
      };

  Asesmen copyWith({
    String? noreg,
    String? keluhUtama,
    String? rwtSekarang,
  }) {
    return Asesmen(
      noreg: noreg ?? this.noreg,
      keluhUtama: keluhUtama ?? this.keluhUtama,
      rwtSekarang: rwtSekarang ?? this.rwtSekarang,
    );
  }
}

class RiwayatKeluarga {
  int nomor;
  String noRm;
  String kelompok;
  DateTime insertDttm;
  String alergi;
  String namaUser;
  String bagian;

  RiwayatKeluarga({
    required this.nomor,
    required this.noRm,
    required this.kelompok,
    required this.insertDttm,
    required this.alergi,
    required this.namaUser,
    required this.bagian,
  });

  factory RiwayatKeluarga.fromJson(Map<String, dynamic> json) =>
      RiwayatKeluarga(
        nomor: json["nomor"],
        noRm: json["no_rm"],
        kelompok: json["kelompok"],
        insertDttm: DateTime.parse(json["insert_dttm"]),
        alergi: json["alergi"],
        namaUser: json["nama_user"],
        bagian: json["bagian"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "no_rm": noRm,
        "kelompok": kelompok,
        "insert_dttm": insertDttm.toIso8601String(),
        "alergi": alergi,
        "nama_user": namaUser,
        "bagian": bagian,
      };
}

class RiwayatTerdahulu {
  DateTime tglMasuk;
  String keluhUtama;
  String riwayatSekarang;

  RiwayatTerdahulu({
    required this.tglMasuk,
    required this.keluhUtama,
    required this.riwayatSekarang,
  });

  factory RiwayatTerdahulu.fromJson(Map<String, dynamic> json) =>
      RiwayatTerdahulu(
        tglMasuk: DateTime.parse(json["tgl_masuk"]),
        keluhUtama: json["keluh_utama"],
        riwayatSekarang: json["riwayat_sekarang"],
      );

  Map<String, dynamic> toJson() => {
        "tgl_masuk": tglMasuk.toIso8601String(),
        "keluh_utama": keluhUtama,
        "riwayat_sekarang": riwayatSekarang,
      };
}
