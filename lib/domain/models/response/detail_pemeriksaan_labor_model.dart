class PemeriksaanDetailLaborModel {
  final Total total;
  final List<Pemeriksaan> pemeriksaan;

  PemeriksaanDetailLaborModel({
    required this.total,
    required this.pemeriksaan,
  });

  factory PemeriksaanDetailLaborModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanDetailLaborModel(
        total: Total.fromJson(json["total"]),
        pemeriksaan: List<Pemeriksaan>.from(
            json["pemeriksaan"].map((x) => Pemeriksaan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total.toJson(),
        "pemeriksaan": List<dynamic>.from(pemeriksaan.map((x) => x.toJson())),
      };
}

class Pemeriksaan {
  final String satuan;
  final String normal;
  final int urut;
  final String nameGrup;
  final String pemeriksaan;
  final String kode;

  Pemeriksaan({
    required this.urut,
    required this.satuan,
    required this.normal,
    required this.nameGrup,
    required this.pemeriksaan,
    required this.kode,
  });

  factory Pemeriksaan.fromJson(Map<String, dynamic> json) => Pemeriksaan(
        normal: json["normal"].toString(),
        satuan: json["satuan"].toString(),
        urut: json["urut"] as int,
        nameGrup: json["name_grup"].toString(),
        pemeriksaan: json["pemeriksaan"].toString(),
        kode: json["kode"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "satuan": satuan,
        "urut": urut,
        "normal": normal,
        "name_grup": nameGrup,
        "pemeriksaan": pemeriksaan,
        "kode": kode,
      };
}

class Total {
  final int taripKelas;
  final String namaGrup;

  Total({
    required this.taripKelas,
    required this.namaGrup,
  });

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        taripKelas: json["tarip_kelas"],
        namaGrup: json["nama_grup"],
      );

  Map<String, dynamic> toJson() => {
        "tarip_kelas": taripKelas,
        "nama_grup": namaGrup,
      };
}
