class PengkajianNutrisiAnak {
  String noreg;
  String n1;
  String n2;
  String n3;
  String n4;
  int nilai;
  int nilaiN1;
  int nilaiN2;
  int nilaiN3;
  int nilaiN4;

  PengkajianNutrisiAnak({
    required this.noreg,
    required this.n1,
    required this.n2,
    required this.n3,
    required this.n4,
    required this.nilai,
    required this.nilaiN1,
    required this.nilaiN2,
    required this.nilaiN3,
    required this.nilaiN4,
  });

  factory PengkajianNutrisiAnak.fromJson(Map<String, dynamic> json) =>
      PengkajianNutrisiAnak(
        noreg: json["noreg"].toString(),
        n1: json["n1"].toString(),
        n2: json["n2"].toString(),
        n3: json["n3"].toString(),
        n4: json["n4"].toString(),
        nilai: json["nilai"] as int,
        nilaiN1: json["nilai_n1"] as int,
        nilaiN2: json["nilai_n2"] as int,
        nilaiN3: json["nilai_n3"] as int,
        nilaiN4: json["nilai_n4"] as int,
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "n1": n1,
        "n2": n2,
        "n3": n3,
        "n4": n4,
        "nilai": nilai,
        "nilai_n1": nilaiN1,
        "nilai_n2": nilaiN2,
        "nilai_n3": nilaiN3,
        "nilai_n4": nilaiN4,
      };

  PengkajianNutrisiAnak copyWith({
    String? noreg,
    String? n1,
    String? n2,
    String? n3,
    String? n4,
    int? nilai,
    int? nilaiN1,
    int? nilaiN2,
    int? nilaiN3,
    int? nilaiN4,
  }) {
    return PengkajianNutrisiAnak(
      noreg: noreg ?? this.noreg,
      n1: n1 ?? this.n1,
      n2: n2 ?? this.n2,
      n3: n3 ?? this.n3,
      n4: n4 ?? this.n4,
      nilai: nilai ?? this.nilai,
      nilaiN1: nilaiN1 ?? this.nilaiN1,
      nilaiN2: nilaiN2 ?? this.nilaiN2,
      nilaiN3: nilaiN3 ?? this.nilaiN3,
      nilaiN4: nilaiN4 ?? this.nilaiN4,
    );
  }
}
