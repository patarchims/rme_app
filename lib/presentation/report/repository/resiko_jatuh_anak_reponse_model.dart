class ReportResikoJatuhAnak {
  String insertDttm;
  String ketPerson;
  String pelayanan;
  String kdBagian;
  String noreg;
  String kategori;
  String usia;
  String jenisKelamin;
  String diagnosis;
  String gangguanKognitif;
  String faktorLingkungan;
  String respon;
  String penggunaanObat;
  String namaPerawat;
  String keterangan;
  int total;

  ReportResikoJatuhAnak({
    required this.insertDttm,
    required this.ketPerson,
    required this.pelayanan,
    required this.kdBagian,
    required this.noreg,
    required this.kategori,
    required this.usia,
    required this.jenisKelamin,
    required this.diagnosis,
    required this.gangguanKognitif,
    required this.faktorLingkungan,
    required this.respon,
    required this.penggunaanObat,
    required this.namaPerawat,
    required this.keterangan,
    required this.total,
  });

  factory ReportResikoJatuhAnak.fromJson(Map<String, dynamic> json) =>
      ReportResikoJatuhAnak(
        insertDttm: json["insertDttm"].toString(),
        ketPerson: json["ket_person"].toString(),
        pelayanan: json["pelayanan"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        noreg: json["noreg"].toString(),
        kategori: json["kategori"].toString(),
        usia: json["usia"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        diagnosis: json["diagnosis"].toString(),
        gangguanKognitif: json["gangguan_kognitif"].toString(),
        faktorLingkungan: json["faktor_lingkungan"].toString(),
        respon: json["respon"].toString(),
        penggunaanObat: json["penggunaan_obat"].toString(),
        namaPerawat: json["nama_perawat"].toString(),
        keterangan: json["keterangan"].toString(),
        total: json["total"] as int,
      );

  Map<String, dynamic> toJson() => {
        "insertDttm": insertDttm,
        "ket_person": ketPerson,
        "pelayanan": pelayanan,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "kategori": kategori,
        "usia": usia,
        "jenis_kelamin": jenisKelamin,
        "diagnosis": diagnosis,
        "gangguan_kognitif": gangguanKognitif,
        "faktor_lingkungan": faktorLingkungan,
        "respon": respon,
        "penggunaan_obat": penggunaanObat,
        "nama_perawat": namaPerawat,
        "keterangan": keterangan,
        "total": total,
      };
}
