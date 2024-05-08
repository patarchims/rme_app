// ignore_for_file: public_member_api_docs, sort_constructors_first
class NyeriIcuModel {
  int nyeri;
  String lokasiNyeri;
  String frekuensiNyeri;
  String nyeriMenjalar;
  String kualitasNyeri;

  NyeriIcuModel({
    required this.nyeri,
    required this.lokasiNyeri,
    required this.frekuensiNyeri,
    required this.nyeriMenjalar,
    required this.kualitasNyeri,
  });

  factory NyeriIcuModel.fromJson(Map<String, dynamic> json) => NyeriIcuModel(
        nyeri: json["nyeri"] as int,
        lokasiNyeri: json["lokasi_nyeri"].toString(),
        frekuensiNyeri: json["frekuensi_nyeri"].toString(),
        nyeriMenjalar: json["nyeri_menjalar"].toString(),
        kualitasNyeri: json["kualitas_nyeri"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nyeri": nyeri,
        "lokasi_nyeri": lokasiNyeri,
        "frekuensi_nyeri": frekuensiNyeri,
        "nyeri_menjalar": nyeriMenjalar,
        "kualitas_nyeri": kualitasNyeri,
      };

  NyeriIcuModel copyWith({
    int? nyeri,
    String? lokasiNyeri,
    String? frekuensiNyeri,
    String? nyeriMenjalar,
    String? kualitasNyeri,
  }) {
    return NyeriIcuModel(
      nyeri: nyeri ?? this.nyeri,
      lokasiNyeri: lokasiNyeri ?? this.lokasiNyeri,
      frekuensiNyeri: frekuensiNyeri ?? this.frekuensiNyeri,
      nyeriMenjalar: nyeriMenjalar ?? this.nyeriMenjalar,
      kualitasNyeri: kualitasNyeri ?? this.kualitasNyeri,
    );
  }
}
