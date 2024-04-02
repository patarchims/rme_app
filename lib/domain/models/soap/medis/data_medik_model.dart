class DataMedikModel {
  String golDarah;
  String tekananDarah;
  String tekananDarahDetail;
  String penyJantung;
  String penyJantungDetail;
  String diabet;
  String diabetDetail;
  String haemop;
  String haemopDetail;
  String hepat;
  String hepatDetail;
  String penyLain;
  String penyLainDetail;
  String alergiObat;
  String alergiObatDetail;
  String alergiMakanan;
  String alergiMakananDetail;
  String kebiasaanBuruk;
  String kdBagian;

  DataMedikModel({
    required this.golDarah,
    required this.tekananDarah,
    required this.tekananDarahDetail,
    required this.penyJantung,
    required this.penyJantungDetail,
    required this.diabet,
    required this.diabetDetail,
    required this.haemop,
    required this.haemopDetail,
    required this.hepat,
    required this.hepatDetail,
    required this.penyLain,
    required this.penyLainDetail,
    required this.alergiObat,
    required this.alergiObatDetail,
    required this.alergiMakanan,
    required this.alergiMakananDetail,
    required this.kebiasaanBuruk,
    required this.kdBagian,
  });

  factory DataMedikModel.fromJson(Map<String, dynamic> json) => DataMedikModel(
        golDarah: json["golDarah"],
        tekananDarah: json["tekananDarah"],
        tekananDarahDetail: json["tekananDarahDetail"],
        penyJantung: json["penyJantung"],
        penyJantungDetail: json["penyJantungDetail"],
        diabet: json["diabet"],
        diabetDetail: json["diabetDetail"],
        haemop: json["haemop"],
        haemopDetail: json["haemopDetail"],
        hepat: json["hepat"],
        hepatDetail: json["hepatDetail"],
        penyLain: json["penyLain"],
        penyLainDetail: json["penyLainDetail"],
        alergiObat: json["alergiObat"],
        alergiObatDetail: json["alergiObatDetail"],
        alergiMakanan: json["alergiMakanan"],
        alergiMakananDetail: json["alergiMakananDetail"],
        kebiasaanBuruk: json["kebiasaanBuruk"],
        kdBagian: json["kdBagian"],
      );

  Map<String, dynamic> toJson() => {
        "golDarah": golDarah,
        "tekananDarah": tekananDarah,
        "tekananDarahDetail": tekananDarahDetail,
        "penyJantung": penyJantung,
        "penyJantungDetail": penyJantungDetail,
        "diabet": diabet,
        "diabetDetail": diabetDetail,
        "haemop": haemop,
        "haemopDetail": haemopDetail,
        "hepat": hepat,
        "hepatDetail": hepatDetail,
        "penyLain": penyLain,
        "penyLainDetail": penyLainDetail,
        "alergiObat": alergiObat,
        "alergiObatDetail": alergiObatDetail,
        "alergiMakanan": alergiMakanan,
        "alergiMakananDetail": alergiMakananDetail,
        "kebiasaanBuruk": kebiasaanBuruk,
        "kdBagian": kdBagian,
      };
}
