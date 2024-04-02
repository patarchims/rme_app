class TandaVitalIgdDokter {
  String gcsE;
  String gcsV;
  String gcsM;
  String td;
  String nadi;
  String suhu;
  String kesadaran;
  String pernafasan;
  String spo2;
  String tinggiBadan;
  String beratBadan;
  String akral;
  String pupil;

  TandaVitalIgdDokter({
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.td,
    required this.nadi,
    required this.suhu,
    required this.kesadaran,
    required this.pernafasan,
    required this.spo2,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.akral,
    required this.pupil,
  });

  factory TandaVitalIgdDokter.fromJson(Map<String, dynamic> json) =>
      TandaVitalIgdDokter(
          akral: json["akral"].toString(),
          pupil: json["pupil"].toString(),
          gcsE: json["gcs_e"].toString(),
          gcsV: json["gcs_v"].toString(),
          gcsM: json["gcs_m"].toString(),
          td: json["td"].toString(),
          nadi: json["nadi"].toString(),
          suhu: json["suhu"].toString(),
          kesadaran: json["kesadaran"].toString(),
          pernafasan: json["pernafasan"].toString(),
          spo2: json["spo2"].toString(),
          beratBadan: json["berat_badan"].toString(),
          tinggiBadan: json["tinggi_badan"].toString());

  Map<String, dynamic> toJson() => {
        "akral": akral,
        "pupil": pupil,
        "gcs_e": gcsE,
        "gcs_v": gcsV,
        "gcs_m": gcsM,
        "td": td,
        "nadi": nadi,
        "suhu": suhu,
        "kesadaran": kesadaran,
        "pernafasan": pernafasan,
        "spo2": spo2,
      };

  TandaVitalIgdDokter copyWith({
    String? gcsE,
    String? gcsV,
    String? gcsM,
    String? td,
    String? nadi,
    String? suhu,
    String? kesadaran,
    String? pernafasan,
    String? spo2,
    String? tinggiBadan,
    String? beratBadan,
    String? akral,
    String? pupil,
  }) {
    return TandaVitalIgdDokter(
      akral: akral ?? this.akral,
      pupil: pupil ?? this.pupil,
      beratBadan: beratBadan ?? this.beratBadan,
      tinggiBadan: tinggiBadan ?? this.tinggiBadan,
      gcsE: gcsE ?? this.gcsE,
      gcsV: gcsV ?? this.gcsV,
      gcsM: gcsM ?? this.gcsM,
      td: td ?? this.td,
      nadi: nadi ?? this.nadi,
      suhu: suhu ?? this.suhu,
      kesadaran: kesadaran ?? this.kesadaran,
      pernafasan: pernafasan ?? this.pernafasan,
      spo2: spo2 ?? this.spo2,
    );
  }
}
