class ReportRingkasanPulangResponseModel {
  final Pasien pasien;
  final RingkasanPulang ringkasanPulang;

  ReportRingkasanPulangResponseModel({
    required this.pasien,
    required this.ringkasanPulang,
  });

  factory ReportRingkasanPulangResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ReportRingkasanPulangResponseModel(
          pasien: Pasien.fromJson(json["pasien"]),
          ringkasanPulang: RingkasanPulang.fromJson(json["desc_pulang"]));

  Map<String, dynamic> toJson() => {
        "pasien": pasien.toJson(),
      };
}

class RingkasanPulang {
  String tglMasuk;
  String kdBagian;
  String pelayanan;
  String tglKeluar;
  String ttdDokter;
  String namaDokter;
  String anamnesa;
  String primer;
  String primerDesc;
  String pemfisik;
  String tglSelesai;
  String jamSelesai;
  String bagian;
  String diagS1;
  String secundary1;
  String asesmedDiags2;
  String diags2;
  String asesmedDiags3;
  String diagS3;
  String asesmedDiags4;
  String diagS4;
  String asesmedPros;
  String prosedur1;

  RingkasanPulang({
    required this.tglMasuk,
    required this.kdBagian,
    required this.pelayanan,
    required this.tglKeluar,
    required this.ttdDokter,
    required this.namaDokter,
    required this.anamnesa,
    required this.primer,
    required this.primerDesc,
    required this.pemfisik,
    required this.tglSelesai,
    required this.jamSelesai,
    required this.bagian,
    required this.diagS1,
    required this.secundary1,
    required this.asesmedDiags2,
    required this.diags2,
    required this.asesmedDiags3,
    required this.diagS3,
    required this.asesmedDiags4,
    required this.diagS4,
    required this.asesmedPros,
    required this.prosedur1,
  });

  factory RingkasanPulang.fromJson(Map<String, dynamic> json) =>
      RingkasanPulang(
        tglMasuk: json["tgl_masuk"],
        kdBagian: json["kd_bagian"],
        pelayanan: json["pelayanan"],
        tglKeluar: json["tgl_keluar"],
        ttdDokter: json["ttd_dokter"],
        namaDokter: json["nama_dokter"],
        anamnesa: json["anamnesa"],
        primer: json["primer"],
        primerDesc: json["primer_desc"],
        pemfisik: json["pemfisik"],
        tglSelesai: json["tgl_selesai"],
        jamSelesai: json["jam_selesai"],
        bagian: json["bagian"],
        diagS1: json["diag_s1"],
        secundary1: json["secundary1"],
        asesmedDiags2: json["asesmed_diags2"],
        diags2: json["diags2"],
        asesmedDiags3: json["asesmed_diags3"],
        diagS3: json["diag_s3"],
        asesmedDiags4: json["asesmed_diags4"],
        diagS4: json["diag_s4"],
        asesmedPros: json["asesmed_pros"],
        prosedur1: json["prosedur1"],
      );

  Map<String, dynamic> toJson() => {
        "tgl_masuk": tglMasuk,
        "kd_bagian": kdBagian,
        "pelayanan": pelayanan,
        "tgl_keluar": tglKeluar,
        "ttd_dokter": ttdDokter,
        "nama_dokter": namaDokter,
        "anamnesa": anamnesa,
        "primer": primer,
        "primer_desc": primerDesc,
        "pemfisik": pemfisik,
        "tgl_selesai": tglSelesai,
        "jam_selesai": jamSelesai,
        "bagian": bagian,
        "diag_s1": diagS1,
        "secundary1": secundary1,
        "asesmed_diags2": asesmedDiags2,
        "diags2": diags2,
        "asesmed_diags3": asesmedDiags3,
        "diag_s3": diagS3,
        "asesmed_diags4": asesmedDiags4,
        "diag_s4": diagS4,
        "asesmed_pros": asesmedPros,
        "prosedur1": prosedur1,
      };
}

class Pasien {
  final String nik;
  final String id;
  final String firstname;
  final String jenisKelamin;
  final String tglLahir;

  Pasien({
    required this.nik,
    required this.id,
    required this.firstname,
    required this.jenisKelamin,
    required this.tglLahir,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        nik: json["nik"].toString(),
        id: json["id"].toString(),
        firstname: json["firstname"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        tglLahir: json["tgl_lahir"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "id": id,
        "firstname": firstname,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
      };
}
