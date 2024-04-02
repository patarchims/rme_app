import 'dart:convert';

import 'package:hms_app/domain/models/odontogram/odontogram_model.dart';

class AssementRawatJalanModel {
  final DataMedik dataMedik;
  final IntraOral intraOral;
  final String kelUtama;
  final List<OdontogramModel>? odontogram;
  final String pelayanan;
  final PemeriksaanGigi pemeriksaanGigi;
  final Riwayat riwayat;
  final String? kdBagian;
  final String? noReg;

  AssementRawatJalanModel({
    this.kdBagian,
    this.noReg,
    required this.dataMedik,
    required this.intraOral,
    required this.kelUtama,
    this.odontogram,
    required this.pelayanan,
    required this.pemeriksaanGigi,
    required this.riwayat,
  });

  factory AssementRawatJalanModel.fromJson(String str) =>
      AssementRawatJalanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AssementRawatJalanModel.fromMap(Map<String, dynamic> json) =>
      AssementRawatJalanModel(
        kdBagian: json["kdBagian"].toString(),
        noReg: json["noReg"].toString(),
        dataMedik: DataMedik.fromMap(json["dataMedik"]),
        intraOral: IntraOral.fromMap(json["intraOral"]),
        kelUtama: json["kelUtama"],
        // odontogram: List<OdontogramModel>.from(
        //     json["odontogram"].map((x) => OdontogramModel.fromMap(x))),
        pelayanan: json["pelayanan"],
        pemeriksaanGigi: PemeriksaanGigi.fromMap(json["pemeriksaanGigi"]),
        riwayat: Riwayat.fromMap(json["riwayat"]),
      );

  Map<String, dynamic> toMap() => {
        "kdBagian": kdBagian,
        "noReg": noReg,
        "dataMedik": dataMedik.toMap(),
        "intraOral": intraOral.toMap(),
        "kelUtama": kelUtama,
        "pelayanan": pelayanan,
        "pemeriksaanGigi": pemeriksaanGigi.toMap(),
        "riwayat": riwayat.toMap(),
      };
}

class DataMedik {
  final String golDarah;
  final String tdDarah;
  final String tdDarahDetail;
  final String penyJantung;
  final String penyJantungDetail;
  final String diabet;
  final String diabetDetail;
  final String haemop;
  final String haemopDetail;
  final String hepatitis;
  final String hepatitisDetail;
  final String penyLain;
  final String penyLainDetail;
  final String alergiObat;
  final String alergiObatDetail;
  final String alergiMakanan;
  final String alergiMakananDetail;
  final String kebiasaanBuruk;

  DataMedik({
    required this.golDarah,
    required this.tdDarah,
    required this.tdDarahDetail,
    required this.penyJantung,
    required this.penyJantungDetail,
    required this.diabet,
    required this.diabetDetail,
    required this.haemop,
    required this.haemopDetail,
    required this.hepatitis,
    required this.hepatitisDetail,
    required this.penyLain,
    required this.penyLainDetail,
    required this.alergiObat,
    required this.alergiObatDetail,
    required this.alergiMakanan,
    required this.alergiMakananDetail,
    required this.kebiasaanBuruk,
  });

  factory DataMedik.fromJson(String str) => DataMedik.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataMedik.fromMap(Map<String, dynamic> json) => DataMedik(
        golDarah: json["golDarah"],
        tdDarah: json["tdDarah"],
        tdDarahDetail: json["tdDarahDetail"],
        penyJantung: json["penyJantung"],
        penyJantungDetail: json["penyJantungDetail"],
        diabet: json["diabet"],
        diabetDetail: json["diabetDetail"],
        haemop: json["haemop"],
        haemopDetail: json["haemopDetail"],
        hepatitis: json["hepatitis"],
        hepatitisDetail: json["hepatitisDetail"],
        penyLain: json["penyLain"],
        penyLainDetail: json["penyLainDetail"],
        alergiObat: json["alergiObat"],
        alergiObatDetail: json["alergiObatDetail"],
        alergiMakanan: json["alergiMakanan"],
        alergiMakananDetail: json["alergiMakananDetail"],
        kebiasaanBuruk: json["kebiasaanBuruk"],
      );

  Map<String, dynamic> toMap() => {
        "golDarah": golDarah,
        "tdDarah": tdDarah,
        "tdDarahDetail": tdDarahDetail,
        "penyJantung": penyJantung,
        "penyJantungDetail": penyJantungDetail,
        "diabet": diabet,
        "diabetDetail": diabetDetail,
        "haemop": haemop,
        "haemopDetail": haemopDetail,
        "hepatitis": hepatitis,
        "hepatitisDetail": hepatitisDetail,
        "penyLain": penyLain,
        "penyLainDetail": penyLainDetail,
        "alergiObat": alergiObat,
        "alergiObatDetail": alergiObatDetail,
        "alergiMakanan": alergiMakanan,
        "alergiMakananDetail": alergiMakananDetail,
        "kebiasaanBuruk": kebiasaanBuruk,
      };
}

class IntraOral {
  final String aterior;
  final String posterior;
  final String hubMoral;
  final String palatum;
  final String torusPalatinus;
  final String torusMandibulari;
  final String torusMandibulariDetail;
  final String superTeeth;
  final String superTeethDetail;
  final String diastema;
  final String diastemaDetail;
  final String gigiAnomali;
  final String gigiAnomaliDetail;
  final String lainnya;

  IntraOral({
    required this.aterior,
    required this.posterior,
    required this.hubMoral,
    required this.palatum,
    required this.torusPalatinus,
    required this.torusMandibulari,
    required this.torusMandibulariDetail,
    required this.superTeeth,
    required this.superTeethDetail,
    required this.diastema,
    required this.diastemaDetail,
    required this.gigiAnomali,
    required this.gigiAnomaliDetail,
    required this.lainnya,
  });

  factory IntraOral.fromJson(String str) => IntraOral.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IntraOral.fromMap(Map<String, dynamic> json) => IntraOral(
        aterior: json["aterior"],
        posterior: json["posterior"],
        hubMoral: json["hubMoral"],
        palatum: json["palatum"],
        torusPalatinus: json["torusPalatinus"],
        torusMandibulari: json["torusMandibulari"],
        torusMandibulariDetail: json["torusMandibulariDetail"],
        superTeeth: json["superTeeth"],
        superTeethDetail: json["superTeethDetail"],
        diastema: json["diastema"],
        diastemaDetail: json["diastemaDetail"],
        gigiAnomali: json["gigiAnomali"],
        gigiAnomaliDetail: json["gigiAnomaliDetail"],
        lainnya: json["lainnya"],
      );

  Map<String, dynamic> toMap() => {
        "aterior": aterior,
        "posterior": posterior,
        "hubMoral": hubMoral,
        "palatum": palatum,
        "torusPalatinus": torusPalatinus,
        "torusMandibulari": torusMandibulari,
        "torusMandibulariDetail": torusMandibulariDetail,
        "superTeeth": superTeeth,
        "superTeethDetail": superTeethDetail,
        "diastema": diastema,
        "diastemaDetail": diastemaDetail,
        "gigiAnomali": gigiAnomali,
        "gigiAnomaliDetail": gigiAnomaliDetail,
        "lainnya": lainnya,
      };
}

class PemeriksaanGigi {
  final String pemGigi1;
  final String pemGigi2;
  final String pemGigi3;
  final String pemGigi4;
  final String pemGigi5;
  final String pemGigi5Detail;

  PemeriksaanGigi({
    required this.pemGigi1,
    required this.pemGigi2,
    required this.pemGigi3,
    required this.pemGigi4,
    required this.pemGigi5,
    required this.pemGigi5Detail,
  });

  factory PemeriksaanGigi.fromJson(String str) =>
      PemeriksaanGigi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PemeriksaanGigi.fromMap(Map<String, dynamic> json) => PemeriksaanGigi(
        pemGigi1: json["pemGigi1"],
        pemGigi2: json["pemGigi2"],
        pemGigi3: json["pemGigi3"],
        pemGigi4: json["pemGigi4"],
        pemGigi5: json["pemGigi5"],
        pemGigi5Detail: json["pemGigi5Detail"],
      );

  Map<String, dynamic> toMap() => {
        "pemGigi1": pemGigi1,
        "pemGigi2": pemGigi2,
        "pemGigi3": pemGigi3,
        "pemGigi4": pemGigi4,
        "pemGigi5": pemGigi5,
        "pemGigi5Detail": pemGigi5Detail,
      };
}

class Riwayat {
  final String riwayatSekarang;
  final String riwayatDulu;
  final String riwayatObat;
  final String riwayatPenyakitKlrg;
  final String riwayatAlergi;
  final String riwayatAlergiDetail;

  Riwayat({
    required this.riwayatSekarang,
    required this.riwayatDulu,
    required this.riwayatObat,
    required this.riwayatPenyakitKlrg,
    required this.riwayatAlergi,
    required this.riwayatAlergiDetail,
  });

  factory Riwayat.fromJson(String str) => Riwayat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Riwayat.fromMap(Map<String, dynamic> json) => Riwayat(
        riwayatSekarang: json["riwayatSekarang"],
        riwayatDulu: json["riwayatDulu"],
        riwayatObat: json["riwayatObat"],
        riwayatPenyakitKlrg: json["riwayatPenyakitKlrg"],
        riwayatAlergi: json["riwayatAlergi"],
        riwayatAlergiDetail: json["riwayatAlergiDetail"],
      );

  Map<String, dynamic> toMap() => {
        "riwayatSekarang": riwayatSekarang,
        "riwayatDulu": riwayatDulu,
        "riwayatObat": riwayatObat,
        "riwayatPenyakitKlrg": riwayatPenyakitKlrg,
        "riwayatAlergi": riwayatAlergi,
        "riwayatAlergiDetail": riwayatAlergiDetail,
      };
}
