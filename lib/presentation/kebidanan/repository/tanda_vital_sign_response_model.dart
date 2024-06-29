// ignore_for_file: public_member_api_docs, sort_constructors_first
class VitalSignBidanModel {
  final String tekananDarah;
  final String nadi;
  final String pernapasan;
  final String suhu;
  final String tinggiBadan;
  final String beratBadan;
  final String kesadaran;
  final String ddj;
  final String gcsE;
  final String gcsV;
  final String gcsM;
  final String tfu;
  final String akral;
  final String pupil;

  VitalSignBidanModel({
    required this.ddj,
    required this.tekananDarah,
    required this.nadi,
    required this.pernapasan,
    required this.suhu,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.kesadaran,
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.tfu,
    required this.akral,
    required this.pupil,
  });

  factory VitalSignBidanModel.fromJson(Map<String, dynamic> json) =>
      VitalSignBidanModel(
          akral: json["akral"].toString(),
          pupil: json["pupil"].toString(),
          ddj: json["ddj"].toString(),
          tekananDarah: json["tekanan_darah"].toString(),
          nadi: json["nadi"].toString(),
          pernapasan: json["pernapasan"].toString(),
          suhu: json["suhu"].toString(),
          kesadaran: json["kesadaran"].toString(),
          tinggiBadan: json["tinggi_badan"].toString(),
          beratBadan: json["berat_badan"].toString(),
          gcsE: json["gcs_e"].toString(),
          gcsV: json["gcs_v"].toString(),
          gcsM: json["gcs_m"].toString(),
          tfu: json["tfu"].toString());

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
    String? kesadaran,
    String? gcsE,
    String? gcsV,
    String? gcsM,
    String? tfu,
    String? akral,
    String? pupil,
  }) {
    return VitalSignBidanModel(
      akral: akral ?? this.akral,
      pupil: pupil ?? this.pupil,
      kesadaran: kesadaran ?? this.kesadaran,
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
