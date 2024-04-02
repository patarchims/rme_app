import 'package:hms_app/presentation/component/component.dart';

class PemeriksaanFisikIgdModel {
  String mata;
  String? mataDetail;
  String tht;
  String mulut;
  String gigi;
  String thyroid;
  String leherLainnya;
  String dindingDada;
  String suaraJantung;
  String suaraParu;
  String dindingPerut;
  String hati;
  String lien;
  String peristatikUsus;
  String abdomenDetail;
  String kulit;
  String ginjal;
  String genetalia;
  String superior;
  String inferior;

  PemeriksaanFisikIgdModel({
    required this.mata,
    this.mataDetail,
    required this.tht,
    required this.mulut,
    required this.gigi,
    required this.thyroid,
    required this.leherLainnya,
    required this.dindingDada,
    required this.suaraJantung,
    required this.suaraParu,
    required this.dindingPerut,
    required this.hati,
    required this.lien,
    required this.peristatikUsus,
    required this.abdomenDetail,
    required this.kulit,
    required this.ginjal,
    required this.genetalia,
    required this.superior,
    required this.inferior,
  });

  factory PemeriksaanFisikIgdModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikIgdModel(
        mata: json["mata"],
        mataDetail: json["mata_detail"],
        tht: json["tht"],
        mulut: json["mulut"],
        gigi: json["gigi"],
        thyroid: json["thyroid"],
        leherLainnya: json["leher_lainnya"],
        dindingDada: json["dinding_dada"],
        suaraJantung: json["suara_jantung"],
        suaraParu: json["suara_paru"],
        dindingPerut: json["dinding_perut"],
        hati: json["hati"],
        lien: json["lien"],
        peristatikUsus: json["peristatik_usus"],
        abdomenDetail: json["abdomen_detail"],
        kulit: json["kulit"],
        ginjal: json["ginjal"],
        genetalia: json["genetalia"],
        superior: json["superior"],
        inferior: json["inferior"],
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
        "mata": toMata(
            value: mata,
            newalue: (mataDetail == null) ? "" : mataDetail.toString()),
        "tht": tht,
        "mulut": mulut,
        "gigi": gigi,
        "thyroid": thyroid,
        "leher_lainnya": leherLainnya,
        "dinding_dada": dindingDada,
        "suara_jantung": suaraJantung,
        "suara_paru": suaraParu,
        "dinding_perut": dindingPerut,
        "hati": hati,
        "lien": lien,
        "peristatik_usus": peristatikUsus,
        "abdomen_detail": abdomenDetail,
        "kulit": kulit,
        "ginjal": ginjal,
        "genetalia": genetalia,
        "superior": superior,
        "inferior": inferior,
      };

  PemeriksaanFisikIgdModel copyWith({
    String? mata,
    String? tht,
    String? mulut,
    String? gigi,
    String? thyroid,
    String? leherLainnya,
    String? dindingDada,
    String? suaraJantung,
    String? suaraParu,
    String? dindingPerut,
    String? hati,
    String? lien,
    String? peristatikUsus,
    String? abdomenDetail,
    String? kulit,
    String? ginjal,
    String? genetalia,
    String? superior,
    String? inferior,
    String? mataDetail,
  }) {
    return PemeriksaanFisikIgdModel(
      mataDetail: mataDetail ?? this.mataDetail,
      mata: mata ?? this.mata,
      tht: tht ?? this.tht,
      mulut: mulut ?? this.mulut,
      gigi: gigi ?? this.gigi,
      thyroid: thyroid ?? this.thyroid,
      leherLainnya: leherLainnya ?? this.leherLainnya,
      dindingDada: dindingDada ?? this.dindingDada,
      suaraJantung: suaraJantung ?? this.suaraJantung,
      suaraParu: suaraParu ?? this.suaraParu,
      dindingPerut: dindingPerut ?? this.dindingPerut,
      hati: hati ?? this.hati,
      lien: lien ?? this.lien,
      peristatikUsus: peristatikUsus ?? this.peristatikUsus,
      abdomenDetail: abdomenDetail ?? this.abdomenDetail,
      kulit: kulit ?? this.kulit,
      ginjal: ginjal ?? this.ginjal,
      genetalia: genetalia ?? this.genetalia,
      superior: superior ?? this.superior,
      inferior: inferior ?? this.inferior,
    );
  }
}

String toMata({required String value, required String newalue}) {
  return value.replaceAll(
      RegExp(Constants.lainnya), "${Constants.lainnya} : $newalue");
}
