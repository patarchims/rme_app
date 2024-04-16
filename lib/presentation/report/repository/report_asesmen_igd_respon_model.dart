class ReponseReportIgdAsesmenMedis {
  Asesmen asesmen;
  List<Riwayat> riwayat;
  List<Alergi> alergi;
  TindakLanjut tindakLanjut;
  List<Diagnosa> diagnosa;
  Fisik fisik;
  VitalSign vitalSIgn;
  // TAMBAHKAN DATA PENDUNJANG MEDIK
  List<DPenlabModel> dPenLab;
  List<DRadilogiModel> radiologi;

  ReponseReportIgdAsesmenMedis({
    required this.asesmen,
    required this.dPenLab,
    required this.radiologi,
    required this.riwayat,
    required this.alergi,
    required this.tindakLanjut,
    required this.diagnosa,
    required this.fisik,
    required this.vitalSIgn,
  });

  factory ReponseReportIgdAsesmenMedis.fromJson(Map<String, dynamic> json) =>
      ReponseReportIgdAsesmenMedis(
        radiologi: (json["radiologi"] as Iterable)
            .map((e) => DRadilogiModel.fromJson(e))
            .toList(),
        dPenLab: (json["labor"] as Iterable)
            .map((e) => DPenlabModel.fromJson(e))
            .toList(),
        vitalSIgn: VitalSign.fromJson(json["vital_sign"]),
        asesmen: Asesmen.fromJson(json["asesmen"]),
        riwayat:
            List<Riwayat>.from(json["riwayat"].map((x) => Riwayat.fromJson(x))),
        alergi:
            List<Alergi>.from(json["alergi"].map((x) => Alergi.fromJson(x))),
        tindakLanjut: TindakLanjut.fromJson(json["tindak_lanjut"]),
        diagnosa: List<Diagnosa>.from(
            json["diagnosa"].map((x) => Diagnosa.fromJson(x))),
        fisik: Fisik.fromJson(json["fisik"]),
      );

  Map<String, dynamic> toJson() => {
        "asesmen": asesmen.toJson(),
        "riwayat": List<dynamic>.from(riwayat.map((x) => x.toJson())),
        "alergi": List<dynamic>.from(alergi.map((x) => x.toJson())),
        "tindak_lanjut": tindakLanjut.toJson(),
        "diagnosa": List<dynamic>.from(diagnosa.map((x) => x.toJson())),
        "fisik": fisik.toJson(),
      };
}

class Alergi {
  String noRm;
  String kelompok;
  String insertDttm;
  String alergi;
  String namaUser;
  String bagian;

  Alergi({
    required this.noRm,
    required this.kelompok,
    required this.insertDttm,
    required this.alergi,
    required this.namaUser,
    required this.bagian,
  });

  factory Alergi.fromJson(Map<String, dynamic> json) => Alergi(
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

class Asesmen {
  String insertDttm;
  String person;
  String userId;
  String pelayanan;
  String insertPc;
  String kdBagian;
  String noreg;
  String keluhUtama;
  String rwtSekarang;
  String tglMasuk;
  String jamMasuk;
  String imageLokalis;
  String prognosis;
  String alasanOpname;
  String terapi;
  String konsulke;
  String namaDokter;
  String diagnosaBanding;

  Asesmen({
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

  factory Asesmen.fromJson(Map<String, dynamic> json) => Asesmen(
      diagnosaBanding: json["diagnosa_banding"].toString(),
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
      namaDokter: json["nama_dokter"].toString());

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

class Fisik {
  String kepala;
  String mata;
  String tht;
  String mulut;
  String leher;
  String dada;
  String jantung;
  String paru;
  String perut;
  String hati;
  String limpa;
  String ginjal;
  String alatKelamin;
  String anggotaGerak;
  String refleks;
  String kekuatanOtot;
  String kulit;
  String getahBening;
  String rtvt;
  String jalanNafas;
  String sirkulasi;
  String kesadaran;

  Fisik({
    required this.kepala,
    required this.mata,
    required this.tht,
    required this.mulut,
    required this.leher,
    required this.dada,
    required this.jantung,
    required this.paru,
    required this.perut,
    required this.hati,
    required this.limpa,
    required this.ginjal,
    required this.alatKelamin,
    required this.anggotaGerak,
    required this.refleks,
    required this.kekuatanOtot,
    required this.kulit,
    required this.getahBening,
    required this.rtvt,
    required this.jalanNafas,
    required this.sirkulasi,
    required this.kesadaran,
  });

  factory Fisik.fromJson(Map<String, dynamic> json) => Fisik(
      kepala: json["kepala"],
      mata: json["mata"],
      tht: json["tht"],
      mulut: json["mulut"],
      leher: json["leher"],
      dada: json["dada"],
      jantung: json["jantung"],
      paru: json["paru"],
      perut: json["perut"],
      hati: json["hati"],
      limpa: json["limpa"],
      ginjal: json["ginjal"],
      alatKelamin: json["alat_kelamin"],
      anggotaGerak: json["anggota_gerak"],
      refleks: json["refleks"],
      kekuatanOtot: json["kekuatan_otot"],
      kulit: json["kulit"],
      getahBening: json["getah_bening"],
      rtvt: json["rtvt"],
      jalanNafas: json["jalan_nafas"],
      sirkulasi: json["sirkulasi"],
      kesadaran: json["kesadaran"]);

  Map<String, dynamic> toJson() => {
        "kepala": kepala,
        "mata": mata,
        "tht": tht,
        "mulut": mulut,
        "leher": leher,
        "dada": dada,
        "jantung": jantung,
        "paru": paru,
        "perut": perut,
        "hati": hati,
        "limpa": limpa,
        "ginjal": ginjal,
        "alat_kelamin": alatKelamin,
        "anggota_gerak": anggotaGerak,
        "refleks": refleks,
        "kekuatan_otot": kekuatanOtot,
        "kulit": kulit,
        "getah_bening": getahBening,
        "rtvt": rtvt,
        "jalan_nafas": jalanNafas,
        "sirkulasi": sirkulasi,
      };
}

class Riwayat {
  String tglMasuk;
  String keluhUtama;
  String riwayatSekarang;

  Riwayat({
    required this.tglMasuk,
    required this.keluhUtama,
    required this.riwayatSekarang,
  });

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        tglMasuk: json["tgl_masuk"],
        keluhUtama: json["keluh_utama"],
        riwayatSekarang: json["riwayat_sekarang"],
      );

  Map<String, dynamic> toJson() => {
        "tgl_masuk": tglMasuk,
        "keluh_utama": keluhUtama,
        "riwayat_sekarang": riwayatSekarang,
      };
}

class TindakLanjut {
  String insertDttm;
  String kdBagian;
  String noreg;
  String alasanKonsul;
  String terapi;
  String alasanOpname;
  String konsulKe;
  String prognosis;
  String tglMasuk;
  String jamMasuk;
  String kdDpjp;
  String person;
  String userId;
  String deviceId;
  String pelayanan;

  TindakLanjut({
    required this.insertDttm,
    required this.kdBagian,
    required this.noreg,
    required this.alasanKonsul,
    required this.terapi,
    required this.alasanOpname,
    required this.konsulKe,
    required this.prognosis,
    required this.tglMasuk,
    required this.jamMasuk,
    required this.kdDpjp,
    required this.person,
    required this.userId,
    required this.deviceId,
    required this.pelayanan,
  });

  factory TindakLanjut.fromJson(Map<String, dynamic> json) => TindakLanjut(
        insertDttm: json["insertDttm"].toString(),
        kdBagian: json["kdBagian"].toString(),
        noreg: json["noreg"].toString(),
        alasanKonsul: json["alasan_konsul"].toString(),
        terapi: json["terapi"].toString(),
        alasanOpname: json["alasan_opname"].toString(),
        konsulKe: json["konsul_ke"].toString(),
        prognosis: json["prognosis"].toString(),
        tglMasuk: json["tgl_masuk"].toString(),
        jamMasuk: json["jam_masuk"].toString(),
        kdDpjp: json["kd_dpjp"].toString(),
        person: json["person"].toString(),
        userId: json["user_id"].toString(),
        deviceId: json["device_id"].toString(),
        pelayanan: json["pelayanan"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "insertDttm": insertDttm,
        "kdBagian": kdBagian,
        "noreg": noreg,
        "alasan_konsul": alasanKonsul,
        "terapi": terapi,
        "alasan_opname": alasanOpname,
        "konsul_ke": konsulKe,
        "prognosis": prognosis,
        "tgl_masuk": tglMasuk,
        "jam_masuk": jamMasuk,
        "kd_dpjp": kdDpjp,
        "person": person,
        "user_id": userId,
        "device_id": deviceId,
        "pelayanan": pelayanan,
      };
}

class VitalSign {
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

  VitalSign({
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
  });

  factory VitalSign.fromJson(Map<String, dynamic> json) => VitalSign(
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
        "pernafasan": pernafasan
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
        tanggal: json["tanggal"].toString(),
        namaKelompok: json["nama_kelompok"].toString(),
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
        pemeriksaanDeskripsi: json["pemeriksaan_deskripsi"].toString(),
        uraian: json["uraian"].toString(),
        hasil: json["hasil"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "pemeriksaan_deskripsi": pemeriksaanDeskripsi,
        "uraian": uraian,
        "hasil": hasil,
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
        pemeriksaanDeskripsi: json["pemeriksaan_deskripsi"].toString(),
        normal: json["normal"].toString(),
        satuan: json["satuan"].toString(),
        hasil: json["hasil"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "pemeriksaan_deskripsi": pemeriksaanDeskripsi,
        "normal": normal,
        "satuan": satuan,
        "hasil": hasil,
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
        tanggal: json["tanggal"].toString(),
        namaKelompok: json["nama_kelompok"].toString(),
        penlab:
            List<Penlab>.from(json["penlab"].map((x) => Penlab.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "nama_kelompok": namaKelompok,
        "penlab": List<dynamic>.from(penlab.map((x) => x.toJson())),
      };
}
