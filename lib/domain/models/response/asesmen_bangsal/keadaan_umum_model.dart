// ignore_for_file: public_member_api_docs, sort_constructors_first
class KeadaanUmumModel {
  String keadaanUmum;
  String kesadaran;
  String kesadaranDetail;

  KeadaanUmumModel({
    required this.keadaanUmum,
    required this.kesadaran,
    required this.kesadaranDetail,
  });

  factory KeadaanUmumModel.fromJson(Map<String, dynamic> json) =>
      KeadaanUmumModel(
        keadaanUmum: json["keadaan_umum"],
        kesadaran: json["kesadaran"],
        kesadaranDetail: json["kesadaran_detail"],
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
        "keadaan_umum": keadaanUmum,
        "kesadaran": kesadaran,
        "kesadaran_detail": kesadaranDetail,
      };

  KeadaanUmumModel copyWith({
    String? keadaanUmum,
    String? kesadaran,
    String? kesadaranDetail,
  }) {
    return KeadaanUmumModel(
      keadaanUmum: keadaanUmum ?? this.keadaanUmum,
      kesadaran: kesadaran ?? this.kesadaran,
      kesadaranDetail: kesadaranDetail ?? this.kesadaranDetail,
    );
  }
}
