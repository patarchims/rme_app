class AsesmenIntensiveIcuModel {
  String asesmen;
  String caraMasuk;
  String keluhanUtama;
  String dari;
  String penyakitSekarang;
  String riwayatAlergi;
  String yangMuncul;
  String transfusiDarah;
  String riwayatMerokok;
  String minumanKeras;
  String alcoholMempengaruhi;
  List<PenyakitKeluarga> penyakitKeluarga;
  List<PenyakitDahulu> riwayat;

  AsesmenIntensiveIcuModel({
    required this.asesmen,
    required this.caraMasuk,
    required this.keluhanUtama,
    required this.dari,
    required this.penyakitSekarang,
    required this.riwayatAlergi,
    required this.yangMuncul,
    required this.transfusiDarah,
    required this.riwayatMerokok,
    required this.minumanKeras,
    required this.alcoholMempengaruhi,
    required this.penyakitKeluarga,
    required this.riwayat,
  });

  factory AsesmenIntensiveIcuModel.fromJson(Map<String, dynamic> json) =>
      AsesmenIntensiveIcuModel(
        riwayat: List<PenyakitDahulu>.from(
            json["riwayat_dahulu"].map((x) => PenyakitDahulu.fromJson(x))),
        asesmen: json["asesmen"].toString(),
        caraMasuk: json["cara_masuk"].toString(),
        keluhanUtama: json["keluhan_utama"].toString(),
        dari: json["dari"].toString(),
        penyakitSekarang: json["penyakit_sekarang"].toString(),
        riwayatAlergi: json["riwayat_alergi"].toString(),
        yangMuncul: json["yang_muncul"].toString(),
        transfusiDarah: json["transfusi_darah"].toString(),
        riwayatMerokok: json["riwayat_merokok"].toString(),
        minumanKeras: json["minuman_keras"].toString(),
        alcoholMempengaruhi: json["alcohol_mempengaruhi"].toString(),
        penyakitKeluarga: List<PenyakitKeluarga>.from(
            json["penyakit_keluarga"].map((x) => PenyakitKeluarga.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "asesmen": asesmen,
        "cara_masuk": caraMasuk,
        "keluhan_utama": keluhanUtama,
        "dari": dari,
        "penyakit_sekarang": penyakitSekarang,
        "riwayat_alergi": riwayatAlergi,
        "yang_muncul": yangMuncul,
        "transfusi_darah": transfusiDarah,
        "riwayat_merokok": riwayatMerokok,
        "minuman_keras": minumanKeras,
        "alcohol_mempengaruhi": alcoholMempengaruhi,
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
        tglMasuk: json["tgl_masuk"].toString(),
        riwayatPenyakit: json["riwayat_penyakit"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "tgl_masuk": tglMasuk,
        "riwayat_penyakit": riwayatPenyakit,
      };
}

class PenyakitKeluarga {
  int nomor;
  String noRm;
  String kelompok;
  String insertDttm;
  String alergi;
  String namaUser;
  String bagian;

  PenyakitKeluarga({
    required this.nomor,
    required this.noRm,
    required this.kelompok,
    required this.insertDttm,
    required this.alergi,
    required this.namaUser,
    required this.bagian,
  });

  factory PenyakitKeluarga.fromJson(Map<String, dynamic> json) =>
      PenyakitKeluarga(
        nomor: json["nomor"] as int,
        noRm: json["no_rm"].toString(),
        kelompok: json["kelompok"].toString(),
        insertDttm: json["insert_dttm"].toString(),
        alergi: json["alergi"].toString(),
        namaUser: json["nama_user"].toString(),
        bagian: json["bagian"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "no_rm": noRm,
        "kelompok": kelompok,
        "insert_dttm": insertDttm,
        "alergi": alergi,
        "nama_user": namaUser,
        "bagian": bagian,
      };
}
