// ignore_for_file: public_member_api_docs, sort_constructors_first
class PengkajianFungsional {
  String noreg;
  String f1;
  int nilaiF1;
  String f2;
  int nilaiF2;
  String f3;
  int nilaiF3;
  String f4;
  int nilaiF4;
  String f5;
  int nilaiF5;
  String f6;
  int nilaiF6;
  String f7;
  int nilaiF7;
  String f8;
  int nilaiF8;
  String f9;
  int nilaiF9;
  String f10;
  int nilaiF10;
  int nilai;

  PengkajianFungsional({
    required this.noreg,
    required this.f1,
    required this.nilaiF1,
    required this.f2,
    required this.nilaiF2,
    required this.f3,
    required this.nilaiF3,
    required this.f4,
    required this.nilaiF4,
    required this.f5,
    required this.nilaiF5,
    required this.f6,
    required this.nilaiF6,
    required this.f7,
    required this.nilaiF7,
    required this.f8,
    required this.nilaiF8,
    required this.f9,
    required this.nilaiF9,
    required this.f10,
    required this.nilaiF10,
    required this.nilai,
  });

  factory PengkajianFungsional.fromJson(Map<String, dynamic> json) =>
      PengkajianFungsional(
        noreg: json["noreg"],
        f1: json["f1"],
        nilaiF1: json["nilai_f1"],
        f2: json["f2"],
        nilaiF2: json["nilai_f2"],
        f3: json["f3"],
        nilaiF3: json["nilai_f3"],
        f4: json["f4"],
        nilaiF4: json["nilai_f4"],
        f5: json["f5"],
        nilaiF5: json["nilai_f5"],
        f6: json["f6"],
        nilaiF6: json["nilai_f6"],
        f7: json["f7"],
        nilaiF7: json["nilai_f7"],
        f8: json["f8"],
        nilaiF8: json["nilai_f8"],
        f9: json["f9"],
        nilaiF9: json["nilai_f9"],
        f10: json["f10"],
        nilaiF10: json["nilai_f10"],
        nilai: json["nilai"],
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "f1": f1,
        "nilai_f1": nilaiF1,
        "f2": f2,
        "nilai_f2": nilaiF2,
        "f3": f3,
        "nilai_f3": nilaiF3,
        "f4": f4,
        "nilai_f4": nilaiF4,
        "f5": f5,
        "nilai_f5": nilaiF5,
        "f6": f6,
        "nilai_f6": nilaiF6,
        "f7": f7,
        "nilai_f7": nilaiF7,
        "f8": f8,
        "nilai_f8": nilaiF8,
        "f9": f9,
        "nilai_f9": nilaiF9,
        "f10": f10,
        "nilai_f10": nilaiF10,
        "nilai": nilai,
      };

  PengkajianFungsional copyWith({
    String? noreg,
    String? f1,
    int? nilaiF1,
    String? f2,
    int? nilaiF2,
    String? f3,
    int? nilaiF3,
    String? f4,
    int? nilaiF4,
    String? f5,
    int? nilaiF5,
    String? f6,
    int? nilaiF6,
    String? f7,
    int? nilaiF7,
    String? f8,
    int? nilaiF8,
    String? f9,
    int? nilaiF9,
    String? f10,
    int? nilaiF10,
    int? nilai,
  }) {
    return PengkajianFungsional(
      noreg: noreg ?? this.noreg,
      f1: f1 ?? this.f1,
      nilaiF1: nilaiF1 ?? this.nilaiF1,
      f2: f2 ?? this.f2,
      nilaiF2: nilaiF2 ?? this.nilaiF2,
      f3: f3 ?? this.f3,
      nilaiF3: nilaiF3 ?? this.nilaiF3,
      f4: f4 ?? this.f4,
      nilaiF4: nilaiF4 ?? this.nilaiF4,
      f5: f5 ?? this.f5,
      nilaiF5: nilaiF5 ?? this.nilaiF5,
      f6: f6 ?? this.f6,
      nilaiF6: nilaiF6 ?? this.nilaiF6,
      f7: f7 ?? this.f7,
      nilaiF7: nilaiF7 ?? this.nilaiF7,
      f8: f8 ?? this.f8,
      nilaiF8: nilaiF8 ?? this.nilaiF8,
      f9: f9 ?? this.f9,
      nilaiF9: nilaiF9 ?? this.nilaiF9,
      f10: f10 ?? this.f10,
      nilaiF10: nilaiF10 ?? this.nilaiF10,
      nilai: nilai ?? this.nilai,
    );
  }
}
