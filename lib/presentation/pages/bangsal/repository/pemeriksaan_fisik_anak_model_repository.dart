// ignore_for_file: public_member_api_docs, sort_constructors_first
class PemeriksaanFisikAnakModelRepository {
  String gcsE;
  String gcsM;
  String gcsV;
  String mata;
  String telinga;
  String hidung;
  String mulut;
  String leherDanBahu;
  String dada;
  String abdomen;
  String punggung;
  String nutrisiDanHidrasi;
  String peristaltik;

  PemeriksaanFisikAnakModelRepository({
    required this.gcsE,
    required this.gcsM,
    required this.gcsV,
    required this.mata,
    required this.telinga,
    required this.hidung,
    required this.mulut,
    required this.leherDanBahu,
    required this.dada,
    required this.abdomen,
    required this.punggung,
    required this.nutrisiDanHidrasi,
    required this.peristaltik,
  });

  factory PemeriksaanFisikAnakModelRepository.fromJson(
          Map<String, dynamic> json) =>
      PemeriksaanFisikAnakModelRepository(
        gcsE: json["gcs_e"].toString(),
        peristaltik: json["peristaltik"].toString(),
        gcsM: json["gcs_m"].toString(),
        gcsV: json["gcs_V"].toString(),
        mata: json["mata"].toString(),
        telinga: json["telinga"].toString(),
        hidung: json["hidung"].toString(),
        mulut: json["mulut"].toString(),
        leherDanBahu: json["leher_dan_bahu"].toString(),
        dada: json["dada"].toString(),
        abdomen: json["abdomen"].toString(),
        punggung: json["punggung"].toString(),
        nutrisiDanHidrasi: json["nutrisi_dan_hidrasi"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "peristaltik": peristaltik,
        "gcs_e": gcsE,
        "gcs_m": gcsM,
        "gcs_V": gcsV,
        "mata": mata,
        "telinga": telinga,
        "hidung": hidung,
        "mulut": mulut,
        "leher_dan_bahu": leherDanBahu,
        "dada": dada,
        "abdomen": abdomen,
        "punggung": punggung,
        "nutrisi_dan_hidrasi": nutrisiDanHidrasi,
      };

  PemeriksaanFisikAnakModelRepository copyWith({
    String? gcsE,
    String? gcsM,
    String? gcsV,
    String? mata,
    String? telinga,
    String? hidung,
    String? mulut,
    String? leherDanBahu,
    String? dada,
    String? abdomen,
    String? punggung,
    String? nutrisiDanHidrasi,
    String? peristaltik,
  }) {
    return PemeriksaanFisikAnakModelRepository(
      gcsE: gcsE ?? this.gcsE,
      gcsM: gcsM ?? this.gcsM,
      gcsV: gcsV ?? this.gcsV,
      mata: mata ?? this.mata,
      telinga: telinga ?? this.telinga,
      hidung: hidung ?? this.hidung,
      mulut: mulut ?? this.mulut,
      leherDanBahu: leherDanBahu ?? this.leherDanBahu,
      dada: dada ?? this.dada,
      abdomen: abdomen ?? this.abdomen,
      punggung: punggung ?? this.punggung,
      nutrisiDanHidrasi: nutrisiDanHidrasi ?? this.nutrisiDanHidrasi,
      peristaltik: peristaltik ?? this.peristaltik,
    );
  }
}
