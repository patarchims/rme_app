class SkriningNyeriModel {
  int skalaNyeri;
  String frekuensiNyeri;
  String lamaNyeri;
  String nyeriMenjalar;
  String manjalarDetail;
  String kualitasNyeri;
  String nyeriPemicu;
  String nyeriPengurang;

  SkriningNyeriModel({
    required this.skalaNyeri,
    required this.frekuensiNyeri,
    required this.lamaNyeri,
    required this.nyeriMenjalar,
    required this.manjalarDetail,
    required this.kualitasNyeri,
    required this.nyeriPemicu,
    required this.nyeriPengurang,
  });

  factory SkriningNyeriModel.fromJson(Map<String, dynamic> json) =>
      SkriningNyeriModel(
        skalaNyeri: json["skala_nyeri"] as int,
        frekuensiNyeri: json["frekuensi_nyeri"].toString(),
        lamaNyeri: json["lama_nyeri"].toString(),
        nyeriMenjalar: json["nyeri_menjalar"].toString(),
        manjalarDetail: json["manjalar_detail"].toString(),
        kualitasNyeri: json["kualitas_nyeri"].toString(),
        nyeriPemicu: json["nyeri_pemicu"].toString(),
        nyeriPengurang: json["nyeri_pengurang"].toString(),
      );

  Map<String, dynamic> toJson({
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
  }) =>
      {
        "device_id": deviceID,
        "pelayanan": pelayanan,
        "noreg": noReg,
        "person": person,
        "skala_nyeri": skalaNyeri,
        "frekuensi_nyeri": frekuensiNyeri,
        "lama_nyeri": lamaNyeri,
        "nyeri_menjalar": nyeriMenjalar,
        "manjalar_detail": manjalarDetail,
        "kualitas_nyeri": kualitasNyeri,
        "nyeri_pemicu": nyeriPemicu,
        "nyeri_pengurang": nyeriPengurang,
      };

  SkriningNyeriModel copyWith({
    int? skalaNyeri,
    String? frekuensiNyeri,
    String? lamaNyeri,
    String? nyeriMenjalar,
    String? manjalarDetail,
    String? kualitasNyeri,
    String? nyeriPemicu,
    String? nyeriPengurang,
  }) {
    return SkriningNyeriModel(
      skalaNyeri: skalaNyeri ?? this.skalaNyeri,
      frekuensiNyeri: frekuensiNyeri ?? this.frekuensiNyeri,
      lamaNyeri: lamaNyeri ?? this.lamaNyeri,
      nyeriMenjalar: nyeriMenjalar ?? this.nyeriMenjalar,
      manjalarDetail: manjalarDetail ?? this.manjalarDetail,
      kualitasNyeri: kualitasNyeri ?? this.kualitasNyeri,
      nyeriPemicu: nyeriPemicu ?? this.nyeriPemicu,
      nyeriPengurang: nyeriPengurang ?? this.nyeriPengurang,
    );
  }
}
