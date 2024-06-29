class TindakanModel {
  final int id;
  final String insertDttm;
  final String noDaskep;
  final String userId;
  final String kdBagian;
  final String deskripsi;
  final Perawat perawat;
  final Bagian bagian;

  TindakanModel({
    required this.id,
    required this.insertDttm,
    required this.noDaskep,
    required this.userId,
    required this.kdBagian,
    required this.deskripsi,
    required this.perawat,
    required this.bagian,
  });

  TindakanModel copyWith({
    int? id,
    String? insertDttm,
    String? noDaskep,
    String? userId,
    String? kdBagian,
    String? deskripsi,
    Perawat? perawat,
    Bagian? bagian,
  }) =>
      TindakanModel(
        id: id ?? this.id,
        insertDttm: insertDttm ?? this.insertDttm,
        noDaskep: noDaskep ?? this.noDaskep,
        userId: userId ?? this.userId,
        kdBagian: kdBagian ?? this.kdBagian,
        deskripsi: deskripsi ?? this.deskripsi,
        perawat: perawat ?? this.perawat,
        bagian: bagian ?? this.bagian,
      );

  factory TindakanModel.fromJson(Map<String, dynamic> json) => TindakanModel(
        id: json["id"] as int,
        insertDttm: json["insert_dttm"].toString(),
        noDaskep: json["no_daskep"].toString(),
        userId: json["user_id"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        deskripsi: json["deskripsi"],
        perawat: Perawat.fromJson(json["perawat"]),
        bagian: Bagian.fromJson(json["bagian"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "insert_dttm": insertDttm,
        "no_daskep": noDaskep,
        "user_id": userId,
        "kd_bagian": kdBagian,
        "deskripsi": deskripsi,
        "perawat": perawat.toJson(),
        "bagian": bagian.toJson(),
      };
}

class Bagian {
  final String kdBag;
  final String bagian;
  final String pelayanan;

  Bagian({
    required this.kdBag,
    required this.bagian,
    required this.pelayanan,
  });

  Bagian copyWith({
    String? kdBag,
    String? bagian,
    String? pelayanan,
  }) =>
      Bagian(
        kdBag: kdBag ?? this.kdBag,
        bagian: bagian ?? this.bagian,
        pelayanan: pelayanan ?? this.pelayanan,
      );

  factory Bagian.fromJson(Map<String, dynamic> json) => Bagian(
        kdBag: json["kd_bag"],
        bagian: json["bagian"],
        pelayanan: json["pelayanan"],
      );

  Map<String, dynamic> toJson() => {
        "kd_bag": kdBag,
        "bagian": bagian,
        "pelayanan": pelayanan,
      };
}

class Perawat {
  final String idPerawat;
  final String nama;
  final String alamat;
  final String jenisKelamin;
  final String status;

  Perawat({
    required this.idPerawat,
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
    required this.status,
  });

  Perawat copyWith({
    String? idPerawat,
    String? nama,
    String? alamat,
    String? jenisKelamin,
    String? status,
  }) =>
      Perawat(
        idPerawat: idPerawat ?? this.idPerawat,
        nama: nama ?? this.nama,
        alamat: alamat ?? this.alamat,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        status: status ?? this.status,
      );

  factory Perawat.fromJson(Map<String, dynamic> json) => Perawat(
        idPerawat: json["id_perawat"],
        nama: json["nama"],
        alamat: json["alamat"],
        jenisKelamin: json["jenis_kelamin"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_perawat": idPerawat,
        "nama": nama,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "status": status,
      };
}
