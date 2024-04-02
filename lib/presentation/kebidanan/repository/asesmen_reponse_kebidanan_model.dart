// ignore_for_file: public_member_api_docs, sort_constructors_first
class AsesmenKebidananResponseModel {
  Asesmen asesmen;
  List<RiwayatKeluarga> riwayatPenyakitKeluarga;
  List<RiwayatTerdahulu> riwayatTerdahulu;

  AsesmenKebidananResponseModel({
    required this.asesmen,
    required this.riwayatPenyakitKeluarga,
    required this.riwayatTerdahulu,
  });

  factory AsesmenKebidananResponseModel.fromJson(Map<String, dynamic> json) =>
      AsesmenKebidananResponseModel(
        riwayatTerdahulu: List<RiwayatTerdahulu>.from(
            json["riwayat_terdahulu"].map((x) => RiwayatTerdahulu.fromJson(x))),
        riwayatPenyakitKeluarga: List<RiwayatKeluarga>.from(
            json["riwayat_keluarga"].map((x) => RiwayatKeluarga.fromJson(x))),
        asesmen: Asesmen.fromJson(json["asesmen"]),
      );

  Map<String, dynamic> toJson() => {
        "asesmen": asesmen.toJson(),
      };

  AsesmenKebidananResponseModel copyWith({
    Asesmen? asesmen,
    List<RiwayatKeluarga>? riwayatPenyakitKeluarga,
    List<RiwayatTerdahulu>? riwayatTerdahulu,
  }) {
    return AsesmenKebidananResponseModel(
        asesmen: asesmen ?? this.asesmen,
        riwayatPenyakitKeluarga:
            riwayatPenyakitKeluarga ?? this.riwayatPenyakitKeluarga,
        riwayatTerdahulu: riwayatTerdahulu ?? this.riwayatTerdahulu);
  }
}

class Asesmen {
  String noreg;
  String keluhanUtama;
  String rwytPenyakit;
  String rwytMenstruasi;
  String keluhanMenyertai;
  String siklusHaid;
  String rwytPenikahan;
  String rwytDahulu;

  Asesmen({
    required this.noreg,
    required this.keluhanUtama,
    required this.rwytPenyakit,
    required this.rwytMenstruasi,
    required this.keluhanMenyertai,
    required this.siklusHaid,
    required this.rwytPenikahan,
    required this.rwytDahulu,
  });

  factory Asesmen.fromJson(Map<String, dynamic> json) => Asesmen(
      noreg: json["noreg"],
      keluhanUtama: json["keluhan_utama"],
      rwytPenyakit: json["rwyt_penyakit"],
      rwytMenstruasi: json["rwyt_menstruasi"],
      keluhanMenyertai: json["keluhan_menyertai"],
      siklusHaid: json["siklus_haid"],
      rwytPenikahan: json["rwyt_penikahan"],
      rwytDahulu: json["penyakit_dahulu"]);

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "keluhan_utama": keluhanUtama,
        "rwyt_penyakit": rwytPenyakit,
        "rwyt_menstruasi": rwytMenstruasi,
        "keluhan_menyertai": keluhanMenyertai,
        "siklus_haid": siklusHaid,
        "rwyt_penikahan": rwytPenikahan,
        "riwayat_dahulu": rwytDahulu,
      };

  Asesmen copyWith({
    String? noreg,
    String? keluhanUtama,
    String? rwytPenyakit,
    String? rwytMenstruasi,
    String? keluhanMenyertai,
    String? siklusHaid,
    String? rwytPenikahan,
    String? rwytDahulu,
  }) {
    return Asesmen(
      rwytDahulu: rwytDahulu ?? this.rwytDahulu,
      noreg: noreg ?? this.noreg,
      keluhanUtama: keluhanUtama ?? this.keluhanUtama,
      rwytPenyakit: rwytPenyakit ?? this.rwytPenyakit,
      rwytMenstruasi: rwytMenstruasi ?? this.rwytMenstruasi,
      keluhanMenyertai: keluhanMenyertai ?? this.keluhanMenyertai,
      siklusHaid: siklusHaid ?? this.siklusHaid,
      rwytPenikahan: rwytPenikahan ?? this.rwytPenikahan,
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

class Pengkajian {
  String noreg;
  String person;
  String dpjp;
  String jenpel;
  String keluhanUtama;
  String rwytPenyakit;
  String reaksiAlergi;
  String detailJenpel;
  String riwayatPenyakitDahulu;

  Pengkajian({
    required this.noreg,
    required this.detailJenpel,
    required this.person,
    required this.dpjp,
    required this.jenpel,
    required this.keluhanUtama,
    required this.rwytPenyakit,
    required this.reaksiAlergi,
    required this.riwayatPenyakitDahulu,
  });

  factory Pengkajian.fromJson(Map<String, dynamic> json) => Pengkajian(
      detailJenpel: json["detail_jenpel"],
      noreg: json["noreg"],
      person: json["person"],
      dpjp: json["dpjp"],
      jenpel: json["jenpel"],
      keluhanUtama: json["keluhan_utama"],
      rwytPenyakit: json["rwyt_penyakit"],
      reaksiAlergi: json["reaksi_alergi"],
      riwayatPenyakitDahulu: json["rwyt_penyakit_dahulu"]);

  Map<String, dynamic> toJson() => {
        "detail_jenpel": jenpel,
        "noreg": noreg,
        "person": person,
        "dpjp": dpjp,
        "jenpel": jenpel,
        "keluhan_utama": keluhanUtama,
        "rwyt_penyakit": rwytPenyakit,
        "reaksi_alergi": reaksiAlergi,
        "rwyt_penyakit_dahulu": riwayatPenyakitDahulu
      };

  Pengkajian copyWith({
    String? noreg,
    String? person,
    String? dpjp,
    String? jenpel,
    String? keluhanUtama,
    String? rwytPenyakit,
    String? reaksiAlergi,
    String? detailJenpel,
    String? riwayatPenyakitDahulu,
  }) {
    return Pengkajian(
      riwayatPenyakitDahulu:
          riwayatPenyakitDahulu ?? this.riwayatPenyakitDahulu,
      detailJenpel: detailJenpel ?? this.detailJenpel,
      noreg: noreg ?? this.noreg,
      person: person ?? this.person,
      dpjp: dpjp ?? this.dpjp,
      jenpel: jenpel ?? this.jenpel,
      keluhanUtama: keluhanUtama ?? this.keluhanUtama,
      rwytPenyakit: rwytPenyakit ?? this.rwytPenyakit,
      reaksiAlergi: reaksiAlergi ?? this.reaksiAlergi,
    );
  }
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
        "tgl_masuk": tglMasuk.toString(),
        "keluh_utama": keluhUtama,
        "riwayat_sekarang": riwayatSekarang,
      };
}
