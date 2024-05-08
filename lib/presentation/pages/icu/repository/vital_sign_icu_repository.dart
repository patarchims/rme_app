class VitalSignIcuModel {
  String tekananDarah;
  String nadi;
  String beratBadan;
  String suhu;
  String pernapasan;
  String tinggiBadan;

  VitalSignIcuModel({
    required this.tekananDarah,
    required this.nadi,
    required this.beratBadan,
    required this.suhu,
    required this.pernapasan,
    required this.tinggiBadan,
  });

  factory VitalSignIcuModel.fromJson(Map<String, dynamic> json) =>
      VitalSignIcuModel(
        tekananDarah: json["tekanan_darah"].toString(),
        nadi: json["nadi"].toString(),
        beratBadan: json["berat_badan"].toString(),
        suhu: json["suhu"].toString(),
        pernapasan: json["pernapasan"].toString(),
        tinggiBadan: json["tinggi_badan"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "tekanan_darah": tekananDarah,
        "nadi": nadi,
        "berat_badan": beratBadan,
        "suhu": suhu,
        "pernapasan": pernapasan,
        "tinggi_badan": tinggiBadan,
      };

  VitalSignIcuModel copyWith({
    String? tekananDarah,
    String? nadi,
    String? beratBadan,
    String? suhu,
    String? pernapasan,
    String? tinggiBadan,
  }) {
    return VitalSignIcuModel(
      tekananDarah: tekananDarah ?? this.tekananDarah,
      nadi: nadi ?? this.nadi,
      beratBadan: beratBadan ?? this.beratBadan,
      suhu: suhu ?? this.suhu,
      pernapasan: pernapasan ?? this.pernapasan,
      tinggiBadan: tinggiBadan ?? this.tinggiBadan,
    );
  }
}
