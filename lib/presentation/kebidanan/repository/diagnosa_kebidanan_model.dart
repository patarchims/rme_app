class DiagnosaKebidananModel {
  String kodeDiagnosa;
  String namaDiagnosa;
  bool isSelected;

  DiagnosaKebidananModel({
    required this.kodeDiagnosa,
    required this.namaDiagnosa,
    required this.isSelected,
  });

  factory DiagnosaKebidananModel.fromJson(Map<String, dynamic> json) =>
      DiagnosaKebidananModel(
        kodeDiagnosa: json["kode_diagnosa"],
        namaDiagnosa: json["nama_diagnosa"],
        isSelected: json["is_selected"],
      );

  Map<String, dynamic> toJson() => {
        "kode_diagnosa": kodeDiagnosa,
        "is_selected": isSelected,
        "nama_diagnosa": namaDiagnosa,
      };

  DiagnosaKebidananModel copyWith({
    String? kodeDiagnosa,
    String? namaDiagnosa,
    bool? isSelected,
  }) {
    return DiagnosaKebidananModel(
      kodeDiagnosa: kodeDiagnosa ?? this.kodeDiagnosa,
      namaDiagnosa: namaDiagnosa ?? this.namaDiagnosa,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
