// ignore_for_file: public_member_api_docs, sort_constructors_first
class AsesmenKebidananModel {
  final String gravida;
  final String abortus;
  final String para;
  final String haid;
  final String haidTerakhir;
  final String usiaKehamilan;
  final String partusHpl;
  final String leopold1;
  final String leopold2;
  final String leopold3;
  final String leopold4;
  final String hodge;
  final String inspeksi;
  final String inspekuloV;
  final String inspekuloP;
  final String pemeriksaanDalam;
  final String hamilMuda;
  final String hamilTua;
  final String tbj;
  final String tfu;
  final String nyeriTekan;
  final String palpasi;

  AsesmenKebidananModel({
    required this.gravida,
    required this.palpasi,
    required this.abortus,
    required this.para,
    required this.haid,
    required this.haidTerakhir,
    required this.usiaKehamilan,
    required this.partusHpl,
    required this.leopold1,
    required this.leopold2,
    required this.leopold3,
    required this.leopold4,
    required this.hodge,
    required this.inspeksi,
    required this.inspekuloV,
    required this.inspekuloP,
    required this.pemeriksaanDalam,
    required this.hamilMuda,
    required this.hamilTua,
    required this.tbj,
    required this.tfu,
    required this.nyeriTekan,
  });

  factory AsesmenKebidananModel.fromJson(Map<String, dynamic> json) =>
      AsesmenKebidananModel(
        palpasi: json["palpasi"],
        nyeriTekan: json["nyeri_tekan"],
        tbj: json["tbj"],
        tfu: json["tfu"],
        hamilMuda: json["hamil_muda"],
        hamilTua: json["hamil_tua"],
        gravida: json["gravida"],
        abortus: json["abortus"],
        para: json["para"],
        haid: json["haid"],
        haidTerakhir: json["haid_terakhir"],
        usiaKehamilan: json["usia_kehamilan"],
        partusHpl: json["partus_hpl"],
        leopold1: json["leopold1"],
        leopold2: json["leopold2"],
        leopold3: json["leopold3"],
        leopold4: json["leopold4"],
        hodge: json["hodge"],
        inspeksi: json["inspeksi"],
        inspekuloV: json["inspekulo_v"],
        inspekuloP: json["inspekulo_p"],
        pemeriksaanDalam: json["pemeriksaan_dalam"],
      );

  Map<String, dynamic> toJson() => {
        "gravida": gravida,
        "abortus": abortus,
        "para": para,
        "haid": haid,
        "haid_terakhir": haidTerakhir,
        "usia_kehamilan": usiaKehamilan,
        "partus_hpl": partusHpl,
        "leopold1": leopold1,
        "leopold2": leopold2,
        "leopold3": leopold3,
        "leopold4": leopold4,
        "hodge": hodge,
        "inspeksi": inspeksi,
        "inspekulo_v": inspekuloV,
        "inspekulo_p": inspekuloP,
        "pemeriksaan_dalam": pemeriksaanDalam,
      };

  AsesmenKebidananModel copyWith({
    String? gravida,
    String? abortus,
    String? para,
    String? haid,
    String? haidTerakhir,
    String? usiaKehamilan,
    String? partusHpl,
    String? leopold1,
    String? leopold2,
    String? leopold3,
    String? leopold4,
    String? hodge,
    String? inspeksi,
    String? inspekuloV,
    String? inspekuloP,
    String? pemeriksaanDalam,
    String? hamilMuda,
    String? hamilTua,
    String? tbj,
    String? tfu,
    String? nyeriTekan,
    String? palpasi,
  }) {
    return AsesmenKebidananModel(
      palpasi: palpasi ?? this.palpasi,
      nyeriTekan: nyeriTekan ?? this.nyeriTekan,
      tbj: tbj ?? this.tbj,
      tfu: tfu ?? this.tfu,
      gravida: gravida ?? this.gravida,
      abortus: abortus ?? this.abortus,
      para: para ?? this.para,
      haid: haid ?? this.haid,
      haidTerakhir: haidTerakhir ?? this.haidTerakhir,
      usiaKehamilan: usiaKehamilan ?? this.usiaKehamilan,
      partusHpl: partusHpl ?? this.partusHpl,
      leopold1: leopold1 ?? this.leopold1,
      leopold2: leopold2 ?? this.leopold2,
      leopold3: leopold3 ?? this.leopold3,
      leopold4: leopold4 ?? this.leopold4,
      hodge: hodge ?? this.hodge,
      inspeksi: inspeksi ?? this.inspeksi,
      inspekuloV: inspekuloV ?? this.inspekuloV,
      inspekuloP: inspekuloP ?? this.inspekuloP,
      pemeriksaanDalam: pemeriksaanDalam ?? this.pemeriksaanDalam,
      hamilMuda: hamilMuda ?? this.hamilMuda,
      hamilTua: hamilTua ?? this.hamilTua,
    );
  }
}
