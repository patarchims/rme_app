class EarlyWarningSystem {
  final String waktu;
  final int idEws;
  final String tingkatKesadaran;
  final String noreg;
  final int td;
  final int nadi;
  final int pernapasan;
  final String reaksiOtot;
  final int suhu;
  final int spo2;
  final int crt;
  final int skalaNyeri;
  final Karyawan karyawan;

  EarlyWarningSystem({
    required this.waktu,
    required this.idEws,
    required this.tingkatKesadaran,
    required this.noreg,
    required this.td,
    required this.nadi,
    required this.pernapasan,
    required this.reaksiOtot,
    required this.suhu,
    required this.spo2,
    required this.crt,
    required this.skalaNyeri,
    required this.karyawan,
  });

  factory EarlyWarningSystem.fromJson(Map<String, dynamic> json) =>
      EarlyWarningSystem(
        waktu: json["waktu"].toString(),
        idEws: json["id_ews"] as int,
        tingkatKesadaran: json["tingkat_kesadaran"].toString(),
        noreg: json["noreg"].toString(),
        td: json["td"] as int,
        nadi: json["nadi"] as int,
        pernapasan: json["pernapasan"] as int,
        reaksiOtot: json["reaksi_otot"].toString(),
        suhu: json["suhu"] as int,
        spo2: json["spo2"] as int,
        crt: json["crt"] as int,
        karyawan: Karyawan.fromJson(json["karyawan"]),
        skalaNyeri: json["skala_nyeri"] as int,
      );

  Map<String, dynamic> toJson() => {
        "waktu": waktu,
        "id_ews": idEws,
        "tingkat_kesadaran": tingkatKesadaran,
        "noreg": noreg,
        "td": td,
        "nadi": nadi,
        "pernapasan": pernapasan,
        "reaksi_otot": reaksiOtot,
        "suhu": suhu,
        "spo2": spo2,
        "crt": crt,
        "skala_nyeri": skalaNyeri,
      };
}

class Karyawan {
  final String keterangan;
  final String idPengajar;
  final String nama;
  final String jenisKelamin;

  Karyawan({
    required this.keterangan,
    required this.idPengajar,
    required this.nama,
    required this.jenisKelamin,
  });

  factory Karyawan.fromJson(Map<String, dynamic> json) => Karyawan(
        keterangan: json["keterangan"].toString(),
        idPengajar: json["id_pengajar"].toString(),
        nama: json["nama"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "keterangan": keterangan,
        "id_pengajar": idPengajar,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
      };
}
