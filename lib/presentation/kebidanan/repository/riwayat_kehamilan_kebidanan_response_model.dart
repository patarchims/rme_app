class KehamilanKebidanModel {
  int id;
  String insertDttm;
  String userId;
  String deviceId;
  String kdRiwayat;
  String tahun;
  String tempat;
  String noreg;
  String umur;
  String jenisPersalinan;
  String penolong;
  String penyulit;
  String nifas;
  String jk;
  String bb;
  String keadaanSekarang;

  KehamilanKebidanModel({
    required this.insertDttm,
    required this.id,
    required this.userId,
    required this.deviceId,
    required this.kdRiwayat,
    required this.tahun,
    required this.tempat,
    required this.noreg,
    required this.umur,
    required this.jenisPersalinan,
    required this.penolong,
    required this.penyulit,
    required this.nifas,
    required this.jk,
    required this.bb,
    required this.keadaanSekarang,
  });

  factory KehamilanKebidanModel.fromJson(Map<String, dynamic> json) =>
      KehamilanKebidanModel(
        id: json["id"],
        insertDttm: json["insert_dttm"],
        userId: json["user_id"],
        deviceId: json["device_id"],
        kdRiwayat: json["kd_riwayat"],
        tahun: json["tahun"],
        tempat: json["tempat"],
        noreg: json["noreg"],
        umur: json["umur"],
        jenisPersalinan: json["jenis_persalinan"],
        penolong: json["penolong"],
        penyulit: json["penyulit"],
        nifas: json["nifas"],
        jk: json["jk"],
        bb: json["bb"],
        keadaanSekarang: json["keadaan_sekarang"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "insert_dttm": insertDttm,
        "user_id": userId,
        "device_id": deviceId,
        "kd_riwayat": kdRiwayat,
        "tahun": tahun,
        "tempat": tempat,
        "noreg": noreg,
        "umur": umur,
        "jenis_persalinan": jenisPersalinan,
        "penolong": penolong,
        "penyulit": penyulit,
        "nifas": nifas,
        "jk": jk,
        "bb": bb,
        "keadaan_sekarang": keadaanSekarang,
      };
}
