class ReportTriaseResponseModel {
  Triase triase;
  String keluhanUtama;
  AlergiModel alergiModel;
  SoapDokter soapDokter;
  PemeriksaanFisik pemeriksaanFisik;
  AsesmenBidan asesmenBidan;
  List<Riwayat> riwayat;

  ReportTriaseResponseModel({
    required this.triase,
    required this.soapDokter,
    required this.keluhanUtama,
    required this.alergiModel,
    required this.pemeriksaanFisik,
    required this.asesmenBidan,
    required this.riwayat,
  });

  factory ReportTriaseResponseModel.fromJson(Map<String, dynamic> json) =>
      ReportTriaseResponseModel(
          riwayat: List<Riwayat>.from(
              json["riwayat"].map((x) => Riwayat.fromJson(x))),
          pemeriksaanFisik: PemeriksaanFisik.fromJson(json),
          asesmenBidan: AsesmenBidan.fromJson(json),
          soapDokter: SoapDokter.fromJson(json),
          keluhanUtama: json["keluhan_utama"],
          triase: Triase.fromJson(json["triase"]),
          alergiModel: AlergiModel.fromJson(json));

  Map<String, dynamic> toJson() => {
        "triase": triase.toJson(),
      };
}

class Triase {
  String userId;
  String insertDttm;
  String kdBagian;
  String kategori;
  String pelayanan;
  String noreg;
  String jalanNafas;
  String pupilKiri;
  String pupilKanan;
  String refleks;
  String cahayaKanan;
  String cahayaKiri;
  String gangguan;
  String gangguanDetail;
  String td;
  String nadi;
  String suhu;
  String pernafasan;
  String spo2;
  String gcsE;
  String gcsV;
  String gcsM;
  String akral;
  int nyeri;
  String nyeriP;
  String nyeriQ;
  String nyeriR;
  String nyeriS;
  String nyeriT;
  int wajah;
  int kaki;
  int aktifitas;
  int menangis;
  int bersuara;
  int skalaTriase;
  String namaPerawat;
  String namaDokter;

  Triase({
    required this.cahayaKanan,
    required this.cahayaKiri,
    required this.gangguan,
    required this.gangguanDetail,
    required this.userId,
    required this.insertDttm,
    required this.kdBagian,
    required this.kategori,
    required this.pelayanan,
    required this.noreg,
    required this.jalanNafas,
    required this.pupilKiri,
    required this.pupilKanan,
    required this.refleks,
    required this.td,
    required this.nadi,
    required this.suhu,
    required this.pernafasan,
    required this.spo2,
    required this.gcsE,
    required this.gcsV,
    required this.gcsM,
    required this.akral,
    required this.nyeri,
    required this.nyeriP,
    required this.nyeriQ,
    required this.nyeriR,
    required this.nyeriS,
    required this.nyeriT,
    required this.wajah,
    required this.kaki,
    required this.aktifitas,
    required this.menangis,
    required this.bersuara,
    required this.skalaTriase,
    required this.namaPerawat,
    required this.namaDokter,
  });

  factory Triase.fromJson(Map<String, dynamic> json) => Triase(
        gangguan: json["gangguan"],
        gangguanDetail: json["gangguan_detail"],
        cahayaKanan: json["cahaya_kanan"],
        cahayaKiri: json["cahaya_kiri"],
        userId: json["user_id"],
        insertDttm: json["insert_dttm"],
        kdBagian: json["kd_bagian"],
        kategori: json["kategori"],
        pelayanan: json["pelayanan"],
        noreg: json["noreg"],
        jalanNafas: json["jalan_nafas"],
        pupilKiri: json["pupil_kiri"],
        pupilKanan: json["pupil_kanan"],
        refleks: json["refleks"],
        td: json["td"],
        nadi: json["nadi"],
        suhu: json["suhu"],
        pernafasan: json["pernafasan"],
        spo2: json["spo2"],
        gcsE: json["gcs_e"],
        gcsV: json["gcs_v"],
        gcsM: json["gcs_m"],
        akral: json["akral"],
        nyeri: json["nyeri"],
        nyeriP: json["nyeri_p"],
        nyeriQ: json["nyeri_q"],
        nyeriR: json["nyeri_r"],
        nyeriS: json["nyeri_s"],
        nyeriT: json["nyeri_t"],
        wajah: json["wajah"],
        kaki: json["kaki"],
        aktifitas: json["aktifitas"],
        menangis: json["menangis"],
        bersuara: json["bersuara"],
        skalaTriase: json["skala_triase"],
        namaPerawat: json["nama_perawat"],
        namaDokter: json["nama_dokter"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "insert_dttm": insertDttm,
        "kd_bagian": kdBagian,
        "kategori": kategori,
        "pelayanan": pelayanan,
        "noreg": noreg,
        "jalan_nafas": jalanNafas,
        "pupil_kiri": pupilKiri,
        "pupil_kanan": pupilKanan,
        "refleks": refleks,
        "td": td,
        "nadi": nadi,
        "suhu": suhu,
        "pernafasan": pernafasan,
        "spo2": spo2,
        "gcs_e": gcsE,
        "gcs_v": gcsV,
        "gcs_m": gcsM,
        "akral": akral,
        "nyeri": nyeri,
        "nyeri_p": nyeriP,
        "nyeri_q": nyeriQ,
        "nyeri_r": nyeriR,
        "nyeri_s": nyeriS,
        "nyeri_t": nyeriT,
        "wajah": wajah,
        "kaki": kaki,
        "aktifitas": aktifitas,
        "menangis": menangis,
        "bersuara": bersuara,
        "skala_triase": skalaTriase,
        "nama_perawat": namaPerawat,
        "nama_dokter": namaDokter,
      };
}

class AlergiModel {
  List<AlergiResponse> alergi;

  AlergiModel({
    required this.alergi,
  });

  factory AlergiModel.fromJson(Map<String, dynamic> json) => AlergiModel(
        alergi: List<AlergiResponse>.from(
            json["alergi"].map((x) => AlergiResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "alergi": List<dynamic>.from(alergi.map((x) => x.toJson())),
      };
}

class AlergiResponse {
  int nomor;
  String noRm;
  String kelompok;
  String insertDttm;
  String alergi;
  String namaUser;
  String bagian;

  AlergiResponse({
    required this.nomor,
    required this.noRm,
    required this.kelompok,
    required this.insertDttm,
    required this.alergi,
    required this.namaUser,
    required this.bagian,
  });

  factory AlergiResponse.fromJson(Map<String, dynamic> json) => AlergiResponse(
        nomor: json["nomor"],
        noRm: json["no_rm"],
        kelompok: json["kelompok"],
        insertDttm: json["insert_dttm"].toString(),
        alergi: json["alergi"],
        namaUser: json["nama_user"],
        bagian: json["bagian"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "no_rm": noRm,
        "kelompok": kelompok,
        "insert_dttm": insertDttm,
        "alergi": alergi,
        "nama_user": namaUser,
        "bagian": bagian,
      };
}

class SoapDokter {
  SoapDokterClass soapDokter;

  SoapDokter({
    required this.soapDokter,
  });

  factory SoapDokter.fromJson(Map<String, dynamic> json) => SoapDokter(
        soapDokter: SoapDokterClass.fromJson(json["soap_dokter"]),
      );

  Map<String, dynamic> toJson() => {
        "soap_dokter": soapDokter.toJson(),
      };
}

class SoapDokterClass {
  String inserDttm;
  String ketPerson;
  String userId;
  String tglMasuk;
  String pelayanan;
  String kdBagian;
  String noreg;
  String kdDpjp;
  String keluhanUtama;
  String telaah;
  String kesadaran;
  String jenpel;
  String imageLokalis;
  String namaDokter;
  String primari;
  String desP;
  String s1;
  String des1;
  String s2;
  String des2;
  String s3;
  String des3;
  String s4;
  String des4;
  String s5;
  String des5;
  String s6;
  String des6;
  String alasanOpname;
  String terapi;
  String konsulKe;

  SoapDokterClass({
    required this.inserDttm,
    required this.ketPerson,
    required this.userId,
    required this.tglMasuk,
    required this.pelayanan,
    required this.kdBagian,
    required this.noreg,
    required this.kdDpjp,
    required this.keluhanUtama,
    required this.telaah,
    required this.kesadaran,
    required this.jenpel,
    required this.imageLokalis,
    required this.namaDokter,
    required this.primari,
    required this.desP,
    required this.s1,
    required this.des1,
    required this.s2,
    required this.des2,
    required this.s3,
    required this.des3,
    required this.s4,
    required this.des4,
    required this.s5,
    required this.des5,
    required this.s6,
    required this.des6,
    required this.alasanOpname,
    required this.terapi,
    required this.konsulKe,
  });

  factory SoapDokterClass.fromJson(Map<String, dynamic> json) =>
      SoapDokterClass(
        inserDttm: json["inser_dttm"],
        ketPerson: json["ket_person"],
        userId: json["user_id"],
        tglMasuk: json["tgl_masuk"],
        pelayanan: json["pelayanan"],
        kdBagian: json["kd_bagian"],
        noreg: json["noreg"],
        kdDpjp: json["kd_dpjp"],
        keluhanUtama: json["keluhan_utama"],
        telaah: json["telaah"],
        kesadaran: json["kesadaran"],
        jenpel: json["jenpel"],
        imageLokalis: json["image_lokalis"],
        namaDokter: json["nama_dokter"],
        primari: json["primari"],
        desP: json["des_p"],
        s1: json["s1"],
        des1: json["des1"],
        s2: json["s2"],
        des2: json["des2"],
        s3: json["s3"],
        des3: json["des3"],
        s4: json["s4"],
        des4: json["des4"],
        s5: json["s5"],
        des5: json["des5"],
        s6: json["s6"],
        des6: json["des6"],
        alasanOpname: json["alasan_opname"],
        terapi: json["terapi"],
        konsulKe: json["konsul_ke"],
      );

  Map<String, dynamic> toJson() => {
        "inser_dttm": inserDttm,
        "ket_person": ketPerson,
        "user_id": userId,
        "tgl_masuk": tglMasuk,
        "pelayanan": pelayanan,
        "kd_bagian": kdBagian,
        "noreg": noreg,
        "kd_dpjp": kdDpjp,
        "keluhan_utama": keluhanUtama,
        "telaah": telaah,
        "kesadaran": kesadaran,
        "jenpel": jenpel,
        "image_lokalis": imageLokalis,
        "nama_dokter": namaDokter,
        "primari": primari,
        "des_p": desP,
        "s1": s1,
        "des1": des1,
        "s2": s2,
        "des2": des2,
        "s3": s3,
        "des3": des3,
        "s4": s4,
        "des4": des4,
        "s5": s5,
        "des5": des5,
        "s6": s6,
        "des6": des6,
        "alasan_opname": alasanOpname,
        "terapi": terapi,
        "konsul_ke": konsulKe,
      };
}

class PemeriksaanFisik {
  PemeriksaanFisikClass pemeriksaanFisik;

  PemeriksaanFisik({
    required this.pemeriksaanFisik,
  });

  factory PemeriksaanFisik.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisik(
        pemeriksaanFisik:
            PemeriksaanFisikClass.fromJson(json["pemeriksaan_fisik"]),
      );

  Map<String, dynamic> toJson() => {
        "pemeriksaan_fisik": pemeriksaanFisik.toJson(),
      };
}

class PemeriksaanFisikClass {
  String mata;
  String tht;
  String mulut;
  String gigi;
  String leher;
  String thyroid;
  String leherlain;
  String dada;
  String dindingDada;
  String jantung;
  String paru;
  String perut;
  String peristikUsus;
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
  String perawat;
  String dokter;

  PemeriksaanFisikClass({
    required this.mata,
    required this.tht,
    required this.mulut,
    required this.gigi,
    required this.leher,
    required this.thyroid,
    required this.leherlain,
    required this.dada,
    required this.dindingDada,
    required this.jantung,
    required this.paru,
    required this.perut,
    required this.peristikUsus,
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
    required this.perawat,
    required this.dokter,
  });

  factory PemeriksaanFisikClass.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisikClass(
        mata: json["mata"],
        tht: json["tht"],
        mulut: json["mulut"],
        gigi: json["gigi"],
        leher: json["leher"],
        thyroid: json["thyroid"],
        leherlain: json["leherlain"],
        dada: json["dada"],
        dindingDada: json["dinding_dada"],
        jantung: json["jantung"],
        paru: json["paru"],
        perut: json["perut"],
        peristikUsus: json["peristik_usus"],
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
        perawat: json["perawat"],
        dokter: json["dokter"],
      );

  Map<String, dynamic> toJson() => {
        "mata": mata,
        "tht": tht,
        "mulut": mulut,
        "gigi": gigi,
        "leher": leher,
        "thyroid": thyroid,
        "leherlain": leherlain,
        "dada": dada,
        "dinding_dada": dindingDada,
        "jantung": jantung,
        "paru": paru,
        "perut": perut,
        "peristik_usus": peristikUsus,
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
        "perawat": perawat,
        "dokter": dokter,
      };
}

class AsesmenBidan {
  AsesmenBidanClass asesmenBidan;

  AsesmenBidan({
    required this.asesmenBidan,
  });

  factory AsesmenBidan.fromJson(Map<String, dynamic> json) => AsesmenBidan(
        asesmenBidan: AsesmenBidanClass.fromJson(json["asesmen_bidan"]),
      );

  Map<String, dynamic> toJson() => {
        "asesmen_bidan": asesmenBidan.toJson(),
      };
}

class AsesmenBidanClass {
  String userId;
  String insertDttm;
  String kdBagian;
  String pelayanan;
  String noreg;
  String info;
  String infoDetail;
  String caraMasuk;
  String rwtPenyakit;
  String asalMasuk;
  String skalaNyeri;
  String frekuensiNyeri;
  String lamaNyeri;
  String menjalar;
  String menjalarDetail;
  String kualitasNyeri;
  String pemicu;
  String pengurang;
  String fungsional;
  String fungsionalDetail;
  String rj1;
  String rj2;
  String hasilRj;
  String hasilRjTind;
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
  String leopold1;
  String leopold2;
  String leopold3;
  String leopold4;
  String kondisiPulang;
  String transportasi;
  String djj;
  String vt;
  String namaPerawat;
  String pulang1;
  String pulangDetail;
  String pulang2;
  String pulang2Detail;
  String pulang3;
  String pulang3Detail;
  String jamCheckOut;
  String jamCheckInRanap;
  String caraKeluar;

  AsesmenBidanClass({
    required this.rwtPenyakit,
    required this.userId,
    required this.insertDttm,
    required this.kdBagian,
    required this.pelayanan,
    required this.noreg,
    required this.info,
    required this.infoDetail,
    required this.caraMasuk,
    required this.asalMasuk,
    required this.skalaNyeri,
    required this.frekuensiNyeri,
    required this.lamaNyeri,
    required this.menjalar,
    required this.menjalarDetail,
    required this.kualitasNyeri,
    required this.pemicu,
    required this.pengurang,
    required this.fungsional,
    required this.fungsionalDetail,
    required this.rj1,
    required this.rj2,
    required this.hasilRj,
    required this.hasilRjTind,
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
    required this.leopold1,
    required this.leopold2,
    required this.leopold3,
    required this.leopold4,
    required this.kondisiPulang,
    required this.transportasi,
    required this.namaPerawat,
    required this.djj,
    required this.vt,
    required this.pulang1,
    required this.pulangDetail,
    required this.pulang2,
    required this.pulang2Detail,
    required this.pulang3,
    required this.pulang3Detail,
    required this.jamCheckOut,
    required this.jamCheckInRanap,
    required this.caraKeluar,
  });

  factory AsesmenBidanClass.fromJson(Map<String, dynamic> json) =>
      AsesmenBidanClass(
          rwtPenyakit: json["rwt_penyakit"],
          jamCheckInRanap: json["jam_check_in_ranap"],
          jamCheckOut: json["jam_check_out"],
          userId: json["user_id"],
          insertDttm: json["insert_dttm"],
          kdBagian: json["kd_bagian"],
          pelayanan: json["pelayanan"],
          noreg: json["noreg"],
          info: json["info"],
          infoDetail: json["info_detail"],
          caraMasuk: json["cara_masuk"],
          asalMasuk: json["asal_masuk"],
          skalaNyeri: json["skala_nyeri"],
          frekuensiNyeri: json["frekuensi_nyeri"],
          lamaNyeri: json["lama_nyeri"],
          menjalar: json["menjalar"],
          menjalarDetail: json["menjalar_detail"],
          kualitasNyeri: json["kualitas_nyeri"],
          pemicu: json["pemicu"],
          pengurang: json["pengurang"],
          fungsional: json["fungsional"],
          fungsionalDetail: json["fungsional_detail"],
          rj1: json["rj1"],
          rj2: json["rj2"],
          hasilRj: json["hasil_rj"],
          hasilRjTind: json["hasil_rj_tind"],
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
          leopold1: json["leopold1"],
          leopold2: json["leopold2"],
          leopold3: json["leopold3"],
          leopold4: json["leopold4"],
          kondisiPulang: json["kondisi_pulang"],
          transportasi: json["transportasi"],
          namaPerawat: json["nama_perawat"],
          pulang1: json["pulang1"],
          pulang2: json["pulang2"],
          pulang2Detail: json["pulang2_detail"],
          pulang3: json["pulang3"],
          pulang3Detail: json["pulang3_detail"],
          pulangDetail: json["pulang_detail"],
          djj: json["djj"],
          caraKeluar: json["cara_keluar"],
          vt: json["vt"]);

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "insert_dttm": insertDttm,
        "kd_bagian": kdBagian,
        "pelayanan": pelayanan,
        "noreg": noreg,
        "info": info,
        "info_detail": infoDetail,
        "cara_masuk": caraMasuk,
        "skala_nyeri": skalaNyeri,
        "frekuensi_nyeri": frekuensiNyeri,
        "lama_nyeri": lamaNyeri,
        "menjalar": menjalar,
        "menjalar_detail": menjalarDetail,
        "kualitas_nyeri": kualitasNyeri,
        "pemicu": pemicu,
        "pengurang": pengurang,
        "fungsional": fungsional,
        "fungsional_detail": fungsionalDetail,
        "rj1": rj1,
        "rj2": rj2,
        "hasil_rj": hasilRj,
        "hasil_rj_tind": hasilRjTind,
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
        "leopold1": leopold1,
        "leopold2": leopold2,
        "leopold3": leopold3,
        "leopold4": leopold4,
        "kondisi_pulang": kondisiPulang,
        "transportasi": transportasi,
        "nama_perawat": namaPerawat,
        "cara_keluar": caraKeluar,
      };
}

class Riwayat {
  final String noreg;
  final String penyakit;
  final String noRm;

  Riwayat({
    required this.noreg,
    required this.penyakit,
    required this.noRm,
  });

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        noreg: json["noreg"],
        penyakit: json["penyakit"],
        noRm: json["no_rm"],
      );

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "penyakit": penyakit,
        "no_rm": noRm,
      };
}
