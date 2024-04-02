class ResikoJatuhMorseResponse {
  String insertDttm;
  String pelayanan;
  String kdBagian;
  String noreg;
  String kategori;
  String ketPerson;
  String rJatuh;
  String diagnosis;
  String ambulasi;
  String terapi;
  String terpasangInfuse;
  String gayaBerjalan;
  String statusMental;
  int total;

  ResikoJatuhMorseResponse({
    required this.insertDttm,
    required this.pelayanan,
    required this.kdBagian,
    required this.noreg,
    required this.kategori,
    required this.ketPerson,
    required this.rJatuh,
    required this.diagnosis,
    required this.ambulasi,
    required this.terapi,
    required this.terpasangInfuse,
    required this.gayaBerjalan,
    required this.statusMental,
    required this.total,
  });

  factory ResikoJatuhMorseResponse.fromJson(Map<String, dynamic> json) =>
      ResikoJatuhMorseResponse(
        insertDttm: json["insertDttm"],
        pelayanan: json["pelayanan"],
        kdBagian: json["kd_bagian"],
        noreg: json["noreg"],
        kategori: json["kategori"],
        ketPerson: json["ket_person"],
        rJatuh: json["r_jatuh"],
        diagnosis: json["diagnosis"],
        ambulasi: json["ambulasi"],
        terapi: json["terapi"],
        terpasangInfuse: json["terpasang_infuse"],
        gayaBerjalan: json["gaya_berjalan"],
        statusMental: json["status_mental"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "insertDttm": insertDttm,
        "pelayanan": pelayanan,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "kategori": kategori,
        "ket_person": ketPerson,
        "r_jatuh": rJatuh,
        "diagnosis": diagnosis,
        "ambulasi": ambulasi,
        "terapi": terapi,
        "terpasang_infuse": terpasangInfuse,
        "gaya_berjalan": gayaBerjalan,
        "status_mental": statusMental,
        "total": total,
      };
}
