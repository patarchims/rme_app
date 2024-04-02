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

  AsesmenKebidananModel({
    required this.gravida,
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
  });

  factory AsesmenKebidananModel.fromJson(Map<String, dynamic> json) =>
      AsesmenKebidananModel(
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
}
