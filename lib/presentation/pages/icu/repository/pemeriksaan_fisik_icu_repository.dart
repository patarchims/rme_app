// ignore_for_file: public_member_api_docs, sort_constructors_first
class PemeriksaanFisikIcuModel {
  final String gcsE;
  final String gcsM;
  final String gcsV;
  final String kesadaran;
  final String kepala;
  final String rambut;
  final String wajah;
  final String mata;
  final String telinga;
  final String hidung;
  final String mulut;
  final String gigi;
  final String lidah;
  final String tenggorokan;
  final String leher;
  final String dada;
  final String respirasi;
  final String jantung;
  final String integumen;
  final String ekstremitas;

  PemeriksaanFisikIcuModel({
    required this.gcsE,
    required this.gcsM,
    required this.gcsV,
    required this.kesadaran,
    required this.kepala,
    required this.rambut,
    required this.wajah,
    required this.mata,
    required this.telinga,
    required this.hidung,
    required this.mulut,
    required this.gigi,
    required this.lidah,
    required this.tenggorokan,
    required this.leher,
    required this.dada,
    required this.respirasi,
    required this.jantung,
    required this.integumen,
    required this.ekstremitas,
  });

  factory PemeriksaanFisikIcuModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikIcuModel(
        gcsE: json["gcs_e"].toString(),
        gcsM: json["gcs_m"].toString(),
        gcsV: json["gcs_V"].toString(),
        kesadaran: json["kesadaran"].toString(),
        kepala: json["kepala"].toString(),
        rambut: json["rambut"].toString(),
        wajah: json["wajah"].toString(),
        mata: json["mata"].toString(),
        telinga: json["telinga"].toString(),
        hidung: json["hidung"].toString(),
        mulut: json["mulut"].toString(),
        gigi: json["gigi"].toString(),
        lidah: json["lidah"].toString(),
        tenggorokan: json["tenggorokan"].toString(),
        leher: json["leher"].toString(),
        dada: json["dada"].toString(),
        respirasi: json["respirasi"].toString(),
        jantung: json["jantung"].toString(),
        integumen: json["integumen"].toString(),
        ekstremitas: json["ekstremitas"].toString(),
      );

  Map<String, dynamic> toJson({
    required String deviceID,
    required String pelayanan,
    required String person,
    required String noreg,
  }) =>
      {
        "device_id": deviceID,
        "pelayanan": pelayanan,
        "person": person,
        "noreg": noreg,
        "gcs_e": gcsE,
        "gcs_m": gcsM,
        "gcs_V": gcsV,
        "kesadaran": kesadaran,
        "kepala": kepala,
        "rambut": rambut,
        "wajah": wajah,
        "mata": mata,
        "telinga": telinga,
        "hidung": hidung,
        "mulut": mulut,
        "gigi": gigi,
        "lidah": lidah,
        "tenggorokan": tenggorokan,
        "leher": leher,
        "dada": dada,
        "respirasi": respirasi,
        "jantung": jantung,
        "integumen": integumen,
        "ekstremitas": ekstremitas,
      };

  PemeriksaanFisikIcuModel copyWith({
    String? gcsE,
    String? gcsM,
    String? gcsV,
    String? kesadaran,
    String? kepala,
    String? rambut,
    String? wajah,
    String? mata,
    String? telinga,
    String? hidung,
    String? mulut,
    String? gigi,
    String? lidah,
    String? tenggorokan,
    String? leher,
    String? dada,
    String? respirasi,
    String? jantung,
    String? integumen,
    String? ekstremitas,
  }) {
    return PemeriksaanFisikIcuModel(
      gcsE: gcsE ?? this.gcsE,
      gcsM: gcsM ?? this.gcsM,
      gcsV: gcsV ?? this.gcsV,
      kesadaran: kesadaran ?? this.kesadaran,
      kepala: kepala ?? this.kepala,
      rambut: rambut ?? this.rambut,
      wajah: wajah ?? this.wajah,
      mata: mata ?? this.mata,
      telinga: telinga ?? this.telinga,
      hidung: hidung ?? this.hidung,
      mulut: mulut ?? this.mulut,
      gigi: gigi ?? this.gigi,
      lidah: lidah ?? this.lidah,
      tenggorokan: tenggorokan ?? this.tenggorokan,
      leher: leher ?? this.leher,
      dada: dada ?? this.dada,
      respirasi: respirasi ?? this.respirasi,
      jantung: jantung ?? this.jantung,
      integumen: integumen ?? this.integumen,
      ekstremitas: ekstremitas ?? this.ekstremitas,
    );
  }
}
