// ignore_for_file: public_member_api_docs, sort_constructors_first
class VitalSignBangsalModel {
  String tekananDarah;
  String nadi;
  String pernapasan;
  String suhu;
  String tinggiBadan;
  String beratBadan;

  VitalSignBangsalModel({
    required this.tekananDarah,
    required this.nadi,
    required this.pernapasan,
    required this.suhu,
    required this.tinggiBadan,
    required this.beratBadan,
  });

  factory VitalSignBangsalModel.fromJson(Map<String, dynamic> json) =>
      VitalSignBangsalModel(
        tekananDarah: json["tekanan_darah"],
        nadi: json["nadi"],
        pernapasan: json["pernapasan"],
        suhu: json["suhu"],
        tinggiBadan: json["tinggi_badan"],
        beratBadan: json["berat_badan"],
      );

  Map<String, dynamic> toJson({
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
    required String kategori,
  }) =>
      {
        "device_id": deviceID,
        "pelayanan": pelayanan,
        "noreg": noReg,
        "person": person,
        "kategori": kategori,
        "tekanan_darah": tekananDarah,
        "nadi": nadi,
        "pernapasan": pernapasan,
        "suhu": suhu,
        "tinggi_badan": tinggiBadan,
        "berat_badan": beratBadan,
      };

  VitalSignBangsalModel copyWith({
    String? tekananDarah,
    String? nadi,
    String? pernapasan,
    String? suhu,
    String? tinggiBadan,
    String? beratBadan,
  }) {
    return VitalSignBangsalModel(
      tekananDarah: tekananDarah ?? this.tekananDarah,
      nadi: nadi ?? this.nadi,
      pernapasan: pernapasan ?? this.pernapasan,
      suhu: suhu ?? this.suhu,
      tinggiBadan: tinggiBadan ?? this.tinggiBadan,
      beratBadan: beratBadan ?? this.beratBadan,
    );
  }
}
