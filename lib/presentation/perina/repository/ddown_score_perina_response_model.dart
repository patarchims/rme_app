// ignore_for_file: public_member_api_docs, sort_constructors_first
class DDownScorePerinaModel {
  int nifas;
  int sianosis;
  int retraksi;
  int airEntry;
  int merintih;
  int total;

  DDownScorePerinaModel({
    required this.nifas,
    required this.sianosis,
    required this.retraksi,
    required this.airEntry,
    required this.merintih,
    required this.total,
  });

  factory DDownScorePerinaModel.fromJson(Map<String, dynamic> json) =>
      DDownScorePerinaModel(
        nifas: json["nifas"],
        sianosis: json["sianosis"],
        retraksi: json["retraksi"],
        airEntry: json["air_entry"],
        merintih: json["merintih"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "nifas": nifas,
        "sianosis": sianosis,
        "retraksi": retraksi,
        "air_entry": airEntry,
        "merintih": merintih,
        "total": total,
      };

  DDownScorePerinaModel copyWith({
    int? nifas,
    int? sianosis,
    int? retraksi,
    int? airEntry,
    int? merintih,
    int? total,
  }) {
    return DDownScorePerinaModel(
      nifas: nifas ?? this.nifas,
      sianosis: sianosis ?? this.sianosis,
      retraksi: retraksi ?? this.retraksi,
      airEntry: airEntry ?? this.airEntry,
      merintih: merintih ?? this.merintih,
      total: total ?? this.total,
    );
  }
}
