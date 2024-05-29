// ignore_for_file: public_member_api_docs, sort_constructors_first
class PengkajianAwalIgdRepository {
  List<RiwayatKeluarga> riwayatPenyakitKeluarga;
  List<RiwayatTerdahulu> riwayatTerdahulu;
  final PengkajianIGD pengkajian;

  PengkajianAwalIgdRepository({
    required this.riwayatPenyakitKeluarga,
    required this.riwayatTerdahulu,
    required this.pengkajian,
  });

  factory PengkajianAwalIgdRepository.fromMap(Map<String, dynamic> map) {
    return PengkajianAwalIgdRepository(
      pengkajian: PengkajianIGD.fromMap(map["pengkajian"]),
      riwayatTerdahulu: List<RiwayatTerdahulu>.from(
          map["riwayat_terdahulu"].map((x) => RiwayatTerdahulu.fromJson(x))),
      riwayatPenyakitKeluarga: List<RiwayatKeluarga>.from(
          map["riwayat_keluarga"].map((x) => RiwayatKeluarga.fromJson(x))),
    );
  }

  PengkajianAwalIgdRepository copyWith({
    List<RiwayatKeluarga>? riwayatPenyakitKeluarga,
    List<RiwayatTerdahulu>? riwayatTerdahulu,
    PengkajianIGD? pengkajian,
  }) {
    return PengkajianAwalIgdRepository(
      pengkajian: pengkajian ?? this.pengkajian,
      riwayatPenyakitKeluarga:
          riwayatPenyakitKeluarga ?? this.riwayatPenyakitKeluarga,
      riwayatTerdahulu: riwayatTerdahulu ?? this.riwayatTerdahulu,
    );
  }
}

class PengkajianIGD {
  final String keluhanUtama;
  final String riwayatPenyakitSekarang;
  final String riwayatPenyakitDahulu;
  final String info;
  final String infoDetail;
  final String caraMasuk;
  final String asalMasuk;
  final String fungsiAktivitas;
  final String reaksiAlergi;
  PengkajianIGD({
    required this.keluhanUtama,
    required this.riwayatPenyakitSekarang,
    required this.riwayatPenyakitDahulu,
    required this.info,
    required this.infoDetail,
    required this.caraMasuk,
    required this.asalMasuk,
    required this.fungsiAktivitas,
    required this.reaksiAlergi,
  });

  factory PengkajianIGD.fromMap(Map<String, dynamic> map) {
    return PengkajianIGD(
      keluhanUtama: map['keluhan_utama'].toString(),
      reaksiAlergi: map["reaksi_alergi"].toString(),
      riwayatPenyakitSekarang: map['rwt_sekarang'].toString(),
      riwayatPenyakitDahulu: map['rwt_penyakit'].toString(),
      info: map['info'].toString(),
      infoDetail: map['info_detail'].toString(),
      caraMasuk: map['cara_masuk'].toString(),
      asalMasuk: map['asal_masuk'].toString(),
      fungsiAktivitas: map['fungsional'].toString(),
    );
  }

  PengkajianIGD copyWith({
    String? keluhanUtama,
    String? riwayatPenyakitSekarang,
    String? riwayatPenyakitDahulu,
    String? info,
    String? infoDetail,
    String? caraMasuk,
    String? asalMasuk,
    String? fungsiAktivitas,
    String? reaksiAlergi,
  }) {
    return PengkajianIGD(
      keluhanUtama: keluhanUtama ?? this.keluhanUtama,
      riwayatPenyakitSekarang:
          riwayatPenyakitSekarang ?? this.riwayatPenyakitSekarang,
      riwayatPenyakitDahulu:
          riwayatPenyakitDahulu ?? this.riwayatPenyakitDahulu,
      info: info ?? this.info,
      infoDetail: infoDetail ?? this.infoDetail,
      caraMasuk: caraMasuk ?? this.caraMasuk,
      asalMasuk: asalMasuk ?? this.asalMasuk,
      fungsiAktivitas: fungsiAktivitas ?? this.fungsiAktivitas,
      reaksiAlergi: reaksiAlergi ?? this.reaksiAlergi,
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
