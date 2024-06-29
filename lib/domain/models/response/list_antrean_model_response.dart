import 'package:equatable/equatable.dart';

class AntreanPasienModel extends Equatable {
  final String noAntrean;
  final int usia;
  final String debitur;
  final String kdDebitur;
  final String noreg;
  final String regType;
  final String mrn;
  final String status;
  final String keterangan;
  final String proses;
  final String namaPasien;
  final String bagian;
  final String kdBagian;
  final String pelayanan;
  final String namaDokter;
  final String jenisKelamin;
  final String tglLahir;
  final String kdKelas;
  final String kelas;
  final String kasur;
  final String kamar;
  final String umur;
  final String kdDokter;
  const AntreanPasienModel({
    required this.noAntrean,
    required this.usia,
    required this.debitur,
    required this.kdDebitur,
    required this.noreg,
    required this.regType,
    required this.mrn,
    required this.status,
    required this.keterangan,
    required this.proses,
    required this.namaPasien,
    required this.kdBagian,
    required this.bagian,
    required this.pelayanan,
    required this.namaDokter,
    required this.jenisKelamin,
    required this.tglLahir,
    required this.kdKelas,
    required this.umur,
    required this.kdDokter,
    required this.kelas,
    required this.kasur,
    required this.kamar,
  });

  factory AntreanPasienModel.fromMap(Map<String, dynamic> json) =>
      AntreanPasienModel(
        kamar: json["kamar"].toString(),
        kasur: json["kasur"].toString(),
        usia: json["usia"] as int,
        kdBagian: json["kd_bagian"].toString(),
        tglLahir: json["tglLahir"].toString(),
        jenisKelamin: json["jenisKelamin"].toString(),
        noAntrean: json["noAntrean"].toString(),
        debitur: json["debitur"].toString(),
        kdDebitur: json["kdDebitur"].toString(),
        noreg: json["noreg"].toString(),
        regType: json["regType"].toString(),
        mrn: json["mrn"].toString(),
        status: json["status"].toString(),
        keterangan: json["keterangan"].toString(),
        proses: json["proses"].toString(),
        namaPasien: json["namaPasien"].toString(),
        bagian: json["bagian"].toString(),
        pelayanan: json["pelayanan"].toString(),
        namaDokter: json["namaDokter"].toString(),
        kdKelas: json["kdKelas"].toString(),
        kelas: json["kelas"].toString(),
        umur: json["umur"].toString(),
        kdDokter: json["kdDokter"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "jenisKelamin": jenisKelamin,
        "usia": usia,
        "noAntrean": noAntrean,
        "debitur": debitur,
        "kdDebitur": kdDebitur,
        "noreg": noreg,
        "regType": regType,
        "mrn": mrn,
        "status": status,
        "keterangan": keterangan,
        "proses": proses,
        "namaPasien": namaPasien,
        "bagian": bagian,
        "pelayanan": pelayanan,
        "namaDokter": namaDokter,
        "tglLahir": tglLahir,
        "kd_bagian": kdBagian,
        "umur": umur,
        "kdDokter": kdDokter,
        "kdKelas": kdKelas
      };

  @override
  List<Object?> get props => [
        kdBagian,
        usia,
        jenisKelamin,
        debitur,
        kdDebitur,
        noAntrean,
        noreg,
        regType,
        mrn,
        status,
        keterangan,
        proses,
        namaPasien,
        bagian,
        pelayanan,
        namaDokter,
        tglLahir,
        kdKelas,
        umur,
        kdDokter
      ];
}
