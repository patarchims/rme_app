class CatatanKeperawatanResponse {
  final int idCatatan;
  final String insertDttm;
  final String noreg;
  final String kdBagian;
  final String userId;
  final String catatan;
  final Karyawan karyawan;

  CatatanKeperawatanResponse({
    required this.idCatatan,
    required this.insertDttm,
    required this.noreg,
    required this.kdBagian,
    required this.userId,
    required this.catatan,
    required this.karyawan,
  });

  factory CatatanKeperawatanResponse.fromJson(Map<String, dynamic> json) =>
      CatatanKeperawatanResponse(
        idCatatan: json["id_catatan"] as int,
        insertDttm: json["insert_dttm"].toString(),
        noreg: json["noreg"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        userId: json["user_id"].toString(),
        catatan: json["catatan"].toString(),
        karyawan: Karyawan.fromJson(json["karyawan"]),
      );

  Map<String, dynamic> toJson() => {
        "id_catatan": idCatatan,
        "insert_dttm": insertDttm,
        "noreg": noreg,
        "kd_bagian": kdBagian,
        "user_id": userId,
        "catatan": catatan,
        "karyawan": karyawan.toJson(),
      };
}

class Karyawan {
  final String keterangan;
  final String idPengajar;
  final String nama;
  final String jenisKelamin;

  Karyawan({
    required this.keterangan,
    required this.idPengajar,
    required this.nama,
    required this.jenisKelamin,
  });

  factory Karyawan.fromJson(Map<String, dynamic> json) => Karyawan(
        keterangan: json["keterangan"].toString(),
        idPengajar: json["id_pengajar"].toString(),
        nama: json["nama"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "keterangan": keterangan,
        "id_pengajar": idPengajar,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
      };
}
