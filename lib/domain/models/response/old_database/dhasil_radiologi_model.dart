class DRadilogiModel {
  String tanggal;
  String namaKelompok;
  List<Radiologi> radiologi;

  DRadilogiModel({
    required this.tanggal,
    required this.namaKelompok,
    required this.radiologi,
  });

  factory DRadilogiModel.fromJson(Map<String, dynamic> json) => DRadilogiModel(
        tanggal: json["tanggal"],
        namaKelompok: json["nama_kelompok"],
        radiologi: List<Radiologi>.from(
            json["radiologi"].map((x) => Radiologi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "nama_kelompok": namaKelompok,
        "radiologi": List<dynamic>.from(radiologi.map((x) => x.toJson())),
      };
}

class Radiologi {
  String pemeriksaanDeskripsi;
  String uraian;
  String hasil;

  Radiologi({
    required this.pemeriksaanDeskripsi,
    required this.uraian,
    required this.hasil,
  });

  factory Radiologi.fromJson(Map<String, dynamic> json) => Radiologi(
        pemeriksaanDeskripsi: json["pemeriksaan_deskripsi"],
        uraian: json["uraian"],
        hasil: json["hasil"],
      );

  Map<String, dynamic> toJson() => {
        "pemeriksaan_deskripsi": pemeriksaanDeskripsi,
        "uraian": uraian,
        "hasil": hasil,
      };
}
