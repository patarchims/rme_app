class GangguanPerilakuModel {
  String jalanNafas;
  String tekananDarah;
  String tekananDarah2;
  String pernafasan;
  String pupilKiri;
  String pupilKanan;
  String nadi;
  String spo2;
  String cahayaKanan;
  String cahayaKiri;
  String suhu;
  String akral;
  String gcsE;
  String gcsM;
  String gcsV;
  String gangguan;
  String gangguanDetail;

  GangguanPerilakuModel({
    required this.jalanNafas,
    required this.tekananDarah,
    required this.tekananDarah2,
    required this.pernafasan,
    required this.pupilKiri,
    required this.pupilKanan,
    required this.nadi,
    required this.spo2,
    required this.cahayaKanan,
    required this.cahayaKiri,
    required this.suhu,
    required this.akral,
    required this.gcsE,
    required this.gcsM,
    required this.gcsV,
    required this.gangguan,
    required this.gangguanDetail,
  });

  factory GangguanPerilakuModel.fromJson(Map<String, dynamic> json) =>
      GangguanPerilakuModel(
        jalanNafas: json["jalan_nafas"],
        tekananDarah: toTekananDarah(value: json["tekanan_darah"], list: 0),
        tekananDarah2: toTekananDarah(value: json["tekanan_darah"], list: 1),
        pernafasan: json["pernafasan"],
        pupilKiri: json["pupil_kiri"],
        pupilKanan: json["pupil_kanan"],
        nadi: json["nadi"],
        spo2: json["spo2"],
        cahayaKanan: json["cahaya_kanan"],
        cahayaKiri: json["cahaya_kiri"],
        suhu: json["suhu"],
        akral: json["akral"],
        gcsE: json["gcs_e"],
        gcsM: json["gcs_m"],
        gcsV: json["gcs_v"],
        gangguan: json["gangguan"],
        gangguanDetail: json["gangguan_detail"],
      );

  Map<String, dynamic> toJson({
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
  }) =>
      {
        "device_id": deviceID,
        "pelayanan": pelayanan,
        "noreg": noReg,
        "person": person,
        "jalan_nafas": jalanNafas,
        "tekanan_darah": "$tekananDarah/$tekananDarah2",
        "pernafasan": pernafasan,
        "pupil_kiri": pupilKiri,
        "pupil_kanan": pupilKanan,
        "nadi": nadi,
        "spo2": spo2,
        "cahaya_kanan": cahayaKanan,
        "cahaya_kiri": cahayaKiri,
        "suhu": suhu,
        "akral": akral,
        "gcs_e": gcsE,
        "gcs_m": gcsM,
        "gcs_v": gcsV,
        "gangguan": gangguan,
        "gangguan_detail": gangguanDetail,
      };

  GangguanPerilakuModel copyWith(
      {String? jalanNafas,
      String? tekananDarah,
      String? pernafasan,
      String? pupilKiri,
      String? pupilKanan,
      String? nadi,
      String? spo2,
      String? cahayaKanan,
      String? cahayaKiri,
      String? suhu,
      String? akral,
      String? gcsE,
      String? gcsM,
      String? gcsV,
      String? gangguan,
      String? gangguanDetail,
      String? tekananDarah2}) {
    return GangguanPerilakuModel(
      tekananDarah2: tekananDarah2 ?? this.tekananDarah2,
      jalanNafas: jalanNafas ?? this.jalanNafas,
      tekananDarah: tekananDarah ?? this.tekananDarah,
      pernafasan: pernafasan ?? this.pernafasan,
      pupilKiri: pupilKiri ?? this.pupilKiri,
      pupilKanan: pupilKanan ?? this.pupilKanan,
      nadi: nadi ?? this.nadi,
      spo2: spo2 ?? this.spo2,
      cahayaKanan: cahayaKanan ?? this.cahayaKanan,
      cahayaKiri: cahayaKiri ?? this.cahayaKiri,
      suhu: suhu ?? this.suhu,
      akral: akral ?? this.akral,
      gcsE: gcsE ?? this.gcsE,
      gcsM: gcsM ?? this.gcsM,
      gcsV: gcsV ?? this.gcsV,
      gangguan: gangguan ?? this.gangguan,
      gangguanDetail: gangguanDetail ?? this.gangguanDetail,
    );
  }
}

String toTekananDarah({required String value, required int list}) {
  final splitted = value.split('/');
  return splitted[list];
}

String toSaveTekananDarah({required String value}) {
  return "";
}
