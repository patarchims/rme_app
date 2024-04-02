class RiwayatKehamilanModel {
  bool kehamilan;
  String gravida;
  String para;
  String abortus;
  String hpht;
  String ttp;
  String leopold1;
  String leopold2;
  String leopold3;
  String leopold4;
  String ddj;
  String vt;

  RiwayatKehamilanModel({
    required this.kehamilan,
    required this.gravida,
    required this.para,
    required this.abortus,
    required this.hpht,
    required this.ttp,
    required this.leopold1,
    required this.leopold2,
    required this.leopold3,
    required this.leopold4,
    required this.ddj,
    required this.vt,
  });

  factory RiwayatKehamilanModel.fromJson(Map<String, dynamic> json) =>
      RiwayatKehamilanModel(
        kehamilan: json["kehamilan"],
        gravida: json["gravida"],
        para: json["para"],
        abortus: json["abortus"],
        hpht: json["hpht"],
        ttp: json["ttp"],
        leopold1: json["leopold1"],
        leopold2: json["leopold2"],
        leopold3: json["leopold3"],
        leopold4: json["leopold4"],
        ddj: json["ddj"],
        vt: json["vt"],
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
        "kehamilan": kehamilan.toString(),
        "gravida": gravida,
        "para": para,
        "abortus": abortus,
        "hpht": hpht,
        "ttp": ttp,
        "leopold1": leopold1,
        "leopold2": leopold2,
        "leopold3": leopold3,
        "leopold4": leopold4,
        "ddj": ddj,
        "vt": vt,
      };

  RiwayatKehamilanModel copyWith({
    bool? kehamilan,
    String? gravida,
    String? para,
    String? abortus,
    String? hpht,
    String? ttp,
    String? leopold1,
    String? leopold2,
    String? leopold3,
    String? leopold4,
    String? ddj,
    String? vt,
  }) {
    return RiwayatKehamilanModel(
      kehamilan: kehamilan ?? this.kehamilan,
      gravida: gravida ?? this.gravida,
      para: para ?? this.para,
      abortus: abortus ?? this.abortus,
      hpht: hpht ?? this.hpht,
      ttp: ttp ?? this.ttp,
      leopold1: leopold1 ?? this.leopold1,
      leopold2: leopold2 ?? this.leopold2,
      leopold3: leopold3 ?? this.leopold3,
      leopold4: leopold4 ?? this.leopold4,
      ddj: ddj ?? this.ddj,
      vt: vt ?? this.vt,
    );
  }
}
