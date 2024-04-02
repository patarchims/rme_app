// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResikoJatuhPasienModel {
  final String kodeFaktor;
  final String namaFaktor;
  final String kategoriUmur;
  final String jenis;
  final int noUrut;
  final List<ResikoJatuh> resikoJatuh;

  ResikoJatuhPasienModel({
    required this.kodeFaktor,
    required this.namaFaktor,
    required this.kategoriUmur,
    required this.jenis,
    required this.noUrut,
    required this.resikoJatuh,
  });

  factory ResikoJatuhPasienModel.fromJson(Map<String, dynamic> json) =>
      ResikoJatuhPasienModel(
        kodeFaktor: json["kode_faktor"],
        namaFaktor: json["nama_faktor"],
        kategoriUmur: json["kategori_umur"],
        jenis: json["jenis"],
        noUrut: json["no_urut"],
        resikoJatuh: List<ResikoJatuh>.from(
            json["resiko_jatuh"].map((x) => ResikoJatuh.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kode_faktor": kodeFaktor,
        "nama_faktor": namaFaktor,
        "kategori_umur": kategoriUmur,
        "jenis": jenis,
        "no_urut": noUrut,
        "resiko_jatuh": List<dynamic>.from(resikoJatuh.map((x) => x.toJson())),
      };
}

class ResikoJatuh {
  final String kodeResiko;
  final String kodeFaktor;
  final String kategoriFaktor;
  final bool isEnable;
  final int noUrut;
  final int skor;

  ResikoJatuh({
    required this.kodeResiko,
    required this.kodeFaktor,
    required this.kategoriFaktor,
    required this.isEnable,
    required this.noUrut,
    required this.skor,
  });

  factory ResikoJatuh.fromJson(Map<String, dynamic> json) => ResikoJatuh(
        isEnable: false,
        kodeResiko: json["kode_resiko"],
        kodeFaktor: json["kode_faktor"],
        kategoriFaktor: json["kategori_faktor"],
        noUrut: json["no_urut"],
        skor: json["skor"],
      );

  Map<String, dynamic> toJson() => {
        "is_enable": isEnable,
        "kode_resiko": kodeResiko,
        "kode_faktor": kodeFaktor,
        "kategori_faktor": kategoriFaktor,
        "no_urut": noUrut,
        "skor": skor,
      };

  ResikoJatuh copyWith({
    String? kodeResiko,
    String? kodeFaktor,
    String? kategoriFaktor,
    bool? isEnable,
    int? noUrut,
    int? skor,
  }) {
    return ResikoJatuh(
      kodeResiko: kodeResiko ?? this.kodeResiko,
      kodeFaktor: kodeFaktor ?? this.kodeFaktor,
      kategoriFaktor: kategoriFaktor ?? this.kategoriFaktor,
      isEnable: isEnable ?? this.isEnable,
      noUrut: noUrut ?? this.noUrut,
      skor: skor ?? this.skor,
    );
  }
}

// LIST RESIKO JATUH PASIEN DEWASA
List<ResikoJatuhPasienModel> resikoJatuhPasien = [
  ResikoJatuhPasienModel(
      kodeFaktor: "FA016",
      namaFaktor: "Risiko Rendah",
      kategoriUmur: "Dewasa",
      jenis: "Intervensi",
      noUrut: 1,
      resikoJatuh: [
        ResikoJatuh(
            kodeResiko: "RE029",
            kodeFaktor: "FA016",
            kategoriFaktor: "Pastikan bel, peralatan pribadi mudah dijangkau",
            isEnable: false,
            noUrut: 1,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE030",
            kodeFaktor: "FA016",
            kategoriFaktor:
                "Pastikan posisi tempat tidur pada poisisi terendah dan terkunci",
            isEnable: false,
            noUrut: 2,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE031",
            kodeFaktor: "FA016",
            kategoriFaktor: "Pasang pagar  tempat tidur /Brakard",
            isEnable: false,
            noUrut: 3,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE031",
            kodeFaktor: "FA016",
            kategoriFaktor:
                "Orientasi pasien / penunggu tentang lingkungan/ruang sekitar",
            isEnable: false,
            noUrut: 4,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE045",
            kodeFaktor: "FA016",
            kategoriFaktor:
                "Pasang busa penyanggah pagar tempat tidur pada pasien anak-anak",
            isEnable: false,
            noUrut: 5,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE033",
            kodeFaktor: "FA016",
            kategoriFaktor:
                "Anjurkan pasien menggunakan alas kaki anti selip/tidak licin",
            isEnable: false,
            noUrut: 6,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE034",
            kodeFaktor: "FA016",
            kategoriFaktor:
                "Edukasi pasien toileting dan edukasi perilaku pencegahan jatuh",
            isEnable: false,
            noUrut: 7,
            skor: 0),
      ]),
  ResikoJatuhPasienModel(
      kodeFaktor: "FA017",
      namaFaktor: "Risiko sedang dan tinggi",
      kategoriUmur: "Dewasa",
      jenis: "Intervensi",
      noUrut: 1,
      resikoJatuh: [
        ResikoJatuh(
            kodeResiko: "RE035",
            kodeFaktor: "FA017",
            kategoriFaktor:
                "Pasang tanda resiko jatuh (tempel striker kuning) pada gelang identitas pasien",
            isEnable: false,
            noUrut: 8,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE036",
            kodeFaktor: "FA017",
            kategoriFaktor:
                "Pasang tanda risiko jatuh pada tempat tidur bagian kaki pasien (segitiga kuning/segitiga",
            isEnable: false,
            noUrut: 9,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE037",
            kodeFaktor: "FA017",
            kategoriFaktor:
                "Beri tanda resiko jatuh pada pintu kamar pasien ( RT )",
            isEnable: false,
            noUrut: 10,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE038",
            kodeFaktor: "FA017",
            kategoriFaktor:
                "Libatkan keluarga dengan edukasi lebih ketat tentang pencegahan jatuh",
            isEnable: false,
            noUrut: 11,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE039",
            kodeFaktor: "FA017",
            kategoriFaktor: "Tingkatkan observasi/bantuan saat ambulansi",
            isEnable: false,
            noUrut: 12,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE040",
            kodeFaktor: "FA017",
            kategoriFaktor:
                "Instruksikan pasien untuk tidak bangun tanpa pertolongan",
            isEnable: false,
            noUrut: 13,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE034",
            kodeFaktor: "FA016",
            kategoriFaktor: "Dampingi pasien dalam kegiatan ADL",
            isEnable: false,
            noUrut: 14,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE034",
            kodeFaktor: "FA016",
            kategoriFaktor: "Kunjungi dan monitor pasien setiap jam",
            isEnable: false,
            noUrut: 15,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE034",
            kodeFaktor: "FA016",
            kategoriFaktor: "Pasien ditempatkan dekat Nurse Station",
            isEnable: false,
            noUrut: 16,
            skor: 0),
        ResikoJatuh(
            kodeResiko: "RE034",
            kodeFaktor: "FA016",
            kategoriFaktor:
                "Lakukan Fiksasi fisik (Restrain) dengan persetujuan keluarga",
            isEnable: false,
            noUrut: 17,
            skor: 0),
      ]),
];
