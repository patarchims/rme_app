// ignore_for_file: public_member_api_docs, sort_constructors_first
class SkalaNyeriResponse {
  int skalaNyeri;

  SkalaNyeriResponse({
    required this.skalaNyeri,
  });

  factory SkalaNyeriResponse.fromJson(Map<String, dynamic> json) =>
      SkalaNyeriResponse(
        skalaNyeri: json["skala_nyeri"] as int,
      );

  Map<String, dynamic> toJson() => {
        "skala_nyeri": skalaNyeri,
      };

  SkalaNyeriResponse copyWith({
    int? skalaNyeri,
  }) {
    return SkalaNyeriResponse(
      skalaNyeri: skalaNyeri ?? this.skalaNyeri,
    );
  }
}
