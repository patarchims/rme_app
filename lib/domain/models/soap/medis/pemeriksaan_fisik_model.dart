class PemeriksaanFisikModel {
  final String noreg;
  final String kepala;
  final String kepalaDetail;
  final String leher;
  final String leherDetail;
  final String genetalia;
  final String genetaliaDetail;
  final String abdomen;
  final String abdomenDetail;
  final String ekstremitas;
  final String ekstremitasDetail;
  final String data;
  final String dataDetail;
  final String punggung;
  final String punggungDetail;
  String? lainLain;

  PemeriksaanFisikModel({
    required this.noreg,
    required this.kepala,
    required this.kepalaDetail,
    required this.leher,
    required this.leherDetail,
    required this.genetalia,
    required this.genetaliaDetail,
    required this.abdomen,
    required this.abdomenDetail,
    required this.ekstremitas,
    required this.ekstremitasDetail,
    required this.data,
    required this.dataDetail,
    required this.punggung,
    required this.punggungDetail,
    this.lainLain,
  });

  factory PemeriksaanFisikModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikModel(
        noreg: json["noreg"].toString(),
        kepala: json["kepala"].toString(),
        kepalaDetail: json["kepala_detail"].toString(),
        leher: json["leher"].toString(),
        leherDetail: json["leher_detail"].toString(),
        genetalia: json["genetalia"].toString(),
        genetaliaDetail: json["genetalia_detail"].toString(),
        abdomen: json["abdomen"].toString(),
        abdomenDetail: json["abdomen_detail"].toString(),
        ekstremitas: json["ekstremitas"].toString(),
        ekstremitasDetail: json["ekstremitas_detail"].toString(),
        data: json["data"].toString(),
        dataDetail: json["data_detail"].toString(),
        punggung: json["punggung"].toString(),
        lainLain: json["lain_lain"].toString(),
        punggungDetail: json["punggung_detail"].toString(),
      );

  Map<String, dynamic> toJson({
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) =>
      {
        "noreg": noreg,
        "kepala": kepala,
        "kepala_detail": kepalaDetail,
        "leher": leher,
        "leher_detail": leherDetail,
        "genetalia": genetalia,
        "genetalia_detail": genetaliaDetail,
        "abdomen": abdomen,
        "abdomen_detail": abdomenDetail,
        "ekstremitas": ekstremitas,
        "ekstremitas_detail": ekstremitasDetail,
        "data": data,
        "data_detail": dataDetail,
        "punggung": punggung,
        "punggung_detail": punggungDetail,
        "lain_lain": lainLain,
        "person": person,
        "user_id": userID,
        "device_id": deviceID,
        "pelayanan": pelayanan
      };
}
