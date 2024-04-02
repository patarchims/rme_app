class SkalaTriaseModel {
  int nyeri;
  String nyeriP;
  String nyeriQ;
  String nyeriR;
  String nyeriS;
  String nyeriT;
  int flaccWajah;
  int flaccKaki;
  int flaccAktifitas;
  int flaccMenangis;
  int flaccBersuara;
  int flaccTotal;
  int skalaTriase;

  SkalaTriaseModel({
    required this.nyeri,
    required this.nyeriP,
    required this.nyeriQ,
    required this.nyeriR,
    required this.nyeriS,
    required this.nyeriT,
    required this.flaccWajah,
    required this.flaccKaki,
    required this.flaccAktifitas,
    required this.flaccMenangis,
    required this.flaccBersuara,
    required this.flaccTotal,
    required this.skalaTriase,
  });

  factory SkalaTriaseModel.fromJson(Map<String, dynamic> json) =>
      SkalaTriaseModel(
        nyeri: json["nyeri"],
        nyeriP: json["nyeri_p"],
        nyeriQ: json["nyeri_q"],
        nyeriR: json["nyeri_r"],
        nyeriS: json["nyeri_s"],
        nyeriT: json["nyeri_t"],
        flaccWajah: json["flacc_wajah"],
        flaccKaki: json["flacc_kaki"],
        flaccAktifitas: json["flacc_aktifitas"],
        flaccMenangis: json["flacc_menangis"],
        flaccBersuara: json["flacc_bersuara"],
        flaccTotal: json["flacc_total"],
        skalaTriase: json["skala_triase"],
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
        "nyeri": nyeri,
        "nyeri_p": nyeriP,
        "nyeri_q": nyeriQ,
        "nyeri_r": nyeriR,
        "nyeri_s": nyeriS,
        "nyeri_t": nyeriT,
        "flacc_wajah": flaccWajah,
        "flacc_kaki": flaccKaki,
        "flacc_aktifitas": flaccAktifitas,
        "flacc_menangis": flaccMenangis,
        "flacc_bersuara": flaccBersuara,
        "flacc_total": flaccTotal,
        "skala_triase": skalaTriase,
      };

  static SkalaTriaseModel newSkala = SkalaTriaseModel(
      nyeri: 0,
      nyeriP: "",
      nyeriQ: "",
      nyeriR: "",
      nyeriS: "",
      nyeriT: "",
      flaccWajah: 0,
      flaccKaki: 0,
      flaccAktifitas: 0,
      flaccMenangis: 0,
      flaccBersuara: 0,
      flaccTotal: 0,
      skalaTriase: 0);

  SkalaTriaseModel copyWith({
    int? nyeri,
    String? nyeriP,
    String? nyeriQ,
    String? nyeriR,
    String? nyeriS,
    String? nyeriT,
    int? flaccWajah,
    int? flaccKaki,
    int? flaccAktifitas,
    int? flaccMenangis,
    int? flaccBersuara,
    int? flaccTotal,
    int? skalaTriase,
  }) {
    return SkalaTriaseModel(
      nyeri: nyeri ?? this.nyeri,
      nyeriP: nyeriP ?? this.nyeriP,
      nyeriQ: nyeriQ ?? this.nyeriQ,
      nyeriR: nyeriR ?? this.nyeriR,
      nyeriS: nyeriS ?? this.nyeriS,
      nyeriT: nyeriT ?? this.nyeriT,
      flaccWajah: flaccWajah ?? this.flaccWajah,
      flaccKaki: flaccKaki ?? this.flaccKaki,
      flaccAktifitas: flaccAktifitas ?? this.flaccAktifitas,
      flaccMenangis: flaccMenangis ?? this.flaccMenangis,
      flaccBersuara: flaccBersuara ?? this.flaccBersuara,
      flaccTotal: flaccTotal ?? this.flaccTotal,
      skalaTriase: skalaTriase ?? this.skalaTriase,
    );
  }
}
