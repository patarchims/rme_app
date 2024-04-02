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
  });

  factory AntreanPasienModel.fromMap(Map<String, dynamic> json) =>
      AntreanPasienModel(
        usia: json["usia"] as int,
        kdBagian: json["kd_bagian"].toString(),
        tglLahir: json["tglLahir"].toString(),
        jenisKelamin: json["jenisKelamin"].toString(),
        noAntrean: json["noAntrean"].toString(),
        debitur: json["debitur"].toString(),
        kdDebitur: json["kdDebitur"].toString(),
        noreg: json["noreg"],
        regType: json["regType"],
        mrn: json["mrn"],
        status: json["status"],
        keterangan: json["keterangan"],
        proses: json["proses"],
        namaPasien: json["namaPasien"],
        bagian: json["bagian"],
        pelayanan: json["pelayanan"],
        namaDokter: json["namaDokter"],
        kdKelas: json["kdKelas"],
        umur: json["umur"],
        kdDokter: json["kdDokter"],
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
