class ReportPengkajianAwalPasienRawatInapResponseModel {
  final Pasien pasien;
  ReportPengkajianAwalPasienRawatInapResponseModel({
    required this.pasien,
  });

  factory ReportPengkajianAwalPasienRawatInapResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ReportPengkajianAwalPasienRawatInapResponseModel(
        pasien: Pasien.fromJson(json["pasien"]),
      );

  Map<String, dynamic> toJson() => {
        "pasien": pasien.toJson(),
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
