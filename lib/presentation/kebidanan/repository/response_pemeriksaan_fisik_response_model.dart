// ignore_for_file: public_member_api_docs, sort_constructors_first
class PemeriksaanFisikResponseModel {
  String insertDttm;
  String updDttm;
  String device;
  String userId;
  String kategori;
  String person;
  String kdBagian;
  String noreg;
  String kepala;
  String mata;
  String telinga;
  String mulut;
  String mucosaMulut;
  String gigi;
  String hidung;
  String tenggorokan;
  String payudara;
  String leherDanBahu;
  String abdomen;
  String nutrisiDanHidrasi;

  PemeriksaanFisikResponseModel({
    required this.insertDttm,
    required this.updDttm,
    required this.device,
    required this.userId,
    required this.kategori,
    required this.nutrisiDanHidrasi,
    required this.person,
    required this.kdBagian,
    required this.noreg,
    required this.kepala,
    required this.mata,
    required this.telinga,
    required this.mulut,
    required this.mucosaMulut,
    required this.gigi,
    required this.hidung,
    required this.tenggorokan,
    required this.payudara,
    required this.leherDanBahu,
    required this.abdomen,
  });

  factory PemeriksaanFisikResponseModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikResponseModel(
        nutrisiDanHidrasi: json["nutrisi_dan_hidrasi"],
        insertDttm: json["insert_dttm"],
        updDttm: json["upd_dttm"],
        device: json["device"],
        userId: json["user_id"],
        kategori: json["kategori"],
        person: json["person"],
        kdBagian: json["kd_bagian"],
        noreg: json["noreg"],
        kepala: json["kepala"],
        mata: json["mata"],
        telinga: json["telinga"],
        mulut: json["mulut"],
        mucosaMulut: json["mucosa_mulut"],
        gigi: json["gigi"],
        hidung: json["hidung"],
        tenggorokan: json["tenggorokan"],
        payudara: json["payudara"],
        leherDanBahu: json["leher_dan_bahu"],
        abdomen: json["abodmen"],
      );

  Map<String, dynamic> toJson() => {
        "nutrisi_dan_hidrasi": nutrisiDanHidrasi,
        "insert_dttm": insertDttm,
        "upd_dttm": updDttm,
        "device": device,
        "mucosa_mulut": mucosaMulut,
        "user_id": userId,
        "kategori": kategori,
        "person": person,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "kepala": kepala,
        "mata": mata,
        "telinga": telinga,
        "mulut": mulut,
        "gigi": gigi,
        "hidung": hidung,
        "tenggorokan": tenggorokan,
        "payudara": payudara,
        "leher_dan_bahu": leherDanBahu,
        "abdomen": abdomen,
      };

  PemeriksaanFisikResponseModel copyWith({
    String? insertDttm,
    String? updDttm,
    String? device,
    String? userId,
    String? kategori,
    String? person,
    String? kdBagian,
    String? noreg,
    String? kepala,
    String? mata,
    String? telinga,
    String? mulut,
    String? gigi,
    String? hidung,
    String? tenggorokan,
    String? payudara,
    String? leherDanBahu,
    String? mucosaMulut,
    String? abdomen,
    String? nutrisiDanHidrasi,
  }) {
    return PemeriksaanFisikResponseModel(
      nutrisiDanHidrasi: nutrisiDanHidrasi ?? this.nutrisiDanHidrasi,
      abdomen: abdomen ?? this.abdomen,
      mucosaMulut: mucosaMulut ?? this.mucosaMulut,
      insertDttm: insertDttm ?? this.insertDttm,
      updDttm: updDttm ?? this.updDttm,
      device: device ?? this.device,
      userId: userId ?? this.userId,
      kategori: kategori ?? this.kategori,
      person: person ?? this.person,
      kdBagian: kdBagian ?? this.kdBagian,
      noreg: noreg ?? this.noreg,
      kepala: kepala ?? this.kepala,
      mata: mata ?? this.mata,
      telinga: telinga ?? this.telinga,
      mulut: mulut ?? this.mulut,
      gigi: gigi ?? this.gigi,
      hidung: hidung ?? this.hidung,
      tenggorokan: tenggorokan ?? this.tenggorokan,
      payudara: payudara ?? this.payudara,
      leherDanBahu: leherDanBahu ?? this.leherDanBahu,
    );
  }
}

class PemeriksaanFisikLainnya {
  String kepala;
  String mata;
  String telinga;
  String mulut;
  String mucosaMulut;
  String gigi;
  String hidung;
  String tenggorokan;
  String payudara;
  String leherDanBahu;
  String abdomen;
  String nutrisiDanHidrasi;
  PemeriksaanFisikLainnya({
    required this.kepala,
    required this.mata,
    required this.telinga,
    required this.mulut,
    required this.mucosaMulut,
    required this.gigi,
    required this.hidung,
    required this.tenggorokan,
    required this.payudara,
    required this.leherDanBahu,
    required this.abdomen,
    required this.nutrisiDanHidrasi,
  });

  PemeriksaanFisikLainnya copyWith({
    String? kepala,
    String? mata,
    String? telinga,
    String? mulut,
    String? mucosaMulut,
    String? gigi,
    String? hidung,
    String? tenggorokan,
    String? payudara,
    String? leherDanBahu,
    String? abdomen,
    String? nutrisiDanHidrasi,
  }) {
    return PemeriksaanFisikLainnya(
      kepala: kepala ?? this.kepala,
      mata: mata ?? this.mata,
      telinga: telinga ?? this.telinga,
      mulut: mulut ?? this.mulut,
      mucosaMulut: mucosaMulut ?? this.mucosaMulut,
      gigi: gigi ?? this.gigi,
      hidung: hidung ?? this.hidung,
      tenggorokan: tenggorokan ?? this.tenggorokan,
      payudara: payudara ?? this.payudara,
      leherDanBahu: leherDanBahu ?? this.leherDanBahu,
      abdomen: abdomen ?? this.abdomen,
      nutrisiDanHidrasi: nutrisiDanHidrasi ?? this.nutrisiDanHidrasi,
    );
  }
}
