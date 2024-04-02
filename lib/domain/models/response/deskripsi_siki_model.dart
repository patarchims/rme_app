// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeskripsisSikiModel {
  final String judul;
  final String kode;
  final List<Deskripsi> deskripsi;

  DeskripsisSikiModel({
    required this.judul,
    required this.kode,
    required this.deskripsi,
  });

  factory DeskripsisSikiModel.fromJson(Map<String, dynamic> json) =>
      DeskripsisSikiModel(
        judul: json["judul"],
        kode: json["kode"],
        deskripsi: List<Deskripsi>.from(
            json["deskripsi"].map((x) => Deskripsi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "kode": kode,
        "deskripsi": List<dynamic>.from(deskripsi.map((x) => x.toJson())),
      };
}

class Deskripsi {
  final int id;
  final int noUrut;
  final String kodeSiki;
  final String deskripsi;
  final String kategori;
  final bool selected;

  Deskripsi({
    required this.id,
    required this.noUrut,
    required this.kodeSiki,
    required this.deskripsi,
    required this.kategori,
    required this.selected,
  });

  factory Deskripsi.fromJson(Map<String, dynamic> json) => Deskripsi(
      id: json["id"],
      noUrut: json["no_urut"],
      kodeSiki: json["kode_siki"],
      deskripsi: json["deskripsi"],
      kategori: json["kategori"],
      selected: false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_urut": noUrut,
        "kode_siki": kodeSiki,
        "deskripsi": deskripsi,
        "kategori": kategori,
      };

  Deskripsi copyWith({
    int? id,
    int? noUrut,
    String? kodeSiki,
    String? deskripsi,
    String? kategori,
    bool? selected,
  }) {
    return Deskripsi(
      id: id ?? this.id,
      noUrut: noUrut ?? this.noUrut,
      kodeSiki: kodeSiki ?? this.kodeSiki,
      deskripsi: deskripsi ?? this.deskripsi,
      kategori: kategori ?? this.kategori,
      selected: selected ?? this.selected,
    );
  }
}
