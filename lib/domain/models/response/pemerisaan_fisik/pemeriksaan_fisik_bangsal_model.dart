class PemeriksaanFisikBangsalModel {
  String kepala;
  String mata;
  String tht;
  String gigi;
  String thyroid;
  String leherlainnya;
  String dindingDada;
  String suaraJantung;
  String dindingPerut;
  String hati;
  String lien;
  String peristaltikUsus;
  String leher;
  String dada;
  String abdomen;
  String punggung;
  String genetalia;
  String ekstremitas;
  String lainLain;
  String pemeriksaanFisik;

  PemeriksaanFisikBangsalModel({
    required this.kepala,
    required this.leher,
    required this.dada,
    required this.abdomen,
    required this.punggung,
    required this.genetalia,
    required this.ekstremitas,
    required this.lainLain,
    required this.pemeriksaanFisik,
    required this.mata,
    required this.tht,
    required this.gigi,
    required this.thyroid,
    required this.leherlainnya,
    required this.dindingDada,
    required this.suaraJantung,
    required this.dindingPerut,
    required this.hati,
    required this.lien,
    required this.peristaltikUsus,
  });

  factory PemeriksaanFisikBangsalModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikBangsalModel(
        dindingDada: json["diding_dada"],
        dindingPerut: json["diding_dada"],
        gigi: json["gigi"],
        hati: json["hati"],
        leherlainnya: json["leherlainnya"],
        lien: json["lien"],
        mata: json["mata"],
        peristaltikUsus: json["peristaltik_usus"],
        suaraJantung: json["suara_jantung"],
        tht: json["tht"],
        thyroid: json["thyroid"],
        kepala: json["kepala"],
        leher: json["leher"],
        dada: json["dada"].toString(),
        abdomen: json["abdomen"],
        punggung: json["punggung"],
        genetalia: json["genetalia"],
        ekstremitas: json["ekstremitas"],
        lainLain: json["lain_lain"],
        pemeriksaanFisik: json["pemeriksaan_fisik"],
      );

  Map<String, dynamic> toJson({
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
    required String kategori,
  }) =>
      {
        "kategori": kategori,
        "device_id": deviceID,
        "pelayanan": pelayanan,
        "noreg": noReg,
        "person": person,
        "kepala": kepala,
        "leher": leher,
        "dada": dada,
        "abdomen": abdomen,
        "punggung": punggung,
        "genetalia": genetalia,
        "ekstremitas": ekstremitas,
        "lain_lain": lainLain,
        "pemeriksaan_fisik": pemeriksaanFisik
      };

  PemeriksaanFisikBangsalModel copyWith({
    String? kepala,
    String? leher,
    String? dada,
    String? abdomen,
    String? punggung,
    String? genetalia,
    String? ekstremitas,
    String? lainLain,
    String? pemeriksaanFisik,
    String? dindingDada,
    String? leherlainnya,
    String? dindingPerut,
    String? gigi,
    String? hati,
    String? lien,
    String? mata,
    String? thyroid,
    String? suaraJantung,
    String? peristaltikUsus,
    String? tht,
  }) {
    return PemeriksaanFisikBangsalModel(
      dindingDada: dindingDada ?? this.dindingDada,
      dindingPerut: dindingPerut ?? this.dindingPerut,
      gigi: gigi ?? this.gigi,
      peristaltikUsus: peristaltikUsus ?? this.peristaltikUsus,
      suaraJantung: suaraJantung ?? this.suaraJantung,
      tht: tht ?? this.tht,
      thyroid: thyroid ?? this.thyroid,
      hati: hati ?? this.hati,
      leherlainnya: leherlainnya ?? this.leherlainnya,
      lien: lien ?? this.lien,
      mata: mata ?? this.mata,
      pemeriksaanFisik: pemeriksaanFisik ?? this.pemeriksaanFisik,
      kepala: kepala ?? this.kepala,
      leher: leher ?? this.leher,
      dada: dada ?? this.dada,
      abdomen: abdomen ?? this.abdomen,
      punggung: punggung ?? this.punggung,
      genetalia: genetalia ?? this.genetalia,
      ekstremitas: ekstremitas ?? this.ekstremitas,
      lainLain: lainLain ?? this.lainLain,
    );
  }
}
