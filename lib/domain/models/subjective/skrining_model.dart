class SkirningModel {
  SkirningModel({
    required this.kdBagian,
    required this.noReg,
    required this.k1,
    required this.k2,
    required this.k3,
    required this.k4,
    required this.k5,
    required this.k6,
    required this.kf1,
    required this.kf2,
    required this.kf3,
    required this.kf4,
    required this.b1,
    required this.b2,
    required this.rj,
    required this.iv1,
    required this.iv2,
    required this.iv3,
    required this.iv4,
  });

  final String kdBagian;
  final String noReg;
  final String k1;
  final String k2;
  final String k3;
  final String k4;
  final String k5;
  final String k6;
  final String kf1;
  final String kf2;
  final String kf3;
  final String kf4;
  final String b1;
  final String b2;
  final String rj;
  final String iv1;
  final String iv2;
  final String iv3;
  final String iv4;

  factory SkirningModel.fromJson(Map<String, dynamic> json) => SkirningModel(
        kdBagian: json["kdBagian"],
        noReg: json["noReg"],
        k1: json["k1"],
        k2: json["k2"],
        k3: json["k3"],
        k4: json["k4"],
        k5: json["k5"],
        k6: json["k6"],
        kf1: json["KF1"],
        kf2: json["KF2"],
        kf3: json["KF3"],
        kf4: json["KF4"],
        b1: json["B1"],
        b2: json["B2"],
        rj: json["RJ"],
        iv1: json["IV1"],
        iv2: json["IV2"],
        iv3: json["IV3"],
        iv4: json["IV4"],
      );

  Map<String, dynamic> toJson() => {
        "kdBagian": kdBagian,
        "noReg": noReg,
        "k1": k1,
        "k2": k2,
        "k3": k3,
        "k4": k4,
        "k5": k5,
        "k6": k6,
        "KF1": kf1,
        "KF2": kf2,
        "KF3": kf3,
        "KF4": kf4,
        "B1": b1,
        "B2": b2,
        "RJ": rj,
        "IV1": iv1,
        "IV2": iv2,
        "IV3": iv3,
        "IV4": iv4,
      };
}
