class AsesmenBayiResponseModel {
  final AsesmenBayiPerinaModel asesmenBayiModel;
  final KaryawanModel karyawan;
  final DownScoreModelResponse downScoreModel;
  final VitalSignPerinaModel vitalSignModel;
  final FisikPerinaModel fisikPerina;
  final List<RiwayatKelahiranModel> riwayatKelahiranModel;
  final List<ApgarScoreModel> apgarScore;
  AsesmenBayiResponseModel({
    required this.asesmenBayiModel,
    required this.karyawan,
    required this.riwayatKelahiranModel,
    required this.downScoreModel,
    required this.apgarScore,
    required this.vitalSignModel,
    required this.fisikPerina,
  });

  factory AsesmenBayiResponseModel.fromMap(Map<String, dynamic> map) {
    return AsesmenBayiResponseModel(
        karyawan: KaryawanModel.fromJson(map["karyawan"]),
        fisikPerina: FisikPerinaModel.fromJson(map["fisik"]),
        vitalSignModel: VitalSignPerinaModel.fromJson(
            map["vital_sign"] as Map<String, dynamic>),
        downScoreModel: DownScoreModelResponse.fromMap(
            map["down_score"] as Map<String, dynamic>),
        apgarScore: List<ApgarScoreModel>.from(
          (map['apgar_score'] as Iterable).map<ApgarScoreModel>(
            (x) => ApgarScoreModel.fromJson(x as Map<String, dynamic>),
          ),
        ),
        asesmenBayiModel: AsesmenBayiPerinaModel.fromJson(
            map['asesmen_bayi'] as Map<String, dynamic>),
        riwayatKelahiranModel: List<RiwayatKelahiranModel>.from(
          (map['riwayat_kelahiran'] as Iterable).map<RiwayatKelahiranModel>(
            (x) => RiwayatKelahiranModel.fromJson(x as Map<String, dynamic>),
          ),
        ));
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'asesmen_bayi': asesmenBayiModel.toJson(),
    };
  }
}

class RiwayatKelahiranModel {
  final String kdRiwayat;
  final String tahunPersalinan;
  final String noRm;
  final String tempatPersalinan;
  final String noreg;
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

  RiwayatKelahiranModel({
    required this.kdRiwayat,
    required this.tahunPersalinan,
    required this.noRm,
    required this.tempatPersalinan,
    required this.noreg,
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

  factory RiwayatKelahiranModel.fromJson(Map<String, dynamic> json) =>
      RiwayatKelahiranModel(
        kdRiwayat: json["kd_riwayat"].toString(),
        tahunPersalinan: json["tahun_persalinan"].toString(),
        noRm: json["no_rm"].toString(),
        tempatPersalinan: json["tempat_persalinan"].toString(),
        noreg: json["noreg"].toString(),
        umurKehamilan: json["umur_kehamilan"].toString(),
        jenisPersalinan: json["jenis_persalinan"].toString(),
        penolong: json["penolong"].toString(),
        penyulit: json["penyulit"].toString(),
        nifas: json["nifas"].toString(),
        jk: json["jk"].toString(),
        bb: json["bb"].toString(),
        keadaanSekarang: json["keadaan_sekarang"].toString(),
        komplikasiHamil: json["komplikasi_hamil"].toString(),
        komplikasiPersalinan: json["komplikasi_persalinan"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kd_riwayat": kdRiwayat,
        "tahun_persalinan": tahunPersalinan,
        "no_rm": noRm,
        "tempat_persalinan": tempatPersalinan,
        "noreg": noreg,
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
}

class AsesmenBayiPerinaModel {
  final String tanggal;
  final String obatObatanYangDikomsumsi;
  final String dokterObgyn;
  final String pendarahanPrenatal;
  final String dokterAnak;
  final String namaAyah;
  final String riwayatPenyakitAyah;
  final String pekerjaanAyah;
  final String perkawinanAyah;
  final String usiaKehamilan;
  final String namaIbu;
  final String pekerjaanIbu;
  final String perkawinanIbu;
  final String penyakitIbu;
  final String namaPjawab;
  final String usiaPjawab;
  final String prenatalKebiasaanIbu;
  final String pekerjaanPjawab;
  final String usiaPersalinan;
  final String tglLahir;
  final String lahirDengan;
  final String menangis;
  final String jenisKelamin;
  final String jumlahHari;
  final String keterangan;
  final String prenatalUsiaKehamilan;
  final String prenatalKomplikasi;
  final String prenatalHis;
  final String prenatalTtp;
  final String prenatalKetuban;
  final String prenatalJam;
  final String rwtUsiaPersalinan;
  final String rwtLahirDengan;
  final String rwtJenisKelamin;
  final String rwtKelahiranBayi;
  final String rwtMenangis;
  final String rwtKeterangan;
  final String prenatalUsiaPersalinan;
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
  final String prenatalRiwayatPersalinan;

  AsesmenBayiPerinaModel({
    required this.tanggal,
    required this.obatObatanYangDikomsumsi,
    required this.dokterObgyn,
    required this.pendarahanPrenatal,
    required this.dokterAnak,
    required this.namaAyah,
    required this.riwayatPenyakitAyah,
    required this.pekerjaanAyah,
    required this.perkawinanAyah,
    required this.usiaKehamilan,
    required this.namaIbu,
    required this.pekerjaanIbu,
    required this.perkawinanIbu,
    required this.penyakitIbu,
    required this.namaPjawab,
    required this.usiaPjawab,
    required this.prenatalKebiasaanIbu,
    required this.pekerjaanPjawab,
    required this.usiaPersalinan,
    required this.tglLahir,
    required this.lahirDengan,
    required this.menangis,
    required this.jenisKelamin,
    required this.jumlahHari,
    required this.keterangan,
    required this.prenatalUsiaKehamilan,
    required this.prenatalKomplikasi,
    required this.prenatalHis,
    required this.prenatalTtp,
    required this.prenatalKetuban,
    required this.prenatalJam,
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
    required this.prenatalRiwayatPersalinan,
  });

  factory AsesmenBayiPerinaModel.fromJson(Map<String, dynamic> json) =>
      AsesmenBayiPerinaModel(
        tanggal: json["tanggal"].toString(),
        obatObatanYangDikomsumsi:
            json["obat_obatan_yang_dikomsumsi"].toString(),
        dokterObgyn: json["dokter_obgyn"].toString(),
        pendarahanPrenatal: json["pendarahan_prenatal"].toString(),
        dokterAnak: json["dokter_anak"].toString(),
        namaAyah: json["nama_ayah"].toString(),
        riwayatPenyakitAyah: json["riwayat_penyakit_ayah"].toString(),
        pekerjaanAyah: json["pekerjaan_ayah"].toString(),
        perkawinanAyah: json["perkawinan_ayah"].toString(),
        usiaKehamilan: json["usia_kehamilan"].toString(),
        namaIbu: json["nama_ibu"].toString(),
        pekerjaanIbu: json["pekerjaan_ibu"].toString(),
        perkawinanIbu: json["perkawinan_ibu"].toString(),
        penyakitIbu: json["penyakit_ibu"].toString(),
        namaPjawab: json["nama_pjawab"].toString(),
        usiaPjawab: json["usia_pjawab"].toString(),
        prenatalKebiasaanIbu: json["prenatal_kebiasaan_ibu"].toString(),
        pekerjaanPjawab: json["pekerjaan_pjawab"].toString(),
        usiaPersalinan: json["usia_persalinan"].toString(),
        tglLahir: json["tgl_lahir"].toString(),
        lahirDengan: json["lahir_dengan"].toString(),
        menangis: json["menangis"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        jumlahHari: json["jumlah_hari"].toString(),
        keterangan: json["keterangan"].toString(),
        prenatalUsiaKehamilan: json["prenatal_usia_kehamilan"].toString(),
        prenatalKomplikasi: json["prenatal_komplikasi"].toString(),
        prenatalHis: json["prenatal_his"].toString(),
        prenatalTtp: json["prenatal_ttp"].toString(),
        prenatalKetuban: json["prenatal_ketuban"].toString(),
        prenatalJam: json["prenatal_jam"].toString(),
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
        natalVolume: json["natal_volume"].toString(),
        natalKomplikasi: json["natal_komplikasi"].toString(),
        prenatalRiwayatPersalinan:
            json["prenatal_riwayat_persalinan"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "obat_obatan_yang_dikomsumsi": obatObatanYangDikomsumsi,
        "dokter_obgyn": dokterObgyn,
        "pendarahan_prenatal": pendarahanPrenatal,
        "dokter_anak": dokterAnak,
        "nama_ayah": namaAyah,
        "riwayat_penyakit_ayah": riwayatPenyakitAyah,
        "pekerjaan_ayah": pekerjaanAyah,
        "perkawinan_ayah": perkawinanAyah,
        "usia_kehamilan": usiaKehamilan,
        "nama_ibu": namaIbu,
        "pekerjaan_ibu": pekerjaanIbu,
        "perkawinan_ibu": perkawinanIbu,
        "penyakit_ibu": penyakitIbu,
        "nama_pjawab": namaPjawab,
        "usia_pjawab": usiaPjawab,
        "prenatal_kebiasaan_ibu": prenatalKebiasaanIbu,
        "pekerjaan_pjawab": pekerjaanPjawab,
        "usia_persalinan": usiaPersalinan,
        "tgl_lahir": tglLahir,
      };
}

class ApgarScoreModel {
  final int id;
  final String waktu;
  final int jantung;
  final int nafas;
  final int otot;
  final int refleksi;
  final int warnaKulit;
  final int total;

  ApgarScoreModel({
    required this.id,
    required this.waktu,
    required this.jantung,
    required this.nafas,
    required this.otot,
    required this.refleksi,
    required this.warnaKulit,
    required this.total,
  });

  factory ApgarScoreModel.fromJson(Map<String, dynamic> json) =>
      ApgarScoreModel(
        id: json["id"],
        waktu: json["waktu"],
        jantung: json["jantung"],
        nafas: json["nafas"],
        otot: json["otot"],
        refleksi: json["refleksi"],
        warnaKulit: json["warna_kulit"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "waktu": waktu,
        "jantung": jantung,
        "nafas": nafas,
        "otot": otot,
        "refleksi": refleksi,
        "warna_kulit": warnaKulit,
        "total": total,
      };
}

class DownScoreModelResponse {
  final int nifas;
  final int sianosis;
  final int retraksi;
  final int airEntry;
  final int merintih;
  final int total;

  DownScoreModelResponse({
    required this.nifas,
    required this.sianosis,
    required this.retraksi,
    required this.airEntry,
    required this.merintih,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nifas': nifas,
      'sianosis': sianosis,
      'retraksi': retraksi,
      'airEntry': airEntry,
      'merintih': merintih,
      'total': total,
    };
  }

  factory DownScoreModelResponse.fromMap(Map<String, dynamic> map) {
    return DownScoreModelResponse(
      nifas: map['nifas'] as int,
      sianosis: map['sianosis'] as int,
      retraksi: map['retraksi'] as int,
      airEntry: map['air_entry'] as int,
      merintih: map['merintih'] as int,
      total: map['total'] as int,
    );
  }
}

class VitalSignPerinaModel {
  final String td;
  final String hr;
  final String rr;
  final String spo2;
  final String bb;
  final String tb;
  final String lingkarKepala;
  final String lingkarLengan;
  final String lingkarDada;
  final String lingkarPerut;

  VitalSignPerinaModel({
    required this.td,
    required this.hr,
    required this.rr,
    required this.spo2,
    required this.bb,
    required this.tb,
    required this.lingkarKepala,
    required this.lingkarLengan,
    required this.lingkarDada,
    required this.lingkarPerut,
  });

  factory VitalSignPerinaModel.fromJson(Map<String, dynamic> json) =>
      VitalSignPerinaModel(
        td: json["td"].toString(),
        hr: json["hr"].toString(),
        rr: json["rr"].toString(),
        spo2: json["spo2"].toString(),
        bb: json["bb"].toString(),
        tb: json["tb"].toString(),
        lingkarKepala: json["lingkar_kepala"].toString(),
        lingkarLengan: json["lingkar_lengan"].toString(),
        lingkarDada: json["lingkar_dada"].toString(),
        lingkarPerut: json["lingkar_perut"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "td": td,
        "hr": hr,
        "rr": rr,
        "spo2": spo2,
        "bb": bb,
        "tb": tb,
        "lingkar_kepala": lingkarKepala,
        "lingkar_lengan": lingkarLengan,
        "lingkar_dada": lingkarDada,
        "lingkar_perut": lingkarPerut,
      };
}

class FisikPerinaModel {
  final String kepala;
  final String gcsE;
  final String gcsV;
  final String gcsM;
  final String tonickNeck;
  final String kesadaran;
  final String wajah;
  final String telinga;
  final String hidung;
  final String mulut;
  final String refleks;
  final String leherDahBahu;
  final String dada;
  final String abdomen;
  final String punggung;
  final String integumen;
  final String ekstremitas;
  final String genetalia;
  final String anus;

  FisikPerinaModel({
    required this.gcsE,
    required this.tonickNeck,
    required this.gcsV,
    required this.gcsM,
    required this.kepala,
    required this.kesadaran,
    required this.wajah,
    required this.telinga,
    required this.hidung,
    required this.mulut,
    required this.refleks,
    required this.leherDahBahu,
    required this.dada,
    required this.abdomen,
    required this.punggung,
    required this.integumen,
    required this.ekstremitas,
    required this.genetalia,
    required this.anus,
  });

  factory FisikPerinaModel.fromJson(Map<String, dynamic> json) =>
      FisikPerinaModel(
        tonickNeck: json["tonick_neck"].toString(),
        gcsE: json["gcs_e"].toString(),
        gcsM: json["gcs_v"].toString(),
        gcsV: json["gcs_m"].toString(),
        kesadaran: json["kesadaran"].toString(),
        kepala: json["kepala"].toString(),
        wajah: json["wajah"].toString(),
        telinga: json["telinga"].toString(),
        hidung: json["hidung"].toString(),
        mulut: json["mulut"].toString(),
        refleks: json["refleks"].toString(),
        leherDahBahu: json["leher_dah_bahu"].toString(),
        dada: json["dada"].toString(),
        abdomen: json["abdomen"].toString(),
        punggung: json["punggung"].toString(),
        integumen: json["integumen"].toString(),
        ekstremitas: json["ekstremitas"].toString(),
        genetalia: json["genetalia"].toString(),
        anus: json["anus"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kepala": kepala,
        "wajah": wajah,
        "telinga": telinga,
        "hidung": hidung,
        "mulut": mulut,
        "refleks": refleks,
        "leher_dah_bahu": leherDahBahu,
        "dada": dada,
        "abdomen": abdomen,
        "punggung": punggung,
        "integumen": integumen,
        "ekstremitas": ekstremitas,
        "genetalia": genetalia,
        "anus": anus,
      };
}

class KaryawanModel {
  final String nama;
  final String jk;

  KaryawanModel({
    required this.nama,
    required this.jk,
  });

  factory KaryawanModel.fromJson(Map<String, dynamic> json) => KaryawanModel(
        nama: json["nama"].toString(),
        jk: json["jk"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "jk": jk,
      };
}
