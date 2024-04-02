class ResponseIdentitasBayi {
  final ImageFiles imageFiles;
  final BayiIdentitas identitasBayi;
  final VitalSignPerinaBayi vitalSignPerina;
  ResponseIdentitasBayi({
    required this.imageFiles,
    required this.identitasBayi,
    required this.vitalSignPerina,
  });

  factory ResponseIdentitasBayi.fromMap(Map<String, dynamic> map) {
    return ResponseIdentitasBayi(
      vitalSignPerina: VitalSignPerinaBayi.fromJson(
          map["vital_sign"] as Map<String, dynamic>),
      imageFiles: ImageFiles.fromJson(map['gambar'] as Map<String, dynamic>),
      identitasBayi:
          BayiIdentitas.fromJson(map['pasien'] as Map<String, dynamic>),
    );
  }
}

class VitalSignPerinaBayi {
  final String beratLahir;
  final String warnaKulit;
  final String panjangBadan;

  VitalSignPerinaBayi({
    required this.beratLahir,
    required this.warnaKulit,
    required this.panjangBadan,
  });

  factory VitalSignPerinaBayi.fromJson(Map<String, dynamic> json) =>
      VitalSignPerinaBayi(
        beratLahir: json["berat_lahir"].toString(),
        warnaKulit: json["warna_kulit"].toString(),
        panjangBadan: json["panjang_badan"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "berat_lahir": beratLahir,
        "warna_kulit": warnaKulit,
        "panjang_badan": panjangBadan,
      };
}

class ImageFiles {
  final String kakiKananBayi;
  final String kakiKiriBayi;
  final String tanganKiriIbu;
  final String ttdJk;
  final String ttdWali;
  final String namaPenentuJK;
  final String namaWali;
  final String namaPemberiGelangBayi;
  final String jamKelahiran;

  ImageFiles({
    required this.kakiKananBayi,
    required this.kakiKiriBayi,
    required this.tanganKiriIbu,
    required this.ttdJk,
    required this.ttdWali,
    required this.namaPenentuJK,
    required this.namaWali,
    required this.namaPemberiGelangBayi,
    required this.jamKelahiran,
  });

  factory ImageFiles.fromJson(Map<String, dynamic> json) => ImageFiles(
        jamKelahiran: json["jam_kelahiran"].toString(),
        namaPemberiGelangBayi: json["nama_pemberi_gelang_bayi"].toString(),
        namaPenentuJK: json["nama_penentu_jk"].toString(),
        namaWali: json["nama_wali"].toString(),
        ttdJk: json["ttd_jk"].toString(),
        ttdWali: json["ttd_wali"].toString(),
        kakiKananBayi: json["kaki_kanan_bayi"].toString(),
        kakiKiriBayi: json["kaki_kiri_bayi"].toString(),
        tanganKiriIbu: json["tangan_kiri_ibu"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kaki_kanan_bayi": kakiKananBayi,
        "kaki_kiri_bayi": kakiKiriBayi,
        "tangan_kiri_bayi": tanganKiriIbu,
      };
}

class BayiIdentitas {
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

  BayiIdentitas({
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

  factory BayiIdentitas.fromJson(Map<String, dynamic> json) => BayiIdentitas(
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
        "tgl_lahir": tglLahir,
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
