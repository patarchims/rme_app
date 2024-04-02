// ignore_for_file: public_member_api_docs, sort_constructors_first
class VitalSignBidanModel {
  final String tekananDarah;
  final String nadi;
  final String pernapasan;
  final String suhu;
  final String tinggiBadan;
  final String beratBadan;
  final String ddj;
  final String gcsE;
  final String gcsV;
  final String gcsM;
  final String tfu;

  VitalSignBidanModel({
    required this.ddj,
    required this.tekananDarah,
    required this.nadi,
    required this.pernapasan,
    required this.suhu,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.tfu,
  });

  factory VitalSignBidanModel.fromJson(Map<String, dynamic> json) =>
      VitalSignBidanModel(
          ddj: json["ddj"],
          tekananDarah: json["tekanan_darah"],
          nadi: json["nadi"],
          pernapasan: json["pernapasan"],
          suhu: json["suhu"],
          tinggiBadan: json["tinggi_badan"],
          beratBadan: json["berat_badan"],
          gcsE: json["gcs_e"],
          gcsV: json["gcs_v"],
          gcsM: json["gcs_m"],
          tfu: json["tfu"]);

  Map<String, dynamic> toJson() => {
        "ddj": ddj,
        "tekanan_darah": tekananDarah,
        "nadi": nadi,
        "pernapasan": pernapasan,
        "suhu": suhu,
        "tinggi_badan": tinggiBadan,
        "berat_badan": beratBadan,
        "gcs_e": gcsE,
        "gcs_v": gcsV,
        "gcs_m": gcsM,
        "tfu": tfu,
      };

  VitalSignBidanModel copyWith({
    String? ddj,
    String? tekananDarah,
    String? nadi,
    String? pernapasan,
    String? suhu,
    String? tinggiBadan,
    String? beratBadan,
    String? gcsE,
    String? gcsV,
    String? gcsM,
    String? tfu,
  }) {
    return VitalSignBidanModel(
      tfu: tfu ?? this.tfu,
      ddj: ddj ?? this.ddj,
      tekananDarah: tekananDarah ?? this.tekananDarah,
      nadi: nadi ?? this.nadi,
      pernapasan: pernapasan ?? this.pernapasan,
      suhu: suhu ?? this.suhu,
      tinggiBadan: tinggiBadan ?? this.tinggiBadan,
      beratBadan: beratBadan ?? this.beratBadan,
      gcsE: gcsE ?? this.gcsE,
      gcsV: gcsV ?? this.gcsV,
      gcsM: gcsM ?? this.gcsM,
    );
  }
}
