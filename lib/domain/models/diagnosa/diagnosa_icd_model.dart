class DiagnosaIcdModel {
  final String chapter;
  final String s1;
  final String code;
  final String code2;
  final String description;
  final String severity;
  final String inpatient;
  final String outpatient;

  DiagnosaIcdModel({
    required this.chapter,
    required this.s1,
    required this.code,
    required this.code2,
    required this.description,
    required this.severity,
    required this.inpatient,
    required this.outpatient,
  });

  factory DiagnosaIcdModel.fromMap(Map<String, dynamic> json) =>
      DiagnosaIcdModel(
        chapter: json["chapter"],
        code: json["code"],
        s1: json["s1"],
        code2: json["code2"],
        description: json["description"],
        severity: json["severity"],
        inpatient: json["inpatient"],
        outpatient: json["outpatient"],
      );

  Map<String, dynamic> toMap() => {
        "chapter": chapter,
        "s1": s1,
        "code": code,
        "code2": code2,
        "description": description,
        "severity": severity,
        "inpatient": inpatient,
        "outpatient": outpatient,
      };
}
