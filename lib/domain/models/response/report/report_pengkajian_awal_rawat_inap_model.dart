class ReportPengkajianAwalRawatInapModel {
  FisikModel fisikModel;
  VitalSignDokter vitalSignDokter;
  AsesmenDokter asesmenDokter;
  List<DPenlabModel> dPenLab;
  List<DRadilogiModel> radiologi;
  List<Diagnosa> diagnosa;
  ReportPengkajianAwalRawatInapModel({
    required this.fisikModel,
    required this.diagnosa,
    required this.radiologi,
    required this.vitalSignDokter,
    required this.asesmenDokter,
    required this.dPenLab,
  });

  factory ReportPengkajianAwalRawatInapModel.fromMap(Map<String, dynamic> map) {
    return ReportPengkajianAwalRawatInapModel(
      diagnosa:
          List<Diagnosa>.from(map["diagnosa"].map((x) => Diagnosa.fromJson(x))),
      radiologi: (map["radiologi"] as Iterable)
          .map((e) => DRadilogiModel.fromJson(e))
          .toList(),
      dPenLab: (map["labor"] as Iterable)
          .map((e) => DPenlabModel.fromJson(e))
          .toList(),
      asesmenDokter: AsesmenDokter.fromJson(map["asesmen"]),
      vitalSignDokter: VitalSignDokter.fromJson(map["vital"]),
      fisikModel: FisikModel.fromJson(map['fisik'] as Map<String, dynamic>),
    );
  }
}

class FisikModel {
  String insertDttm;
  String insertDevice;
  String insertUserId;
  String ketPerson;
  String pelayanan;
  String kdBagian;
  String kategori;
  String noreg;
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
  String leher;
  String lien;
  String leherLainnya;
  String dada;
  String respirasi;
  String perut;
  String jantung;
  String integument;
  String ekstremitas;
  String ekstremitasSuperior;
  String ekstremitasInferior;
  String kemampuanGenggam;
  String genetalia;
  String anus;
  String punggung;
  String lainLain;
  String dindingdada;
  String dindingdadaRetEpigastrium;
  String dindingdadaRetSuprastermal;
  String dindingdadaRetraksi;
  String hepar;
  String heparDetail;
  String limpa;
  String limpaDetail;
  String ouf;
  String tugorKulit;
  String pemeriksaanFisik;
  int skalaNyeri;
  String skalaNyeriP;
  String skalaNyeriQ;
  String skalaNyeriR;
  String skalaNyeriS;
  String skalaNyeriT;
  int flaccWajah;
  int flaccKaki;
  int flaccAktifitas;
  int flaccMenangis;
  int flaccBersuara;
  int flaccTotal;
  int skalaTriase;

  FisikModel({
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

  factory FisikModel.fromJson(Map<String, dynamic> json) => FisikModel(
        insertDttm: json["InsertDttm"],
        insertDevice: json["InsertDevice"],
        insertUserId: json["InsertUserId"],
        ketPerson: json["KetPerson"],
        pelayanan: json["Pelayanan"],
        kdBagian: json["KdBagian"],
        kategori: json["Kategori"],
        noreg: json["Noreg"],
        alatKelamin: json["AlatKelamin"],
        anggotaGerak: json["AnggotaGerak"],
        refleks: json["Refleks"],
        otot: json["Otot"],
        rtVt: json["RtVt"],
        gcsE: json["GcsE"],
        gcsM: json["GcsM"],
        gcsV: json["GcsV"],
        pupilKiri: json["PupilKiri"],
        pupilKanan: json["PupilKanan"],
        isokor: json["Isokor"],
        isokorDetail: json["IsokorDetail"],
        anisokor: json["Anisokor"],
        cahayaKanan: json["CahayaKanan"],
        cahayaKiri: json["CahayaKiri"],
        akral: json["Akral"],
        pupil: json["Pupil"],
        kesadaran: json["Kesadaran"],
        kepala: json["Kepala"],
        rambut: json["Rambut"],
        wajah: json["Wajah"],
        keadaanUmum: json["KeadaanUmum"],
        jalanNafas: json["JalanNafas"],
        sirkulasi: json["Sirkulasi"],
        gangguan: json["Gangguan"],
        kulit: json["Kulit"],
        abdomen: json["Abdomen"],
        ginjal: json["Ginjal"],
        abdomenLainnya: json["AbdomenLainnya"],
        peristatikUsus: json["PeristatikUsus"],
        thyroid: json["Thyroid"],
        hati: json["Hati"],
        paru: json["Paru"],
        mata: json["Mata"],
        tht: json["Tht"],
        telinga: json["Telinga"],
        hidung: json["Hidung"],
        mulut: json["Mulut"],
        gigi: json["Gigi"],
        lidah: json["Lidah"],
        tenggorokan: json["Tenggorokan"],
        leher: json["Leher"],
        lien: json["Lien"],
        leherLainnya: json["LeherLainnya"],
        dada: json["Dada"],
        respirasi: json["Respirasi"],
        perut: json["Perut"],
        jantung: json["Jantung"],
        integument: json["Integument"],
        ekstremitas: json["Ekstremitas"],
        ekstremitasSuperior: json["EkstremitasSuperior"],
        ekstremitasInferior: json["EkstremitasInferior"],
        kemampuanGenggam: json["KemampuanGenggam"],
        genetalia: json["Genetalia"],
        anus: json["Anus"],
        punggung: json["Punggung"],
        lainLain: json["LainLain"],
        dindingdada: json["Dindingdada"],
        dindingdadaRetEpigastrium: json["DindingdadaRetEpigastrium"],
        dindingdadaRetSuprastermal: json["DindingdadaRetSuprastermal"],
        dindingdadaRetraksi: json["DindingdadaRetraksi"],
        hepar: json["Hepar"],
        heparDetail: json["HeparDetail"],
        limpa: json["Limpa"],
        limpaDetail: json["LimpaDetail"],
        ouf: json["Ouf"],
        tugorKulit: json["TugorKulit"],
        pemeriksaanFisik: json["PemeriksaanFisik"],
        skalaNyeri: json["SkalaNyeri"],
        skalaNyeriP: json["SkalaNyeriP"],
        skalaNyeriQ: json["SkalaNyeriQ"],
        skalaNyeriR: json["SkalaNyeriR"],
        skalaNyeriS: json["SkalaNyeriS"],
        skalaNyeriT: json["SkalaNyeriT"],
        flaccWajah: json["FlaccWajah"],
        flaccKaki: json["FlaccKaki"],
        flaccAktifitas: json["FlaccAktifitas"],
        flaccMenangis: json["FlaccMenangis"],
        flaccBersuara: json["FlaccBersuara"],
        flaccTotal: json["FlaccTotal"],
        skalaTriase: json["SkalaTriase"],
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
        "Pupil": pupil,
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

class VitalSignDokter {
  final String insertDttm;
  final String userId;
  final String pelayanan;
  final String kdBagian;
  final String deviceId;
  final String kategori;
  final String person;
  final String noreg;
  final String td;
  final String nadi;
  final String suhu;
  final String spo2;
  final String pernafasan;
  final String tinggiBadan;
  final String beratBadan;

  VitalSignDokter({
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

  factory VitalSignDokter.fromJson(Map<String, dynamic> json) =>
      VitalSignDokter(
        insertDttm: json["insert_dttm"],
        userId: json["user_id"],
        pelayanan: json["pelayanan"],
        kdBagian: json["kd_bagian"],
        deviceId: json["device_id"],
        kategori: json["kategori"],
        person: json["person"],
        noreg: json["noreg"],
        td: json["td"],
        nadi: json["nadi"],
        suhu: json["suhu"],
        spo2: json["spo2"],
        pernafasan: json["pernafasan"],
        tinggiBadan: json["tinggi_badan"],
        beratBadan: json["berat_badan"],
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

class AsesmenDokter {
  final String insertDttm;
  final String person;
  final String userId;
  final String pelayanan;
  final String insertPc;
  final String kdBagian;
  final String noreg;
  final String keluhUtama;
  final String rwtSekarang;
  final String tglMasuk;
  final String jamMasuk;
  final String imageLokalis;
  final String prognosis;
  final String alasanOpname;
  final String terapi;
  final String konsulke;
  final String namaDokter;
  final String diagnosaBanding;

  AsesmenDokter({
    required this.insertDttm,
    required this.person,
    required this.userId,
    required this.pelayanan,
    required this.insertPc,
    required this.kdBagian,
    required this.noreg,
    required this.keluhUtama,
    required this.rwtSekarang,
    required this.tglMasuk,
    required this.jamMasuk,
    required this.imageLokalis,
    required this.prognosis,
    required this.alasanOpname,
    required this.terapi,
    required this.konsulke,
    required this.namaDokter,
    required this.diagnosaBanding,
  });

  factory AsesmenDokter.fromJson(Map<String, dynamic> json) => AsesmenDokter(
        insertDttm: json["insert_dttm"].toString(),
        person: json["person"].toString(),
        userId: json["user_id"].toString(),
        pelayanan: json["pelayanan"].toString(),
        insertPc: json["insert_pc"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        noreg: json["noreg"].toString(),
        keluhUtama: json["keluh_utama"].toString(),
        rwtSekarang: json["rwt_sekarang"].toString(),
        tglMasuk: json["tgl_masuk"].toString(),
        jamMasuk: json["jam_masuk"].toString(),
        imageLokalis: json["image_lokalis"].toString(),
        prognosis: json["prognosis"].toString(),
        alasanOpname: json["alasan_opname"].toString(),
        terapi: json["terapi"].toString(),
        konsulke: json["konsulke"].toString(),
        namaDokter: json["nama_dokter"].toString(),
        diagnosaBanding: json["diagnosa_banding"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "person": person,
        "user_id": userId,
        "pelayanan": pelayanan,
        "insert_pc": insertPc,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "keluh_utama": keluhUtama,
        "rwt_sekarang": rwtSekarang,
        "tgl_masuk": tglMasuk,
        "jam_masuk": jamMasuk,
        "image_lokalis": imageLokalis,
        "prognosis": prognosis,
        "alasan_opname": alasanOpname,
        "terapi": terapi,
        "konsulke": konsulke,
        "nama_dokter": namaDokter,
        "diagnosa_banding": diagnosaBanding
      };
}

class DPenlabModel {
  String tanggal;
  String namaKelompok;
  List<Penlab> penlab;

  DPenlabModel({
    required this.tanggal,
    required this.namaKelompok,
    required this.penlab,
  });

  factory DPenlabModel.fromJson(Map<String, dynamic> json) => DPenlabModel(
        tanggal: json["tanggal"],
        namaKelompok: json["nama_kelompok"],
        penlab:
            List<Penlab>.from(json["penlab"].map((x) => Penlab.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "nama_kelompok": namaKelompok,
        "penlab": List<dynamic>.from(penlab.map((x) => x.toJson())),
      };
}

class Penlab {
  String pemeriksaanDeskripsi;
  String normal;
  String satuan;
  String hasil;

  Penlab({
    required this.pemeriksaanDeskripsi,
    required this.normal,
    required this.satuan,
    required this.hasil,
  });

  factory Penlab.fromJson(Map<String, dynamic> json) => Penlab(
        pemeriksaanDeskripsi: json["pemeriksaan_deskripsi"],
        normal: json["normal"],
        satuan: json["satuan"],
        hasil: json["hasil"],
      );

  Map<String, dynamic> toJson() => {
        "pemeriksaan_deskripsi": pemeriksaanDeskripsi,
        "normal": normal,
        "satuan": satuan,
        "hasil": hasil,
      };
}

class DRadilogiModel {
  String tanggal;
  String namaKelompok;
  List<Radiologi> radiologi;

  DRadilogiModel({
    required this.tanggal,
    required this.namaKelompok,
    required this.radiologi,
  });

  factory DRadilogiModel.fromJson(Map<String, dynamic> json) => DRadilogiModel(
        tanggal: json["tanggal"],
        namaKelompok: json["nama_kelompok"],
        radiologi: List<Radiologi>.from(
            json["radiologi"].map((x) => Radiologi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "nama_kelompok": namaKelompok,
        "radiologi": List<dynamic>.from(radiologi.map((x) => x.toJson())),
      };
}

class Radiologi {
  String pemeriksaanDeskripsi;
  String uraian;
  String hasil;

  Radiologi({
    required this.pemeriksaanDeskripsi,
    required this.uraian,
    required this.hasil,
  });

  factory Radiologi.fromJson(Map<String, dynamic> json) => Radiologi(
        pemeriksaanDeskripsi: json["pemeriksaan_deskripsi"],
        uraian: json["uraian"],
        hasil: json["hasil"],
      );

  Map<String, dynamic> toJson() => {
        "pemeriksaan_deskripsi": pemeriksaanDeskripsi,
        "uraian": uraian,
        "hasil": hasil,
      };
}

class Diagnosa {
  String diagnosa;
  String description;
  String type;
  String table;

  Diagnosa({
    required this.diagnosa,
    required this.description,
    required this.type,
    required this.table,
  });

  factory Diagnosa.fromJson(Map<String, dynamic> json) => Diagnosa(
        diagnosa: json["diagnosa"],
        description: json["description"],
        type: json["type"],
        table: json["table"],
      );

  Map<String, dynamic> toJson() => {
        "diagnosa": diagnosa,
        "description": description,
        "type": type,
        "table": table,
      };
}
