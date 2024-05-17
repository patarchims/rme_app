class PengkajianKeperawatanResponseModel {
  Pengkajian pengkajian;
  List<RiwayatKeluarga> riwayatPenyakitKeluarga;
  List<RiwayatTerdahulu> riwayatTerdahulu;

  PengkajianKeperawatanResponseModel({
    required this.pengkajian,
    required this.riwayatTerdahulu,
    required this.riwayatPenyakitKeluarga,
  });

  factory PengkajianKeperawatanResponseModel.fromJson(
          Map<String, dynamic> json) =>
      PengkajianKeperawatanResponseModel(
        riwayatTerdahulu: List<RiwayatTerdahulu>.from(
            json["riwayat_terdahulu"].map((x) => RiwayatTerdahulu.fromJson(x))),
        riwayatPenyakitKeluarga: List<RiwayatKeluarga>.from(
            json["riwayat_keluarga"].map((x) => RiwayatKeluarga.fromJson(x))),
        pengkajian: Pengkajian.fromJson(json["pengkajian"]),
      );

  PengkajianKeperawatanResponseModel copyWith({
    Pengkajian? pengkajian,
    List<RiwayatKeluarga>? riwayatPenyakitKeluarga,
    List<RiwayatTerdahulu>? riwayatTerdahulu,
  }) {
    return PengkajianKeperawatanResponseModel(
      riwayatTerdahulu: riwayatTerdahulu ?? this.riwayatTerdahulu,
      riwayatPenyakitKeluarga:
          riwayatPenyakitKeluarga ?? this.riwayatPenyakitKeluarga,
      pengkajian: pengkajian ?? this.pengkajian,
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
        nomor: json["nomor"] as int,
        noRm: json["no_rm"].toString(),
        kelompok: json["kelompok"].toString(),
        insertDttm: DateTime.parse(json["insert_dttm"]),
        alergi: json["alergi"].toString(),
        namaUser: json["nama_user"].toString(),
        bagian: json["bagian"].toString(),
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
        keluhUtama: json["keluh_utama"].toString(),
        riwayatSekarang: json["riwayat_sekarang"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "tgl_masuk": tglMasuk.toString(),
        "keluh_utama": keluhUtama,
        "riwayat_sekarang": riwayatSekarang,
      };
}
