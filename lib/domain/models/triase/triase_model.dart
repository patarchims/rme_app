class TriaseModel {
  final String? insertDttm;
  final String? kdBagian;
  final String noreg;
  final String keluhan;
  final String alergi;
  final String alergiDetail;
  final String nafas;
  final String tekananDarah;
  final String pernapasan;
  final String pupil;
  final String nadi;
  final String spo;
  final String suhu;
  final String akral;
  final String reflekCahaya;
  final String gangguan;
  final String gangguanDetail;
  final int nyeri;
  final String nyeriP;
  final String nyeriQ;
  final String nyeriR;
  final String nyeriS;
  final String nyeriT;
  final int wajah;
  final int kaki;
  final int aktifitas;
  final int menangis;
  final int bersuara;
  final int total;
  final int triase;
  final String? tanggal;
  final String? jam;

  TriaseModel({
    this.insertDttm,
    this.kdBagian,
    required this.noreg,
    required this.keluhan,
    required this.alergi,
    required this.alergiDetail,
    required this.nafas,
    required this.tekananDarah,
    required this.pernapasan,
    required this.pupil,
    required this.nadi,
    required this.spo,
    required this.suhu,
    required this.akral,
    required this.reflekCahaya,
    required this.gangguan,
    required this.gangguanDetail,
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
    required this.total,
    required this.triase,
    this.tanggal,
    this.jam,
  });

  factory TriaseModel.fromJson(Map<String, dynamic> json) => TriaseModel(
        insertDttm: json["insertDttm"],
        kdBagian: json["kdBagian"],
        noreg: json["noreg"],
        keluhan: json["keluhan"],
        alergi: json["alergi"],
        alergiDetail: json["alergi_detail"],
        nafas: json["nafas"],
        tekananDarah: json["tekanan_darah"],
        pernapasan: json["pernapasan"],
        pupil: json["pupil"],
        nadi: json["nadi"],
        spo: json["spo"],
        suhu: json["suhu"],
        akral: json["akral"],
        reflekCahaya: json["reflek_cahaya"],
        gangguan: json["gangguan"],
        gangguanDetail: json["gangguan_detail"],
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
        total: json["total"],
        triase: json["triase"],
        tanggal: json["tanggal"],
        jam: json["jam"],
      );

  Map<String, dynamic> toJson() => {
        "insertDttm": insertDttm,
        "kdBagian": kdBagian,
        "noreg": noreg,
        "keluhan": keluhan,
        "alergi": alergi,
        "alergi_detail": alergiDetail,
        "nafas": nafas,
        "tekanan_darah": tekananDarah,
        "pernapasan": pernapasan,
        "pupil": pupil,
        "nadi": nadi,
        "spo": spo,
        "suhu": suhu,
        "akral": akral,
        "reflek_cahaya": reflekCahaya,
        "gangguan": gangguan,
        "gangguan_detail": gangguanDetail,
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
        "total": total,
        "triase": triase,
        "tanggal": tanggal.toString(),
        "jam": jam,
      };
}
