class DokterSpesialisModel {
  final String idk;
  final String nama;
  final String spesialis;
  final String gelar;

  DokterSpesialisModel({
    required this.idk,
    required this.nama,
    required this.spesialis,
    required this.gelar,
  });

  factory DokterSpesialisModel.fromJson(Map<String, dynamic> json) =>
      DokterSpesialisModel(
        idk: json["idk"].toString(),
        nama: json["nama"].toString(),
        spesialis: json["spesialis"].toString(),
        gelar: json["gelar"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "idk": idk,
        "nama": nama,
        "spesialis": spesialis,
        "gelar": gelar,
      };
}
