// ignore_for_file: public_member_api_docs, sort_constructors_first
class PengkajianNyeriNips {
  String noreg;
  String ekspresiWajah;
  String tangisan;
  String polaNapas;
  String tangan;
  String kaki;
  String kesadaran;
  int total;
  int nyeri;
  String lokasiNyeri;
  String frekuensiNyeri;
  String nyeriMenjalar;
  String kualitasNyeri;

  PengkajianNyeriNips({
    required this.noreg,
    required this.ekspresiWajah,
    required this.tangisan,
    required this.polaNapas,
    required this.tangan,
    required this.kaki,
    required this.kesadaran,
    required this.total,
    required this.nyeri,
    required this.lokasiNyeri,
    required this.frekuensiNyeri,
    required this.nyeriMenjalar,
    required this.kualitasNyeri,
  });

  factory PengkajianNyeriNips.fromJson(Map<String, dynamic> json) =>
      PengkajianNyeriNips(
          nyeri: json["nyeri"] as int,
          noreg: json["noreg"].toString(),
          ekspresiWajah: json["ekspresi_wajah"].toString(),
          tangisan: json["tangisan"].toString(),
          polaNapas: json["pola_napas"].toString(),
          tangan: json["tangan"].toString(),
          kaki: json["kaki"].toString(),
          kesadaran: json["kesadaran"].toString(),
          total: json["total"] as int,
          frekuensiNyeri: json["frekuensi_nyeri"].toString(),
          kualitasNyeri: json["kualitas_nyeri"].toString(),
          nyeriMenjalar: json["nyeri_menjalar"].toString(),
          lokasiNyeri: json["lokasi_nyeri"].toString());

  Map<String, dynamic> toJson() => {
        "noreg": noreg,
        "ekspresi_wajah": ekspresiWajah,
        "tangisan": tangisan,
        "pola_napas": polaNapas,
        "tangan": tangan,
        "kaki": kaki,
        "kesadaran": kesadaran,
        "total": total,
      };

  PengkajianNyeriNips copyWith({
    String? noreg,
    String? ekspresiWajah,
    String? tangisan,
    String? polaNapas,
    String? tangan,
    String? kaki,
    String? kesadaran,
    int? total,
    int? nyeri,
    String? lokasiNyeri,
    String? frekuensiNyeri,
    String? nyeriMenjalar,
    String? kualitasNyeri,
  }) {
    return PengkajianNyeriNips(
      noreg: noreg ?? this.noreg,
      ekspresiWajah: ekspresiWajah ?? this.ekspresiWajah,
      tangisan: tangisan ?? this.tangisan,
      polaNapas: polaNapas ?? this.polaNapas,
      tangan: tangan ?? this.tangan,
      kaki: kaki ?? this.kaki,
      kesadaran: kesadaran ?? this.kesadaran,
      total: total ?? this.total,
      nyeri: nyeri ?? this.nyeri,
      lokasiNyeri: lokasiNyeri ?? this.lokasiNyeri,
      frekuensiNyeri: frekuensiNyeri ?? this.frekuensiNyeri,
      nyeriMenjalar: nyeriMenjalar ?? this.nyeriMenjalar,
      kualitasNyeri: kualitasNyeri ?? this.kualitasNyeri,
    );
  }
}
