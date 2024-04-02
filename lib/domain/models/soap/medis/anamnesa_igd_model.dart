class AnamnesaIgdModel {
  final String noreg;
  final String keluhanUtama;
  final String kesadaran;
  final String telaah;
  final String rwytKlrg;
  final String rwytDulu;
  String? mslhMedis;
  String? rwytSkrg;
  String? rwytObat;
  final String jenpel;

  AnamnesaIgdModel({
    required this.noreg,
    required this.keluhanUtama,
    required this.kesadaran,
    required this.telaah,
    this.rwytSkrg,
    this.mslhMedis,
    this.rwytObat,
    required this.rwytDulu,
    required this.rwytKlrg,
    required this.jenpel,
  });

  factory AnamnesaIgdModel.fromJson(Map<String, dynamic> json) =>
      AnamnesaIgdModel(
        noreg: json["noreg"].toString(),
        keluhanUtama: json["keluhan_utama"].toString(),
        kesadaran: json["kesadaran"].toString(),
        telaah: json["telaah"].toString(),
        mslhMedis: json["mslh_medis"].toString(),
        rwytSkrg: json["rwyt_skrg"].toString(),
        rwytDulu: json["rwyt_dulu"].toString(),
        rwytObat: json["rwyt_obat"].toString(),
        rwytKlrg: json["rwyt_klrg"].toString(),
        jenpel: json["jenpel"].toString(),
      );

  Map<String, dynamic> toJson({
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) =>
      {
        "no_reg": noreg,
        "keluhan_utama": keluhanUtama,
        "kesadaran": kesadaran,
        "telaah": telaah,
        "mslh_medis": mslhMedis,
        "rwyt_skrg": rwytSkrg,
        "rwyt_dulu": rwytDulu,
        "rwyt_obat": rwytObat,
        "rwyt_klrg": rwytKlrg,
        "jenpel": jenpel,
        "person": person,
        "user_id": userID,
        "device_id": deviceID,
        "pelayanan": pelayanan
      };
}
