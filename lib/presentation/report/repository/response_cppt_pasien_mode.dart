class ResponseCpptPasien {
  String insertDttm;
  String kdBagian;
  String tanggal;
  String noreg;
  String kelompok;
  String subjektif;
  String situation;
  String background;
  String recomendation;
  String plan;
  String objektif;
  String asesmen;
  String instruksiPpa;
  String namaDokter;
  String namaPerawat;
  String namaBagian;
  String noRm;

  ResponseCpptPasien({
    required this.insertDttm,
    required this.situation,
    required this.background,
    required this.recomendation,
    required this.plan,
    required this.kdBagian,
    required this.tanggal,
    required this.noreg,
    required this.subjektif,
    required this.objektif,
    required this.asesmen,
    required this.instruksiPpa,
    required this.namaDokter,
    required this.namaPerawat,
    required this.namaBagian,
    required this.noRm,
    required this.kelompok,
  });

  factory ResponseCpptPasien.fromJson(Map<String, dynamic> json) =>
      ResponseCpptPasien(
        kelompok: json["kelompok"],
        background: json["background"],
        recomendation: json["recomendation"],
        situation: json["situation"],
        plan: json["plan"],
        insertDttm: json["insert_dttm"],
        kdBagian: json["kd_bagian"],
        tanggal: json["tanggal"],
        noreg: json["noreg"],
        subjektif: json["subjektif"],
        objektif: json["objektif"],
        asesmen: json["asesmen"],
        instruksiPpa: json["instruksi_ppa"],
        namaDokter: json["nama_dokter"],
        namaPerawat: json["nama_perawat"],
        namaBagian: json["nama_bagian"],
        noRm: json["no_rm"],
      );

  Map<String, dynamic> toJson() => {
        "plan": plan,
        "insert_dttm": insertDttm,
        "kd_bagian": kdBagian,
        "tanggal": tanggal,
        "noreg": noreg,
        "subjektif": subjektif,
        "objektif": objektif,
        "asesmen": asesmen,
        "instruksi_ppa": instruksiPpa,
        "nama_dokter": namaDokter,
        "nama_perawat": namaPerawat,
        "nama_bagian": namaBagian,
        "no_rm": noRm,
      };
}
