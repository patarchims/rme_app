class PemeriksaanFisikAnakModel {
  final String mata;
  final String mulut;
  final String gigi;
  final String thyroid;
  final String paru;
  final String jantung;
  final String dindingDada;
  final String dindingdadaRetEpigastrium;
  final String dindingDadaRetSuprastermal;
  final String dindingDadaRetraksi;
  final String hepar;
  final String heparDetail;
  final String tugorKulit;
  final String limpa;
  final String limpaDetail;
  final String ginjal;
  final String ginjalDetail;
  final String genetalia;
  final String ouf;
  final String ekstremitas;

  PemeriksaanFisikAnakModel({
    required this.mata,
    required this.mulut,
    required this.gigi,
    required this.thyroid,
    required this.paru,
    required this.jantung,
    required this.dindingDada,
    required this.dindingdadaRetEpigastrium,
    required this.dindingDadaRetSuprastermal,
    required this.dindingDadaRetraksi,
    required this.hepar,
    required this.heparDetail,
    required this.tugorKulit,
    required this.limpa,
    required this.limpaDetail,
    required this.ginjal,
    required this.ginjalDetail,
    required this.genetalia,
    required this.ouf,
    required this.ekstremitas,
  });

  PemeriksaanFisikAnakModel copyWith({
    String? mata,
    String? mulut,
    String? gigi,
    String? thyroid,
    String? paru,
    String? jantung,
    String? dindingDada,
    String? dindingdadaRetEpigastrium,
    String? dindingDadaRetSuprastermal,
    String? dindingDadaRetraksi,
    String? hepar,
    String? heparDetail,
    String? tugorKulit,
    String? limpa,
    String? limpaDetail,
    String? ginjal,
    String? ginjalDetail,
    String? genetalia,
    String? ouf,
    String? ekstremitas,
  }) {
    return PemeriksaanFisikAnakModel(
      mata: mata ?? this.mata,
      mulut: mulut ?? this.mulut,
      gigi: gigi ?? this.gigi,
      thyroid: thyroid ?? this.thyroid,
      paru: paru ?? this.paru,
      jantung: jantung ?? this.jantung,
      dindingDada: dindingDada ?? this.dindingDada,
      dindingdadaRetEpigastrium:
          dindingdadaRetEpigastrium ?? this.dindingdadaRetEpigastrium,
      dindingDadaRetSuprastermal:
          dindingDadaRetSuprastermal ?? this.dindingDadaRetSuprastermal,
      dindingDadaRetraksi: dindingDadaRetraksi ?? this.dindingDadaRetraksi,
      hepar: hepar ?? this.hepar,
      heparDetail: heparDetail ?? this.heparDetail,
      tugorKulit: tugorKulit ?? this.tugorKulit,
      limpa: limpa ?? this.limpa,
      limpaDetail: limpaDetail ?? this.limpaDetail,
      ginjal: ginjal ?? this.ginjal,
      ginjalDetail: ginjalDetail ?? this.ginjalDetail,
      genetalia: genetalia ?? this.genetalia,
      ouf: ouf ?? this.ouf,
      ekstremitas: ekstremitas ?? this.ekstremitas,
    );
  }

  Map<String, dynamic> toMap({
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
    required String kategori,
  }) {
    return <String, dynamic>{
      "device_id": deviceID,
      "pelayanan": pelayanan,
      "noreg": noReg,
      "person": person,
      "kategori": kategori,
      'mata': mata,
      'mulut': mulut,
      'gigi': gigi,
      'thyroid': thyroid,
      'paru': paru,
      'jantung': jantung,
      'dinding_dada': dindingDada,
      'epigatrium': dindingdadaRetEpigastrium,
      'supratermal': dindingDadaRetSuprastermal,
      'retraksi': dindingDadaRetraksi,
      'hepar': hepar,
      'hepar_detail': heparDetail,
      'tugor_kulit': tugorKulit,
      'limpa': limpa,
      'limpaDetail': limpaDetail,
      'ginjal': ginjal,
      'ginjal_detail': ginjalDetail,
      'genetalia': genetalia,
      'ouf': ouf,
      'ekstremitas': ekstremitas,
    };
  }

  factory PemeriksaanFisikAnakModel.fromMap(Map<String, dynamic> map) {
    return PemeriksaanFisikAnakModel(
      mata: map['mata'].toString(),
      mulut: map['mulut'].toString(),
      gigi: map['gigi'].toString(),
      thyroid: map['thyroid'].toString(),
      paru: map['paru'].toString(),
      jantung: map['jantung'].toString(),
      dindingDada: map['dinding_dada'].toString(),
      dindingdadaRetEpigastrium: map['epigatrium'].toString(),
      dindingDadaRetSuprastermal: map['supratermal'].toString(),
      dindingDadaRetraksi: map['retraksi'].toString(),
      hepar: map['hepar'].toString(),
      heparDetail: map['hepar_detail'].toString(),
      tugorKulit: map['tugor_kulit'].toString(),
      limpa: map['limpa'].toString(),
      limpaDetail: map['limpa_detail'].toString(),
      ginjal: map['ginjal'].toString(),
      ginjalDetail: map['ginjal_detail'].toString(),
      genetalia: map['genetalia'].toString(),
      ouf: map['ouf'].toString(),
      ekstremitas: map['ekstremitas'].toString(),
    );
  }
}
