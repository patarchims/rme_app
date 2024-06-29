class HistoryResepObatModel {
  final String jenisResep;
  final String catatan;
  final String signa;
  final String nomor;
  final String kdDokter;
  final String nmDokter;
  final String bagian;
  final String tglInput;
  final String id;
  final String noreg;
  final String kodeObat;
  final String namaObat;
  final String satuan;
  final String jumlah;
  final String dosis;
  final String cara;
  final String racik;
  final String alergi;

  HistoryResepObatModel({
    required this.jenisResep,
    required this.catatan,
    required this.signa,
    required this.nomor,
    required this.kdDokter,
    required this.nmDokter,
    required this.bagian,
    required this.tglInput,
    required this.id,
    required this.noreg,
    required this.kodeObat,
    required this.namaObat,
    required this.satuan,
    required this.jumlah,
    required this.dosis,
    required this.cara,
    required this.racik,
    required this.alergi,
  });

  HistoryResepObatModel copyWith({
    String? jenisResep,
    String? catatan,
    String? signa,
    String? nomor,
    String? kdDokter,
    String? nmDokter,
    String? bagian,
    String? tglInput,
    String? id,
    String? noreg,
    String? kodeObat,
    String? namaObat,
    String? satuan,
    String? jumlah,
    String? dosis,
    String? cara,
    String? racik,
    String? alergi,
  }) =>
      HistoryResepObatModel(
        jenisResep: jenisResep ?? this.jenisResep,
        catatan: catatan ?? this.catatan,
        signa: signa ?? this.signa,
        nomor: nomor ?? this.nomor,
        kdDokter: kdDokter ?? this.kdDokter,
        nmDokter: nmDokter ?? this.nmDokter,
        bagian: bagian ?? this.bagian,
        tglInput: tglInput ?? this.tglInput,
        id: id ?? this.id,
        noreg: noreg ?? this.noreg,
        kodeObat: kodeObat ?? this.kodeObat,
        namaObat: namaObat ?? this.namaObat,
        satuan: satuan ?? this.satuan,
        jumlah: jumlah ?? this.jumlah,
        dosis: dosis ?? this.dosis,
        cara: cara ?? this.cara,
        racik: racik ?? this.racik,
        alergi: alergi ?? this.alergi,
      );

  factory HistoryResepObatModel.fromJson(Map<String, dynamic> json) =>
      HistoryResepObatModel(
        jenisResep: json["jenis_resep"].toString(),
        catatan: json["catatan"].toString(),
        signa: json["signa"].toString(),
        nomor: json["nomor"].toString(),
        kdDokter: json["kd_dokter"].toString(),
        nmDokter: json["nm_dokter"].toString(),
        bagian: json["bagian"].toString(),
        tglInput: json["tgl_input"].toString(),
        id: json["id"].toString(),
        noreg: json["noreg"].toString(),
        kodeObat: json["kode_obat"].toString(),
        namaObat: json["nama_obat"].toString(),
        satuan: json["satuan"].toString(),
        jumlah: json["jumlah"].toString(),
        dosis: json["dosis"].toString(),
        cara: json["cara"].toString(),
        racik: json["racik"].toString(),
        alergi: json["alergi"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "jenis_resep": jenisResep,
        "catatan": catatan,
        "signa": signa,
        "nomor": nomor,
        "kd_dokter": kdDokter,
        "nm_dokter": nmDokter,
        "bagian": bagian,
        "tgl_input": tglInput,
        "id": id,
        "noreg": noreg,
        "kode_obat": kodeObat,
        "nama_obat": namaObat,
        "satuan": satuan,
        "jumlah": jumlah,
        "dosis": dosis,
        "cara": cara,
        "racik": racik,
        "alergi": alergi,
      };
}
