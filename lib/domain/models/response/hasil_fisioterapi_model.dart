class HasilFisioterapiModel {
  String judul;
  String hasil;
  String uraian;

  HasilFisioterapiModel({
    required this.judul,
    required this.hasil,
    required this.uraian,
  });

  factory HasilFisioterapiModel.fromJson(Map<String, dynamic> json) =>
      HasilFisioterapiModel(
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
