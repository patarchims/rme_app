import 'package:equatable/equatable.dart';

class CpptPasienModel extends Equatable {
  final String bagian;
  final String insertDttm;
  final int id;
  final String tanggal;
  final String objectif;
  final String subjektif;
  final String asesmen;
  final String plan;
  final String ppa;
  final String instruksiPpa;

  const CpptPasienModel({
    required this.id,
    required this.insertDttm,
    required this.instruksiPpa,
    required this.bagian,
    required this.tanggal,
    required this.subjektif,
    required this.objectif,
    required this.asesmen,
    required this.plan,
    required this.ppa,
  });

  factory CpptPasienModel.fromJson(Map<String, dynamic> json) =>
      CpptPasienModel(
        insertDttm: json["insert_dttm"].toString(),
        id: json["id_cppt"] as int,
        instruksiPpa: json["instruksi_ppa"].toString(),
        bagian: json["bagian"].toString(),
        tanggal: json["tanggal"].toString(),
        subjektif: json["subjektif"].toString(),
        objectif: json["objectif"].toString(),
        asesmen: json["asesmen"].toString(),
        plan: json["plan"].toString(),
        ppa: json["ppa"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id_cppt": id,
        "instruksi_ppa": instruksiPpa,
        "bagian": bagian,
        "tanggal": tanggal,
        "objectif": objectif,
        "asesmen": asesmen,
        "subjektif": subjektif,
        "plan": plan,
        "ppa": ppa,
      };

  @override
  List<Object?> get props =>
      [bagian, tanggal, objectif, asesmen, plan, ppa, subjektif];
}
