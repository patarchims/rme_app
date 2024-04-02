// ignore_for_file: public_member_api_docs, sort_constructors_first
class PenunjangMedikModel {
  String asalPelayanan;
  String penmed;
  String uraian;
  String hasil;
  String catatan;
  String kodePenunjang;
  KdPelayanan kdPelayanan;

  PenunjangMedikModel({
    required this.asalPelayanan,
    required this.penmed,
    required this.kodePenunjang,
    required this.kdPelayanan,
    required this.uraian,
    required this.hasil,
    required this.catatan,
  });

  factory PenunjangMedikModel.fromJson(Map<String, dynamic> json) =>
      PenunjangMedikModel(
        asalPelayanan: json["asal_pelayanan"].toString(),
        penmed: json["penmed"].toString(),
        uraian: json["uraian"].toString(),
        catatan: json["catatan"].toString(),
        hasil: json["hasil"].toString(),
        kodePenunjang: json["kode_penunjang"].toString(),
        kdPelayanan: KdPelayanan.fromJson(json["kd_pelayanan"]),
      );

  Map<String, dynamic> toJson() => {
        "asal_pelayanan": asalPelayanan,
        "penmed": penmed,
        "uraian": uraian,
        "catatan": catatan,
        "hasil": hasil,
        "kode_penunjang": kodePenunjang,
        "kd_pelayanan": kdPelayanan.toJson(),
      };
}

class KdPelayanan {
  String kdBagian;
  String bagian;
  String pelayanan;

  KdPelayanan({
    required this.kdBagian,
    required this.bagian,
    required this.pelayanan,
  });

  factory KdPelayanan.fromJson(Map<String, dynamic> json) => KdPelayanan(
        kdBagian: json["kd_bagian"].toString(),
        bagian: json["bagian"].toString(),
        pelayanan: json["pelayanan"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kd_bagian": kdBagian,
        "bagian": bagian,
        "pelayanan": pelayanan,
      };
}
