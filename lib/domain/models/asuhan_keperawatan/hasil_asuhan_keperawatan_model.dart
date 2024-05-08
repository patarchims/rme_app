// ignore_for_file: public_member_api_docs, sort_constructors_first
class HasilAsuhanKeperawatanModel {
  String hasil;
  String tanggal;
  String insertDttm;
  String kodeDiagnosa;
  String noDaskep;
  Diagnosa diagnosa;
  Bagian bagian;
  Perawat perawat;
  List<DeskripsiSlki> deskripsiSlki;
  List<DeskripsiSiki> deskripsiSiki;

  HasilAsuhanKeperawatanModel({
    required this.hasil,
    required this.insertDttm,
    required this.tanggal,
    required this.bagian,
    required this.perawat,
    required this.kodeDiagnosa,
    required this.noDaskep,
    required this.diagnosa,
    required this.deskripsiSlki,
    required this.deskripsiSiki,
  });

  factory HasilAsuhanKeperawatanModel.fromJson(Map<String, dynamic> json) =>
      HasilAsuhanKeperawatanModel(
        tanggal: json["tanggal"].toString(),
        insertDttm: json["insert_dttm"].toString(),
        perawat: Perawat.fromJson(json["perawat"]),
        bagian: Bagian.fromJson(json["bagian"]),
        hasil: json["hasil"].toString(),
        kodeDiagnosa: json["kode_diagnosa"].toString(),
        noDaskep: json["no_daskep"].toString(),
        diagnosa: Diagnosa.fromJson(json["diagnosa"]),
        deskripsiSlki: List<DeskripsiSlki>.from(
            json["deskripsi_slki"].map((x) => DeskripsiSlki.fromJson(x))),
        deskripsiSiki: List<DeskripsiSiki>.from(
            json["deskripsi_siki"].map((x) => DeskripsiSiki.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "hasil": hasil,
        "kode_diagnosa": kodeDiagnosa,
        "no_daskep": noDaskep,
        "diagnosa": diagnosa.toJson(),
        "deskripsi_slki":
            List<dynamic>.from(deskripsiSlki.map((x) => x.toJson())),
        "deskripsi_siki":
            List<dynamic>.from(deskripsiSiki.map((x) => x.toJson())),
      };

  HasilAsuhanKeperawatanModel copyWith({
    String? hasil,
    String? tanggal,
    String? insertDttm,
    String? kodeDiagnosa,
    String? noDaskep,
    Diagnosa? diagnosa,
    Bagian? bagian,
    Perawat? perawat,
    List<DeskripsiSlki>? deskripsiSlki,
    List<DeskripsiSiki>? deskripsiSiki,
  }) {
    return HasilAsuhanKeperawatanModel(
      insertDttm: insertDttm ?? this.insertDttm,
      tanggal: tanggal ?? this.tanggal,
      bagian: bagian ?? this.bagian,
      perawat: perawat ?? this.perawat,
      hasil: hasil ?? this.hasil,
      kodeDiagnosa: kodeDiagnosa ?? this.kodeDiagnosa,
      noDaskep: noDaskep ?? this.noDaskep,
      diagnosa: diagnosa ?? this.diagnosa,
      deskripsiSlki: deskripsiSlki ?? this.deskripsiSlki,
      deskripsiSiki: deskripsiSiki ?? this.deskripsiSiki,
    );
  }
}

class Perawat {
  String idPerawat;
  String nama;
  String alamat;
  String jenisKelamin;
  String status;

  Perawat({
    required this.idPerawat,
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
    required this.status,
  });

  factory Perawat.fromJson(Map<String, dynamic> json) => Perawat(
        idPerawat: json["id_perawat"].toString(),
        nama: json["nama"].toString(),
        alamat: json["alamat"].toString(),
        jenisKelamin: json["jenis_kelamin"].toString(),
        status: json["status"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id_perawat": idPerawat,
        "nama": nama,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "status": status,
      };
}

class DeskripsiSiki {
  String insertDttm;
  String noDaskep;
  int idSiki;
  String kodeSiki;
  String namaSiki;
  String kategori;
  int noUrut;

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
        insertDttm: json["insert_dttm"].toString(),
        noDaskep: json["no_daskep"].toString(),
        idSiki: json["id_siki"] as int,
        kodeSiki: json["kode_siki"].toString(),
        namaSiki: json["nama_siki"].toString(),
        kategori: json["kategori"].toString(),
        noUrut: json["no_urut"] as int,
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm,
        "no_daskep": noDaskep,
        "id_siki": idSiki,
        "kode_siki": kodeSiki,
        "nama_siki": namaSiki,
        "kategori": kategori,
        "no_urut": noUrut,
      };
}

class DeskripsiSlki {
  DateTime insertDttm;
  String noDaskep;
  int idKriteria;
  String kodeSlki;
  String namaSllki;
  String kategori;
  int noUrut;
  int hasil;
  int target;
  int waktu;

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
        insertDttm: DateTime.parse(json["insert_dttm"]),
        noDaskep: json["no_daskep"],
        idKriteria: json["id_kriteria"],
        kodeSlki: json["kode_slki"],
        namaSllki: json["nama_sllki"],
        kategori: json["kategori"],
        noUrut: json["no_urut"],
        hasil: json["hasil"] as int,
        target: json["target"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "insert_dttm": insertDttm.toIso8601String(),
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

  DeskripsiSlki copyWith({
    DateTime? insertDttm,
    String? noDaskep,
    int? idKriteria,
    String? kodeSlki,
    String? namaSllki,
    String? kategori,
    int? noUrut,
    int? hasil,
    int? target,
    int? waktu,
  }) {
    return DeskripsiSlki(
      insertDttm: insertDttm ?? this.insertDttm,
      noDaskep: noDaskep ?? this.noDaskep,
      idKriteria: idKriteria ?? this.idKriteria,
      kodeSlki: kodeSlki ?? this.kodeSlki,
      namaSllki: namaSllki ?? this.namaSllki,
      kategori: kategori ?? this.kategori,
      noUrut: noUrut ?? this.noUrut,
      hasil: hasil ?? this.hasil,
      target: target ?? this.target,
      waktu: waktu ?? this.waktu,
    );
  }
}

class Diagnosa {
  String kode;
  String judul;
  String defenisi;
  String subjectif;
  String objectif;
  String problem;
  String etiologi;
  String etiologiFisiologis;
  String etiologiSituasional;
  String faktorResiko;
  String gejalaMayorSubjektif;
  String gejalaMayorObjectif;
  String gejalanMinorObjectif;
  String kondisiKlinisTerkait;
  String mappingSlki;
  String mappingSiki;

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

class Bagian {
  String kdBag;
  String bagian;
  String pelayanan;

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
