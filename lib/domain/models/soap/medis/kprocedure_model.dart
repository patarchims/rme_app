class KProcedureModel {
  final String kel;
  final String grup;
  final String nameGrup;
  final String icd;
  final int urut;

  KProcedureModel({
    required this.kel,
    required this.grup,
    required this.nameGrup,
    required this.icd,
    required this.urut,
  });

  factory KProcedureModel.fromJson(Map<String, dynamic> json) =>
      KProcedureModel(
        kel: json["kel"].toString(),
        grup: json["grup"].toString(),
        nameGrup: json["name_grup"].toString(),
        icd: json["icd"].toString(),
        urut: json["urut"] as int,
      );

  Map<String, dynamic> toJson() => {
        "kel": kel,
        "grup": grup,
        "name_grup": nameGrup,
        "icd": icd,
        "urut": urut,
      };
}
