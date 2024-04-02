class RiwayatAlergiPasien {
  final PenyakitDahulu penyakitDahulu;
  final List<Alergi> alergi;

  RiwayatAlergiPasien({
    required this.penyakitDahulu,
    required this.alergi,
  });

  factory RiwayatAlergiPasien.fromJson(Map<String, dynamic> json) =>
      RiwayatAlergiPasien(
        penyakitDahulu: PenyakitDahulu.fromJson(json["penyakit_dahulu"]),
        alergi:
            List<Alergi>.from(json["alergi"].map((x) => Alergi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "penyakit_dahulu": penyakitDahulu.toJson(),
        "alergi": List<dynamic>.from(alergi.map((x) => x.toJson())),
      };
}

class Alergi {
  final int no;
  final String noRm;
  final String kelompok;
  final String insertDttm;
  final String alergi;
  final String namaUser;
  final String bagian;

  Alergi({
    required this.no,
    required this.noRm,
    required this.kelompok,
    required this.insertDttm,
    required this.alergi,
    required this.namaUser,
    required this.bagian,
  });

  factory Alergi.fromJson(Map<String, dynamic> json) => Alergi(
        no: json["nomor"] as int,
        noRm: json["no_rm"],
        kelompok: json["kelompok"],
        insertDttm: json["insert_dttm"],
        alergi: json["alergi"],
        namaUser: json["nama_user"],
        bagian: json["bagian"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": no,
        "no_rm": noRm,
        "kelompok": kelompok,
        "insert_dttm": insertDttm,
        "alergi": alergi,
        "nama_user": namaUser,
        "bagian": bagian,
      };
}

class PenyakitDahulu {
  final String tglMasuk;
  final String riwayatPenyakit;

  PenyakitDahulu({
    required this.tglMasuk,
    required this.riwayatPenyakit,
  });

  factory PenyakitDahulu.fromJson(Map<String, dynamic> json) => PenyakitDahulu(
        tglMasuk: json["tgl_masuk"],
        riwayatPenyakit: json["riwayat_penyakit"],
      );

  Map<String, dynamic> toJson() => {
        "tgl_masuk": tglMasuk,
        "riwayat_penyakit": riwayatPenyakit,
      };
}
