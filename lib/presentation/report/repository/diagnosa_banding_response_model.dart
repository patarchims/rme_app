class DiagnosaBandingResponseModel {
  final String diagnosaBanding;
  final String noreg;

  DiagnosaBandingResponseModel({
    required this.diagnosaBanding,
    required this.noreg,
  });

  factory DiagnosaBandingResponseModel.fromJson(Map<String, dynamic> json) =>
      DiagnosaBandingResponseModel(
        diagnosaBanding: json["diagnosa_banding"],
        noreg: json["noreg"],
      );

  Map<String, dynamic> toJson() => {
        "diagnosa_banding": diagnosaBanding,
        "noreg": noreg,
      };

  DiagnosaBandingResponseModel copyWith({
    String? diagnosaBanding,
    String? noreg,
  }) {
    return DiagnosaBandingResponseModel(
      diagnosaBanding: diagnosaBanding ?? this.diagnosaBanding,
      noreg: noreg ?? this.noreg,
    );
  }
}

class DiagnosaBandingResponse {
  final String diagnosa;
  final String description;

  DiagnosaBandingResponse({
    required this.diagnosa,
    required this.description,
  });

  factory DiagnosaBandingResponse.fromJson(Map<String, dynamic> json) =>
      DiagnosaBandingResponse(
        diagnosa: json["diagnosa"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "diagnosa": diagnosa,
        "description": description,
      };
}
