class RiwayatPengobatanDirumahModel {
  DateTime insertDttm;
  String userId;
  String deviceId;
  String kdRiwayat;
  String noreg;
  String namaObat;
  String dosis;
  String caraPemberian;
  String frekuensi;
  String waktu;

  RiwayatPengobatanDirumahModel({
    required this.insertDttm,
    required this.userId,
    required this.deviceId,
    required this.kdRiwayat,
    required this.noreg,
    required this.namaObat,
    required this.dosis,
    required this.caraPemberian,
    required this.frekuensi,
    required this.waktu,
  });

  factory RiwayatPengobatanDirumahModel.fromJson(Map<String, dynamic> json) =>
      RiwayatPengobatanDirumahModel(
        insertDttm: DateTime.parse(json["insert_dttm"]),
        userId: json["user_id"],
        deviceId: json["device_id"],
        kdRiwayat: json["kd_riwayat"],
        noreg: json["noreg"],
        namaObat: json["nama_obat"],
        dosis: json["dosis"],
        caraPemberian: json["cara_pemberian"],
        frekuensi: json["frekuensi"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm.toIso8601String(),
        "user_id": userId,
        "device_id": deviceId,
        "kd_riwayat": kdRiwayat,
        "noreg": noreg,
        "nama_obat": namaObat,
        "dosis": dosis,
        "cara_pemberian": caraPemberian,
        "frekuensi": frekuensi,
        "waktu": waktu,
      };
}
