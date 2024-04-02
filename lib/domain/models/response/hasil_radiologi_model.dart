class RiwayatRadiologiModel {
  String judul;
  String hasil;
  String uraian;

  RiwayatRadiologiModel({
    required this.judul,
    required this.hasil,
    required this.uraian,
  });

  factory RiwayatRadiologiModel.fromJson(Map<String, dynamic> json) =>
      RiwayatRadiologiModel(
        judul: json["judul"].toString(),
        hasil: json["hasil"].toString(),
        uraian: json["uraian"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "hasil": hasil,
        "uraian": uraian,
      };
}
