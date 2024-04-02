// ignore_for_file: public_member_api_docs, sort_constructors_first
class KTaripObatModel {
  String kodeObat;
  String namaObat;
  String satuan;
  double saldo;
  double aso;
  String principal;
  String komposisi;
  int jumlah;
  int jumlahRacikan;
  String dosis;
  String aturan;
  String prescriptio;
  String flag;

  KTaripObatModel({
    required this.kodeObat,
    required this.namaObat,
    required this.satuan,
    required this.saldo,
    required this.aso,
    required this.principal,
    required this.komposisi,
    required this.jumlah,
    required this.jumlahRacikan,
    required this.dosis,
    required this.aturan,
    required this.prescriptio,
    required this.flag,
  });

  factory KTaripObatModel.fromJson(Map<String, dynamic> json) =>
      KTaripObatModel(
        kodeObat: json["kode_obat"].toString(),
        namaObat: json["nama_obat"].toString(),
        satuan: json["satuan"].toString(),
        saldo: double.parse(json["saldo"].toString()),
        aso: double.parse(json["aso"].toString()),
        principal: json["principal"].toString(),
        komposisi: json["komposisi"].toString(),
        jumlah: json["jumlah"],
        jumlahRacikan: json["jumlah_racikan"],
        dosis: json["dosis"].toString(),
        aturan: json["aturan"].toString(),
        prescriptio: json["prescriptio"].toString(),
        flag: json["flag"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kode_obat": kodeObat,
        "nama_obat": namaObat,
        "satuan": satuan,
        "saldo": saldo,
        "aso": aso,
        "principal": principal,
        "komposisi": komposisi,
        "jumlah": jumlah,
        "dosis": dosis,
        "aturan": aturan,
        "prescriptio": prescriptio,
        "jumlah_racikan": jumlah,
        "flag": flag,
      };

  KTaripObatModel copyWith(
      {String? kodeObat,
      String? namaObat,
      String? satuan,
      double? saldo,
      double? aso,
      String? principal,
      String? komposisi,
      int? jumlah,
      String? dosis,
      String? aturan,
      String? prescriptio,
      String? flag,
      int? jumlahRacikan}) {
    return KTaripObatModel(
      jumlahRacikan: jumlahRacikan ?? this.jumlahRacikan,
      kodeObat: kodeObat ?? this.kodeObat,
      namaObat: namaObat ?? this.namaObat,
      satuan: satuan ?? this.satuan,
      saldo: saldo ?? this.saldo,
      aso: aso ?? this.aso,
      principal: principal ?? this.principal,
      komposisi: komposisi ?? this.komposisi,
      jumlah: jumlah ?? this.jumlah,
      dosis: dosis ?? this.dosis,
      aturan: aturan ?? this.aturan,
      prescriptio: prescriptio ?? this.prescriptio,
      flag: flag ?? this.flag,
    );
  }
}
