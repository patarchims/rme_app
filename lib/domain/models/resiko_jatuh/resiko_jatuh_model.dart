class IntervensiModel {
  int number;
  String title;
  List<SubIntervensi> subIntervensi;
  IntervensiModel({
    required this.number,
    required this.title,
    required this.subIntervensi,
  });
}

class SubIntervensi {
  int number;
  String subTitle;
  bool isEnable;
  SubIntervensi({
    required this.number,
    required this.subTitle,
    required this.isEnable,
  });

  SubIntervensi copyWith({
    int? number,
    String? subTitle,
    bool? isEnable,
  }) {
    return SubIntervensi(
      number: number ?? this.number,
      subTitle: subTitle ?? this.subTitle,
      isEnable: isEnable ?? this.isEnable,
    );
  }
}

List<IntervensiModel> intervensi = [
  IntervensiModel(number: 1, title: "Risiko Rendah", subIntervensi: [
    SubIntervensi(
      isEnable: false,
      number: 1,
      subTitle: "Pastikan bel, peralatan pribadi mudah dijangkau",
    ),
    SubIntervensi(
      isEnable: false,
      number: 2,
      subTitle: "Pastikan posisi tempat tidur pada posisi terndah dan terkunci",
    ),
    SubIntervensi(
      isEnable: false,
      number: 3,
      subTitle: "Pasang pagar tempat tidur/Brankard",
    ),
    SubIntervensi(
      isEnable: false,
      number: 4,
      subTitle:
          "Pasang busa penyanggah pagar tempat tidur pada pasien anak-anak",
    ),
    SubIntervensi(
      isEnable: false,
      number: 5,
      subTitle:
          "Orientasikan pasien/penunggu tentang lingkungan/ruangan sekitar",
    ),
    SubIntervensi(
      isEnable: false,
      number: 6,
      subTitle: "Anjurankan pasien menggunakan alas kaki anti slip/tidak licin",
    ),
    SubIntervensi(
      isEnable: false,
      number: 7,
      subTitle:
          "Edukasi pasien toileting dan edukasi perilaku pencegahan jatuh",
    ),
  ]),
  IntervensiModel(number: 1, title: "Risiko sedang dan tinggi", subIntervensi: [
    SubIntervensi(
      isEnable: false,
      number: 8,
      subTitle:
          "Pasang tanda resiko jatuh (tempel stiker kuning) pada gelang identitas pasien",
    ),
    SubIntervensi(
      isEnable: false,
      number: 9,
      subTitle:
          "Pasang tanda risiko jatuh pada tempat tidur bagian kaki pasien (segitiga kuning/segitiga merah)",
    ),
    SubIntervensi(
      isEnable: false,
      number: 10,
      subTitle: "Beri tanda riisiko jatuh pada pintu kamar pasien (RT) ",
    ),
    SubIntervensi(
      isEnable: false,
      number: 11,
      subTitle:
          "Libatkan Keluarga dengan edukasi lebih ketat tentang pencegahan jatuh",
    ),
    SubIntervensi(
      isEnable: false,
      number: 12,
      subTitle: "Tingkatkan Observasi / bantuan saat abulansi",
    ),
    SubIntervensi(
      isEnable: false,
      number: 13,
      subTitle: "Intruksikan pasien untuk tidak bangun tanpa pertolongan",
    ),
    SubIntervensi(
      isEnable: false,
      number: 14,
      subTitle: "Dampingi pasien dalam kegiatan ADL",
    ),
    SubIntervensi(
      isEnable: false,
      number: 15,
      subTitle: "Kunjungi dan monitor pasien setiap jam",
    ),
    SubIntervensi(
      isEnable: false,
      number: 16,
      subTitle: "Pasien ditempatkan dekat Nurse Station",
    ),
    SubIntervensi(
      isEnable: false,
      number: 17,
      subTitle: "Lakukan Fiksasi fisik (Restrain) dengan persetujuan keluarga",
    ),
  ])
];
