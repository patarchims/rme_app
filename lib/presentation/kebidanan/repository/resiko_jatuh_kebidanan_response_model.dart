// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResikoJatuhKebidananModel {
  String noreg;
  String insertPc;
  String pelayanan;
  String kategori;
  String rJatuh;
  String diagnosis;
  String terpasangInfuse;
  String alatBantu1;
  String alatBantu2;
  String alatBantu3;
  int total;

  ResikoJatuhKebidananModel({
    required this.noreg,
    required this.insertPc,
    required this.pelayanan,
    required this.kategori,
    required this.rJatuh,
    required this.diagnosis,
    required this.alatBantu1,
    required this.alatBantu2,
    required this.alatBantu3,
    required this.terpasangInfuse,
    required this.total,
  });

  factory ResikoJatuhKebidananModel.fromJson(Map<String, dynamic> json) =>
      ResikoJatuhKebidananModel(
        terpasangInfuse: json["terpasang_infuse"],
        noreg: json["noreg"],
        insertPc: json["insert_pc"],
        pelayanan: json["pelayanan"],
        kategori: json["kategori"],
        rJatuh: json["r_jatuh"],
        diagnosis: json["diagnosis"],
        alatBantu1: json["alat_bantu1"],
        alatBantu2: json["alat_bantu2"],
        alatBantu3: json["alat_bantu3"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "insert_pc": insertPc,
        "pelayanan": pelayanan,
        "kategori": kategori,
        "r_jatuh": rJatuh,
        "diagnosis": diagnosis,
        "alat_bantu1": alatBantu1,
        "alat_bantu2": alatBantu2,
        "alat_bantu3": alatBantu3,
        "total": total,
      };

  ResikoJatuhKebidananModel copyWith({
    String? noreg,
    String? insertPc,
    String? pelayanan,
    String? kategori,
    String? rJatuh,
    String? diagnosis,
    String? alatBantu1,
    String? alatBantu2,
    String? alatBantu3,
    String? terpasangInfuse,
    int? total,
  }) {
    return ResikoJatuhKebidananModel(
      terpasangInfuse: terpasangInfuse ?? this.terpasangInfuse,
      noreg: noreg ?? this.noreg,
      insertPc: insertPc ?? this.insertPc,
      pelayanan: pelayanan ?? this.pelayanan,
      kategori: kategori ?? this.kategori,
      rJatuh: rJatuh ?? this.rJatuh,
      diagnosis: diagnosis ?? this.diagnosis,
      alatBantu1: alatBantu1 ?? this.alatBantu1,
      alatBantu2: alatBantu2 ?? this.alatBantu2,
      alatBantu3: alatBantu3 ?? this.alatBantu3,
      total: total ?? this.total,
    );
  }
}
