// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseAsesmenPerinaModel {
  List<Dokter> dokter;
  AsesmenBayiModel asesmenBayi;
  List<RiwayatKehamilanPerinaModel> riwayatKehamilan;
  ResponseAsesmenPerinaModel({
    required this.dokter,
    required this.asesmenBayi,
    required this.riwayatKehamilan,
  });

  factory ResponseAsesmenPerinaModel.fromMap(Map<String, dynamic> map) {
    return ResponseAsesmenPerinaModel(
      asesmenBayi: AsesmenBayiModel.fromJson(map["asesmen_bayi"]),
      riwayatKehamilan: List<RiwayatKehamilanPerinaModel>.from(
        (map['riwayat_kehamilan'] as Iterable).map<RiwayatKehamilanPerinaModel>(
          (x) =>
              RiwayatKehamilanPerinaModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
      dokter: List<Dokter>.from(
        (map['dokter'] as Iterable).map<Dokter>(
          (x) => Dokter.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class Dokter {
  final String idDokter;
  final String spesialisasi;
  final String namaDokter;

  Dokter({
    required this.idDokter,
    required this.spesialisasi,
    required this.namaDokter,
  });

  factory Dokter.fromJson(Map<String, dynamic> json) => Dokter(
        idDokter: json["id_dokter"],
        spesialisasi: json["spesialisasi"],
        namaDokter: json["nama_dokter"],
      );

  Map<String, dynamic> toJson() => {
        "id_dokter": idDokter,
        "spesialisasi": spesialisasi,
        "nama_dokter": namaDokter,
      };
}

class RiwayatKehamilanPerinaModel {
  final String kdRiwayat;
  final String tahubPersalinan;
  final String tempatPersalinan;
  final String umurKehamilan;
  final String jenisPersalinan;
  final String penolong;
  final String penyulit;
  final String nifas;
  final String jk;
  final String bb;
  final String keadaanSekarang;
  final String komplikasiHamil;
  final String komplikasiPersalinan;

  RiwayatKehamilanPerinaModel({
    required this.kdRiwayat,
    required this.tahubPersalinan,
    required this.tempatPersalinan,
    required this.umurKehamilan,
    required this.jenisPersalinan,
    required this.penolong,
    required this.penyulit,
    required this.nifas,
    required this.jk,
    required this.bb,
    required this.keadaanSekarang,
    required this.komplikasiHamil,
    required this.komplikasiPersalinan,
  });

  factory RiwayatKehamilanPerinaModel.fromJson(Map<String, dynamic> json) =>
      RiwayatKehamilanPerinaModel(
        kdRiwayat: json["kd_riwayat"],
        tahubPersalinan: json["tahun_persalinan"],
        tempatPersalinan: json["tempat_persalinan"],
        umurKehamilan: json["umur_kehamilan"],
        jenisPersalinan: json["jenis_persalinan"],
        penolong: json["penolong"],
        penyulit: json["penyulit"],
        nifas: json["nifas"],
        jk: json["jk"],
        bb: json["bb"],
        keadaanSekarang: json["keadaan_sekarang"],
        komplikasiHamil: json["komplikasi_hamil"],
        komplikasiPersalinan: json["komplikasi_persalinan"],
      );

  Map<String, dynamic> toJson() => {
        "kd_riwayat": kdRiwayat,
        "tahub_persalinan": tahubPersalinan,
        "tempat_persalinan": tempatPersalinan,
        "umur_kehamilan": umurKehamilan,
        "jenis_persalinan": jenisPersalinan,
        "penolong": penolong,
        "penyulit": penyulit,
        "nifas": nifas,
        "jk": jk,
        "bb": bb,
        "keadaan_sekarang": keadaanSekarang,
        "komplikasi_hamil": komplikasiHamil,
        "komplikasi_persalinan": komplikasiPersalinan,
      };

  RiwayatKehamilanPerinaModel copyWith({
    String? kdRiwayat,
    String? tahubPersalinan,
    String? kdBagian,
    String? noRm,
    String? tempatPersalinan,
    String? noreg,
    String? umurKehamilan,
    String? jenisPersalinan,
    String? penolong,
    String? penyulit,
    String? nifas,
    String? jk,
    String? bb,
    String? keadaanSekarang,
    String? komplikasiHamil,
    String? komplikasiPersalinan,
  }) {
    return RiwayatKehamilanPerinaModel(
      kdRiwayat: kdRiwayat ?? this.kdRiwayat,
      tahubPersalinan: tahubPersalinan ?? this.tahubPersalinan,
      tempatPersalinan: tempatPersalinan ?? this.tempatPersalinan,
      umurKehamilan: umurKehamilan ?? this.umurKehamilan,
      jenisPersalinan: jenisPersalinan ?? this.jenisPersalinan,
      penolong: penolong ?? this.penolong,
      penyulit: penyulit ?? this.penyulit,
      nifas: nifas ?? this.nifas,
      jk: jk ?? this.jk,
      bb: bb ?? this.bb,
      keadaanSekarang: keadaanSekarang ?? this.keadaanSekarang,
      komplikasiHamil: komplikasiHamil ?? this.komplikasiHamil,
      komplikasiPersalinan: komplikasiPersalinan ?? this.komplikasiPersalinan,
    );
  }
}

class AsesmenBayiModel {
  final String dokterObgyn;
  final String dokterAnak;
  final String namaAyah;
  final String pekerjaanAyah;
  final String perkawinanAyah;
  final String riwayatPenyakitAyah;
  final String usiaKehamilan;
  final String namaIbu;
  final String perkawinanIbu;
  final String penyakitIbu;
  final String pekerjaanIbu;
  final String namaPjawab;
  final String usiaPjawab;
  final String pekerjaanPjawab;
  final String usiaPersalinan;
  final String rwtTglLahir;
  final String menangis;
  final String jenisKelamin;
  final String keterangan;
  final String prenatalUsiaKehamilan;
  final String prenatalKomplikasi;
  final String prenatalHis;
  final String prenatalTtp;
  final String prenatalKetuban;
  final String prenatalPersalinan;
  final String rwtUsiaPersalinan;
  final String rwtPersalinan;
  final String prenatalKebiasaanIbu;
  final String prenatalJumlahHari;
  final String rwtLahirDengan;
  final String rwtJenisKelamin;
  final String rwtKelahiranBayi;
  final String rwtMenangis;
  final String rwtKeterangan;
  final String prenatalUsiaPersalinan;
  final String prenatalJam;
  final String natalPersalinan;
  final String natalKpd;
  final String natalKeadaan;
  final String natalTindakanDiberikan;
  final String natalPost;
  final String natalPrestasi;
  final String natalDitolongOleh;
  final String natalKetuban;
  final String natalLetak;
  final String natalLahirUmur;
  final String natalVolume;
  final String natalKomplikasi;
  final String rwtPrenatalPersalinan;
  final String obatObatanYangdikomsumsi;
  final String pendarahanPrenatal;

  AsesmenBayiModel({
    required this.dokterObgyn,
    required this.pendarahanPrenatal,
    required this.riwayatPenyakitAyah,
    required this.prenatalJumlahHari,
    required this.dokterAnak,
    required this.pekerjaanAyah,
    required this.namaAyah,
    required this.perkawinanAyah,
    required this.usiaKehamilan,
    required this.namaIbu,
    required this.perkawinanIbu,
    required this.pekerjaanIbu,
    required this.penyakitIbu,
    required this.namaPjawab,
    required this.usiaPjawab,
    required this.pekerjaanPjawab,
    required this.usiaPersalinan,
    required this.rwtTglLahir,
    required this.menangis,
    required this.jenisKelamin,
    required this.keterangan,
    required this.prenatalUsiaKehamilan,
    required this.prenatalKomplikasi,
    required this.prenatalKebiasaanIbu,
    required this.prenatalJam,
    required this.prenatalHis,
    required this.prenatalTtp,
    required this.prenatalKetuban,
    required this.prenatalPersalinan,
    required this.rwtUsiaPersalinan,
    required this.rwtLahirDengan,
    required this.rwtJenisKelamin,
    required this.rwtKelahiranBayi,
    required this.rwtMenangis,
    required this.rwtKeterangan,
    required this.prenatalUsiaPersalinan,
    required this.natalPersalinan,
    required this.natalKpd,
    required this.natalKeadaan,
    required this.natalTindakanDiberikan,
    required this.natalPost,
    required this.natalPrestasi,
    required this.natalDitolongOleh,
    required this.natalKetuban,
    required this.natalLetak,
    required this.natalLahirUmur,
    required this.natalVolume,
    required this.natalKomplikasi,
    required this.rwtPersalinan,
    required this.rwtPrenatalPersalinan,
    required this.obatObatanYangdikomsumsi,
  });

  factory AsesmenBayiModel.fromJson(Map<String, dynamic> json) =>
      AsesmenBayiModel(
        pendarahanPrenatal: json["pendarahan_prenatal"].toString(),
        obatObatanYangdikomsumsi:
            json["obat_obatan_yang_dikomsumsi"].toString(),
        rwtPrenatalPersalinan: json["prenatal_riwayat_persalinan"].toString(),
        rwtPersalinan: json["rwt_prenatal_persalinan"].toString(),
        prenatalJumlahHari: json["jumlah_hari"].toString(),
        prenatalKebiasaanIbu: json["prenatal_kebiasaan_ibu"].toString(),
        pekerjaanIbu: json["pekerjaan_ibu"].toString(),
        riwayatPenyakitAyah: json["riwayat_penyakit_ayah"].toString(),
        dokterObgyn: json["dokter_obgyn"].toString(),
        dokterAnak: json["dokter_anak"].toString(),
        prenatalJam: json["prenatal_jam"].toString(),
        namaAyah: json["nama_ayah"].toString(),
        pekerjaanAyah: json["pekerjaan_ayah"].toString(),
        perkawinanAyah: json["perkawinan_ayah"].toString(),
        usiaKehamilan: json["usia_kehamilan"].toString(),
        namaIbu: json["nama_ibu"].toString(),
        perkawinanIbu: json["perkawinan_ibu"].toString(),
        penyakitIbu: json["penyakit_ibu"].toString(),
        namaPjawab: json["nama_pjawab"].toString(),
        usiaPjawab: json["usia_pjawab"].toString(),
        pekerjaanPjawab: json["pekerjaan_pjawab"].toString(),
        usiaPersalinan: json["usia_persalinan"].toString(),
        rwtTglLahir: json["rwt_tgl_lahir"].toString(),
        menangis: json["menangis"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        keterangan: json["keterangan"].toString(),
        prenatalUsiaKehamilan: json["prenatal_usia_kehamilan"].toString(),
        prenatalKomplikasi: json["prenatal_komplikasi"].toString(),
        prenatalHis: json["prenatal_his"].toString(),
        prenatalTtp: json["prenatal_ttp"].toString(),
        prenatalKetuban: json["prenatal_ketuban"].toString(),
        prenatalPersalinan: json["prenatal_riwayat_persalinan"].toString(),
        rwtUsiaPersalinan: json["rwt_usia_persalinan"].toString(),
        rwtLahirDengan: json["rwt_lahir_dengan"].toString(),
        rwtJenisKelamin: json["rwt_jenis_kelamin"].toString(),
        rwtKelahiranBayi: json["rwt_kelahiran_bayi"].toString(),
        rwtMenangis: json["rwt_menangis"].toString(),
        rwtKeterangan: json["rwt_keterangan"].toString(),
        prenatalUsiaPersalinan: json["prenatal_usia_persalinan"].toString(),
        natalPersalinan: json["natal_persalinan"].toString(),
        natalKpd: json["natal_kpd"].toString(),
        natalKeadaan: json["natal_keadaan"].toString(),
        natalTindakanDiberikan: json["natal_tindakan_diberikan"].toString(),
        natalPost: json["natal_post"].toString(),
        natalPrestasi: json["natal_prestasi"].toString(),
        natalDitolongOleh: json["natal_ditolong_oleh"].toString(),
        natalKetuban: json["natal_ketuban"].toString(),
        natalLetak: json["natal_letak"].toString(),
        natalLahirUmur: json["natal_lahir_umur"].toString(),
        natalKomplikasi: json["natal_komplikasi"].toString(),
        natalVolume: json["natal_volume"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "dokter_obgyn": dokterObgyn,
        "dokter_anak": dokterAnak,
        "pekerjaan_ayah": pekerjaanAyah,
        "perkawainan_ayah": perkawinanAyah,
        "usia_kehamilan": usiaKehamilan,
        "nama_ibu": namaIbu,
        "perkawinan_ibu": perkawinanIbu,
        "penyakit_ibut": penyakitIbu,
        "nama_pjawab": namaPjawab,
        "usia_pjawab": usiaPjawab,
        "pekerjaan_pjawab": pekerjaanPjawab,
        "usia_persalinan": usiaPersalinan,
        "menangis": menangis,
        "jenis_kelamin": jenisKelamin,
        "keterangan": keterangan,
        "prenatal_usia_kehamilan": prenatalUsiaKehamilan,
        "prenatal_komplikasi": prenatalKomplikasi,
        "prenatal_his": prenatalHis,
        "prenatal_ttp": prenatalTtp,
        "prenatal_ketuban": prenatalKetuban,
        "prenatal_persalinan": prenatalPersalinan,
        "rwt_usia_persalinan": rwtUsiaPersalinan,
        "rwt_lahir_dengan": rwtLahirDengan,
        "rwt_jenis_kelamin": rwtJenisKelamin,
        "rwt_kelahiran_bayi": rwtKelahiranBayi,
        "rwt_menangis": rwtMenangis,
        "rwt_keterangan": rwtKeterangan,
        "prenatal_usia_persalinan": prenatalUsiaPersalinan,
        "natal_persalinan": natalPersalinan,
        "natal_kpd": natalKpd,
        "natal_keadaan": natalKeadaan,
        "natal_tindakan_diberikan": natalTindakanDiberikan,
        "natal_post": natalPost,
        "natal_prestasi": natalPrestasi,
        "natal_ditolong_oleh": natalDitolongOleh,
        "natal_ketuban": natalKetuban,
        "natal_letak": natalLetak,
        "natal_lahir_umur": natalLahirUmur,
      };
}
