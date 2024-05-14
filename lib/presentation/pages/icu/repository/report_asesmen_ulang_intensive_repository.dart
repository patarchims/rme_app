// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReportPerawatanIntensiveIcuModel {
  List<dynamic> alergi;
  Asesmen asesmen;
  PemeriksaanFisik pemeriksaanFisik;
  PengkajianPersistem pengkajianPersistem;
  List<PengobatanDirumahModel> pengobatanDirumah;
  List<AsuhanKeperawatanModel> asuhanKeperawatan;

  ReportPerawatanIntensiveIcuModel({
    required this.alergi,
    required this.asesmen,
    required this.pemeriksaanFisik,
    required this.pengkajianPersistem,
    required this.pengobatanDirumah,
    required this.asuhanKeperawatan,
  });

  factory ReportPerawatanIntensiveIcuModel.fromJson(
          Map<String, dynamic> json) =>
      ReportPerawatanIntensiveIcuModel(
          asuhanKeperawatan: List<AsuhanKeperawatanModel>.from(
              json["asuhan_keperawatan"]
                  .map((x) => AsuhanKeperawatanModel.fromJson(x))),
          pengobatanDirumah: List<PengobatanDirumahModel>.from(
              json["pengobatan_dirumah"]
                  .map((x) => PengobatanDirumahModel.fromJson(x))),
          alergi: List<dynamic>.from(json["alergi"].map((x) => x)),
          asesmen: Asesmen.fromJson(json["asesmen"]),
          pemeriksaanFisik:
              PemeriksaanFisik.fromJson(json["pemeriksaan_fisik"]),
          pengkajianPersistem:
              PengkajianPersistem.fromMap(json["pengkajian_persistem"]));

  Map<String, dynamic> toJson() => {
        "alergi": List<dynamic>.from(alergi.map((x) => x)),
        "asesmen": asesmen.toJson(),
        "pemeriksaan_fisik": pemeriksaanFisik.toJson(),
      };
}

class PengkajianPersistem {
  String airway;
  String breathing;
  String circulation;
  String nutrisi;
  String makan;
  String padaBayi;
  String minum;
  String eliminasiBak;
  String eliminasiBab;
  String aktivitasIstirahat;
  String aktivitas;
  String berjalan;
  String penggunaanAlatBantu;
  String perfusiSerebral;
  String pupil;
  String refleksCahaya;
  String perfusiRenal;
  String pefusiGastroinestinal;
  String abdomen;
  String thermoregulasi;
  String kenyamanan;
  String kualitas;
  String pola;
  String nyeriMempengaruhi;
  String statusMental;
  String kejang;
  String pasangPengamanTempatTidur;
  String belMudaDijangkau;
  String penglihatan;
  String pendengaran;
  String hamil;
  String pemeriksaanCervixTerakhir;
  String pemeriksaanPayudaraSendiri;
  String mamografiTerakhirTanggal;
  String penggunaanAlatKontrasepsi;
  String bicara;
  String bahasaSehariHari;
  String perluPenerjemah;
  String bahasaIsyarat;
  String hambatanBelajar;
  String caraBelajarDisukai;
  String tingkatPendidikan;
  String potensialKebutuhanPembelajaran;
  String responseEmosi;
  String sistemSosial;
  String tingkatBersama;
  String kondisiLingkunganDirumah;
  String nilaiKepercayaan;
  String menjalankanIbadah;
  String presepsiTerhadapSakit;
  String kunjunganPemimpin;
  String nilaiAturanKhusus;
  String mandi;
  String berpakaian;
  String sistemMakan;
  String sistemEliminasi;
  String sistemMobilisasi;
  String masalahDenganNutrisi;

  PengkajianPersistem({
    required this.airway,
    required this.breathing,
    required this.circulation,
    required this.nutrisi,
    required this.makan,
    required this.padaBayi,
    required this.minum,
    required this.eliminasiBak,
    required this.eliminasiBab,
    required this.aktivitasIstirahat,
    required this.aktivitas,
    required this.berjalan,
    required this.penggunaanAlatBantu,
    required this.perfusiSerebral,
    required this.pupil,
    required this.refleksCahaya,
    required this.perfusiRenal,
    required this.pefusiGastroinestinal,
    required this.abdomen,
    required this.thermoregulasi,
    required this.kenyamanan,
    required this.kualitas,
    required this.pola,
    required this.nyeriMempengaruhi,
    required this.statusMental,
    required this.kejang,
    required this.pasangPengamanTempatTidur,
    required this.belMudaDijangkau,
    required this.penglihatan,
    required this.pendengaran,
    required this.hamil,
    required this.pemeriksaanCervixTerakhir,
    required this.pemeriksaanPayudaraSendiri,
    required this.mamografiTerakhirTanggal,
    required this.penggunaanAlatKontrasepsi,
    required this.bicara,
    required this.bahasaSehariHari,
    required this.perluPenerjemah,
    required this.bahasaIsyarat,
    required this.hambatanBelajar,
    required this.caraBelajarDisukai,
    required this.tingkatPendidikan,
    required this.potensialKebutuhanPembelajaran,
    required this.responseEmosi,
    required this.sistemSosial,
    required this.tingkatBersama,
    required this.kondisiLingkunganDirumah,
    required this.nilaiKepercayaan,
    required this.menjalankanIbadah,
    required this.presepsiTerhadapSakit,
    required this.kunjunganPemimpin,
    required this.nilaiAturanKhusus,
    required this.mandi,
    required this.berpakaian,
    required this.sistemMakan,
    required this.sistemEliminasi,
    required this.sistemMobilisasi,
    required this.masalahDenganNutrisi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'airway': airway,
      'breathing': breathing,
      'circulation': circulation,
      'nutrisi': nutrisi,
      'makan': makan,
      'padaBayi': padaBayi,
      'minum': minum,
      'eliminasiBak': eliminasiBak,
      'eliminasiBab': eliminasiBab,
      'aktivitasIstirahat': aktivitasIstirahat,
      'aktivitas': aktivitas,
      'berjalan': berjalan,
      'penggunaanAlatBantu': penggunaanAlatBantu,
      'perfusiSerebral': perfusiSerebral,
      'pupil': pupil,
      'refleksCahaya': refleksCahaya,
      'perfusiRenal': perfusiRenal,
      'pefusiGastroinestinal': pefusiGastroinestinal,
      'abdomen': abdomen,
      'thermoregulasi': thermoregulasi,
      'kenyamanan': kenyamanan,
      'kualitas': kualitas,
      'pola': pola,
      'nyeriMempengaruhi': nyeriMempengaruhi,
      'statusMental': statusMental,
      'kejang': kejang,
      'pasangPengamanTempatTidur': pasangPengamanTempatTidur,
      'belMudaDijangkau': belMudaDijangkau,
      'penglihatan': penglihatan,
      'pendengaran': pendengaran,
      'hamil': hamil,
      'pemeriksaanCervixTerakhir': pemeriksaanCervixTerakhir,
      'pemeriksaanPayudaraSendiri': pemeriksaanPayudaraSendiri,
      'mamografiTerakhirTanggal': mamografiTerakhirTanggal,
      'penggunaanAlatKontrasepsi': penggunaanAlatKontrasepsi,
      'bicara': bicara,
      'bahasaSehariHari': bahasaSehariHari,
      'perluPenerjemah': perluPenerjemah,
      'bahasaIsyarat': bahasaIsyarat,
      'hambatanBelajar': hambatanBelajar,
      'caraBelajarDisukai': caraBelajarDisukai,
      'tingkatPendidikan': tingkatPendidikan,
      'potensialKebutuhanPembelajaran': potensialKebutuhanPembelajaran,
      'responseEmosi': responseEmosi,
      'sistemSosial': sistemSosial,
      'tingkatBersama': tingkatBersama,
      'kondisiLingkunganDirumah': kondisiLingkunganDirumah,
      'nilaiKepercayaan': nilaiKepercayaan,
      'menjalankanIbadah': menjalankanIbadah,
      'presepsiTerhadapSakit': presepsiTerhadapSakit,
      'kunjunganPemimpin': kunjunganPemimpin,
      'nilaiAturanKhusus': nilaiAturanKhusus,
      'mandi': mandi,
      'berpakaian': berpakaian,
      'sistemMakan': sistemMakan,
      'sistemEliminasi': sistemEliminasi,
      'sistemMobilisasi': sistemMobilisasi,
      'masalahDenganNutrisi': masalahDenganNutrisi,
    };
  }

  factory PengkajianPersistem.fromMap(Map<String, dynamic> map) {
    return PengkajianPersistem(
      airway: map['airway'].toString(),
      breathing: map['breathing'].toString(),
      circulation: map['circulation'].toString(),
      nutrisi: map['nutrisi'].toString(),
      makan: map['makan'].toString(),
      padaBayi: map['pada_bayi'].toString(),
      minum: map['minum'].toString(),
      eliminasiBak: map['eliminasi_bak'].toString(),
      eliminasiBab: map['eliminasi_bab'].toString(),
      aktivitasIstirahat: map['aktivitas_istirahat'].toString(),
      aktivitas: map['aktivitas'].toString(),
      berjalan: map['berjalan'].toString(),
      penggunaanAlatBantu: map['penggunaan_alat_bantu'].toString(),
      perfusiSerebral: map['perfusi_serebral'].toString(),
      pupil: map['pupil'].toString(),
      refleksCahaya: map['refleks_cahaya'].toString(),
      perfusiRenal: map['perfusi_renal'].toString(),
      pefusiGastroinestinal: map['pefusi_gastroinestinal'].toString(),
      abdomen: map['abdomen'].toString(),
      thermoregulasi: map['thermoregulasi'].toString(),
      kenyamanan: map['kenyamanan'].toString(),
      kualitas: map['kualitas'].toString(),
      pola: map['pola'].toString(),
      nyeriMempengaruhi: map['nyeri_mempengaruhi'].toString(),
      statusMental: map['status_mental'].toString(),
      kejang: map['kejang'].toString(),
      pasangPengamanTempatTidur: map['pasang_pengaman_tempat_tidur'].toString(),
      belMudaDijangkau: map['bel_muda_dijangkau'].toString(),
      penglihatan: map['penglihatan'].toString(),
      pendengaran: map['pendengaran'].toString(),
      hamil: map['hamil'].toString(),
      pemeriksaanCervixTerakhir: map['pemeriksaan_cervix_terakhir'].toString(),
      pemeriksaanPayudaraSendiri:
          map['pemeriksaan_payudara_sendiri'].toString(),
      mamografiTerakhirTanggal: map['mamografi_terakhir_tanggal'].toString(),
      penggunaanAlatKontrasepsi: map['penggunaan_alat_kontrasepsi'].toString(),
      bicara: map['bicara'].toString(),
      bahasaSehariHari: map['bahasa_sehari_hari'].toString(),
      perluPenerjemah: map['perlu_penerjemah'].toString(),
      bahasaIsyarat: map['bahasa_isyarat'].toString(),
      hambatanBelajar: map['hambatan_belajar'].toString(),
      caraBelajarDisukai: map['cara_belajar_disukai'].toString(),
      tingkatPendidikan: map['tingkat_pendidikan'].toString(),
      potensialKebutuhanPembelajaran:
          map['potensial_kebutuhan_pembelajaran'].toString(),
      responseEmosi: map['response_emosi'].toString(),
      sistemSosial: map['sistem_sosial'].toString(),
      tingkatBersama: map['tingkat_bersama'].toString(),
      kondisiLingkunganDirumah: map['kondisi_lingkungan_dirumah'].toString(),
      nilaiKepercayaan: map['nilai_kepercayaan'].toString(),
      menjalankanIbadah: map['menjalankan_ibadah'].toString(),
      presepsiTerhadapSakit: map['presepsi_terhadap_sakit'].toString(),
      kunjunganPemimpin: map['kunjungan_pemimpin'].toString(),
      nilaiAturanKhusus: map['nilai_aturan_khusus'].toString(),
      mandi: map['mandi'].toString(),
      berpakaian: map['berpakaian'].toString(),
      sistemMakan: map['sistem_makan'].toString(),
      sistemEliminasi: map['sistem_eliminasi'].toString(),
      sistemMobilisasi: map['sistem_mobilisasi'].toString(),
      masalahDenganNutrisi: map['masalah_dengan_nutrisi'].toString(),
    );
  }
}

class Asesmen {
  String kdDpjp;
  String asesmen;
  String rwtDari;
  String caraMasuk;
  String asalMasuk;
  String keluhan;
  String riwayatPenyakit;
  String reaksiYangMuncul;
  String reaksiAlergi;
  String transfusiDarah;
  String rwtMerokok;
  String rwtMinumanKeras;
  String rwtAlkoholMempegaruhi;
  String nama;

  Asesmen({
    required this.kdDpjp,
    required this.asesmen,
    required this.rwtDari,
    required this.caraMasuk,
    required this.asalMasuk,
    required this.keluhan,
    required this.riwayatPenyakit,
    required this.reaksiYangMuncul,
    required this.reaksiAlergi,
    required this.transfusiDarah,
    required this.rwtMerokok,
    required this.rwtMinumanKeras,
    required this.rwtAlkoholMempegaruhi,
    required this.nama,
  });

  factory Asesmen.fromJson(Map<String, dynamic> json) => Asesmen(
        nama: json["nama"].toString(),
        kdDpjp: json["kd_dpjp"].toString(),
        asesmen: json["asesmen"].toString(),
        rwtDari: json["rwt_dari"].toString(),
        caraMasuk: json["cara_masuk"].toString(),
        asalMasuk: json["asal_masuk"].toString(),
        keluhan: json["keluhan"].toString(),
        riwayatPenyakit: json["riwayat_penyakit"].toString(),
        reaksiYangMuncul: json["reaksi_yang_muncul"].toString(),
        reaksiAlergi: json["reaksi_alergi"].toString(),
        transfusiDarah: json["transfusi_darah"].toString(),
        rwtMerokok: json["rwt_merokok"].toString(),
        rwtMinumanKeras: json["rwt_minuman_keras"].toString(),
        rwtAlkoholMempegaruhi: json["rwt_alkohol_mempegaruhi"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kd_dpjp": kdDpjp,
        "asesmen": asesmen,
        "rwt_dari": rwtDari,
        "cara_masuk": caraMasuk,
        "asal_masuk": asalMasuk,
        "keluhan": keluhan,
        "riwayat_penyakit": riwayatPenyakit,
        "reaksi_yang_muncul": reaksiYangMuncul,
        "reaksi_alergi": reaksiAlergi,
        "transfusi_darah": transfusiDarah,
        "rwt_merokok": rwtMerokok,
        "rwt_minuman_keras": rwtMinumanKeras,
        "rwt_alkohol_mempegaruhi": rwtAlkoholMempegaruhi,
      };
}

class PemeriksaanFisik {
  String kesadaran;
  String kepala;
  String rambut;
  String wajah;
  String mata;
  String telinga;
  String hidung;
  String mulut;
  String gigi;
  String lidah;
  String tenggorokan;
  String leher;
  String dada;
  String respirasi;
  String jantung;
  String integumen;
  String ekstremitas;
  String genetalia;

  PemeriksaanFisik({
    required this.kesadaran,
    required this.kepala,
    required this.rambut,
    required this.wajah,
    required this.mata,
    required this.telinga,
    required this.hidung,
    required this.mulut,
    required this.gigi,
    required this.lidah,
    required this.tenggorokan,
    required this.leher,
    required this.dada,
    required this.respirasi,
    required this.jantung,
    required this.integumen,
    required this.ekstremitas,
    required this.genetalia,
  });

  factory PemeriksaanFisik.fromJson(Map<String, dynamic> json) =>
      PemeriksaanFisik(
        kesadaran: json["kesadaran"].toString(),
        kepala: json["kepala"].toString(),
        rambut: json["rambut"].toString(),
        wajah: json["wajah"].toString(),
        mata: json["mata"].toString(),
        telinga: json["telinga"].toString(),
        hidung: json["hidung"].toString(),
        mulut: json["mulut"].toString(),
        gigi: json["gigi"].toString(),
        lidah: json["lidah"].toString(),
        tenggorokan: json["tenggorokan"].toString(),
        leher: json["leher"].toString(),
        dada: json["dada"].toString(),
        respirasi: json["respirasi"].toString(),
        jantung: json["jantung"].toString(),
        integumen: json["integumen"].toString(),
        ekstremitas: json["ekstremitas"].toString(),
        genetalia: json["genetalia"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kesadaran": kesadaran,
        "kepala": kepala,
        "rambut": rambut,
        "wajah": wajah,
        "mata": mata,
        "telinga": telinga,
        "hidung": hidung,
        "mulut": mulut,
        "gigi": gigi,
        "lidah": lidah,
        "tenggorokan": tenggorokan,
        "leher": leher,
        "dada": dada,
        "respirasi": respirasi,
        "jantung": jantung,
        "integumen": integumen,
        "ekstremitas": ekstremitas,
        "genetalia": genetalia,
      };
}

class PengobatanDirumahModel {
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

  PengobatanDirumahModel({
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

  factory PengobatanDirumahModel.fromJson(Map<String, dynamic> json) =>
      PengobatanDirumahModel(
        insertDttm: json["insert_dttm"].toString(),
        userId: json["user_id"].toString(),
        deviceId: json["device_id"].toString(),
        kdRiwayat: json["kd_riwayat"].toString(),
        noreg: json["noreg"].toString(),
        namaObat: json["nama_obat"].toString(),
        dosis: json["dosis"].toString(),
        caraPemberian: json["cara_pemberian"].toString(),
        frekuensi: json["frekuensi"].toString(),
        waktu: json["waktu"].toString(),
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
