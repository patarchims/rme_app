import 'dart:convert';

class AssesRawatJalanModel {
  final String kelUtama;
  final String riwayatPenyakit;
  final String riwayatObat;
  final String riwayatObatDetail;
  final String tekananDarah;
  final String nadi;
  final String suhu;
  final String pernapasan;
  final String beratBadan;
  final String tinggiBadan;
  final String fungsional;
  final String fungsionalDetail;
  final String resikoJatuh1;
  final String resikoJatuh2;
  final String hasilKajiResikoJatuh;
  final String hasilKajiResikoJatuhTindakan;
  final String nyeri;
  final String psikologis;
  final String psikologisDetail;
  final String pulang1;
  final String pulang1Detail;
  final String pulang2;
  final String pulang2Detail;
  final String pulang3;
  final String pulang3Detail;
  final String masalahKeperawatan;
  final String rencanaKeperawatan;
  final String aseskepUser;
  final String aseskepTgl;
  final String aseskepJam;

  AssesRawatJalanModel({
    required this.kelUtama,
    required this.riwayatPenyakit,
    required this.riwayatObat,
    required this.riwayatObatDetail,
    required this.tekananDarah,
    required this.nadi,
    required this.suhu,
    required this.pernapasan,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.fungsional,
    required this.fungsionalDetail,
    required this.resikoJatuh1,
    required this.resikoJatuh2,
    required this.hasilKajiResikoJatuh,
    required this.hasilKajiResikoJatuhTindakan,
    required this.nyeri,
    required this.psikologis,
    required this.psikologisDetail,
    required this.pulang1,
    required this.pulang1Detail,
    required this.pulang2,
    required this.pulang2Detail,
    required this.pulang3,
    required this.pulang3Detail,
    required this.masalahKeperawatan,
    required this.rencanaKeperawatan,
    required this.aseskepUser,
    required this.aseskepTgl,
    required this.aseskepJam,
  });

  String toJson() => json.encode(toMap());

  factory AssesRawatJalanModel.fromMap(Map<String, dynamic> json) =>
      AssesRawatJalanModel(
        kelUtama: json["kelUtama"].toString(),
        riwayatPenyakit: json["riwayatPenyakit"].toString(),
        riwayatObat: json["riwayatObat"].toString(),
        riwayatObatDetail: json["riwayatObatDetail"].toString(),
        tekananDarah: json["tekananDarah"].toString(),
        nadi: json["nadi"].toString(),
        suhu: json["suhu"].toString(),
        pernapasan: json["pernapasan"].toString(),
        beratBadan: json["beratBadan"].toString(),
        tinggiBadan: json["tinggiBadan"].toString(),
        fungsional: json["fungsional"].toString(),
        fungsionalDetail: json["fungsionalDetail"].toString(),
        resikoJatuh1: json["resikoJatuh1"].toString(),
        resikoJatuh2: json["resikoJatuh2"].toString(),
        hasilKajiResikoJatuh: json["hasilKajiResikoJatuh"].toString(),
        hasilKajiResikoJatuhTindakan:
            json["hasilKajiResikoJatuhTindakan"].toString(),
        nyeri: json["nyeri"].toString(),
        psikologis: json["psikologis"].toString(),
        psikologisDetail: json["psikologisDetail"].toString(),
        pulang1: json["pulang1"].toString(),
        pulang1Detail: json["pulang1Detail"].toString(),
        pulang2: json["pulang2"].toString(),
        pulang2Detail: json["pulang2Detail"].toString(),
        pulang3: json["pulang3"].toString(),
        pulang3Detail: json["pulang3Detail"].toString(),
        masalahKeperawatan: json["masalahKeperawatan"].toString(),
        rencanaKeperawatan: json["rencanaKeperawatan"].toString(),
        aseskepUser: json["aseskepUser"].toString(),
        aseskepTgl: json["aseskepTgl"].toString(),
        aseskepJam: json["aseskepJam"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "kelUtama": kelUtama,
        "riwayatObat": riwayatObat,
        "riwayatObatDetail": riwayatObatDetail,
        "tekananDarah": tekananDarah,
        "nadi": nadi,
        "suhu": suhu,
        "pernapasan": pernapasan,
        "beratBadan": beratBadan,
        "tinggiBadan": tinggiBadan,
        "fungsional": fungsional,
        "fungsionalDetail": fungsionalDetail,
        "resikoJatuh1": resikoJatuh1,
        "resikoJatuh2": resikoJatuh2,
        "hasilKajiResikoJatuh": hasilKajiResikoJatuh,
        "hasilKajiResikoJatuhTindakan": hasilKajiResikoJatuhTindakan,
        "nyeri": nyeri,
        "psikologis": psikologis,
        "psikologisDetail": psikologisDetail,
        "pulang1": pulang1,
        "pulang1Detail": pulang1Detail,
        "pulang2": pulang2,
        "pulang2Detail": pulang2Detail,
        "pulang3": pulang3,
        "pulang3Detail": pulang3Detail,
        "masalahKeperawatan": masalahKeperawatan,
        "rencanaKeperawatan": rencanaKeperawatan,
        "aseskepUser": aseskepUser,
        "aseskepTgl": aseskepTgl,
        "aseskepJam": aseskepJam,
      };
}
