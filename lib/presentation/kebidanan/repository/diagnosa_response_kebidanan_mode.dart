class DiagnosaKebidananResponse {
  final int noDiagnosa;
  final String kodeDiagnosa;
  final String namaDiagnosa;

  DiagnosaKebidananResponse({
    required this.noDiagnosa,
    required this.kodeDiagnosa,
    required this.namaDiagnosa,
  });

  factory DiagnosaKebidananResponse.fromJson(Map<String, dynamic> json) =>
      DiagnosaKebidananResponse(
        noDiagnosa: json["no_diagnosa"] as int,
        kodeDiagnosa: json["kode_diagnosa"],
        namaDiagnosa: json["nama_diagnosa"],
      );

  Map<String, dynamic> toJson() => {
        "no_diagnosa": noDiagnosa,
        "kode_diagnosa": kodeDiagnosa,
        "nama_diagnosa": namaDiagnosa,
      };
}
