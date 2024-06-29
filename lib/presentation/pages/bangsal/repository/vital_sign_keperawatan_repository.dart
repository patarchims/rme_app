// ignore_for_file: public_member_api_docs, sort_constructors_first
class VitalSignKeperawatanModel {
  String gcsE;
  String gcsV;
  String gcsM;
  String td;
  String beratBadan;
  String tinggiBadan;
  String pernafasan;
  String kesadaran;
  String spo2;
  String nadi;
  String suhu;
  String pupil;
  String akral;

  VitalSignKeperawatanModel({
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.td,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.pernafasan,
    required this.kesadaran,
    required this.spo2,
    required this.nadi,
    required this.suhu,
    required this.pupil,
    required this.akral,
  });

  factory VitalSignKeperawatanModel.fromJson(Map<String, dynamic> json) =>
      VitalSignKeperawatanModel(
        gcsE: json["gcs_e"].toString(),
        gcsV: json["gcs_v"].toString(),
        gcsM: json["gcs_m"].toString(),
        td: json["td"].toString(),
        kesadaran: json["kesadaran"].toString(),
        beratBadan: json["berat_badan"].toString(),
        tinggiBadan: json["tinggi_badan"].toString(),
        pernafasan: json["pernafasan"].toString(),
        spo2: json["spo2"].toString(),
        nadi: json["nadi"].toString(),
        suhu: json["suhu"].toString(),
        pupil: json["pupil"].toString(),
        akral: json["akral"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "gcs_e": gcsE,
        "gcs_v": gcsV,
        "gcs_m": gcsM,
        "td": td,
        "berat_badan": beratBadan,
        "tinggi_badan": tinggiBadan,
        "pernafasan": pernafasan,
        "spo2": spo2,
        "nadi": nadi,
        "suhu": suhu,
      };

  VitalSignKeperawatanModel copyWith({
    String? gcsE,
    String? gcsV,
    String? gcsM,
    String? td,
    String? beratBadan,
    String? tinggiBadan,
    String? pernafasan,
    String? spo2,
    String? nadi,
    String? suhu,
    String? kesadaran,
    String? pupil,
    String? akral,
  }) {
    return VitalSignKeperawatanModel(
      kesadaran: kesadaran ?? this.kesadaran,
      pupil: pupil ?? this.pupil,
      akral: akral ?? this.akral,
      gcsE: gcsE ?? this.gcsE,
      gcsV: gcsV ?? this.gcsV,
      gcsM: gcsM ?? this.gcsM,
      td: td ?? this.td,
      beratBadan: beratBadan ?? this.beratBadan,
      tinggiBadan: tinggiBadan ?? this.tinggiBadan,
      pernafasan: pernafasan ?? this.pernafasan,
      spo2: spo2 ?? this.spo2,
      nadi: nadi ?? this.nadi,
      suhu: suhu ?? this.suhu,
    );
  }
}
