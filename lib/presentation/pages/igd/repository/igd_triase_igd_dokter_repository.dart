class TriaseIgdDokterModel {
  final String jam;
  final String tglMasuk;
  final String ddj;
  final String alasanMasuk;
  final String caraMasuk;
  final String penyebabCedera;
  final String kehamilan;
  final String gravida;
  final String para;
  final String abortus;
  final String hpht;
  final String ttp;
  final int skalaNyeri;
  final String nyeriP;
  final String nyeriQ;
  final String nyeriR;
  final String nyeriS;
  final String nyeriT;
  final String skalaTriase;
  final String gangguanPerilaku;
  final int flagWajah;
  final int flagKaki;
  final int flagAktifitas;
  final int flagMenangis;
  final int flagBersuara;
  final int flagTotal;

  TriaseIgdDokterModel({
    required this.jam,
    required this.gangguanPerilaku,
    required this.tglMasuk,
    required this.ddj,
    required this.alasanMasuk,
    required this.caraMasuk,
    required this.penyebabCedera,
    required this.kehamilan,
    required this.gravida,
    required this.para,
    required this.abortus,
    required this.hpht,
    required this.ttp,
    required this.skalaNyeri,
    required this.nyeriP,
    required this.nyeriQ,
    required this.nyeriR,
    required this.nyeriS,
    required this.nyeriT,
    required this.skalaTriase,
    required this.flagWajah,
    required this.flagKaki,
    required this.flagAktifitas,
    required this.flagMenangis,
    required this.flagBersuara,
    required this.flagTotal,
  });

  factory TriaseIgdDokterModel.fromJson(Map<String, dynamic> json) =>
      TriaseIgdDokterModel(
        gangguanPerilaku: json["gangguan_perilaku"].toString(),
        jam: json["jam"].toString(),
        tglMasuk: json["tanggal_masuk"].toString(),
        ddj: json["ddj"].toString(),
        alasanMasuk: json["alasan_masuk"].toString(),
        caraMasuk: json["cara_masuk"].toString(),
        penyebabCedera: json["penyebab_cedera"].toString(),
        kehamilan: json["kehamilan"].toString(),
        gravida: json["gravida"].toString(),
        para: json["para"].toString(),
        abortus: json["abortus"].toString(),
        hpht: json["hpht"].toString(),
        ttp: json["ttp"].toString(),
        skalaNyeri: json["skala_nyeri"] as int,
        nyeriP: json["nyeri_p"].toString(),
        nyeriQ: json["nyeri_q"].toString(),
        nyeriR: json["nyeri_r"].toString(),
        nyeriS: json["nyeri_s"].toString(),
        nyeriT: json["nyeri_t"].toString(),
        skalaTriase: json["skala_triase"].toString(),
        flagWajah: json["flag_wajah"] as int,
        flagKaki: json["flag_kaki"] as int,
        flagAktifitas: json["flag_aktifitas"] as int,
        flagMenangis: json["flag_menangis"] as int,
        flagBersuara: json["flag_bersuara"] as int,
        flagTotal: json["flag_total"] as int,
      );

  Map<String, dynamic> toJson() => {
        "ddj": ddj,
        "alasan_masuk": alasanMasuk,
        "cara_masuk": caraMasuk,
        "penyebab_cedera": penyebabCedera,
        "kehamilan": kehamilan,
        "gravida": gravida,
        "para": para,
        "abortus": abortus,
        "hpht": hpht,
        "ttp": ttp,
        "skala_nyeri": skalaNyeri,
        "nyeri_p": nyeriP,
        "nyeri_q": nyeriQ,
        "nyeri_r": nyeriR,
        "nyeri_s": nyeriS,
        "nyeri_t": nyeriT,
        "skala_triase": skalaTriase,
        "flag_wajah": flagWajah,
        "flag_kaki": flagKaki,
        "flag_aktifitas": flagAktifitas,
        "flag_menangis": flagMenangis,
        "flag_bersuara": flagBersuara,
        "flag_total": flagTotal,
      };

  TriaseIgdDokterModel copyWith({
    String? gangguanPerilaku,
    String? jam,
    String? tglMasuk,
    String? ddj,
    String? alasanMasuk,
    String? caraMasuk,
    String? penyebabCedera,
    String? kehamilan,
    String? gravida,
    String? para,
    String? abortus,
    String? hpht,
    String? ttp,
    int? skalaNyeri,
    String? nyeriP,
    String? nyeriQ,
    String? nyeriR,
    String? nyeriS,
    String? nyeriT,
    String? skalaTriase,
    int? flagWajah,
    int? flagKaki,
    int? flagAktifitas,
    int? flagMenangis,
    int? flagBersuara,
    int? flagTotal,
  }) {
    return TriaseIgdDokterModel(
      gangguanPerilaku: gangguanPerilaku ?? this.gangguanPerilaku,
      jam: jam ?? this.jam,
      tglMasuk: tglMasuk ?? this.tglMasuk,
      ddj: ddj ?? this.ddj,
      alasanMasuk: alasanMasuk ?? this.alasanMasuk,
      caraMasuk: caraMasuk ?? this.caraMasuk,
      penyebabCedera: penyebabCedera ?? this.penyebabCedera,
      kehamilan: kehamilan ?? this.kehamilan,
      gravida: gravida ?? this.gravida,
      para: para ?? this.para,
      abortus: abortus ?? this.abortus,
      hpht: hpht ?? this.hpht,
      ttp: ttp ?? this.ttp,
      skalaNyeri: skalaNyeri ?? this.skalaNyeri,
      nyeriP: nyeriP ?? this.nyeriP,
      nyeriQ: nyeriQ ?? this.nyeriQ,
      nyeriR: nyeriR ?? this.nyeriR,
      nyeriS: nyeriS ?? this.nyeriS,
      nyeriT: nyeriT ?? this.nyeriT,
      skalaTriase: skalaTriase ?? this.skalaTriase,
      flagWajah: flagWajah ?? this.flagWajah,
      flagKaki: flagKaki ?? this.flagKaki,
      flagAktifitas: flagAktifitas ?? this.flagAktifitas,
      flagMenangis: flagMenangis ?? this.flagMenangis,
      flagBersuara: flagBersuara ?? this.flagBersuara,
      flagTotal: flagTotal ?? this.flagTotal,
    );
  }
}

class TriaseReportIgdDokterResponse {
  final TriaseIgdDokterModel triase;
  final PemeriksaanFisik pemeriksaanFisik;
  final Karyawan karyawan;
  final KeluhanUtama keluhanUtama;
  final Vital vital;
  TriaseReportIgdDokterResponse({
    required this.triase,
    required this.keluhanUtama,
    required this.vital,
    required this.pemeriksaanFisik,
    required this.karyawan,
  });

  factory TriaseReportIgdDokterResponse.fromMap(Map<String, dynamic> map) {
    return TriaseReportIgdDokterResponse(
      keluhanUtama:
          KeluhanUtama.fromJson(map["keluhan_utama"] as Map<String, dynamic>),
      vital: Vital.fromJson(map["vital"] as Map<String, dynamic>),
      pemeriksaanFisik:
          PemeriksaanFisik.fromJson(map["fisik"] as Map<String, dynamic>),
      triase:
          TriaseIgdDokterModel.fromJson(map['triase'] as Map<String, dynamic>),
      karyawan: Karyawan.fromJson(map['karyawan'] as Map<String, dynamic>),
    );
  }
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
        nama: json["nama"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        tglLahir: json["tgl_lahir"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
      };
}

class PemeriksaanFisik {
  final String insertDttm;
  final String insertDevice;
  final String insertUserId;
  final String ketPerson;
  final String pelayanan;
  final String kdBagian;
  final String kategori;
  final String noreg;
  final String alatKelamin;
  final String anggotaGerak;
  final String refleks;
  final String otot;
  final String rtVt;
  final String gcsE;
  final String gcsM;
  final String gcsV;
  final String pupil;
  final String pupilKiri;
  final String pupilKanan;
  final String isokor;
  final String isokorDetail;
  final String anisokor;
  final String cahayaKanan;
  final String cahayaKiri;
  final String akral;
  final String kesadaran;
  final String kepala;
  final String rambut;
  final String wajah;
  final String keadaanUmum;
  final String jalanNafas;
  final String sirkulasi;
  final String gangguan;
  final String kulit;
  final String abdomen;
  final String ginjal;
  final String abdomenLainnya;
  final String peristatikUsus;
  final String thyroid;
  final String hati;
  final String paru;
  final String mata;
  final String tht;
  final String telinga;
  final String hidung;
  final String mulut;
  final String gigi;
  final String lidah;
  final String tenggorokan;
  final String leher;
  final String lien;
  final String leherLainnya;
  final String dada;
  final String respirasi;
  final String perut;
  final String jantung;
  final String integument;
  final String ekstremitas;
  final String ekstremitasSuperior;
  final String ekstremitasInferior;
  final String kemampuanGenggam;
  final String genetalia;
  final String anus;
  final String punggung;
  final String lainLain;
  final String dindingdada;
  final String dindingdadaRetEpigastrium;
  final String dindingdadaRetSuprastermal;
  final String dindingdadaRetraksi;
  final String hepar;
  final String heparDetail;
  final String limpa;
  final String limpaDetail;
  final String ouf;
  final String tugorKulit;
  final String pemeriksaanFisik;
  final int skalaNyeri;
  final String skalaNyeriP;
  final String skalaNyeriQ;
  final String skalaNyeriR;
  final String skalaNyeriS;
  final String skalaNyeriT;
  final int flaccWajah;
  final int flaccKaki;
  final int flaccAktifitas;
  final int flaccMenangis;
  final int flaccBersuara;
  final int flaccTotal;
  final int skalaTriase;

  PemeriksaanFisik({
    required this.pupil,
    required this.insertDttm,
    required this.insertDevice,
    required this.insertUserId,
    required this.ketPerson,
    required this.pelayanan,
    required this.kdBagian,
    required this.kategori,
    required this.noreg,
    required this.alatKelamin,
    required this.anggotaGerak,
    required this.refleks,
    required this.otot,
    required this.rtVt,
    required this.gcsE,
    required this.gcsM,
    required this.gcsV,
    required this.pupilKiri,
    required this.pupilKanan,
    required this.isokor,
    required this.isokorDetail,
    required this.anisokor,
    required this.cahayaKanan,
    required this.cahayaKiri,
    required this.akral,
    required this.kesadaran,
    required this.kepala,
    required this.rambut,
    required this.wajah,
    required this.keadaanUmum,
    required this.jalanNafas,
    required this.sirkulasi,
    required this.gangguan,
    required this.kulit,
    required this.abdomen,
    required this.ginjal,
    required this.abdomenLainnya,
    required this.peristatikUsus,
    required this.thyroid,
    required this.hati,
    required this.paru,
    required this.mata,
    required this.tht,
    required this.telinga,
    required this.hidung,
    required this.mulut,
    required this.gigi,
    required this.lidah,
    required this.tenggorokan,
    required this.leher,
    required this.lien,
    required this.leherLainnya,
    required this.dada,
    required this.respirasi,
    required this.perut,
    required this.jantung,
    required this.integument,
    required this.ekstremitas,
    required this.ekstremitasSuperior,
    required this.ekstremitasInferior,
    required this.kemampuanGenggam,
    required this.genetalia,
    required this.anus,
    required this.punggung,
    required this.lainLain,
    required this.dindingdada,
    required this.dindingdadaRetEpigastrium,
    required this.dindingdadaRetSuprastermal,
    required this.dindingdadaRetraksi,
    required this.hepar,
    required this.heparDetail,
    required this.limpa,
    required this.limpaDetail,
    required this.ouf,
    required this.tugorKulit,
    required this.pemeriksaanFisik,
    required this.skalaNyeri,
    required this.skalaNyeriP,
    required this.skalaNyeriQ,
    required this.skalaNyeriR,
    required this.skalaNyeriS,
    required this.skalaNyeriT,
    required this.flaccWajah,
    required this.flaccKaki,
    required this.flaccAktifitas,
    required this.flaccMenangis,
    required this.flaccBersuara,
    required this.flaccTotal,
    required this.skalaTriase,
  });

  factory PemeriksaanFisik.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisik(
        pupil: json["pupil"].toString(),
        insertDttm: json["InsertDttm"].toString(),
        insertDevice: json["InsertDevice"].toString(),
        insertUserId: json["InsertUserId"].toString(),
        ketPerson: json["KetPerson"].toString(),
        pelayanan: json["Pelayanan"].toString(),
        kdBagian: json["KdBagian"].toString(),
        kategori: json["Kategori"].toString(),
        noreg: json["Noreg"].toString(),
        alatKelamin: json["AlatKelamin"].toString(),
        anggotaGerak: json["AnggotaGerak"].toString(),
        refleks: json["Refleks"].toString(),
        otot: json["Otot"].toString(),
        rtVt: json["RtVt"].toString(),
        gcsE: json["GcsE"].toString(),
        gcsM: json["GcsM"].toString(),
        gcsV: json["GcsV"].toString(),
        pupilKiri: json["PupilKiri"].toString(),
        pupilKanan: json["PupilKanan"].toString(),
        isokor: json["Isokor"].toString(),
        isokorDetail: json["IsokorDetail"].toString(),
        anisokor: json["Anisokor"].toString(),
        cahayaKanan: json["CahayaKanan"].toString(),
        cahayaKiri: json["CahayaKiri"].toString(),
        akral: json["Akral"].toString(),
        kesadaran: json["Kesadaran"].toString(),
        kepala: json["Kepala"].toString(),
        rambut: json["Rambut"].toString(),
        wajah: json["Wajah"].toString(),
        keadaanUmum: json["KeadaanUmum"].toString(),
        jalanNafas: json["JalanNafas"].toString(),
        sirkulasi: json["Sirkulasi"].toString(),
        gangguan: json["Gangguan"].toString(),
        kulit: json["Kulit"].toString(),
        abdomen: json["Abdomen"].toString(),
        ginjal: json["Ginjal"].toString(),
        abdomenLainnya: json["AbdomenLainnya"].toString(),
        peristatikUsus: json["PeristatikUsus"].toString(),
        thyroid: json["Thyroid"].toString(),
        hati: json["Hati"].toString(),
        paru: json["Paru"].toString(),
        mata: json["Mata"].toString(),
        tht: json["Tht"].toString(),
        telinga: json["Telinga"].toString(),
        hidung: json["Hidung"].toString(),
        mulut: json["Mulut"].toString(),
        gigi: json["Gigi"].toString(),
        lidah: json["Lidah"].toString(),
        tenggorokan: json["Tenggorokan"].toString(),
        leher: json["Leher"].toString(),
        lien: json["Lien"].toString(),
        leherLainnya: json["LeherLainnya"].toString(),
        dada: json["Dada"].toString(),
        respirasi: json["Respirasi"].toString(),
        perut: json["Perut"].toString(),
        jantung: json["Jantung"].toString(),
        integument: json["Integument"].toString(),
        ekstremitas: json["Ekstremitas"].toString(),
        ekstremitasSuperior: json["EkstremitasSuperior"].toString(),
        ekstremitasInferior: json["EkstremitasInferior"].toString(),
        kemampuanGenggam: json["KemampuanGenggam"].toString(),
        genetalia: json["Genetalia"].toString(),
        anus: json["Anus"].toString(),
        punggung: json["Punggung"].toString(),
        lainLain: json["LainLain"].toString(),
        dindingdada: json["Dindingdada"].toString(),
        dindingdadaRetEpigastrium: json["DindingdadaRetEpigastrium"].toString(),
        dindingdadaRetSuprastermal:
            json["DindingdadaRetSuprastermal"].toString(),
        dindingdadaRetraksi: json["DindingdadaRetraksi"].toString(),
        hepar: json["Hepar"].toString(),
        heparDetail: json["HeparDetail"].toString(),
        limpa: json["Limpa"].toString(),
        limpaDetail: json["LimpaDetail"].toString(),
        ouf: json["Ouf"].toString(),
        tugorKulit: json["TugorKulit"].toString(),
        pemeriksaanFisik: json["PemeriksaanFisik"].toString(),
        skalaNyeri: json["SkalaNyeri"] as int,
        skalaNyeriP: json["SkalaNyeriP"].toString(),
        skalaNyeriQ: json["SkalaNyeriQ"].toString(),
        skalaNyeriR: json["SkalaNyeriR"].toString(),
        skalaNyeriS: json["SkalaNyeriS"].toString(),
        skalaNyeriT: json["SkalaNyeriT"].toString(),
        flaccWajah: json["FlaccWajah"] as int,
        flaccKaki: json["FlaccKaki"] as int,
        flaccAktifitas: json["FlaccAktifitas"] as int,
        flaccMenangis: json["FlaccMenangis"] as int,
        flaccBersuara: json["FlaccBersuara"] as int,
        flaccTotal: json["FlaccTotal"] as int,
        skalaTriase: json["SkalaTriase"] as int,
      );

  Map<String, dynamic> toJson() => {
        "InsertDttm": insertDttm,
        "InsertDevice": insertDevice,
        "InsertUserId": insertUserId,
        "KetPerson": ketPerson,
        "Pelayanan": pelayanan,
        "KdBagian": kdBagian,
        "Kategori": kategori,
        "Noreg": noreg,
        "AlatKelamin": alatKelamin,
        "AnggotaGerak": anggotaGerak,
        "Refleks": refleks,
        "Otot": otot,
        "RtVt": rtVt,
        "GcsE": gcsE,
        "GcsM": gcsM,
        "GcsV": gcsV,
        "PupilKiri": pupilKiri,
        "PupilKanan": pupilKanan,
        "Isokor": isokor,
        "IsokorDetail": isokorDetail,
        "Anisokor": anisokor,
        "CahayaKanan": cahayaKanan,
        "CahayaKiri": cahayaKiri,
        "Akral": akral,
        "Kesadaran": kesadaran,
        "Kepala": kepala,
        "Rambut": rambut,
        "Wajah": wajah,
        "KeadaanUmum": keadaanUmum,
        "JalanNafas": jalanNafas,
        "Sirkulasi": sirkulasi,
        "Gangguan": gangguan,
        "Kulit": kulit,
        "Abdomen": abdomen,
        "Ginjal": ginjal,
        "AbdomenLainnya": abdomenLainnya,
        "PeristatikUsus": peristatikUsus,
        "Thyroid": thyroid,
        "Hati": hati,
        "Paru": paru,
        "Mata": mata,
        "Tht": tht,
        "Telinga": telinga,
        "Hidung": hidung,
        "Mulut": mulut,
        "Gigi": gigi,
        "Lidah": lidah,
        "Tenggorokan": tenggorokan,
        "Leher": leher,
        "Lien": lien,
        "LeherLainnya": leherLainnya,
        "Dada": dada,
        "Respirasi": respirasi,
        "Perut": perut,
        "Jantung": jantung,
        "Integument": integument,
        "Ekstremitas": ekstremitas,
        "EkstremitasSuperior": ekstremitasSuperior,
        "EkstremitasInferior": ekstremitasInferior,
        "KemampuanGenggam": kemampuanGenggam,
        "Genetalia": genetalia,
        "Anus": anus,
        "Punggung": punggung,
        "LainLain": lainLain,
        "Dindingdada": dindingdada,
        "DindingdadaRetEpigastrium": dindingdadaRetEpigastrium,
        "DindingdadaRetSuprastermal": dindingdadaRetSuprastermal,
        "DindingdadaRetraksi": dindingdadaRetraksi,
        "Hepar": hepar,
        "HeparDetail": heparDetail,
        "Limpa": limpa,
        "LimpaDetail": limpaDetail,
        "Ouf": ouf,
        "TugorKulit": tugorKulit,
        "PemeriksaanFisik": pemeriksaanFisik,
        "SkalaNyeri": skalaNyeri,
        "SkalaNyeriP": skalaNyeriP,
        "SkalaNyeriQ": skalaNyeriQ,
        "SkalaNyeriR": skalaNyeriR,
        "SkalaNyeriS": skalaNyeriS,
        "SkalaNyeriT": skalaNyeriT,
        "FlaccWajah": flaccWajah,
        "FlaccKaki": flaccKaki,
        "FlaccAktifitas": flaccAktifitas,
        "FlaccMenangis": flaccMenangis,
        "FlaccBersuara": flaccBersuara,
        "FlaccTotal": flaccTotal,
        "SkalaTriase": skalaTriase,
      };
}

class Vital {
  final String gcsE;
  final String gcsV;
  final String gcsM;
  final String td;
  final String nadi;
  final String suhu;
  final String kesadaran;
  final String pernafasan;
  final String spo2;
  final String tinggiBadan;
  final String beratBadan;

  Vital({
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.td,
    required this.nadi,
    required this.suhu,
    required this.kesadaran,
    required this.pernafasan,
    required this.spo2,
    required this.tinggiBadan,
    required this.beratBadan,
  });

  factory Vital.fromJson(Map<String, dynamic> json) => Vital(
        gcsE: json["gcs_e"].toString(),
        gcsV: json["gcs_v"].toString(),
        gcsM: json["gcs_m"].toString(),
        td: json["td"].toString(),
        nadi: json["nadi"].toString(),
        suhu: json["suhu"].toString(),
        kesadaran: json["kesadaran"].toString(),
        pernafasan: json["pernafasan"].toString(),
        spo2: json["spo2"].toString(),
        tinggiBadan: json["tinggi_badan"].toString(),
        beratBadan: json["berat_badan"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "gcs_e": gcsE,
        "gcs_v": gcsV,
        "gcs_m": gcsM,
        "td": td,
        "nadi": nadi,
        "suhu": suhu,
        "kesadaran": kesadaran,
        "pernafasan": pernafasan,
        "spo2": spo2,
        "tinggi_badan": tinggiBadan,
        "berat_badan": beratBadan,
      };
}

class KeluhanUtama {
  final List<dynamic> riwayatTerdahulu;
  final List<RiwayatKeluarga> riwayatKeluarga;
  final Asesmen asesmen;

  KeluhanUtama({
    required this.riwayatTerdahulu,
    required this.riwayatKeluarga,
    required this.asesmen,
  });

  factory KeluhanUtama.fromJson(Map<String, dynamic> json) => KeluhanUtama(
        riwayatTerdahulu:
            List<dynamic>.from(json["riwayat_terdahulu"].map((x) => x)),
        riwayatKeluarga: List<RiwayatKeluarga>.from(
            json["riwayat_keluarga"].map((x) => RiwayatKeluarga.fromJson(x))),
        asesmen: Asesmen.fromJson(json["asesmen"]),
      );

  Map<String, dynamic> toJson() => {
        "riwayat_terdahulu": List<dynamic>.from(riwayatTerdahulu.map((x) => x)),
        "riwayat_keluarga":
            List<dynamic>.from(riwayatKeluarga.map((x) => x.toJson())),
        "asesmen": asesmen.toJson(),
      };
}

class Asesmen {
  final String noreg;
  final String keluhUtama;
  final String rwtSekarang;

  Asesmen({
    required this.noreg,
    required this.keluhUtama,
    required this.rwtSekarang,
  });

  factory Asesmen.fromJson(Map<String, dynamic> json) => Asesmen(
        noreg: json["noreg"].toString(),
        keluhUtama: json["keluh_utama"].toString(),
        rwtSekarang: json["rwt_sekarang"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "keluh_utama": keluhUtama,
        "rwt_sekarang": rwtSekarang,
      };
}

class RiwayatKeluarga {
  final String noRm;
  final String kelompok;
  final String insertDttm;
  final String alergi;
  final String namaUser;
  final String bagian;

  RiwayatKeluarga({
    required this.noRm,
    required this.kelompok,
    required this.insertDttm,
    required this.alergi,
    required this.namaUser,
    required this.bagian,
  });

  factory RiwayatKeluarga.fromJson(Map<String, dynamic> json) =>
      RiwayatKeluarga(
        noRm: json["no_rm"].toString(),
        kelompok: json["kelompok"].toString(),
        insertDttm: json["insert_dttm"].toString(),
        alergi: json["alergi"].toString(),
        namaUser: json["nama_user"].toString(),
        bagian: json["bagian"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "no_rm": noRm,
        "kelompok": kelompok,
        "insert_dttm": insertDttm,
        "alergi": alergi,
        "nama_user": namaUser,
        "bagian": bagian,
      };
}
