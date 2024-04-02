class PemeriksaanLaborModel {
  final String num;
  final String nameGrup;
  final String kode;
  final String pemeriksaan;
  final int taripKelas;

  PemeriksaanLaborModel({
    required this.num,
    required this.nameGrup,
    required this.kode,
    required this.pemeriksaan,
    required this.taripKelas,
  });

  factory PemeriksaanLaborModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanLaborModel(
        num: json["num"].toString(),
        nameGrup: json["name_grup"].toString(),
        kode: json["kode"].toString(),
        pemeriksaan: json["pemeriksaan"].toString(),
        taripKelas: json["tarip_kelas"] as int,
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "name_grup": nameGrup,
        "kode": kode,
        "pemeriksaan": pemeriksaan,
        "tarip_kelas": taripKelas,
      };
}
