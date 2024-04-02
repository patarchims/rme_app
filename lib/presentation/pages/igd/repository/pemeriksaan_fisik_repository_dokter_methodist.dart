class PemeriksaanFisikMethodistDokter {
  final String kepala;
  final String mata;
  final String tht;
  final String mulut;
  final String gigi;
  final String leher;
  final String getahBening;
  final String dada;
  final String jantung;
  final String paru;
  final String perut;
  final String hati;
  final String limpa;
  final String usus;
  final String abdomenLainnya;
  final String ginjal;
  final String alatKelamin;
  final String anus;
  final String superior;
  final String inferior;

  PemeriksaanFisikMethodistDokter({
    required this.kepala,
    required this.mata,
    required this.tht,
    required this.mulut,
    required this.gigi,
    required this.leher,
    required this.getahBening,
    required this.dada,
    required this.jantung,
    required this.paru,
    required this.perut,
    required this.hati,
    required this.limpa,
    required this.usus,
    required this.abdomenLainnya,
    required this.ginjal,
    required this.alatKelamin,
    required this.anus,
    required this.superior,
    required this.inferior,
  });

  factory PemeriksaanFisikMethodistDokter.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikMethodistDokter(
        kepala: json["kepala"],
        mata: json["mata"],
        tht: json["tht"],
        mulut: json["mulut"],
        gigi: json["gigi"],
        leher: json["leher"],
        getahBening: json["getah_bening"],
        dada: json["dada"],
        jantung: json["jantung"],
        paru: json["paru"],
        perut: json["perut"],
        hati: json["hati"],
        limpa: json["limpa"],
        usus: json["usus"],
        abdomenLainnya: json["abdomen_lainnya"],
        ginjal: json["ginjal"],
        alatKelamin: json["alat_kelamin"],
        anus: json["anus"],
        superior: json["superior"],
        inferior: json["inferior"],
      );

  Map<String, dynamic> toJson() => {
        "kepala": kepala,
        "mata": mata,
        "tht": tht,
        "mulut": mulut,
        "gigi": gigi,
        "leher": leher,
        "getah_bening": getahBening,
        "dada": dada,
        "jantung": jantung,
        "paru": paru,
        "perut": perut,
        "hati": hati,
        "limpa": limpa,
        "usus": usus,
        "abdomen_lainnya": abdomenLainnya,
        "ginjal": ginjal,
        "alat_kelamin": alatKelamin,
        "anus": anus,
        "superior": superior,
        "inferior": inferior,
      };

  PemeriksaanFisikMethodistDokter copyWith({
    String? kepala,
    String? mata,
    String? tht,
    String? mulut,
    String? gigi,
    String? leher,
    String? getahBening,
    String? dada,
    String? jantung,
    String? paru,
    String? perut,
    String? hati,
    String? limpa,
    String? usus,
    String? abdomenLainnya,
    String? ginjal,
    String? alatKelamin,
    String? anus,
    String? superior,
    String? inferior,
  }) {
    return PemeriksaanFisikMethodistDokter(
      kepala: kepala ?? this.kepala,
      mata: mata ?? this.mata,
      tht: tht ?? this.tht,
      mulut: mulut ?? this.mulut,
      gigi: gigi ?? this.gigi,
      leher: leher ?? this.leher,
      getahBening: getahBening ?? this.getahBening,
      dada: dada ?? this.dada,
      jantung: jantung ?? this.jantung,
      paru: paru ?? this.paru,
      perut: perut ?? this.perut,
      hati: hati ?? this.hati,
      limpa: limpa ?? this.limpa,
      usus: usus ?? this.usus,
      abdomenLainnya: abdomenLainnya ?? this.abdomenLainnya,
      ginjal: ginjal ?? this.ginjal,
      alatKelamin: alatKelamin ?? this.alatKelamin,
      anus: anus ?? this.anus,
      superior: superior ?? this.superior,
      inferior: inferior ?? this.inferior,
    );
  }
}
