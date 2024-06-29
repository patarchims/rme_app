// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hms_app/domain/models/asuhan_keperawatan/hasil_asuhan_keperawatan_model.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/tindakan_model.dart';

class ResumeKeperawatan {
  String hasil;
  String tanggal;
  String insertDttm;
  String kodeDiagnosa;
  String noDaskep;
  DiagnosaAsu diagnosa;
  Bagian bagian;
  Perawat perawat;
  List<DeskripsiSlki> deskripsiSlki;
  List<DeskripsiSiki> deskripsiSiki;
  List<TindakanModel> tindakanModel;

  ResumeKeperawatan({
    required this.hasil,
    required this.insertDttm,
    required this.tanggal,
    required this.bagian,
    required this.perawat,
    required this.kodeDiagnosa,
    required this.noDaskep,
    required this.diagnosa,
    required this.deskripsiSlki,
    required this.deskripsiSiki,
    required this.tindakanModel,
  });

  factory ResumeKeperawatan.fromJson(Map<String, dynamic> json) =>
      ResumeKeperawatan(
        tanggal: json["tanggal"].toString(),
        insertDttm: json["insert_dttm"].toString(),
        perawat: Perawat.fromJson(json["perawat"]),
        bagian: Bagian.fromJson(json["bagian"]),
        hasil: json["hasil"].toString(),
        kodeDiagnosa: json["kode_diagnosa"].toString(),
        noDaskep: json["no_daskep"].toString(),
        diagnosa: DiagnosaAsu.fromJson(json["diagnosa"]),
        deskripsiSlki: List<DeskripsiSlki>.from(
            json["deskripsi_slki"].map((x) => DeskripsiSlki.fromJson(x))),
        tindakanModel: List<TindakanModel>.from(
            json["tindakan"].map((x) => TindakanModel.fromJson(x))),
        deskripsiSiki: List<DeskripsiSiki>.from(
            json["deskripsi_siki"].map((x) => DeskripsiSiki.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "hasil": hasil,
        "kode_diagnosa": kodeDiagnosa,
        "no_daskep": noDaskep,
        "diagnosa": diagnosa.toJson(),
        "deskripsi_slki":
            List<dynamic>.from(deskripsiSlki.map((x) => x.toJson())),
        "deskripsi_siki":
            List<dynamic>.from(deskripsiSiki.map((x) => x.toJson())),
      };

  ResumeKeperawatan copyWith({
    String? hasil,
    String? tanggal,
    String? insertDttm,
    String? kodeDiagnosa,
    String? noDaskep,
    DiagnosaAsu? diagnosa,
    Bagian? bagian,
    Perawat? perawat,
    List<DeskripsiSlki>? deskripsiSlki,
    List<DeskripsiSiki>? deskripsiSiki,
    List<TindakanModel>? tindakanModel,
  }) {
    return ResumeKeperawatan(
      tindakanModel: tindakanModel ?? this.tindakanModel,
      insertDttm: insertDttm ?? this.insertDttm,
      tanggal: tanggal ?? this.tanggal,
      bagian: bagian ?? this.bagian,
      perawat: perawat ?? this.perawat,
      hasil: hasil ?? this.hasil,
      kodeDiagnosa: kodeDiagnosa ?? this.kodeDiagnosa,
      noDaskep: noDaskep ?? this.noDaskep,
      diagnosa: diagnosa ?? this.diagnosa,
      deskripsiSlki: deskripsiSlki ?? this.deskripsiSlki,
      deskripsiSiki: deskripsiSiki ?? this.deskripsiSiki,
    );
  }
}
