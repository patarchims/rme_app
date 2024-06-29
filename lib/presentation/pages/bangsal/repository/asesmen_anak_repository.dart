class PenkajianAnakRepository {
  final PengkajianAnak pengkajianAnak;
  List<RiwayatKeluarga> riwayatPenyakitKeluarga;
  List<RiwayatTerdahulu> riwayatTerdahulu;

  PenkajianAnakRepository({
    required this.pengkajianAnak,
    required this.riwayatTerdahulu,
    required this.riwayatPenyakitKeluarga,
  });

  factory PenkajianAnakRepository.fromMap(Map<String, dynamic> map) {
    return PenkajianAnakRepository(
      riwayatTerdahulu: List<RiwayatTerdahulu>.from(
          map["riwayat_terdahulu"].map((x) => RiwayatTerdahulu.fromJson(x))),
      riwayatPenyakitKeluarga: List<RiwayatKeluarga>.from(
          map["riwayat_keluarga"].map((x) => RiwayatKeluarga.fromJson(x))),
      pengkajianAnak: PengkajianAnak.fromJson(
          map['pengkajian_anak'] as Map<String, dynamic>),
    );
  }

  PenkajianAnakRepository copyWith({
    PengkajianAnak? pengkajianAnak,
    List<RiwayatKeluarga>? riwayatPenyakitKeluarga,
    List<RiwayatTerdahulu>? riwayatTerdahulu,
  }) {
    return PenkajianAnakRepository(
        pengkajianAnak: pengkajianAnak ?? this.pengkajianAnak,
        riwayatPenyakitKeluarga:
            riwayatPenyakitKeluarga ?? this.riwayatPenyakitKeluarga,
        riwayatTerdahulu: riwayatTerdahulu ?? this.riwayatTerdahulu);
  }
}

class PengkajianAnak {
  String noreg;
  String person;
  String kdDpjp;
  String jenpel;
  String jenpelDetail;
  String keluhanUtama;
  String rwtPenyakit;
  String reaksiAlergi;
  String rwtPenyakitDahulu;
  String rwtImunisasi;
  String rwtKelahiran;

  PengkajianAnak({
    required this.noreg,
    required this.person,
    required this.kdDpjp,
    required this.jenpel,
    required this.jenpelDetail,
    required this.keluhanUtama,
    required this.rwtPenyakit,
    required this.reaksiAlergi,
    required this.rwtPenyakitDahulu,
    required this.rwtImunisasi,
    required this.rwtKelahiran,
  });

  factory PengkajianAnak.fromJson(Map<String, dynamic> json) => PengkajianAnak(
        rwtImunisasi: json["rwt_imunisasi"].toString(),
        rwtKelahiran: json["rwt_kelahiran"].toString(),
        noreg: json["noreg"].toString(),
        person: json["person"].toString(),
        kdDpjp: json["kd_dpjp"].toString(),
        jenpel: json["jenpel"].toString(),
        jenpelDetail: json["jenpel_detail"].toString(),
        keluhanUtama: json["keluhan_utama"].toString(),
        rwtPenyakit: json["rwt_penyakit"].toString(),
        reaksiAlergi: json["reaksi_alergi"].toString(),
        rwtPenyakitDahulu: json["rwt_penyakit_dahulu"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "person": person,
        "kd_dpjp": kdDpjp,
        "jenpel": jenpel,
        "jenpel_detail": jenpelDetail,
        "keluhan_utama": keluhanUtama,
        "rwt_penyakit": rwtPenyakit,
        "reaksi_alergi": reaksiAlergi,
        "rwt_penyakit_dahulu": rwtPenyakitDahulu,
      };

  PengkajianAnak copyWith({
    String? noreg,
    String? person,
    String? kdDpjp,
    String? jenpel,
    String? jenpelDetail,
    String? keluhanUtama,
    String? rwtPenyakit,
    String? reaksiAlergi,
    String? rwtPenyakitDahulu,
    String? rwtImunisasi,
    String? rwtKelahiran,
  }) {
    return PengkajianAnak(
      rwtImunisasi: rwtImunisasi ?? this.rwtImunisasi,
      rwtKelahiran: rwtKelahiran ?? this.rwtKelahiran,
      noreg: noreg ?? this.noreg,
      person: person ?? this.person,
      kdDpjp: kdDpjp ?? this.kdDpjp,
      jenpel: jenpel ?? this.jenpel,
      jenpelDetail: jenpelDetail ?? this.jenpelDetail,
      keluhanUtama: keluhanUtama ?? this.keluhanUtama,
      rwtPenyakit: rwtPenyakit ?? this.rwtPenyakit,
      reaksiAlergi: reaksiAlergi ?? this.reaksiAlergi,
      rwtPenyakitDahulu: rwtPenyakitDahulu ?? this.rwtPenyakitDahulu,
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
