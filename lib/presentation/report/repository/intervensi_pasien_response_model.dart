class IntervensiPasienResponseModel {
  String insertDttm;
  String insertPc;
  String noreg;
  String person;
  String namaPerawat;
  String noDaskep;
  String kodeSdki;
  String noRm;
  List<Siki> siki;
  List<TindakanModel> tindakan;

  IntervensiPasienResponseModel({
    required this.insertDttm,
    required this.insertPc,
    required this.noreg,
    required this.person,
    required this.namaPerawat,
    required this.noDaskep,
    required this.kodeSdki,
    required this.noRm,
    required this.siki,
    required this.tindakan,
  });

  factory IntervensiPasienResponseModel.fromJson(Map<String, dynamic> json) =>
      IntervensiPasienResponseModel(
          insertDttm: json["insert_dttm"],
          insertPc: json["insert_pc"],
          noreg: json["noreg"],
          person: json["person"],
          namaPerawat: json["nama_perawat"],
          noDaskep: json["no_daskep"],
          kodeSdki: json["kode_sdki"],
          noRm: json["no_rm"],
          siki: List<Siki>.from(json["siki"].map((x) => Siki.fromJson(x))),
          tindakan: List<TindakanModel>.from(
              json["tindakan"].map((e) => TindakanModel.fromJson(e))));

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "insert_pc": insertPc,
        "noreg": noreg,
        "person": person,
        "nama_perawat": namaPerawat,
        "no_daskep": noDaskep,
        "kode_sdki": kodeSdki,
        "no_rm": noRm,
        "siki": List<dynamic>.from(siki.map((x) => x.toJson())),
      };
}

class Siki {
  String insertDttm;
  String noDaskep;
  int idSiki;
  String kodeSiki;
  String namaSiki;
  String kategori;
  int noUrut;

  Siki({
    required this.insertDttm,
    required this.noDaskep,
    required this.idSiki,
    required this.kodeSiki,
    required this.namaSiki,
    required this.kategori,
    required this.noUrut,
  });

  factory Siki.fromJson(Map<String, dynamic> json) => Siki(
        insertDttm: json["insert_dttm"],
        noDaskep: json["no_daskep"],
        idSiki: json["id_siki"],
        kodeSiki: json["kode_siki"],
        namaSiki: json["nama_siki"],
        kategori: json["kategori"],
        noUrut: json["no_urut"],
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "no_daskep": noDaskep,
        "id_siki": idSiki,
        "kode_siki": kodeSiki,
        "nama_siki": namaSiki,
        "kategori": kategori,
        "no_urut": noUrut,
      };
}

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
        deskripsi: json["deskripsi"].toString(),
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
        kdBag: json["kd_bag"].toString(),
        bagian: json["bagian"].toString(),
        pelayanan: json["pelayanan"].toString(),
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
        idPerawat: json["id_perawat"].toString(),
        nama: json["nama"].toString(),
        alamat: json["alamat"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        status: json["status"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id_perawat": idPerawat,
        "nama": nama,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "status": status,
      };
}
