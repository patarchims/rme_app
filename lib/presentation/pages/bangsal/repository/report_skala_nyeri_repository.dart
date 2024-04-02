class ReportSkalaNyeri {
  Karyawan karyawan;
  SkalaNyeri skalaNyeri;

  ReportSkalaNyeri({
    required this.karyawan,
    required this.skalaNyeri,
  });

  factory ReportSkalaNyeri.fromJson(Map<String, dynamic> json) =>
      ReportSkalaNyeri(
        karyawan: Karyawan.fromJson(json["karyawan"]),
        skalaNyeri: SkalaNyeri.fromJson(json["skala_nyeri"]),
      );

  Map<String, dynamic> toJson() => {
        "karyawan": karyawan.toJson(),
        "skala_nyeri": skalaNyeri.toJson(),
      };
}

class Karyawan {
  String nama;
  String jenisKelamin;
  String tglLahir;

  Karyawan({
    required this.nama,
    required this.jenisKelamin,
    required this.tglLahir,
  });

  factory Karyawan.fromJson(Map<String, dynamic> json) => Karyawan(
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        tglLahir: json["tgl_lahir"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
      };
}

class SkalaNyeri {
  int skalaNyeri;

  SkalaNyeri({
    required this.skalaNyeri,
  });

  factory SkalaNyeri.fromJson(Map<String, dynamic> json) => SkalaNyeri(
        skalaNyeri: json["skala_nyeri"],
      );

  Map<String, dynamic> toJson() => {
        "skala_nyeri": skalaNyeri,
      };
}
