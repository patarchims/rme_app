// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeskripsiSikiModel {
  final String kode;
  final String judul;
  final List<Deskripsi>? observasi;
  final List<Deskripsi>? terapetutik;
  final List<Deskripsi>? edukasi;
  final List<Deskripsi>? kolaborasi;

  DeskripsiSikiModel({
    required this.kode,
    required this.judul,
    required this.observasi,
    required this.terapetutik,
    required this.edukasi,
    required this.kolaborasi,
  });

  factory DeskripsiSikiModel.fromJson(Map<String, dynamic> json) =>
      DeskripsiSikiModel(
        kode: json["kode"],
        judul: json["judul"],
        observasi: (json["observasi"] != null)
            ? List<Deskripsi>.from(
                json["observasi"].map((x) => Deskripsi.fromJson(x)))
            : [],
        terapetutik: (json["terapetutik"] != null)
            ? List<Deskripsi>.from(
                json["terapetutik"].map((x) => Deskripsi.fromJson(x)))
            : [],
        edukasi: (json["edukasi"] != null)
            ? List<Deskripsi>.from(
                json["edukasi"].map((x) => Deskripsi.fromJson(x)))
            : [],
        kolaborasi: (json["kolaborasi"] != null)
            ? List<Deskripsi>.from(
                json["kolaborasi"].map((x) => Deskripsi.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "judul": judul,
        "observasi": List<Deskripsi>.from(observasi!.map((x) => x.toJson())),
        "terapetutik":
            List<Deskripsi>.from(terapetutik!.map((x) => x.toJson())),
        "edukasi": List<Deskripsi>.from(edukasi!.map((x) => x.toJson())),
        "kolaborasi": List<Deskripsi>.from(edukasi!.map((x) => x.toJson())),
      };

  DeskripsiSikiModel copyWith({
    String? kode,
    String? judul,
    List<Deskripsi>? observasi,
    List<Deskripsi>? terapetutik,
    List<Deskripsi>? edukasi,
    List<Deskripsi>? kolaborasi,
  }) {
    return DeskripsiSikiModel(
      kode: kode ?? this.kode,
      judul: judul ?? this.judul,
      observasi: observasi ?? this.observasi,
      terapetutik: terapetutik ?? this.terapetutik,
      edukasi: edukasi ?? this.edukasi,
      kolaborasi: kolaborasi ?? this.kolaborasi,
    );
  }
}

class Deskripsi {
  final int noUrut;
  final String kodeSiki;
  final String deskripsi;
  final bool isSelected;

  Deskripsi({
    required this.noUrut,
    required this.kodeSiki,
    required this.deskripsi,
    required this.isSelected,
  });

  factory Deskripsi.fromJson(Map<String, dynamic> json) => Deskripsi(
        noUrut: json["no_urut"],
        kodeSiki: json["kode_siki"],
        deskripsi: json["deskripsi"],
        isSelected: json["is_selected"],
      );

  Map<String, dynamic> toJson() => {
        "no_urut": noUrut,
        "kode_siki": kodeSiki,
        "deskripsi": deskripsi,
        "is_selected": isSelected,
      };

  Deskripsi copyWith({
    int? noUrut,
    String? kodeSiki,
    String? deskripsi,
    bool? isSelected,
  }) {
    return Deskripsi(
      noUrut: noUrut ?? this.noUrut,
      kodeSiki: kodeSiki ?? this.kodeSiki,
      deskripsi: deskripsi ?? this.deskripsi,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
