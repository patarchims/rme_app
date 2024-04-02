class InformasiMedisModel {
  DateTime insertDttm;
  String kdBagian;
  String noreg;
  String masalahMedis;
  String terapi;
  String fisik;
  String anjuran;

  InformasiMedisModel({
    required this.insertDttm,
    required this.kdBagian,
    required this.noreg,
    required this.masalahMedis,
    required this.terapi,
    required this.fisik,
    required this.anjuran,
  });

  factory InformasiMedisModel.fromJson(Map<String, dynamic> json) =>
      InformasiMedisModel(
        insertDttm: DateTime.parse(json["insert_dttm"].toString()),
        kdBagian: json["kd_bagian"].toString(),
        noreg: json["noreg"].toString(),
        masalahMedis: json["masalah_medis"].toString(),
        terapi: json["terapi"].toString(),
        fisik: json["fisik"].toString(),
        anjuran: json["anjuran"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm.toIso8601String(),
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "masalah_medis": masalahMedis,
        "terapi": terapi,
        "fisik": fisik,
        "anjuran": anjuran,
      };
}
