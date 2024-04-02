class ReponseResumeMedisPerinatologi {
  final IdentitasBayiResponse identitasBayiResponse;
  ReponseResumeMedisPerinatologi({
    required this.identitasBayiResponse,
  });

  factory ReponseResumeMedisPerinatologi.fromMap(Map<String, dynamic> map) {
    return ReponseResumeMedisPerinatologi(
      identitasBayiResponse: IdentitasBayiResponse.fromJson(
          map['identitas_bayi'] as Map<String, dynamic>),
    );
  }
}

class IdentitasBayiResponse {
  final String namaBayi;
  final String tglLahir;
  final String noRm;
  final String noReg;
  final String umur;
  final String jk;
  final String tglMasuk;
  final String tglKeluar;
  final String dokterAnak;
  final String namaIbu;
  final String ruang;
  final String agama;
  final String alamat;
  final String dokterObgyn;

  IdentitasBayiResponse({
    required this.namaBayi,
    required this.tglLahir,
    required this.noRm,
    required this.noReg,
    required this.umur,
    required this.jk,
    required this.tglMasuk,
    required this.tglKeluar,
    required this.dokterAnak,
    required this.namaIbu,
    required this.ruang,
    required this.agama,
    required this.alamat,
    required this.dokterObgyn,
  });

  factory IdentitasBayiResponse.fromJson(Map<String, dynamic> json) =>
      IdentitasBayiResponse(
        namaBayi: json["nama_bayi"].toString(),
        tglLahir: json["tgl_lahir"].toString(),
        noRm: json["no_rm"].toString(),
        noReg: json["no_reg"].toString(),
        umur: json["umur"].toString(),
        jk: json["jk"].toString(),
        tglMasuk: json["tgl_masuk"].toString(),
        tglKeluar: json["tgl_keluar"].toString(),
        dokterAnak: json["dokter_anak"].toString(),
        namaIbu: json["nama_ibu"].toString(),
        ruang: json["ruang"].toString(),
        agama: json["agama"].toString(),
        alamat: json["alamat"].toString(),
        dokterObgyn: json["dokter_obgyn"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nama_bayi": namaBayi,
        "tgl_lahir": tglLahir,
        "no_rm": noRm,
        "no_reg": noReg,
        "umur": umur,
        "jk": jk,
        "tgl_masuk": tglMasuk,
        "tgl_keluar": tglKeluar,
        "dokter_anak": dokterAnak,
        "nama_ibu": namaIbu,
        "ruang": ruang,
        "agama": agama,
        "alamat": alamat,
        "dokter_obgyn": dokterObgyn,
      };
}


// {
//             "nama_bayi": "BY NY MASDARIA PAKPAHAN",
//             "tgl_lahir": "2023-01-11",
//             "no_rm": "181418",
//             "no_reg": "20240111002869",
//             "umur": "0 Tahun,  0 Bulan",
//             "jk": "Laki-Laki",
//             "tgl_masuk": "",
//             "tgl_keluar": "",
//             "dokter_anak": "",
//             "nama_ibu": "",
//             "ruang": "",
//             "agama": "Kristen Protestan",
//             "alamat": "SOSOR GOTING",
//             "dokter_obgyn": ""
//         }