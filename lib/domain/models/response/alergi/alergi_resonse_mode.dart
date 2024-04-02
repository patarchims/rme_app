class AlergiModel {
  final String noRm;
  final String kelompok;
  final String insertDttm;
  final String alergi;
  final String namaUser;
  final String bagian;

  AlergiModel({
    required this.noRm,
    required this.kelompok,
    required this.insertDttm,
    required this.alergi,
    required this.namaUser,
    required this.bagian,
  });

  factory AlergiModel.fromJson(Map<String, dynamic> json) => AlergiModel(
        noRm: json["no_rm"],
        kelompok: json["kelompok"],
        insertDttm: json["insert_dttm"],
        alergi: json["alergi"],
        namaUser: json["nama_user"],
        bagian: json["bagian"],
      );

  Map<String, dynamic> toJson() => {
        "no_rm": noRm,
        "kelompok": kelompok,
        "insert_dttm": insertDttm,
        "alergi": alergi,
        "nama_user": namaUser,
        "bagian": bagian,
      };
}
