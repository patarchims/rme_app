class AsesmenAnamnesaModel {
  final String kelUtama;
  final String riwayatSekarang;
  final String penyakitKeluarga;
  final String riwayatAlergi;
  final String riwayatAlergiDetail;
  final String jenisPelayanan;
  final String gigi1;
  final String gigi2;
  final String gigi3;
  final String gigi4;
  final String gigi5;
  final String gigi5Detail;

  AsesmenAnamnesaModel({
    required this.kelUtama,
    required this.riwayatSekarang,
    required this.penyakitKeluarga,
    required this.riwayatAlergi,
    required this.riwayatAlergiDetail,
    required this.jenisPelayanan,
    required this.gigi1,
    required this.gigi2,
    required this.gigi3,
    required this.gigi4,
    required this.gigi5,
    required this.gigi5Detail,
  });

  factory AsesmenAnamnesaModel.fromJson(Map<String, dynamic> json) =>
      AsesmenAnamnesaModel(
        kelUtama: json["kelUtama"].toString(),
        riwayatSekarang: json["riwayatSekarang"].toString(),
        penyakitKeluarga: json["penyakitKeluarga"].toString(),
        riwayatAlergi: json["riwayatAlergi"].toString(),
        riwayatAlergiDetail: json["riwayatAlergiDetail"].toString(),
        jenisPelayanan: json["jenisPelayanan"].toString(),
        gigi1: json["gigi1"].toString(),
        gigi2: json["gigi2"].toString(),
        gigi3: json["gigi3"].toString(),
        gigi4: json["gigi4"].toString(),
        gigi5: json["gigi5"].toString(),
        gigi5Detail: json["gigi5Detail"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "kelUtama": kelUtama,
        "riwayatSekarang": riwayatSekarang,
        "penyakitKeluarga": penyakitKeluarga,
        "riwayatAlergi": riwayatAlergi,
        "riwayatAlergiDetail": riwayatAlergiDetail,
        "jenisPelayanan": jenisPelayanan,
        "gigi1": gigi1,
        "gigi2": gigi2,
        "gigi3": gigi3,
        "gigi4": gigi4,
        "gigi5": gigi5,
        "gigi5Detail": gigi5Detail,
      };

  AsesmenAnamnesaModel copyWith({
    String? kelUtama,
    String? riwayatSekarang,
    String? penyakitKeluarga,
    String? riwayatAlergi,
    String? riwayatAlergiDetail,
    String? jenisPelayanan,
    String? gigi1,
    String? gigi2,
    String? gigi3,
    String? gigi4,
    String? gigi5,
    String? gigi5Detail,
  }) {
    return AsesmenAnamnesaModel(
      kelUtama: kelUtama ?? this.kelUtama,
      riwayatSekarang: riwayatSekarang ?? this.riwayatSekarang,
      penyakitKeluarga: penyakitKeluarga ?? this.penyakitKeluarga,
      riwayatAlergi: riwayatAlergi ?? this.riwayatAlergi,
      riwayatAlergiDetail: riwayatAlergiDetail ?? this.riwayatAlergiDetail,
      jenisPelayanan: jenisPelayanan ?? this.jenisPelayanan,
      gigi1: gigi1 ?? this.gigi1,
      gigi2: gigi2 ?? this.gigi2,
      gigi3: gigi3 ?? this.gigi3,
      gigi4: gigi4 ?? this.gigi4,
      gigi5: gigi5 ?? this.gigi5,
      gigi5Detail: gigi5Detail ?? this.gigi5Detail,
    );
  }
}
