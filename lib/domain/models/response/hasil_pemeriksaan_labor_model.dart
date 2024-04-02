class HasilPemeriksaanLaborModel {
  String dpjp;
  String asalPelayanan;
  String nomorLab;
  String kelompok;
  List<Lab> lab;

  HasilPemeriksaanLaborModel({
    required this.dpjp,
    required this.asalPelayanan,
    required this.nomorLab,
    required this.kelompok,
    required this.lab,
  });

  factory HasilPemeriksaanLaborModel.fromJson(Map<String, dynamic> json) =>
      HasilPemeriksaanLaborModel(
        dpjp: json["dpjp"],
        asalPelayanan: json["asal_pelayanan"],
        nomorLab: json["nomor_lab"],
        kelompok: json["kelompok"],
        lab: List<Lab>.from(json["lab"].map((x) => Lab.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dpjp": dpjp,
        "asal_pelayanan": asalPelayanan,
        "nomor_lab": nomorLab,
        "kelompok": kelompok,
        "lab": List<dynamic>.from(lab.map((x) => x.toJson())),
      };
}

class Lab {
  String kode;
  String hasil;
  String satuan;
  String normal;
  String deskripsi;

  Lab({
    required this.kode,
    required this.hasil,
    required this.satuan,
    required this.normal,
    required this.deskripsi,
  });

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        kode: json["kode"],
        hasil: json["hasil"],
        satuan: json["satuan"],
        normal: json["normal"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "hasil": hasil,
        "satuan": satuan,
        "normal": normal,
        "deskripsi": deskripsi,
      };
}
