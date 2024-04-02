class TindakLanjutIgdModel {
  String pulang1;
  String pulang1Detail;
  String pulang2;
  String pulang2Detail;
  String pulang3;
  String pulang3Detail;
  String caraKeluar;
  String? jam;
  String? menit;

  TindakLanjutIgdModel(
      {required this.pulang1,
      required this.pulang1Detail,
      required this.pulang2,
      this.jam,
      this.menit,
      required this.pulang2Detail,
      required this.pulang3,
      required this.pulang3Detail,
      required this.caraKeluar});

  factory TindakLanjutIgdModel.fromJson(Map<String, dynamic> json) =>
      TindakLanjutIgdModel(
          pulang1: json["pulang1"],
          pulang1Detail: json["pulang1_detail"],
          pulang2: json["pulang2"],
          pulang2Detail: json["pulang2_detail"],
          pulang3: json["pulang3"],
          pulang3Detail: json["pulang3_detail"],
          caraKeluar: json["cara_keluar"]);

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
        "pulang1": pulang1,
        "jam": jam,
        "cara_keluar": caraKeluar,
        "menit": menit,
        "pulang1_detail": pulang1Detail,
        "pulang2": pulang2,
        "pulang2_detail": pulang2Detail,
        "pulang3": pulang3,
        "pulang3_detail": pulang3Detail,
      };

  TindakLanjutIgdModel copyWith({
    String? pulang1,
    String? pulang1Detail,
    String? pulang2,
    String? pulang2Detail,
    String? pulang3,
    String? pulang3Detail,
    String? jam,
    String? menit,
    String? caraKeluar,
  }) {
    return TindakLanjutIgdModel(
      jam: jam ?? this.jam,
      pulang1: pulang1 ?? this.pulang1,
      menit: menit ?? this.menit,
      caraKeluar: caraKeluar ?? this.caraKeluar,
      pulang1Detail: pulang1Detail ?? this.pulang1Detail,
      pulang2: pulang2 ?? this.pulang2,
      pulang2Detail: pulang2Detail ?? this.pulang2Detail,
      pulang3: pulang3 ?? this.pulang3,
      pulang3Detail: pulang3Detail ?? this.pulang3Detail,
    );
  }
}
