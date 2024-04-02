// ignore_for_file: public_member_api_docs, sort_constructors_first
class FisikPerinaModel {
  String gcsE;
  String gcsV;
  String gcsM;
  String tonickNeck;
  String kelainan;
  String kesadaran;
  String kepala;
  String wajah;
  String telinga;
  String hidung;
  String mulut;
  String refleks;
  String leherDahBahu;
  String dada;
  String abdomen;
  String punggung;
  String integumen;
  String ekstremitas;
  String genetalia;
  String anus;

  FisikPerinaModel({
    required this.kesadaran,
    required this.tonickNeck,
    required this.kelainan,
    required this.kepala,
    required this.wajah,
    required this.telinga,
    required this.hidung,
    required this.mulut,
    required this.refleks,
    required this.leherDahBahu,
    required this.dada,
    required this.abdomen,
    required this.punggung,
    required this.integumen,
    required this.ekstremitas,
    required this.genetalia,
    required this.anus,
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
  });

  factory FisikPerinaModel.fromJson(Map<String, dynamic> json) =>
      FisikPerinaModel(
        gcsE: json["gcs_e"].toString(),
        gcsM: json["gcs_m"].toString(),
        gcsV: json["gcs_v"].toString(),
        kelainan: json["kelainan"].toString(),
        tonickNeck: json["tonick_neck"].toString(),
        kesadaran: json["kesadaran"].toString(),
        kepala: json["kepala"].toString(),
        wajah: json["wajah"].toString(),
        telinga: json["telinga"].toString(),
        hidung: json["hidung"].toString(),
        mulut: json["mulut"].toString(),
        refleks: json["refleks"].toString(),
        leherDahBahu: json["leher_dah_bahu"].toString(),
        dada: json["dada"].toString(),
        abdomen: json["abdomen"].toString(),
        punggung: json["punggung"].toString(),
        integumen: json["integumen"].toString(),
        ekstremitas: json["ekstremitas"].toString(),
        genetalia: json["genetalia"].toString(),
        anus: json["anus"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kepala": kepala,
        "wajah": wajah,
        "telinga": telinga,
        "hidung": hidung,
        "mulut": mulut,
        "refleks": refleks,
        "leher_dah_bahu": leherDahBahu,
        "dada": dada,
        "abdomen": abdomen,
        "punggung": punggung,
        "integumen": integumen,
        "ekstremitas": ekstremitas,
        "genetalia": genetalia,
        "anus": anus,
      };

  FisikPerinaModel copyWith({
    String? kepala,
    String? wajah,
    String? telinga,
    String? hidung,
    String? mulut,
    String? refleks,
    String? leherDahBahu,
    String? dada,
    String? abdomen,
    String? punggung,
    String? integumen,
    String? ekstremitas,
    String? genetalia,
    String? anus,
    String? kesadaran,
    String? kelainan,
    String? tonickNeck,
    String? gcsE,
    String? gcsV,
    String? gcsM,
  }) {
    return FisikPerinaModel(
      gcsE: gcsE ?? this.gcsE,
      gcsM: gcsM ?? this.gcsM,
      gcsV: gcsV ?? this.gcsV,
      tonickNeck: tonickNeck ?? this.tonickNeck,
      kelainan: kelainan ?? this.kelainan,
      kesadaran: kesadaran ?? this.kesadaran,
      kepala: kepala ?? this.kepala,
      wajah: wajah ?? this.wajah,
      telinga: telinga ?? this.telinga,
      hidung: hidung ?? this.hidung,
      mulut: mulut ?? this.mulut,
      refleks: refleks ?? this.refleks,
      leherDahBahu: leherDahBahu ?? this.leherDahBahu,
      dada: dada ?? this.dada,
      abdomen: abdomen ?? this.abdomen,
      punggung: punggung ?? this.punggung,
      integumen: integumen ?? this.integumen,
      ekstremitas: ekstremitas ?? this.ekstremitas,
      genetalia: genetalia ?? this.genetalia,
      anus: anus ?? this.anus,
    );
  }
}
