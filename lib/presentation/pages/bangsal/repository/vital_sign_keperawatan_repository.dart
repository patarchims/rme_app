// ignore_for_file: public_member_api_docs, sort_constructors_first
class VitalSignKeperawatanModel {
  String gcsE;
  String gcsV;
  String gcsM;
  String td;
  String beratBadan;
  String tinggiBadan;
  String pernafasan;
  String spo2;
  String nadi;
  String suhu;

  VitalSignKeperawatanModel({
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.td,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.pernafasan,
    required this.spo2,
    required this.nadi,
    required this.suhu,
  });

  factory VitalSignKeperawatanModel.fromJson(Map<String, dynamic> json) =>
      VitalSignKeperawatanModel(
        gcsE: json["gcs_e"],
        gcsV: json["gcs_v"],
        gcsM: json["gcs_m"],
        td: json["td"],
        beratBadan: json["berat_badan"],
        tinggiBadan: json["tinggi_badan"],
        pernafasan: json["pernafasan"],
        spo2: json["spo2"],
        nadi: json["nadi"],
        suhu: json["suhu"],
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
  }) {
    return VitalSignKeperawatanModel(
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
