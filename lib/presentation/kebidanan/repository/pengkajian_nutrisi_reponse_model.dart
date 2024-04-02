// ignore_for_file: public_member_api_docs, sort_constructors_first
class PengkajianNutrisiResponseModel {
  String noreg;
  String n1;
  String n2;
  int nilai;
  int nilaiN1;
  int nilaiN2;

  PengkajianNutrisiResponseModel({
    required this.noreg,
    required this.n1,
    required this.n2,
    required this.nilai,
    required this.nilaiN1,
    required this.nilaiN2,
  });

  factory PengkajianNutrisiResponseModel.fromJson(Map<String, dynamic> json) =>
      PengkajianNutrisiResponseModel(
        noreg: json["noreg"],
        n1: json["n1"],
        n2: json["n2"],
        nilai: json["nilai"],
        nilaiN1: json["nilai_n1"],
        nilaiN2: json["nilai_n2"],
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "n1": n1,
        "n2": n2,
        "nilai": nilai,
        "nilai_n1": nilaiN1,
        "nilai_n2": nilaiN2,
      };

  PengkajianNutrisiResponseModel copyWith({
    String? noreg,
    String? n1,
    String? n2,
    int? nilai,
    int? nilaiN1,
    int? nilaiN2,
  }) {
    return PengkajianNutrisiResponseModel(
      noreg: noreg ?? this.noreg,
      n1: n1 ?? this.n1,
      n2: n2 ?? this.n2,
      nilai: nilai ?? this.nilai,
      nilaiN1: nilaiN1 ?? this.nilaiN1,
      nilaiN2: nilaiN2 ?? this.nilaiN2,
    );
  }
}
