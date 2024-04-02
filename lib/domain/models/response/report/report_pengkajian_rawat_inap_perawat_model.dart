class ReportPengkajianRawatInapPerawat {
  FisikPerawat fisik;
  VitalPerawat vital;
  AsesmenPerawat asesmenPerawat;
  NutrisiResponse nutrisiResponse;
  FungsionalModel fungsional;
  List<RiwayatPengobatan> riwayatPengobatan;
  List<AsuhanKeperawatanModel> asuhanKeperawatan;
  List<RiwayatPenyakit> riwayatPenyakit;
  List<RiwayatPenyakitKeluarga> riwayatPenyakitKeluarga;
  ReportPengkajianRawatInapPerawat({
    required this.fungsional,
    required this.riwayatPenyakit,
    required this.nutrisiResponse,
    required this.fisik,
    required this.riwayatPengobatan,
    required this.vital,
    required this.asesmenPerawat,
    required this.asuhanKeperawatan,
    required this.riwayatPenyakitKeluarga,
  });

  factory ReportPengkajianRawatInapPerawat.fromMap(Map<String, dynamic> map) {
    return ReportPengkajianRawatInapPerawat(
      riwayatPenyakit: List<RiwayatPenyakit>.from(map["riwayat_penyakit_dahulu"]
          .map((x) => RiwayatPenyakit.fromMap(x))),
      riwayatPenyakitKeluarga: List<RiwayatPenyakitKeluarga>.from(
          map["riwayat_keluarga"]
              .map((x) => RiwayatPenyakitKeluarga.fromJson(x))),
      nutrisiResponse: NutrisiResponse.fromJson(map["nutrisi"]),
      fungsional: FungsionalModel.fromJson(map["fungsional"]),
      riwayatPengobatan: List<RiwayatPengobatan>.from(
          map["pengobatan"].map((x) => RiwayatPengobatan.fromJson(x))),
      asuhanKeperawatan: List<AsuhanKeperawatanModel>.from(
          map["asuhan"].map((x) => AsuhanKeperawatanModel.fromJson(x))),
      asesmenPerawat: AsesmenPerawat.fromJson(map["asesmen"]),
      vital: VitalPerawat.fromJson(map["vital"]),
      fisik: FisikPerawat.fromJson(map['fisik']),
    );
  }
}

class NutrisiResponse {
  final String n1;
  final String n2;
  final int nilai;

  NutrisiResponse({
    required this.n1,
    required this.n2,
    required this.nilai,
  });

  factory NutrisiResponse.fromJson(Map<String, dynamic> json) =>
      NutrisiResponse(
        n1: json["n1"],
        n2: json["n2"],
        nilai: json["nilai"],
      );

  Map<String, dynamic> toJson() => {
        "n1": n1,
        "n2": n2,
        "nilai": nilai,
      };
}

class RiwayatPenyakit {
  final String tglMasuk;
  final String keluhan;
  final String riwayat;
  RiwayatPenyakit({
    required this.tglMasuk,
    required this.keluhan,
    required this.riwayat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tgl_masuk': tglMasuk,
      'keluh_utama': keluhan,
      'riwayat_sekarang': riwayat,
    };
  }

  factory RiwayatPenyakit.fromMap(Map<String, dynamic> map) {
    return RiwayatPenyakit(
      tglMasuk: map['tgl_masuk'].toString(),
      keluhan: map['keluh_utama'].toString(),
      riwayat: map['riwayat_sekarang'].toString(),
    );
  }
}

class FungsionalModel {
  final String f1;
  final String f2;
  final String f3;
  final String f4;
  final String f5;
  final String f6;
  final String f7;
  final String f8;
  final String f9;
  final String f10;
  final int nilai;

  FungsionalModel({
    required this.f1,
    required this.f2,
    required this.f3,
    required this.f4,
    required this.f5,
    required this.f6,
    required this.f7,
    required this.f8,
    required this.f9,
    required this.f10,
    required this.nilai,
  });

  factory FungsionalModel.fromJson(Map<String, dynamic> json) =>
      FungsionalModel(
        f1: json["f1"],
        f2: json["f2"],
        f3: json["f3"],
        f4: json["f4"],
        f5: json["f5"],
        f6: json["f6"],
        f7: json["f7"],
        f8: json["f8"],
        f9: json["f9"],
        f10: json["f10"],
        nilai: json["nilai"],
      );

  Map<String, dynamic> toJson() => {
        "f1": f1,
        "f2": f2,
        "f3": f3,
        "f4": f4,
        "f5": f5,
        "f6": f6,
        "f7": f7,
        "f8": f8,
        "f9": f9,
        "f10": f10,
        "nilai": nilai,
      };
}

class RiwayatPenyakitKeluarga {
  final String tanggal;
  final String penyakit;

  RiwayatPenyakitKeluarga({
    required this.tanggal,
    required this.penyakit,
  });

  factory RiwayatPenyakitKeluarga.fromJson(Map<String, dynamic> json) =>
      RiwayatPenyakitKeluarga(
        tanggal: json["tanggal"],
        penyakit: json["penyakit"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "penyakit": penyakit,
      };
}

class FisikPerawat {
  String alatKelamin;
  String anggotaGerak;
  String refleks;
  String otot;
  String rtVt;
  String gcsE;
  String gcsM;
  String gcsV;
  String pupilKiri;
  String pupilKanan;
  String isokor;
  String isokorDetail;
  String anisokor;
  String cahayaKanan;
  String cahayaKiri;
  String akral;
  String pupil;
  String kesadaran;
  String kepala;
  String rambut;
  String wajah;
  String keadaanUmum;
  String jalanNafas;
  String sirkulasi;
  String gangguan;
  String kulit;
  String abdomen;
  String ginjal;
  String abdomenLainnya;
  String peristatikUsus;
  String thyroid;
  String hati;
  String paru;
  String mata;
  String tht;
  String telinga;
  String hidung;
  String mulut;
  String gigi;
  String lidah;
  String tenggorokan;
  String lehe;
  String lien;
  String leherLainnya;
  String dada;
  String repirasi;
  String perut;
  String jantung;
  String integument;
  String ekstremitas;
  String ekstremitasSuperior;
  String ekstremitasInferior;
  String kemampuanGemgam;
  String genetalia;
  String anus;
  String punggung;
  String lainLain;
  String dindingDada;
  String epigastrium;
  String supratermal;
  String retraksi;
  String hepar;
  String heparDetail;
  String limpa;
  String limpaDetail;
  String ouf;
  String tugorKulit;
  String pemeriksaanFisik;
  int skalaNyeri;
  String nyeriP;
  String nyeriQ;
  String nyeriR;
  String nyeriS;
  String nyeriT;
  int flaccWajah;
  int flaccKaki;
  int flaccAktivitas;
  int flaccMenangis;
  int flaccBersuara;
  int flaccTotal;
  int skalaTriase;

  FisikPerawat({
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
    required this.pupil,
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
    required this.lehe,
    required this.lien,
    required this.leherLainnya,
    required this.dada,
    required this.repirasi,
    required this.perut,
    required this.jantung,
    required this.integument,
    required this.ekstremitas,
    required this.ekstremitasSuperior,
    required this.ekstremitasInferior,
    required this.kemampuanGemgam,
    required this.genetalia,
    required this.anus,
    required this.punggung,
    required this.lainLain,
    required this.dindingDada,
    required this.epigastrium,
    required this.supratermal,
    required this.retraksi,
    required this.hepar,
    required this.heparDetail,
    required this.limpa,
    required this.limpaDetail,
    required this.ouf,
    required this.tugorKulit,
    required this.pemeriksaanFisik,
    required this.skalaNyeri,
    required this.nyeriP,
    required this.nyeriQ,
    required this.nyeriR,
    required this.nyeriS,
    required this.nyeriT,
    required this.flaccWajah,
    required this.flaccKaki,
    required this.flaccAktivitas,
    required this.flaccMenangis,
    required this.flaccBersuara,
    required this.flaccTotal,
    required this.skalaTriase,
  });

  factory FisikPerawat.fromJson(Map<String, dynamic> json) => FisikPerawat(
        alatKelamin: json["alat_kelamin"].toString(),
        anggotaGerak: json["anggota_gerak"].toString(),
        refleks: json["refleks"].toString(),
        otot: json["otot"].toString(),
        rtVt: json["rt_vt"].toString(),
        gcsE: json["gcs_e"].toString(),
        gcsM: json["gcs_m"].toString(),
        gcsV: json["gcs_v"].toString(),
        pupilKiri: json["pupil_kiri"].toString(),
        pupilKanan: json["pupil_kanan"].toString(),
        isokor: json["isokor"].toString(),
        isokorDetail: json["isokor_detail"].toString(),
        anisokor: json["anisokor"].toString(),
        cahayaKanan: json["cahaya_kanan"].toString(),
        cahayaKiri: json["cahaya_kiri"].toString(),
        akral: json["akral"].toString(),
        pupil: json["pupil"].toString(),
        kesadaran: json["kesadaran"].toString(),
        kepala: json["kepala"].toString(),
        rambut: json["rambut"].toString(),
        wajah: json["wajah"].toString(),
        keadaanUmum: json["keadaan_umum"].toString(),
        jalanNafas: json["jalan_nafas"].toString(),
        sirkulasi: json["sirkulasi"].toString(),
        gangguan: json["gangguan"].toString(),
        kulit: json["kulit"].toString(),
        abdomen: json["abdomen"].toString(),
        ginjal: json["ginjal"].toString(),
        abdomenLainnya: json["abdomen_lainnya"].toString(),
        peristatikUsus: json["peristatik_usus"].toString(),
        thyroid: json["thyroid"].toString(),
        hati: json["hati"].toString(),
        paru: json["paru"].toString(),
        mata: json["mata"].toString(),
        tht: json["tht"].toString(),
        telinga: json["telinga"].toString(),
        hidung: json["hidung"].toString(),
        mulut: json["mulut"].toString(),
        gigi: json["gigi"].toString(),
        lidah: json["lidah"].toString(),
        tenggorokan: json["tenggorokan"].toString(),
        lehe: json["lehe"].toString(),
        lien: json["lien"].toString(),
        leherLainnya: json["leher_lainnya"].toString(),
        dada: json["dada"].toString(),
        repirasi: json["repirasi"].toString(),
        perut: json["perut"].toString(),
        jantung: json["jantung"].toString(),
        integument: json["integument"].toString(),
        ekstremitas: json["ekstremitas"].toString(),
        ekstremitasSuperior: json["ekstremitas_superior"].toString(),
        ekstremitasInferior: json["ekstremitas_inferior"].toString(),
        kemampuanGemgam: json["kemampuan_gemgam"].toString(),
        genetalia: json["genetalia"].toString(),
        anus: json["anus"].toString(),
        punggung: json["punggung"].toString(),
        lainLain: json["lain_lain"].toString(),
        dindingDada: json["dinding_dada"].toString(),
        epigastrium: json["epigastrium"].toString(),
        supratermal: json["supratermal"].toString(),
        retraksi: json["retraksi"].toString(),
        hepar: json["hepar"].toString(),
        heparDetail: json["hepar_detail"].toString(),
        limpa: json["limpa"].toString(),
        limpaDetail: json["limpa_detail"].toString(),
        ouf: json["ouf"].toString(),
        tugorKulit: json["tugor_kulit"].toString(),
        pemeriksaanFisik: json["pemeriksaan_fisik"].toString(),
        skalaNyeri: json["skala_nyeri"] as int,
        nyeriP: json["nyeri_p"].toString(),
        nyeriQ: json["nyeri_q"].toString(),
        nyeriR: json["nyeri_r"].toString(),
        nyeriS: json["nyeri_s"].toString(),
        nyeriT: json["nyeri_t"].toString(),
        flaccWajah: json["flacc_wajah"] as int,
        flaccKaki: json["flacc_kaki "] as int,
        flaccAktivitas: json["flacc_aktivitas"] as int,
        flaccMenangis: json["flacc_menangis"] as int,
        flaccBersuara: json["flacc_bersuara"] as int,
        flaccTotal: json["flacc_total"] as int,
        skalaTriase: json["skala_triase"] as int,
      );

  Map<String, dynamic> toJson() => {
        "alat_kelamin": alatKelamin,
        "anggota_gerak": anggotaGerak,
        "refleks": refleks,
        "otot": otot,
        "rt_vt": rtVt,
        "gcs_e": gcsE,
        "gcs_m": gcsM,
        "gcs_v": gcsV,
        "pupil_kiri": pupilKiri,
        "pupil_kanan": pupilKanan,
        "isokor": isokor,
        "isokor_detail": isokorDetail,
        "anisokor": anisokor,
        "cahaya_kanan": cahayaKanan,
        "cahaya_kiri": cahayaKiri,
        "akral": akral,
        "pupil": pupil,
        "kesadaran": kesadaran,
        "kepala": kepala,
        "rambut": rambut,
        "wajah": wajah,
        "keadaan_umum": keadaanUmum,
        "jalan_nafas": jalanNafas,
        "sirkulasi": sirkulasi,
        "gangguan": gangguan,
        "kulit": kulit,
        "abdomen": abdomen,
        "ginjal": ginjal,
        "abdomen_lainnya": abdomenLainnya,
        "peristatik_usus": peristatikUsus,
        "thyroid": thyroid,
        "hati": hati,
        "paru": paru,
        "mata": mata,
        "tht": tht,
        "telinga": telinga,
        "hidung": hidung,
        "mulut": mulut,
        "gigi": gigi,
        "lidah": lidah,
        "tenggorokan": tenggorokan,
        "lehe": lehe,
        "lien": lien,
        "leher_lainnya": leherLainnya,
        "dada": dada,
        "repirasi": repirasi,
        "perut": perut,
        "jantung": jantung,
        "integument": integument,
        "ekstremitas": ekstremitas,
        "ekstremitas_superior": ekstremitasSuperior,
        "ekstremitas_inferior": ekstremitasInferior,
        "kemampuan_gemgam": kemampuanGemgam,
        "genetalia": genetalia,
        "anus": anus,
        "punggung": punggung,
        "lain_lain": lainLain,
        "dinding_dada": dindingDada,
        "epigastrium": epigastrium,
        "supratermal": supratermal,
        "retraksi": retraksi,
        "hepar": hepar,
        "hepar_detail": heparDetail,
        "limpa": limpa,
        "limpa_detail": limpaDetail,
        "ouf": ouf,
        "tugor_kulit": tugorKulit,
        "pemeriksaan_fisik": pemeriksaanFisik,
        "skala_nyeri": skalaNyeri,
        "nyeri_p": nyeriP,
        "nyeri_q": nyeriQ,
        "nyeri_r": nyeriR,
        "nyeri_s": nyeriS,
        "nyeri_t": nyeriT,
        "flacc_wajah": flaccWajah,
        "flacc_kaki ": flaccKaki,
        "flacc_aktivitas": flaccAktivitas,
        "flacc_menangis": flaccMenangis,
        "flacc_bersuara": flaccBersuara,
        "flacc_total": flaccTotal,
        "skala_triase": skalaTriase,
      };
}

class VitalPerawat {
  String insertDttm;
  String userId;
  String pelayanan;
  String kdBagian;
  String deviceId;
  String kategori;
  String person;
  String noreg;
  String td;
  String nadi;
  String suhu;
  String spo2;
  String pernafasan;
  String tinggiBadan;
  String beratBadan;

  VitalPerawat({
    required this.insertDttm,
    required this.userId,
    required this.pelayanan,
    required this.kdBagian,
    required this.deviceId,
    required this.kategori,
    required this.person,
    required this.noreg,
    required this.td,
    required this.nadi,
    required this.suhu,
    required this.spo2,
    required this.pernafasan,
    required this.tinggiBadan,
    required this.beratBadan,
  });

  factory VitalPerawat.fromJson(Map<String, dynamic> json) => VitalPerawat(
        insertDttm: json["insert_dttm"].toString(),
        userId: json["user_id"].toString(),
        pelayanan: json["pelayanan"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        deviceId: json["device_id"].toString(),
        kategori: json["kategori"].toString(),
        person: json["person"].toString(),
        noreg: json["noreg"].toString(),
        td: json["td"].toString(),
        nadi: json["nadi"].toString(),
        suhu: json["suhu"].toString(),
        spo2: json["spo2"].toString(),
        pernafasan: json["pernafasan"].toString(),
        tinggiBadan: json["tinggi_badan"].toString(),
        beratBadan: json["berat_badan"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "user_id": userId,
        "pelayanan": pelayanan,
        "kd_bagian": kdBagian,
        "device_id": deviceId,
        "kategori": kategori,
        "person": person,
        "noreg": noreg,
        "td": td,
        "nadi": nadi,
        "suhu": suhu,
        "spo2": spo2,
        "pernafasan": pernafasan,
        "tinggi_badan": tinggiBadan,
        "berat_badan": beratBadan,
      };
}

class AsesmenPerawat {
  final String person;
  final String jenpel;
  final String insertDttm;
  final String jenpelDetail;
  final String tglMasuk;
  final String tglKeluar;
  final String kdBagian;
  final String noreg;
  final String keluhan;
  final String userId;
  final String riwayatPenyakit;
  final String riwayatPenyakitDahulu;
  final String nama;
  final String reaksiAlergi;
  final String eliminasiBak;
  final String eliminasiBab;
  final String istirahat;
  final String sistemAktivitas;
  final String sistemMandi;
  final String sistemBerpakaian;
  final String sistemMakan;
  final String sistemEliminasi;
  final String sistemMobilisasi;
  final String sistemKardiovaskuler;
  final String sistemRespiratori;
  final String sistemSecebral;
  final String sistemPerfusiPerifer;
  final String sistemPencernaan;
  final String sistemIntegumen;
  final String sistemKenyamaman;
  final String sistemProteksi;
  final String sitemPapsSmer;
  final String sistemHamil;
  final String sistemPendaharan;
  final String hambatanBahasa;
  final String caraBelajar;
  final String bahasaSehari;
  final String spikologis;
  final String hambatanSosial;
  final String hambatanEkonomi;
  final String hambatanSpiritual;
  final String responseEmosi;
  final String nilaiKepercayaan;
  final String presepsiSakit;
  final String thermoregulasi;
  final String khususKepercayaan;
  final String sistemUsus;
  final String akral;
  final String batuk;
  final String suaraNapas;
  final String merokok;
  final String sakitKepala;
  final String perubahanStatusMental;
  final String anggotaGerak;
  final String bicara;
  final String riwayatHipertensi;
  final String perluPenerjemah;
  final String nutrisi;

  AsesmenPerawat({
    required this.person,
    required this.akral,
    required this.batuk,
    required this.suaraNapas,
    required this.merokok,
    required this.jenpel,
    required this.tglMasuk,
    required this.insertDttm,
    required this.jenpelDetail,
    required this.tglKeluar,
    required this.kdBagian,
    required this.noreg,
    required this.keluhan,
    required this.userId,
    required this.riwayatPenyakit,
    required this.riwayatPenyakitDahulu,
    required this.nama,
    required this.reaksiAlergi,
    required this.eliminasiBak,
    required this.eliminasiBab,
    required this.istirahat,
    required this.sistemAktivitas,
    required this.sistemMandi,
    required this.sistemBerpakaian,
    required this.sistemMakan,
    required this.sistemEliminasi,
    required this.sistemMobilisasi,
    required this.sistemKardiovaskuler,
    required this.sistemRespiratori,
    required this.sistemSecebral,
    required this.sistemPerfusiPerifer,
    required this.sistemPencernaan,
    required this.sistemIntegumen,
    required this.sistemKenyamaman,
    required this.sistemProteksi,
    required this.sitemPapsSmer,
    required this.sistemHamil,
    required this.sistemPendaharan,
    required this.hambatanBahasa,
    required this.caraBelajar,
    required this.bahasaSehari,
    required this.spikologis,
    required this.hambatanSosial,
    required this.hambatanEkonomi,
    required this.hambatanSpiritual,
    required this.responseEmosi,
    required this.nilaiKepercayaan,
    required this.presepsiSakit,
    required this.thermoregulasi,
    required this.khususKepercayaan,
    required this.sistemUsus,
    required this.sakitKepala,
    required this.perubahanStatusMental,
    required this.anggotaGerak,
    required this.bicara,
    required this.riwayatHipertensi,
    required this.perluPenerjemah,
    required this.nutrisi,
  });

  factory AsesmenPerawat.fromJson(Map<String, dynamic> json) => AsesmenPerawat(
        nutrisi: json["nutrisi"],
        anggotaGerak: json["anggota_gerak"],
        perluPenerjemah: json["perlu_penerjemah"],
        bicara: json["bicara"],
        riwayatHipertensi: json["riwayat_hipertensi"],
        akral: json["akral"],
        sakitKepala: json["sakit_kepala"],
        perubahanStatusMental: json["perubahan_status_mental"],
        batuk: json["batuk"],
        merokok: json["merokok"],
        suaraNapas: json["merokok"],
        sistemUsus: json["sistem_usus"],
        insertDttm: json["insert_dttm"],
        jenpel: json["jenpel"],
        jenpelDetail: json["jenpel_detail"],
        person: json["person"],
        tglMasuk: json["tgl_masuk"],
        tglKeluar: json["tgl_keluar"],
        kdBagian: json["kd_bagian"],
        noreg: json["noreg"],
        keluhan: json["keluhan"],
        userId: json["user_id"],
        riwayatPenyakit: json["riwayat_penyakit"],
        riwayatPenyakitDahulu: json["riwayat_penyakit_dahulu"],
        nama: json["nama"],
        reaksiAlergi: json["reaksi_alergi"],
        eliminasiBak: json["eliminasi_bak"],
        eliminasiBab: json["eliminasi_bab"],
        istirahat: json["istirahat"],
        sistemAktivitas: json["sistem_aktivitas"],
        sistemMandi: json["sistem_mandi"],
        sistemBerpakaian: json["sistem_berpakaian"],
        sistemMakan: json["sistem_makan"],
        sistemEliminasi: json["sistem_eliminasi"],
        sistemMobilisasi: json["sistem_mobilisasi"],
        sistemKardiovaskuler: json["sistem_kardiovaskuler"],
        sistemRespiratori: json["sistem_respiratori"],
        sistemSecebral: json["sistem_secebral"],
        sistemPerfusiPerifer: json["sistem_perfusi_perifer"],
        sistemPencernaan: json["sistem_pencernaan"],
        sistemIntegumen: json["sistem_integumen"],
        sistemKenyamaman: json["sistem_kenyamaman"],
        sistemProteksi: json["sistem_proteksi"],
        sitemPapsSmer: json["sitem_paps_smer"],
        sistemHamil: json["sistem_hamil"],
        sistemPendaharan: json["sistem_pendaharan"],
        hambatanBahasa: json["hambatan_bahasa"],
        caraBelajar: json["cara_belajar"],
        bahasaSehari: json["bahasa_sehari"],
        spikologis: json["spikologis"],
        hambatanSosial: json["hambatan_sosial"],
        hambatanEkonomi: json["hambatan_ekonomi"],
        hambatanSpiritual: json["hambatan_spiritual"],
        responseEmosi: json["response_emosi"],
        nilaiKepercayaan: json["nilai_kepercayaan"],
        presepsiSakit: json["presepsi_sakit"],
        thermoregulasi: json["thermoregulasi"],
        khususKepercayaan: json["khusus_kepercayaan"],
      );

  Map<String, dynamic> toJson() => {
        "person": person,
        "tgl_masuk": tglMasuk,
        "tgl_keluar": tglKeluar,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "keluhan": keluhan,
        "user_id": userId,
        "riwayat_penyakit": riwayatPenyakit,
        "riwayat_penyakit_dahulu": riwayatPenyakitDahulu,
        "nama": nama,
        "reaksi_alergi": reaksiAlergi,
      };
}

class RiwayatPengobatan {
  final DateTime insertDttm;
  final String userId;
  final String deviceId;
  final String kdRiwayat;
  final String noreg;
  final String namaObat;
  final String dosis;
  final String caraPemberian;
  final String frekuensi;
  final DateTime waktu;

  RiwayatPengobatan({
    required this.insertDttm,
    required this.userId,
    required this.deviceId,
    required this.kdRiwayat,
    required this.noreg,
    required this.namaObat,
    required this.dosis,
    required this.caraPemberian,
    required this.frekuensi,
    required this.waktu,
  });

  factory RiwayatPengobatan.fromJson(Map<String, dynamic> json) =>
      RiwayatPengobatan(
        insertDttm: DateTime.parse(json["insert_dttm"]),
        userId: json["user_id"],
        deviceId: json["device_id"],
        kdRiwayat: json["kd_riwayat"],
        noreg: json["noreg"],
        namaObat: json["nama_obat"],
        dosis: json["dosis"],
        caraPemberian: json["cara_pemberian"],
        frekuensi: json["frekuensi"],
        waktu: DateTime.parse(json["waktu"]),
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm.toIso8601String(),
        "user_id": userId,
        "device_id": deviceId,
        "kd_riwayat": kdRiwayat,
        "noreg": noreg,
        "nama_obat": namaObat,
        "dosis": dosis,
        "cara_pemberian": caraPemberian,
        "frekuensi": frekuensi,
        "waktu": waktu.toIso8601String(),
      };
}

class AsuhanKeperawatanModel {
  final String userId;
  final String tanggal;
  final String kdBagian;
  final String noReg;
  final String hasil;
  final String kodeDiagnosa;
  final String noDaskep;
  final Diagnosa diagnosa;
  final List<DeskripsiSlki> deskripsiSlki;
  final List<DeskripsiSiki> deskripsiSiki;
  final Perawat perawat;
  final Bagian bagian;

  AsuhanKeperawatanModel({
    required this.userId,
    required this.tanggal,
    required this.kdBagian,
    required this.noReg,
    required this.hasil,
    required this.kodeDiagnosa,
    required this.noDaskep,
    required this.diagnosa,
    required this.deskripsiSlki,
    required this.deskripsiSiki,
    required this.perawat,
    required this.bagian,
  });

  factory AsuhanKeperawatanModel.fromJson(Map<String, dynamic> json) =>
      AsuhanKeperawatanModel(
        userId: json["user_id"],
        tanggal: json["tanggal"],
        kdBagian: json["kd_bagian"],
        noReg: json["no_reg"],
        hasil: json["hasil"],
        kodeDiagnosa: json["kode_diagnosa"],
        noDaskep: json["no_daskep"],
        diagnosa: Diagnosa.fromJson(json["diagnosa"]),
        deskripsiSlki: List<DeskripsiSlki>.from(
            json["deskripsi_slki"].map((x) => DeskripsiSlki.fromJson(x))),
        deskripsiSiki: List<DeskripsiSiki>.from(
            json["deskripsi_siki"].map((x) => DeskripsiSiki.fromJson(x))),
        perawat: Perawat.fromJson(json["perawat"]),
        bagian: Bagian.fromJson(json["bagian"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "tanggal": tanggal,
        "kd_bagian": kdBagian,
        "no_reg": noReg,
        "hasil": hasil,
        "kode_diagnosa": kodeDiagnosa,
        "no_daskep": noDaskep,
        "diagnosa": diagnosa.toJson(),
        "deskripsi_slki":
            List<dynamic>.from(deskripsiSlki.map((x) => x.toJson())),
        "deskripsi_siki":
            List<dynamic>.from(deskripsiSiki.map((x) => x.toJson())),
        "perawat": perawat.toJson(),
        "bagian": bagian.toJson(),
      };
}

class Bagian {
  final String kdBag;
  final String bagian;
  final String pelayanan;

  Bagian({
    required this.kdBag,
    required this.bagian,
    required this.pelayanan,
  });

  factory Bagian.fromJson(Map<String, dynamic> json) => Bagian(
        kdBag: json["kd_bag"],
        bagian: json["bagian"],
        pelayanan: json["pelayanan"],
      );

  Map<String, dynamic> toJson() => {
        "kd_bag": kdBag,
        "bagian": bagian,
        "pelayanan": pelayanan,
      };
}

class DeskripsiSiki {
  final DateTime insertDttm;
  final String noDaskep;
  final int idSiki;
  final String kodeSiki;
  final String namaSiki;
  final String kategori;
  final int noUrut;

  DeskripsiSiki({
    required this.insertDttm,
    required this.noDaskep,
    required this.idSiki,
    required this.kodeSiki,
    required this.namaSiki,
    required this.kategori,
    required this.noUrut,
  });

  factory DeskripsiSiki.fromJson(Map<String, dynamic> json) => DeskripsiSiki(
        insertDttm: DateTime.parse(json["insert_dttm"]),
        noDaskep: json["no_daskep"],
        idSiki: json["id_siki"],
        kodeSiki: json["kode_siki"],
        namaSiki: json["nama_siki"],
        kategori: json["kategori"],
        noUrut: json["no_urut"],
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm.toIso8601String(),
        "no_daskep": noDaskep,
        "id_siki": idSiki,
        "kode_siki": kodeSiki,
        "nama_siki": namaSiki,
        "kategori": kategori,
        "no_urut": noUrut,
      };
}

class DeskripsiSlki {
  final String insertDttm;
  final String noDaskep;
  final int idKriteria;
  final String kodeSlki;
  final String namaSllki;
  final String kategori;
  final int noUrut;
  final int hasil;
  final int target;
  final int waktu;

  DeskripsiSlki({
    required this.insertDttm,
    required this.noDaskep,
    required this.idKriteria,
    required this.kodeSlki,
    required this.namaSllki,
    required this.kategori,
    required this.noUrut,
    required this.hasil,
    required this.target,
    required this.waktu,
  });

  factory DeskripsiSlki.fromJson(Map<String, dynamic> json) => DeskripsiSlki(
        insertDttm: json["insert_dttm"],
        noDaskep: json["no_daskep"],
        idKriteria: json["id_kriteria"],
        kodeSlki: json["kode_slki"],
        namaSllki: json["nama_sllki"],
        kategori: json["kategori"],
        noUrut: json["no_urut"],
        hasil: json["hasil"],
        target: json["target"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "no_daskep": noDaskep,
        "id_kriteria": idKriteria,
        "kode_slki": kodeSlki,
        "nama_sllki": namaSllki,
        "kategori": kategori,
        "no_urut": noUrut,
        "hasil": hasil,
        "target": target,
        "waktu": waktu,
      };
}

class Diagnosa {
  final String kode;
  final String judul;
  final String defenisi;
  final String subjectif;
  final String objectif;
  final String problem;
  final String etiologi;
  final String etiologiFisiologis;
  final String etiologiSituasional;
  final String faktorResiko;
  final String gejalaMayorSubjektif;
  final String gejalaMayorObjectif;
  final String gejalanMinorObjectif;
  final String kondisiKlinisTerkait;
  final String mappingSlki;
  final String mappingSiki;

  Diagnosa({
    required this.kode,
    required this.judul,
    required this.defenisi,
    required this.subjectif,
    required this.objectif,
    required this.problem,
    required this.etiologi,
    required this.etiologiFisiologis,
    required this.etiologiSituasional,
    required this.faktorResiko,
    required this.gejalaMayorSubjektif,
    required this.gejalaMayorObjectif,
    required this.gejalanMinorObjectif,
    required this.kondisiKlinisTerkait,
    required this.mappingSlki,
    required this.mappingSiki,
  });

  factory Diagnosa.fromJson(Map<String, dynamic> json) => Diagnosa(
        kode: json["kode"],
        judul: json["judul"],
        defenisi: json["defenisi"],
        subjectif: json["subjectif"],
        objectif: json["objectif"],
        problem: json["problem"],
        etiologi: json["etiologi"],
        etiologiFisiologis: json["etiologi_fisiologis"],
        etiologiSituasional: json["etiologi_situasional"],
        faktorResiko: json["faktor_resiko"],
        gejalaMayorSubjektif: json["gejala_mayor_subjektif"],
        gejalaMayorObjectif: json["gejala_mayor_objectif"],
        gejalanMinorObjectif: json["gejalan_minor_objectif"],
        kondisiKlinisTerkait: json["kondisi_klinis_terkait"],
        mappingSlki: json["mapping_slki"],
        mappingSiki: json["mapping_siki"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "judul": judul,
        "defenisi": defenisi,
        "subjectif": subjectif,
        "objectif": objectif,
        "problem": problem,
        "etiologi": etiologi,
        "etiologi_fisiologis": etiologiFisiologis,
        "etiologi_situasional": etiologiSituasional,
        "faktor_resiko": faktorResiko,
        "gejala_mayor_subjektif": gejalaMayorSubjektif,
        "gejala_mayor_objectif": gejalaMayorObjectif,
        "gejalan_minor_objectif": gejalanMinorObjectif,
        "kondisi_klinis_terkait": kondisiKlinisTerkait,
        "mapping_slki": mappingSlki,
        "mapping_siki": mappingSiki,
      };
}

class Perawat {
  final String idPerawat;
  final String nama;
  final String alamat;
  final String jenisKelamin;
  final String status;

  Perawat({
    required this.idPerawat,
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
    required this.status,
  });

  factory Perawat.fromJson(Map<String, dynamic> json) => Perawat(
        idPerawat: json["id_perawat"],
        nama: json["nama"],
        alamat: json["alamat"],
        jenisKelamin: json["jenis_kelamin"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_perawat": idPerawat,
        "nama": nama,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "status": status,
      };
}
