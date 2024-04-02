class CpptSbarDokterModel {
  int idCppt;
  String insertDttm;
  String userId;
  String kelompok;
  String pelayanan;
  String bagian;
  String tanggal;
  String noreg;
  String namaPerawat;
  String namaDokter;
  String situation;
  String background;
  String asesmen;
  String recomendation;
  String instruksiPPA;

  CpptSbarDokterModel({
    required this.idCppt,
    required this.insertDttm,
    required this.userId,
    required this.kelompok,
    required this.pelayanan,
    required this.bagian,
    required this.tanggal,
    required this.noreg,
    required this.namaPerawat,
    required this.namaDokter,
    required this.situation,
    required this.background,
    required this.asesmen,
    required this.recomendation,
    required this.instruksiPPA,
  });

  factory CpptSbarDokterModel.fromJson(Map<String, dynamic> json) =>
      CpptSbarDokterModel(
          idCppt: json["id_cppt"] as int,
          insertDttm: json["insert_dttm"].toString(),
          userId: json["user_id"].toString(),
          kelompok: json["kelompok"].toString(),
          pelayanan: json["pelayanan"].toString(),
          bagian: json["bagian"].toString(),
          tanggal: json["tanggal"].toString(),
          noreg: json["noreg"].toString(),
          namaPerawat: json["nama_perawat"].toString(),
          namaDokter: json["nama_dokter"].toString(),
          situation: json["situation"].toString(),
          background: json["background"].toString(),
          asesmen: json["asesmen"].toString(),
          recomendation: json["recomendation"].toString(),
          instruksiPPA: json["instruksi_ppa"].toString());

  Map<String, dynamic> toJson() => {
        "id_cppt": idCppt,
        "insert_dttm": insertDttm,
        "user_id": userId,
        "kelompok": kelompok,
        "pelayanan": pelayanan,
        "bagian": bagian,
        "tanggal": tanggal,
        "noreg": noreg,
        "nama_perawat": namaPerawat,
        "nama_dokter": namaDokter,
        "situation": situation,
        "background": background,
        "asesmen": asesmen,
        "recomendation": recomendation,
        "instruksi_ppa": instruksiPPA
      };
}
