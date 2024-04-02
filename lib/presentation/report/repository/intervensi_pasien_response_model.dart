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
      );

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
