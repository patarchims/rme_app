class VItalSignPerina {
  String td;
  String hr;
  String rr;
  String spo2;
  String bb;
  String tb;
  String lingkarKepala;
  String lingkarLengan;
  String lingkarDada;
  String lingkarPerut;
  String warnaKulit;

  VItalSignPerina({
    required this.td,
    required this.hr,
    required this.rr,
    required this.spo2,
    required this.bb,
    required this.tb,
    required this.lingkarKepala,
    required this.lingkarLengan,
    required this.lingkarDada,
    required this.lingkarPerut,
    required this.warnaKulit,
  });

  factory VItalSignPerina.fromJson(Map<String, dynamic> json) =>
      VItalSignPerina(
        warnaKulit: json["warna_kulit"].toString(),
        td: json["td"].toString(),
        hr: json["hr"].toString(),
        rr: json["rr"].toString(),
        spo2: json["spo2"].toString(),
        bb: json["bb"].toString(),
        tb: json["tb"].toString(),
        lingkarKepala: json["lingkar_kepala"].toString(),
        lingkarLengan: json["lingkar_lengan"].toString(),
        lingkarDada: json["lingkar_dada"].toString(),
        lingkarPerut: json["lingkar_perut"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "td": td,
        "hr": hr,
        "rr": rr,
        "spo2": spo2,
        "bb": bb,
        "tb": tb,
        "lingkar_kepala": lingkarKepala,
        "lingkar_lengan": lingkarLengan,
        "lingkar_dada": lingkarDada,
        "lingkar_perut": lingkarPerut,
      };

  VItalSignPerina copyWith({
    String? td,
    String? hr,
    String? rr,
    String? spo2,
    String? bb,
    String? tb,
    String? lingkarKepala,
    String? lingkarLengan,
    String? lingkarDada,
    String? lingkarPerut,
    String? warnaKulit,
  }) {
    return VItalSignPerina(
      warnaKulit: warnaKulit ?? this.warnaKulit,
      td: td ?? this.td,
      hr: hr ?? this.hr,
      rr: rr ?? this.rr,
      spo2: spo2 ?? this.spo2,
      bb: bb ?? this.bb,
      tb: tb ?? this.tb,
      lingkarKepala: lingkarKepala ?? this.lingkarKepala,
      lingkarLengan: lingkarLengan ?? this.lingkarLengan,
      lingkarDada: lingkarDada ?? this.lingkarDada,
      lingkarPerut: lingkarPerut ?? this.lingkarPerut,
    );
  }
}
