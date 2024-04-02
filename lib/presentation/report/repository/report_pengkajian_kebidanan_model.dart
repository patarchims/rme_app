class ReportPengkajianKebidanan {
  VitalSign vitalSign;
  Pengkajian pengkajian;
  List<Kehamilan> kehamilan;
  List<PengobatanDirumah> pengobatanDirumah;
  Fisik fisik;
  Nutrisi nutrisi;
  Fungsional fungsional;
  User user;
  User karu;
  List<Diagnosa> diagnosa;
  List<Alergi> penyakitKeluarga;

  ReportPengkajianKebidanan({
    required this.user,
    required this.karu,
    required this.fungsional,
    required this.diagnosa,
    required this.vitalSign,
    required this.nutrisi,
    required this.pengkajian,
    required this.kehamilan,
    required this.pengobatanDirumah,
    required this.fisik,
    required this.penyakitKeluarga,
  });

  factory ReportPengkajianKebidanan.fromJson(Map<String, dynamic> json) =>
      ReportPengkajianKebidanan(
        penyakitKeluarga:
            List<Alergi>.from(json["alergi"].map((x) => Alergi.fromJson(x))),
        diagnosa: List<Diagnosa>.from(
            json["diagnosa"].map((x) => Diagnosa.fromJson(x))),
        fungsional: Fungsional.fromJson(json["fungsional"]),
        nutrisi: Nutrisi.fromJson(json["nutrisi"]),
        vitalSign: VitalSign.fromJson(json["vital_sign"]),
        pengkajian: Pengkajian.fromJson(json["pengkajian"]),
        user: User.fromJson(json["user"]),
        karu: User.fromJson(json["karu"]),
        kehamilan: List<Kehamilan>.from(
            json["kehamilan"].map((x) => Kehamilan.fromJson(x))),
        pengobatanDirumah: List<PengobatanDirumah>.from(
            json["pengobatan_dirumah"]
                .map((x) => PengobatanDirumah.fromJson(x))),
        fisik: Fisik.fromJson(json["fisik_kebidanan"]),
      );

  Map<String, dynamic> toJson() => {
        "vital_sign": vitalSign.toJson(),
        "kehamilan": List<dynamic>.from(kehamilan.map((x) => x.toJson())),
        "pengobatan_dirumah":
            List<dynamic>.from(pengobatanDirumah.map((x) => x.toJson())),
        "fisik": fisik.toJson(),
      };
}

class Diagnosa {
  String insertDttm;
  String updDttm;
  String insertPc;
  String userId;
  String kdBagian;
  String noreg;
  String kodeDiagnosa;
  String namaDiagnosa;

  Diagnosa({
    required this.insertDttm,
    required this.updDttm,
    required this.insertPc,
    required this.userId,
    required this.kdBagian,
    required this.noreg,
    required this.kodeDiagnosa,
    required this.namaDiagnosa,
  });

  factory Diagnosa.fromJson(Map<String, dynamic> json) => Diagnosa(
        insertDttm: json["insert_dttm"].toString(),
        updDttm: json["upd_dttm"].toString(),
        insertPc: json["insert_pc"].toString(),
        userId: json["user_id"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        noreg: json["noreg"].toString(),
        kodeDiagnosa: json["kode_diagnosa"].toString(),
        namaDiagnosa: json["nama_diagnosa"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "upd_dttm": updDttm,
        "insert_pc": insertPc,
        "user_id": userId,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "kode_diagnosa": kodeDiagnosa,
        "nama_diagnosa": namaDiagnosa,
      };
}

class Fisik {
  String insertDttm;
  String updDttm;
  String device;
  String userId;
  String kategori;
  String person;
  String pelayanan;
  String kdBagian;
  String noreg;
  String kepala;
  String mata;
  String telinga;
  String leherDahBahu;
  String mulut;
  String mucosaMulut;
  String gigi;
  String hidung;
  String tenggorokan;
  String payudara;
  String abdomen;
  String nutrisiDanHidrasi;

  Fisik({
    required this.insertDttm,
    required this.updDttm,
    required this.device,
    required this.userId,
    required this.kategori,
    required this.person,
    required this.pelayanan,
    required this.kdBagian,
    required this.noreg,
    required this.kepala,
    required this.mata,
    required this.telinga,
    required this.leherDahBahu,
    required this.mulut,
    required this.mucosaMulut,
    required this.gigi,
    required this.hidung,
    required this.tenggorokan,
    required this.payudara,
    required this.abdomen,
    required this.nutrisiDanHidrasi,
  });

  factory Fisik.fromJson(Map<String, dynamic> json) => Fisik(
        insertDttm: json["insert_dttm"].toString(),
        updDttm: json["upd_dttm"].toString(),
        device: json["device"].toString(),
        userId: json["user_id"].toString(),
        kategori: json["kategori"].toString(),
        person: json["person"].toString(),
        pelayanan: json["pelayanan"].toString(),
        kdBagian: json["kd_bagian"].toString(),
        noreg: json["noreg"].toString(),
        kepala: json["kepala"].toString(),
        mata: json["mata"].toString(),
        telinga: json["telinga"].toString(),
        leherDahBahu: json["leher_dah_bahu"].toString(),
        mulut: json["mulut"].toString(),
        mucosaMulut: json["mucosa_mulut"].toString(),
        gigi: json["gigi"].toString(),
        hidung: json["hidung"].toString(),
        tenggorokan: json["tenggorokan"].toString(),
        payudara: json["payudara"].toString(),
        abdomen: json["abdomen"].toString(),
        nutrisiDanHidrasi: json["nutrisi_dan_hidrasi"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "upd_dttm": updDttm,
        "device": device,
        "user_id": userId,
        "kategori": kategori,
        "person": person,
        "pelayanan": pelayanan,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "kepala": kepala,
        "mata": mata,
        "telinga": telinga,
        "leher_dah_bahu": leherDahBahu,
        "mulut": mulut,
        "mucosa_mulut": mucosaMulut,
        "gigi": gigi,
        "hidung": hidung,
        "tenggorokan": tenggorokan,
        "payudara": payudara,
        "abdomen": abdomen,
        "nutrisi_dan_hidrasi": nutrisiDanHidrasi,
      };
}

class Kehamilan {
  String insertDttm;
  String userId;
  String deviceId;
  String kdRiwayat;
  String tahun;
  String tempat;
  String noreg;
  String umur;
  String jenisPersalinan;
  String penolong;
  String penyulit;
  String nifas;
  String jk;
  String bb;
  String keadaanSekarang;

  Kehamilan({
    required this.insertDttm,
    required this.userId,
    required this.deviceId,
    required this.kdRiwayat,
    required this.tahun,
    required this.tempat,
    required this.noreg,
    required this.umur,
    required this.jenisPersalinan,
    required this.penolong,
    required this.penyulit,
    required this.nifas,
    required this.jk,
    required this.bb,
    required this.keadaanSekarang,
  });

  factory Kehamilan.fromJson(Map<String, dynamic> json) => Kehamilan(
        insertDttm: json["insert_dttm"].toString(),
        userId: json["user_id"].toString(),
        deviceId: json["device_id"].toString(),
        kdRiwayat: json["kd_riwayat"].toString(),
        tahun: json["tahun"].toString(),
        tempat: json["tempat"].toString(),
        noreg: json["noreg"].toString(),
        umur: json["umur"].toString(),
        jenisPersalinan: json["jenis_persalinan"].toString(),
        penolong: json["penolong"].toString(),
        penyulit: json["penyulit"].toString(),
        nifas: json["nifas"].toString(),
        jk: json["jk"].toString(),
        bb: json["bb"].toString(),
        keadaanSekarang: json["keadaan_sekarang"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "user_id": userId,
        "device_id": deviceId,
        "kd_riwayat": kdRiwayat,
        "tahun": tahun,
        "tempat": tempat,
        "noreg": noreg,
        "umur": umur,
        "jenis_persalinan": jenisPersalinan,
        "penolong": penolong,
        "penyulit": penyulit,
        "nifas": nifas,
        "jk": jk,
        "bb": bb,
        "keadaan_sekarang": keadaanSekarang,
      };
}

class PengobatanDirumah {
  String insertDttm;
  String userId;
  String deviceId;
  String kdRiwayat;
  String noreg;
  String namaObat;
  String dosis;
  String caraPemberian;
  String frekuensi;
  String waktu;

  PengobatanDirumah({
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

  factory PengobatanDirumah.fromJson(Map<String, dynamic> json) =>
      PengobatanDirumah(
        insertDttm: json["insert_dttm"],
        userId: json["user_id"],
        deviceId: json["device_id"],
        kdRiwayat: json["kd_riwayat"],
        noreg: json["noreg"],
        namaObat: json["nama_obat"],
        dosis: json["dosis"],
        caraPemberian: json["cara_pemberian"],
        frekuensi: json["frekuensi"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "user_id": userId,
        "device_id": deviceId,
        "kd_riwayat": kdRiwayat,
        "noreg": noreg,
        "nama_obat": namaObat,
        "dosis": dosis,
        "cara_pemberian": caraPemberian,
        "frekuensi": frekuensi,
        "waktu": waktu,
      };
}

class VitalSign {
  String tekananDarah;
  String pernapasan;
  String suhu;
  String nadi;
  String ddj;
  String beratBadan;
  String tinggiBadan;
  String gcsE;
  String gcsV;
  String gcsM;
  String tfu;

  VitalSign({
    required this.tekananDarah,
    required this.pernapasan,
    required this.suhu,
    required this.nadi,
    required this.ddj,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.tfu,
  });

  factory VitalSign.fromJson(Map<String, dynamic> json) => VitalSign(
        tekananDarah: json["tekanan_darah"],
        pernapasan: json["pernapasan"],
        suhu: json["suhu"],
        nadi: json["nadi"],
        ddj: json["ddj"],
        beratBadan: json["berat_badan"],
        tinggiBadan: json["tinggi_badan"],
        gcsE: json["gcs_e"],
        gcsV: json["gcs_v"],
        gcsM: json["gcs_m"],
        tfu: json["tfu"],
      );

  Map<String, dynamic> toJson() => {
        "tekanan_darah": tekananDarah,
        "pernapasan": pernapasan,
        "suhu": suhu,
        "nadi": nadi,
        "ddj": ddj,
        "berat_badan": beratBadan,
        "tinggi_badan": tinggiBadan,
        "gcs_e": gcsE,
        "gcs_v": gcsV,
        "gcs_m": gcsM,
        "tfu": tfu,
      };
}

class Pengkajian {
  String tglMasuk;
  String tglKeluar;
  String pelayanan;
  String kdBagian;
  String noreg;
  String keluhanUtama;
  String rwtPenyakit;
  String penyakitDahulu;
  String menstruasi;
  String siklusHaid;
  String rwtPernikahan;
  String alergi;
  String gravida;
  String para;
  String abortus;
  String hpht;
  String tpp;
  String leopold1;
  String leopold2;
  String leopold3;
  String leopold4;
  String presepsiSakit;
  String kepercayaan;
  String responseEmosi;
  String hambatanSosial;
  String spikologis;
  String thermoregulasi;
  String bahasaSehari;
  String caraBelajar;
  String hambatanBahasa;
  String sistemPendarahan;
  String hamil;
  String papsSmer;
  String proteksi;
  String kenyamanan;
  String integumen;
  String pencernaan;
  String perfusiPerifer;
  String secebral;
  String respiratori;
  String kardiovaskuler;
  String mobilisasi;
  String eliminasi;
  String sistemMakan;
  String sistemBerpakaian;
  String sistemMandi;
  String inspekuloP;
  String inspekuloV;
  String haid;
  String pemeriksaaanDalam;
  String nilaiKepercayaan;
  String hpl;
  String tbj;
  String tfu;
  String hamilMuda;
  String hamilTua;
  String usiaKehamilan;
  String haidTerakhir;
  String eliminasiBak;
  String eliminasiBab;
  String istirahat;
  String aktivitas;
  String ekonomi;
  String spiritual;
  String keluhanMenyertai;
  String kehamilanHis;
  String kehamilanLendir;

  Pengkajian({
    required this.tglMasuk,
    required this.tglKeluar,
    required this.pelayanan,
    required this.kdBagian,
    required this.noreg,
    required this.keluhanUtama,
    required this.rwtPenyakit,
    required this.penyakitDahulu,
    required this.menstruasi,
    required this.siklusHaid,
    required this.rwtPernikahan,
    required this.alergi,
    required this.gravida,
    required this.para,
    required this.abortus,
    required this.hpht,
    required this.tpp,
    required this.leopold1,
    required this.leopold2,
    required this.leopold3,
    required this.leopold4,
    required this.presepsiSakit,
    required this.kepercayaan,
    required this.responseEmosi,
    required this.hambatanSosial,
    required this.spikologis,
    required this.thermoregulasi,
    required this.bahasaSehari,
    required this.caraBelajar,
    required this.hambatanBahasa,
    required this.sistemPendarahan,
    required this.hamil,
    required this.papsSmer,
    required this.proteksi,
    required this.kenyamanan,
    required this.integumen,
    required this.pencernaan,
    required this.perfusiPerifer,
    required this.secebral,
    required this.respiratori,
    required this.kardiovaskuler,
    required this.mobilisasi,
    required this.eliminasi,
    required this.sistemMakan,
    required this.sistemBerpakaian,
    required this.sistemMandi,
    required this.inspekuloP,
    required this.inspekuloV,
    required this.haid,
    required this.pemeriksaaanDalam,
    required this.nilaiKepercayaan,
    required this.hpl,
    required this.tbj,
    required this.tfu,
    required this.hamilMuda,
    required this.hamilTua,
    required this.usiaKehamilan,
    required this.haidTerakhir,
    required this.eliminasiBak,
    required this.eliminasiBab,
    required this.istirahat,
    required this.aktivitas,
    required this.ekonomi,
    required this.spiritual,
    required this.keluhanMenyertai,
    required this.kehamilanHis,
    required this.kehamilanLendir,
  });

  factory Pengkajian.fromJson(Map<String, dynamic> json) => Pengkajian(
        kehamilanHis: json["kehamilan_his"],
        kehamilanLendir: json["kehamilan_lendir"],
        keluhanMenyertai: json["keluhan_menyertai"],
        aktivitas: json["aktivitas"],
        ekonomi: json["ekonomi"],
        eliminasiBab: json["eliminasi_bab"],
        eliminasiBak: json["eliminasi_bak"],
        haidTerakhir: json["haid_terakhir"],
        hamilMuda: json["hamil_muda"],
        hamilTua: json["hamil_tua"],
        hpl: json["hpl"],
        istirahat: json["istirahat"],
        nilaiKepercayaan: json["nilai_kepercayaan"],
        pemeriksaaanDalam: json["pemeriksaan_dalam"],
        spiritual: json["spiritual"],
        tbj: json["tbj"],
        tfu: json["tfu"],
        usiaKehamilan: json["usia_kehamilan"],
        tglMasuk: json["tgl_masuk"],
        tglKeluar: json["tgl_keluar"],
        pelayanan: json["pelayanan"],
        kdBagian: json["kd_bagian"],
        noreg: json["noreg"],
        keluhanUtama: json["keluhan_utama"],
        rwtPenyakit: json["rwt_penyakit"],
        penyakitDahulu: json["penyakit_dahulu"],
        menstruasi: json["menstruasi"],
        siklusHaid: json["siklus_haid"],
        rwtPernikahan: json["rwt_pernikahan"],
        alergi: json["alergi"],
        gravida: json["gravida"],
        para: json["para"],
        abortus: json["abortus"],
        hpht: json["hpht"],
        tpp: json["tpp"],
        leopold1: json["leopold1"],
        leopold2: json["leopold2"],
        leopold3: json["leopold3"],
        leopold4: json["leopold4"],
        presepsiSakit: json["presepsi_sakit"],
        kepercayaan: json["kepercayaan"],
        responseEmosi: json["response_emosi"],
        hambatanSosial: json["hambatan_sosial"],
        spikologis: json["spikologis"],
        thermoregulasi: json["thermoregulasi"],
        bahasaSehari: json["bahasa_sehari"],
        caraBelajar: json["cara_belajar"],
        hambatanBahasa: json["hambatan_bahasa"],
        sistemPendarahan: json["sistem_pendarahan"],
        hamil: json["hamil"],
        papsSmer: json["paps_smer"],
        proteksi: json["proteksi"],
        kenyamanan: json["kenyamanan"],
        integumen: json["integumen"],
        pencernaan: json["pencernaan"],
        perfusiPerifer: json["perfusi_perifer"],
        secebral: json["secebral"],
        respiratori: json["respiratori"],
        kardiovaskuler: json["kardiovaskuler"],
        mobilisasi: json["mobilisasi"],
        eliminasi: json["eliminasi"],
        sistemMakan: json["sistem_makan"],
        sistemBerpakaian: json["sistem_berpakaian"],
        sistemMandi: json["sistem_mandi"],
        inspekuloP: json["inspekulo_p"],
        inspekuloV: json["inspekulo_v"],
        haid: json["haid"],
      );

  Map<String, dynamic> toJson() => {
        "tgl_masuk": tglMasuk,
        "tgl_keluar": tglKeluar,
        "pelayanan": pelayanan,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "keluhan_utama": keluhanUtama,
        "rwt_penyakit": rwtPenyakit,
        "penyakit_dahulu": penyakitDahulu,
        "menstruasi": menstruasi,
        "siklus_haid": siklusHaid,
        "rwt_pernikahan": rwtPernikahan,
        "alergi": alergi,
        "gravida": gravida,
        "para": para,
        "abortus": abortus,
        "hpht": hpht,
        "tpp": tpp,
        "leopold1": leopold1,
        "leopold2": leopold2,
        "leopold3": leopold3,
        "leopold4": leopold4,
        "presepsi_sakit": presepsiSakit,
        "kepercayaan": kepercayaan,
        "response_emosi": responseEmosi,
        "hambatan_sosial": hambatanSosial,
        "spikologis": spikologis,
        "thermoregulasi": thermoregulasi,
        "bahasa_sehari": bahasaSehari,
        "cara_belajar": caraBelajar,
        "hambatan_bahasa": hambatanBahasa,
        "sistem_pendarahan": sistemPendarahan,
        "hamil": hamil,
        "paps_smer": papsSmer,
        "proteksi": proteksi,
        "kenyamanan": kenyamanan,
        "integumen": integumen,
        "pencernaan": pencernaan,
        "perfusi_perifer": perfusiPerifer,
        "secebral": secebral,
        "respiratori": respiratori,
        "kardiovaskuler": kardiovaskuler,
        "mobilisasi": mobilisasi,
        "eliminasi": eliminasi,
        "sistem_makan": sistemMakan,
        "sistem_berpakaian": sistemBerpakaian,
        "sistem_mandi": sistemMandi,
        "inspekulo_p": inspekuloP,
        "inspekulo_v": inspekuloV,
        "haid": haid,
      };
}

class Nutrisi {
  String insertDttm;
  String updDttm;
  String device;
  String userId;
  String kdBagian;
  String noreg;
  String n1;
  String n2;
  int nilai;

  Nutrisi({
    required this.insertDttm,
    required this.updDttm,
    required this.device,
    required this.userId,
    required this.kdBagian,
    required this.noreg,
    required this.n1,
    required this.n2,
    required this.nilai,
  });

  factory Nutrisi.fromJson(Map<String, dynamic> json) => Nutrisi(
        insertDttm: json["insert_dttm"],
        updDttm: json["upd_dttm"],
        device: json["device"],
        userId: json["user_id"],
        kdBagian: json["kd_bagian"],
        noreg: json["noreg"],
        n1: json["n1"],
        n2: json["n2"],
        nilai: json["nilai"],
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "upd_dttm": updDttm,
        "device": device,
        "user_id": userId,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "n1": n1,
        "n2": n2,
        "nilai": nilai,
      };
}

class Fungsional {
  final String insertDttm;
  final String updDttm;
  final String device;
  final String userId;
  final String kdBagian;
  final String noreg;
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

  Fungsional({
    required this.insertDttm,
    required this.updDttm,
    required this.device,
    required this.userId,
    required this.kdBagian,
    required this.noreg,
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

  factory Fungsional.fromJson(Map<String, dynamic> json) => Fungsional(
        insertDttm: json["insert_dttm"],
        updDttm: json["upd_dttm"],
        device: json["device"],
        userId: json["user_id"],
        kdBagian: json["kd_bagian"],
        noreg: json["noreg"],
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
        "insert_dttm": insertDttm,
        "upd_dttm": updDttm,
        "device": device,
        "user_id": userId,
        "kd_bagian": kdBagian,
        "noreg": noreg,
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

class Alergi {
  final String noRm;
  final String kelompok;
  final String alergi;
  final String namaUser;
  final String bagian;

  Alergi({
    required this.noRm,
    required this.kelompok,
    required this.alergi,
    required this.namaUser,
    required this.bagian,
  });

  factory Alergi.fromJson(Map<String, dynamic> json) => Alergi(
        noRm: json["no_rm"],
        kelompok: json["kelompok"],
        alergi: json["alergi"],
        namaUser: json["nama_user"],
        bagian: json["bagian"],
      );

  Map<String, dynamic> toJson() => {
        "no_rm": noRm,
        "kelompok": kelompok,
        "alergi": alergi,
        "nama_user": namaUser,
        "bagian": bagian,
      };
}

class User {
  final String id;
  final String nama;
  final String jenisKelamin;
  final String tglLahir;

  User({
    required this.id,
    required this.nama,
    required this.jenisKelamin,
    required this.tglLahir,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"].toString(),
        nama: json["nama"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        tglLahir: json["tgl_lahir"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
      };
}
