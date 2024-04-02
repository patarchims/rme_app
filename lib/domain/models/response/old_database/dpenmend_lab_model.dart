class DPenlabModel {
  String tanggal;
  String namaKelompok;
  List<Penlab> penlab;

  DPenlabModel({
    required this.tanggal,
    required this.namaKelompok,
    required this.penlab,
  });

  factory DPenlabModel.fromJson(Map<String, dynamic> json) => DPenlabModel(
        tanggal: json["tanggal"],
        namaKelompok: json["nama_kelompok"],
        penlab:
            List<Penlab>.from(json["penlab"].map((x) => Penlab.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "nama_kelompok": namaKelompok,
        "penlab": List<dynamic>.from(penlab.map((x) => x.toJson())),
      };
}

class Penlab {
  String pemeriksaanDeskripsi;
  String normal;
  String satuan;
  String hasil;

  Penlab({
    required this.pemeriksaanDeskripsi,
    required this.normal,
    required this.satuan,
    required this.hasil,
  });

  factory Penlab.fromJson(Map<String, dynamic> json) => Penlab(
        pemeriksaanDeskripsi: json["pemeriksaan_deskripsi"],
        normal: json["normal"],
        satuan: json["satuan"],
        hasil: json["hasil"],
      );

  Map<String, dynamic> toJson() => {
        "pemeriksaan_deskripsi": pemeriksaanDeskripsi,
        "normal": normal,
        "satuan": satuan,
        "hasil": hasil,
      };
}
