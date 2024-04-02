class ReportTriaseResponseModel {
  final Pasien pasien;
  final SkalaFlacc skalaFlacc;
  final ImageLokalis imageLokais;
  final Nyeri nyeri;
  final PemeriksaanFisikModel pemeriksaanFisik;
  final DiagnosaModel diagnosaModel;
  final TandaVital tandaVital;
  final SoapPerawatModel soapPerawat;

  ReportTriaseResponseModel(
      {required this.pasien,
      required this.skalaFlacc,
      required this.imageLokais,
      required this.pemeriksaanFisik,
      required this.diagnosaModel,
      required this.tandaVital,
      required this.soapPerawat,
      required this.nyeri});

  factory ReportTriaseResponseModel.fromJson(Map<String, dynamic> json) =>
      ReportTriaseResponseModel(
        soapPerawat: SoapPerawatModel.fromJson(json["soap_pasien"]),
        diagnosaModel: DiagnosaModel.fromJson(json["diagnosis"]),
        tandaVital: TandaVital.fromJson(json["tanda_vital"]),
        pemeriksaanFisik:
            PemeriksaanFisikModel.fromJson(json["pemeriksaan_fisik"]),
        pasien: Pasien.fromJson(json["pasien"]),
        skalaFlacc: SkalaFlacc.fromJson(json["skalaFlacc"]),
        nyeri: Nyeri.fromMap(json["nyeri"]),
        imageLokais: ImageLokalis.fromMap(json["image_lokalis"]),
      );

  Map<String, dynamic> toJson() => {
        "pasien": pasien.toJson(),
        "skalaFlacc": skalaFlacc.toJson(),
      };
}

class SoapPerawatModel {
  String insertDttm;
  String updDttm;
  String keteranganPerson;
  String insertUserId;
  String insertPc;
  String tglMasuk;
  String kdBagian;
  String noreg;
  String pelayanan;
  String info;
  String infoDetail;
  String caraMasuk;
  String caraMasukDetail;
  String asalMasuk;
  String asalMasukDetail;
  String td;
  String bb;
  String tb;
  String rwtPenyakit;
  String rwtObat;
  String fungsional;
  String rj1;
  String rj2;
  String hasilRj;
  String rjTind;
  String dekubitus1;
  String dekubitus2;
  String dekubitus3;
  String dekubitus4;
  String dekubitusAnak;
  String kehamilan;
  String gravida;
  String para;
  String abortus;
  String hpht;
  String ttp;
  String leopol1;
  String leopol2;
  String leopol3;
  String leopol4;
  String djj;
  String vt;
  int nyeri;
  String frekuensiNyeri;
  String lamaNyeri;
  String menjalar;
  String menjalarDetail;
  String kualitasNyeri;
  String pemicu;
  String pengurang;
  String pulang1;
  String pulang1Detail;
  String pulang2;
  String pulang2Detail;
  String pulang3;
  String pulang3Detail;
  String keadaanUmum;
  String kesadaran;
  String kesadaranDetail;

  SoapPerawatModel({
    required this.insertDttm,
    required this.updDttm,
    required this.keteranganPerson,
    required this.insertUserId,
    required this.insertPc,
    required this.tglMasuk,
    required this.kdBagian,
    required this.noreg,
    required this.pelayanan,
    required this.info,
    required this.infoDetail,
    required this.caraMasuk,
    required this.caraMasukDetail,
    required this.asalMasuk,
    required this.asalMasukDetail,
    required this.td,
    required this.bb,
    required this.tb,
    required this.rwtPenyakit,
    required this.rwtObat,
    required this.fungsional,
    required this.rj1,
    required this.rj2,
    required this.hasilRj,
    required this.rjTind,
    required this.dekubitus1,
    required this.dekubitus2,
    required this.dekubitus3,
    required this.dekubitus4,
    required this.dekubitusAnak,
    required this.kehamilan,
    required this.gravida,
    required this.para,
    required this.abortus,
    required this.hpht,
    required this.ttp,
    required this.leopol1,
    required this.leopol2,
    required this.leopol3,
    required this.leopol4,
    required this.djj,
    required this.vt,
    required this.nyeri,
    required this.frekuensiNyeri,
    required this.lamaNyeri,
    required this.menjalar,
    required this.menjalarDetail,
    required this.kualitasNyeri,
    required this.pemicu,
    required this.pengurang,
    required this.pulang1,
    required this.pulang1Detail,
    required this.pulang2,
    required this.pulang2Detail,
    required this.pulang3,
    required this.pulang3Detail,
    required this.keadaanUmum,
    required this.kesadaran,
    required this.kesadaranDetail,
  });

  factory SoapPerawatModel.fromJson(Map<String, dynamic> json) =>
      SoapPerawatModel(
        insertDttm: json["InsertDttm"],
        updDttm: json["UpdDttm"],
        keteranganPerson: json["KeteranganPerson"],
        insertUserId: json["InsertUserId"],
        insertPc: json["InsertPc"],
        tglMasuk: json["TglMasuk"],
        kdBagian: json["KdBagian"],
        noreg: json["Noreg"],
        pelayanan: json["Pelayanan"],
        info: json["info"],
        infoDetail: json["info_detail"],
        caraMasuk: json["cara_masuk"],
        caraMasukDetail: json["cara_masuk_detail"],
        asalMasuk: json["asal_masuk"],
        asalMasukDetail: json["asal_masuk_detail"],
        td: json["td"],
        bb: json["bb"],
        tb: json["tb"],
        rwtPenyakit: json["rwt_penyakit"],
        rwtObat: json["rwt_obat"],
        fungsional: json["fungsional"],
        rj1: json["rj1"],
        rj2: json["rj2"],
        hasilRj: json["hasil_rj"],
        rjTind: json["rj_tind"],
        dekubitus1: json["dekubitus1"],
        dekubitus2: json["dekubitus2"],
        dekubitus3: json["dekubitus3"],
        dekubitus4: json["dekubitus4"],
        dekubitusAnak: json["dekubitus_anak"],
        kehamilan: json["kehamilan"],
        gravida: json["gravida"],
        para: json["para"],
        abortus: json["abortus"],
        hpht: json["hpht"],
        ttp: json["ttp"],
        leopol1: json["leopol1"],
        leopol2: json["leopol2"],
        leopol3: json["leopol3"],
        leopol4: json["leopol4"],
        djj: json["djj"],
        vt: json["vt"],
        nyeri: json["nyeri"],
        frekuensiNyeri: json["frekuensi_nyeri"],
        lamaNyeri: json["lama_nyeri"],
        menjalar: json["menjalar"],
        menjalarDetail: json["menjalar_detail"],
        kualitasNyeri: json["kualitas_nyeri"],
        pemicu: json["pemicu"],
        pengurang: json["pengurang"],
        pulang1: json["pulang1"],
        pulang1Detail: json["pulang1_detail"],
        pulang2: json["pulang2"],
        pulang2Detail: json["pulang2_detail"],
        pulang3: json["pulang3"],
        pulang3Detail: json["pulang3_detail"],
        keadaanUmum: json["keadaan_umum"],
        kesadaran: json["kesadaran"],
        kesadaranDetail: json["kesadaran_detail"],
      );

  Map<String, dynamic> toJson() => {
        "InsertDttm": insertDttm,
        "UpdDttm": updDttm,
        "KeteranganPerson": keteranganPerson,
        "InsertUserId": insertUserId,
        "InsertPc": insertPc,
        "TglMasuk": tglMasuk,
        "KdBagian": kdBagian,
        "Noreg": noreg,
        "Pelayanan": pelayanan,
        "info": info,
        "info_detail": infoDetail,
        "cara_masuk": caraMasuk,
        "cara_masuk_detail": caraMasukDetail,
        "asal_masuk": asalMasuk,
        "asal_masuk_detail": asalMasukDetail,
        "td": td,
        "bb": bb,
        "tb": tb,
        "rwt_penyakit": rwtPenyakit,
        "rwt_obat": rwtObat,
        "fungsional": fungsional,
        "rj1": rj1,
        "rj2": rj2,
        "hasil_rj": hasilRj,
        "rj_tind": rjTind,
        "dekubitus1": dekubitus1,
        "dekubitus2": dekubitus2,
        "dekubitus3": dekubitus3,
        "dekubitus4": dekubitus4,
        "dekubitus_anak": dekubitusAnak,
        "kehamilan": kehamilan,
        "gravida": gravida,
        "para": para,
        "abortus": abortus,
        "hpht": hpht,
        "ttp": ttp,
        "leopol1": leopol1,
        "leopol2": leopol2,
        "leopol3": leopol3,
        "leopol4": leopol4,
        "djj": djj,
        "vt": vt,
        "nyeri": nyeri,
        "frekuensi_nyeri": frekuensiNyeri,
        "lama_nyeri": lamaNyeri,
        "menjalar": menjalar,
        "menjalar_detail": menjalarDetail,
        "kualitas_nyeri": kualitasNyeri,
        "pemicu": pemicu,
        "pengurang": pengurang,
        "pulang1": pulang1,
        "pulang1_detail": pulang1Detail,
        "pulang2": pulang2,
        "pulang2_detail": pulang2Detail,
        "pulang3": pulang3,
        "pulang3_detail": pulang3Detail,
        "keadaan_umum": keadaanUmum,
        "kesadaran": kesadaran,
        "kesadaran_detail": kesadaranDetail,
      };
}

class DiagnosaModel {
  String diagnosaPrimer;
  String diagnosaSekunder1;
  String diagnosaSekunder2;
  String diagnosaSekunder3;
  String diagnosaSekunder4;
  String diagnosaSekunder5;
  String diagnosaSekunder6;

  DiagnosaModel({
    required this.diagnosaPrimer,
    required this.diagnosaSekunder1,
    required this.diagnosaSekunder2,
    required this.diagnosaSekunder3,
    required this.diagnosaSekunder4,
    required this.diagnosaSekunder5,
    required this.diagnosaSekunder6,
  });

  factory DiagnosaModel.fromJson(Map<String, dynamic> json) => DiagnosaModel(
        diagnosaPrimer: json["diagnosa_primer"],
        diagnosaSekunder1: json["diagnosa_sekunder1"],
        diagnosaSekunder2: json["diagnosa_sekunder2"],
        diagnosaSekunder3: json["diagnosa_sekunder3"],
        diagnosaSekunder4: json["diagnosa_sekunder4"],
        diagnosaSekunder5: json["diagnosa_sekunder5"],
        diagnosaSekunder6: json["diagnosa_sekunder6"],
      );

  Map<String, dynamic> toJson() => {
        "diagnosa_primer": diagnosaPrimer,
        "diagnosa_sekunder1": diagnosaSekunder1,
        "diagnosa_sekunder2": diagnosaSekunder2,
        "diagnosa_sekunder3": diagnosaSekunder3,
        "diagnosa_sekunder4": diagnosaSekunder4,
        "diagnosa_sekunder5": diagnosaSekunder5,
        "diagnosa_sekunder6": diagnosaSekunder6,
      };
}

class TandaVital {
  String jalanNapas;
  String td;
  String pernafasan;
  String nadi;
  String spo2;
  String e;
  String v;
  String m;
  String cahaya;
  String suhu;
  String akral;
  String pupilKanan;
  String pupilKiri;

  TandaVital({
    required this.jalanNapas,
    required this.td,
    required this.pernafasan,
    required this.nadi,
    required this.spo2,
    required this.e,
    required this.v,
    required this.m,
    required this.cahaya,
    required this.suhu,
    required this.akral,
    required this.pupilKanan,
    required this.pupilKiri,
  });

  factory TandaVital.fromJson(Map<String, dynamic> json) => TandaVital(
        jalanNapas: json["jalan_napas"],
        td: json["td"],
        pernafasan: json["pernafasan"],
        nadi: json["nadi"],
        spo2: json["spo2"],
        e: json["e"],
        v: json["v"],
        m: json["m"],
        cahaya: json["cahaya"],
        suhu: json["suhu"],
        akral: json["akral"],
        pupilKanan: json["pupil_kanan"],
        pupilKiri: json["pupil_kiri"],
      );

  Map<String, dynamic> toJson() => {
        "jalan_napas": jalanNapas,
        "td": td,
        "pernafasan": pernafasan,
        "nadi": nadi,
        "spo2": spo2,
        "e": e,
        "v": v,
        "m": m,
        "cahaya": cahaya,
        "suhu": suhu,
        "akral": akral,
        "pupil_kanan": pupilKanan,
        "pupil_kiri": pupilKiri,
      };
}

class PemeriksaanFisikModel {
  String mata;
  String tht;
  String mulut;
  String gigi;
  String thyroid;
  String leherlain;
  String dindingDada;
  String suaraJantung;
  String suaraParu;
  String dindingParu;
  String hati;
  String lien;
  String persitaltik;
  String abdomenLain;
  String kulit;
  String ginjal;
  String genetalia;
  String superior;
  String inferior;

  PemeriksaanFisikModel({
    required this.mata,
    required this.tht,
    required this.mulut,
    required this.gigi,
    required this.thyroid,
    required this.leherlain,
    required this.dindingDada,
    required this.suaraJantung,
    required this.suaraParu,
    required this.dindingParu,
    required this.hati,
    required this.lien,
    required this.persitaltik,
    required this.abdomenLain,
    required this.kulit,
    required this.ginjal,
    required this.genetalia,
    required this.superior,
    required this.inferior,
  });

  factory PemeriksaanFisikModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikModel(
        mata: json["mata"],
        tht: json["tht"],
        mulut: json["mulut"],
        gigi: json["gigi"],
        thyroid: json["thyroid"],
        leherlain: json["leherlain"],
        dindingDada: json["dinding_dada"],
        suaraJantung: json["suara_jantung"],
        suaraParu: json["suara_paru"],
        dindingParu: json["dinding_paru"],
        hati: json["hati"],
        lien: json["lien"],
        persitaltik: json["persitaltik"],
        abdomenLain: json["abdomen_lain"],
        kulit: json["kulit"],
        ginjal: json["ginjal"],
        genetalia: json["genetalia"],
        superior: json["superior"],
        inferior: json["inferior"],
      );

  Map<String, dynamic> toJson() => {
        "mata": mata,
        "tht": tht,
        "mulut": mulut,
        "gigi": gigi,
        "thyroid": thyroid,
        "leherlain": leherlain,
        "dinding_dada": dindingDada,
        "suara_jantung": suaraJantung,
        "suara_paru": suaraParu,
        "dinding_paru": dindingParu,
        "hati": hati,
        "lien": lien,
        "persitaltik": persitaltik,
        "abdomen_lain": abdomenLain,
        "kulit": kulit,
        "ginjal": ginjal,
        "genetalia": genetalia,
        "superior": superior,
        "inferior": inferior,
      };
}

class Nyeri {
  final int nyeri;
  final String nyeriP;
  final String nyeriQ;
  final String nyeriR;
  final String nyeriS;
  final String nyeriT;
  Nyeri({
    required this.nyeri,
    required this.nyeriP,
    required this.nyeriQ,
    required this.nyeriR,
    required this.nyeriS,
    required this.nyeriT,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'skala_nyeri': nyeri,
      'skala_p': nyeriP,
      'skala_q': nyeriQ,
      'skala_r': nyeriR,
      'skala_s': nyeriS,
      'skala_t': nyeriT,
    };
  }

  factory Nyeri.fromMap(Map<String, dynamic> map) {
    return Nyeri(
      nyeri: map['skala_nyeri'] as int,
      nyeriP: map['skala_p'] as String,
      nyeriQ: map['skala_q'] as String,
      nyeriR: map['skala_r'] as String,
      nyeriS: map['skala_s'] as String,
      nyeriT: map['skala_t'] as String,
    );
  }
}

class ImageLokalis {
  final String image;
  ImageLokalis({
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
    };
  }

  factory ImageLokalis.fromMap(Map<String, dynamic> map) {
    return ImageLokalis(
      image: map['image'] as String,
    );
  }
}

class Pasien {
  final String nik;
  final String id;
  final String firstname;
  final String jenisKelamin;
  final String tglLahir;

  Pasien({
    required this.nik,
    required this.id,
    required this.firstname,
    required this.jenisKelamin,
    required this.tglLahir,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        nik: json["nik"],
        id: json["id"],
        firstname: json["firstname"],
        jenisKelamin: json["jenis_kelamin"],
        tglLahir: json["tgl_lahir"],
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "id": id,
        "firstname": firstname,
        "jenis_kelamin": jenisKelamin,
        "tgl_lahir": tglLahir,
      };
}

class SkalaFlacc {
  final int wajah;
  final int kaki;
  final int aktivitas;
  final int menangis;
  final int bersuara;

  SkalaFlacc({
    required this.wajah,
    required this.kaki,
    required this.aktivitas,
    required this.menangis,
    required this.bersuara,
  });

  factory SkalaFlacc.fromJson(Map<String, dynamic> json) => SkalaFlacc(
        wajah: json["wajah"],
        kaki: json["kaki"],
        aktivitas: json["aktivitas"],
        menangis: json["menangis"],
        bersuara: json["bersuara"],
      );

  Map<String, dynamic> toJson() => {
        "wajah": wajah,
        "kaki": kaki,
        "aktivitas": aktivitas,
        "menangis": menangis,
        "bersuara": bersuara,
      };
}
