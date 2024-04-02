class ResikoJatuhDewasaResponse {
  String insertDttm;
  String pelayanan;
  String kdBagian;
  String noreg;
  String kategori;
  String usia;
  String rJatuh;
  String aktivitas;
  String mobilitas;
  String kognitif;
  String defisitSensori;
  String pengobatan;
  String komorbiditas;
  int total;
  String namaPerawat;

  ResikoJatuhDewasaResponse({
    required this.insertDttm,
    required this.pelayanan,
    required this.kdBagian,
    required this.noreg,
    required this.kategori,
    required this.usia,
    required this.rJatuh,
    required this.aktivitas,
    required this.mobilitas,
    required this.kognitif,
    required this.defisitSensori,
    required this.pengobatan,
    required this.komorbiditas,
    required this.total,
    required this.namaPerawat,
  });

  factory ResikoJatuhDewasaResponse.fromJson(Map<String, dynamic> json) =>
      ResikoJatuhDewasaResponse(
        insertDttm: json["insertDttm"].toString(),
        pelayanan: json["pelayanan"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        noreg: json["noreg"].toString(),
        kategori: json["kategori"].toString(),
        usia: json["usia"].toString(),
        rJatuh: json["r_jatuh"].toString(),
        aktivitas: json["aktivitas"].toString(),
        mobilitas: json["mobilitas"].toString(),
        kognitif: json["kognitif"].toString(),
        defisitSensori: json["defisit_sensori"].toString(),
        pengobatan: json["pengobatan"].toString(),
        komorbiditas: json["komorbiditas"].toString(),
        total: json["total"] as int,
        namaPerawat: json["nama_perawat"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "insertDttm": insertDttm,
        "pelayanan": pelayanan,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "kategori": kategori,
        "usia": usia,
        "r_jatuh": rJatuh,
        "aktivitas": aktivitas,
        "mobilitas": mobilitas,
        "kognitif": kognitif,
        "defisit_sensori": defisitSensori,
        "pengobatan": pengobatan,
        "komorbiditas": komorbiditas,
        "total": total,
        "nama_perawat": namaPerawat,
      };
}
