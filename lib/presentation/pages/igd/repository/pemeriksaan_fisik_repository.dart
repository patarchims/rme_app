class PemeriksaanFisikIgdDokter {
  String kepala;
  String mata;
  String tht;
  String mulut;
  String leher;
  String dada;
  String jantung;
  String paru;
  String perut;
  String hati;
  String limpa;
  String ginjal;
  String alatKelamin;
  String anggotaGerak;
  String refleks;
  String kekuatanOtot;
  String kulit;
  String getahBening;
  String rtvt;
  String jalanNafas;
  String sirkulasi;
  String gigi;
  String abdomen;
  String hidung;
  String telinga;

  PemeriksaanFisikIgdDokter({
    required this.kepala,
    required this.gigi,
    required this.abdomen,
    required this.mata,
    required this.tht,
    required this.mulut,
    required this.leher,
    required this.dada,
    required this.jantung,
    required this.paru,
    required this.perut,
    required this.hati,
    required this.limpa,
    required this.ginjal,
    required this.alatKelamin,
    required this.anggotaGerak,
    required this.refleks,
    required this.kekuatanOtot,
    required this.kulit,
    required this.getahBening,
    required this.rtvt,
    required this.jalanNafas,
    required this.sirkulasi,
    required this.hidung,
    required this.telinga,
  });

  factory PemeriksaanFisikIgdDokter.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikIgdDokter(
          gigi: json["gigi"],
          abdomen: json["abdomen"],
          kepala: json["kepala"],
          mata: json["mata"],
          tht: json["tht"],
          mulut: json["mulut"],
          leher: json["leher"],
          dada: json["dada"],
          jantung: json["jantung"],
          paru: json["paru"],
          perut: json["perut"],
          hati: json["hati"],
          limpa: json["limpa"],
          ginjal: json["ginjal"],
          alatKelamin: json["alat_kelamin"],
          anggotaGerak: json["anggota_gerak"],
          refleks: json["refleks"],
          kekuatanOtot: json["kekuatan_otot"],
          kulit: json["kulit"],
          getahBening: json["getah_bening"],
          rtvt: json["rtvt"],
          jalanNafas: json["jalan_nafas"],
          sirkulasi: json["sirkulasi"],
          hidung: json["hidung"],
          telinga: json["telinga"]);

  Map<String, dynamic> toJson() => {
        "kepala": kepala,
        "mata": mata,
        "tht": tht,
        "mulut": mulut,
        "leher": leher,
        "dada": dada,
        "jantung": jantung,
        "paru": paru,
        "perut": perut,
        "hati": hati,
        "limpa": limpa,
        "ginjal": ginjal,
        "alat_kelamin": alatKelamin,
        "anggota_gerak": anggotaGerak,
        "refleks": refleks,
        "kekuatan_otot": kekuatanOtot,
        "kulit": kulit,
        "getah_bening": getahBening,
        "rtvt": rtvt,
      };

  PemeriksaanFisikIgdDokter copyWith({
    String? kepala,
    String? mata,
    String? tht,
    String? mulut,
    String? leher,
    String? dada,
    String? jantung,
    String? paru,
    String? perut,
    String? hati,
    String? limpa,
    String? ginjal,
    String? alatKelamin,
    String? anggotaGerak,
    String? refleks,
    String? kekuatanOtot,
    String? kulit,
    String? getahBening,
    String? rtvt,
    String? jalanNafas,
    String? sirkulasi,
    String? abdomen,
    String? gigi,
    String? hidung,
    String? telinga,
  }) {
    return PemeriksaanFisikIgdDokter(
      hidung: hidung ?? this.hidung,
      telinga: telinga ?? this.telinga,
      abdomen: abdomen ?? this.abdomen,
      gigi: gigi ?? this.gigi,
      kepala: kepala ?? this.kepala,
      mata: mata ?? this.mata,
      tht: tht ?? this.tht,
      mulut: mulut ?? this.mulut,
      leher: leher ?? this.leher,
      dada: dada ?? this.dada,
      jantung: jantung ?? this.jantung,
      paru: paru ?? this.paru,
      perut: perut ?? this.perut,
      hati: hati ?? this.hati,
      limpa: limpa ?? this.limpa,
      ginjal: ginjal ?? this.ginjal,
      alatKelamin: alatKelamin ?? this.alatKelamin,
      anggotaGerak: anggotaGerak ?? this.anggotaGerak,
      refleks: refleks ?? this.refleks,
      kekuatanOtot: kekuatanOtot ?? this.kekuatanOtot,
      kulit: kulit ?? this.kulit,
      getahBening: getahBening ?? this.getahBening,
      rtvt: rtvt ?? this.rtvt,
      jalanNafas: jalanNafas ?? this.jalanNafas,
      sirkulasi: sirkulasi ?? this.sirkulasi,
    );
  }
}
