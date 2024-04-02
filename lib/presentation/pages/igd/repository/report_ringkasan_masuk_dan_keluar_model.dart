class RingkasanMasukDanKeluar {
  final PasienResonse pasienResonse;
  RingkasanMasukDanKeluar({
    required this.pasienResonse,
  });

  factory RingkasanMasukDanKeluar.fromMap(Map<String, dynamic> map) {
    return RingkasanMasukDanKeluar(
      pasienResonse:
          PasienResonse.fromJson(map['pasien'] as Map<String, dynamic>),
    );
  }
}

class PasienResonse {
  final String nik;
  final String id;
  final String firstname;
  final String jenisKelamin;
  final String tempatLahir;
  final String tglLahir;
  final int umurThn;
  final int umurBln;
  final String suku;
  final String alamat;
  final String agama;
  final String keluarahan;
  final String kabupaten;
  final String propinsi;
  final String negara;
  final String telp;
  final String pendidikan;
  final String pekerjaan;
  final String status;
  final String peksuami;
  final String kunjungan;
  final String hp;
  final String namaAyah;
  final String namaIbu;

  PasienResonse({
    required this.nik,
    required this.id,
    required this.firstname,
    required this.jenisKelamin,
    required this.tempatLahir,
    required this.tglLahir,
    required this.umurThn,
    required this.umurBln,
    required this.suku,
    required this.alamat,
    required this.agama,
    required this.keluarahan,
    required this.kabupaten,
    required this.propinsi,
    required this.negara,
    required this.telp,
    required this.pendidikan,
    required this.pekerjaan,
    required this.status,
    required this.peksuami,
    required this.kunjungan,
    required this.hp,
    required this.namaAyah,
    required this.namaIbu,
  });

  factory PasienResonse.fromJson(Map<String, dynamic> json) => PasienResonse(
        nik: json["nik"].toString(),
        id: json["id"].toString(),
        firstname: json["firstname"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        tempatLahir: json["tempat_lahir"].toString(),
        tglLahir: json["tgl_lahir"].toString(),
        umurThn: json["umur_thn"] as int,
        umurBln: json["umur_bln"] as int,
        suku: json["suku"].toString(),
        alamat: json["alamat"].toString(),
        agama: json["agama"].toString(),
        keluarahan: json["keluarahan"].toString(),
        kabupaten: json["kabupaten"].toString(),
        propinsi: json["propinsi"].toString(),
        negara: json["negara"].toString(),
        telp: json["telp"].toString(),
        pendidikan: json["pendidikan"].toString(),
        pekerjaan: json["pekerjaan"].toString(),
        status: json["status"].toString(),
        peksuami: json["peksuami"].toString(),
        kunjungan: json["kunjungan"].toString(),
        hp: json["hp"].toString(),
        namaAyah: json["nama_ayah"].toString(),
        namaIbu: json["nama_ibu"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "id": id,
        "firstname": firstname,
        "jenis_kelamin": jenisKelamin,
        "tempat_lahir": tempatLahir,
        "umur_thn": umurThn,
        "umur_bln": umurBln,
        "suku": suku,
        "alamat": alamat,
        "agama": agama,
        "keluarahan": keluarahan,
        "kabupaten": kabupaten,
        "propinsi": propinsi,
        "negara": negara,
        "telp": telp,
        "pendidikan": pendidikan,
        "pekerjaan": pekerjaan,
        "status": status,
        "peksuami": peksuami,
        "kunjungan": kunjungan,
        "hp": hp,
        "nama_ayah": namaAyah,
        "nama_ibu": namaIbu,
      };
}
