class DiagnosaKeperawatanModel {
  String kode;
  String judul;

  DiagnosaKeperawatanModel({
    required this.kode,
    required this.judul,
  });

  factory DiagnosaKeperawatanModel.fromJson(Map<String, dynamic> json) =>
      DiagnosaKeperawatanModel(
        kode: json["kode"],
        judul: json["judul"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "judul": judul,
      };
}
