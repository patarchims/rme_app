// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApgarScoreModel {
  int id;
  String waktu;
  int jantung;
  int nafas;
  int otot;
  int refleksi;
  int warnaKulit;
  int total;

  ApgarScoreModel({
    required this.id,
    required this.waktu,
    required this.jantung,
    required this.otot,
    required this.nafas,
    required this.refleksi,
    required this.warnaKulit,
    required this.total,
  });

  factory ApgarScoreModel.fromJson(Map<String, dynamic> json) =>
      ApgarScoreModel(
        id: json["id"],
        otot: json["otot"],
        waktu: json["waktu"],
        jantung: json["jantung"],
        nafas: json["nafas"],
        refleksi: json["refleksi"],
        warnaKulit: json["warna_kulit"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "waktu": waktu,
        "jantung": jantung,
        "nafas": nafas,
        "refleksi": refleksi,
        "warna_kulit": warnaKulit,
        "total": total,
      };

  ApgarScoreModel copyWith({
    int? id,
    String? waktu,
    int? jantung,
    int? nafas,
    int? otot,
    int? refleksi,
    int? warnaKulit,
    int? total,
  }) {
    return ApgarScoreModel(
      id: id ?? this.id,
      waktu: waktu ?? this.waktu,
      jantung: jantung ?? this.jantung,
      nafas: nafas ?? this.nafas,
      otot: otot ?? this.otot,
      refleksi: refleksi ?? this.refleksi,
      warnaKulit: warnaKulit ?? this.warnaKulit,
      total: total ?? this.total,
    );
  }
}
