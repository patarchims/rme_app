import 'package:equatable/equatable.dart';

class CpptPasienModel extends Equatable {
  final String bagian;
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
        id: json["id_cppt"],
        instruksiPpa: json["instruksi_ppa"],
        bagian: json["bagian"],
        tanggal: json["tanggal"],
        subjektif: json["subjektif"],
        objectif: json["objectif"],
        asesmen: json["asesmen"],
        plan: json["plan"],
        ppa: json["ppa"],
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
