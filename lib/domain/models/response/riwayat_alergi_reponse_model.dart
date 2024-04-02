class RiwayatAlergiResponseModel {
  String keluhanUtama;
  String alergi;
  String alergiDetail;

  RiwayatAlergiResponseModel({
    required this.keluhanUtama,
    required this.alergi,
    required this.alergiDetail,
  });

  factory RiwayatAlergiResponseModel.fromJson(Map<String, dynamic> json) =>
      RiwayatAlergiResponseModel(
        keluhanUtama: json["keluhan_utama"],
        alergi: json["alergi"],
        alergiDetail: json["alergi_detail"],
      );

  Map<String, dynamic> toJson() => {
        "keluhan_utama": keluhanUtama,
        "alergi": alergi,
        "alergi_detail": alergiDetail,
      };
}
