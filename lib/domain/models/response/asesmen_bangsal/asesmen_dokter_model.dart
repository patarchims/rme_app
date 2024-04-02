class AsesmenDokterModel {
  String jenpel;
  String keluhanUtama;
  String keluhanTambahan;
  String telaah;
  String masalahMedis;
  String riwayatSekarang;
  String riwayatDulu;
  String riwayatObat;
  String riwayatKeluarga;
  String riwayatAlergi;
  String riwayatDetail;
  String anamnesa;

  AsesmenDokterModel({
    required this.jenpel,
    required this.keluhanUtama,
    required this.keluhanTambahan,
    required this.telaah,
    required this.masalahMedis,
    required this.riwayatSekarang,
    required this.riwayatDulu,
    required this.riwayatObat,
    required this.riwayatKeluarga,
    required this.riwayatAlergi,
    required this.riwayatDetail,
    required this.anamnesa,
  });

  factory AsesmenDokterModel.fromJson(Map<String, dynamic> json) =>
      AsesmenDokterModel(
        jenpel: json["jenpel"].toString(),
        keluhanUtama: json["keluhan_utama"].toString(),
        keluhanTambahan: json["keluhan_tambahan"].toString(),
        telaah: json["telaah"].toString(),
        masalahMedis: json["masalah_medis"].toString(),
        riwayatSekarang: json["riwayat_sekarang"].toString(),
        riwayatDulu: json["riwayat_dulu"].toString(),
        riwayatObat: json["riwayat_obat"].toString(),
        riwayatKeluarga: json["riwayat_keluarga"].toString(),
        riwayatAlergi: json["riwayat_alergi"].toString(),
        riwayatDetail: json["riwayat_detail"].toString(),
        anamnesa: json["anamnesa"].toString(),
      );

  Map<String, dynamic> toJson({
    required String deviceID,
    required String pelayanan,
    required String noReg,
    required String person,
  }) =>
      {
        "device_id": deviceID,
        "pelayanan": pelayanan,
        "noreg": noReg,
        "person": person,
        "jenpel": jenpel,
        "keluhan_tambahan": keluhanTambahan,
        "keluhan_utama": keluhanUtama,
        "telaah": telaah,
        "masalah_medis": masalahMedis,
        "riwayat_sekarang": riwayatSekarang,
        "riwayat_dulu": riwayatDulu,
        "riwayat_obat": riwayatObat,
        "riwayat_keluarga": riwayatKeluarga,
        "riwayat_alergi": riwayatAlergi,
        "riwayat_detail": riwayatDetail,
        "anamnesa": anamnesa,
      };

  AsesmenDokterModel copyWith({
    String? jenpel,
    String? keluhanUtama,
    String? telaah,
    String? masalahMedis,
    String? riwayatSekarang,
    String? riwayatDulu,
    String? riwayatObat,
    String? riwayatKeluarga,
    String? riwayatAlergi,
    String? riwayatDetail,
    String? anamnesa,
    String? keluhanTambahan,
  }) {
    return AsesmenDokterModel(
      keluhanTambahan: keluhanTambahan ?? this.keluhanTambahan,
      jenpel: jenpel ?? this.jenpel,
      keluhanUtama: keluhanUtama ?? this.keluhanUtama,
      telaah: telaah ?? this.telaah,
      masalahMedis: masalahMedis ?? this.masalahMedis,
      riwayatSekarang: riwayatSekarang ?? this.riwayatSekarang,
      riwayatDulu: riwayatDulu ?? this.riwayatDulu,
      riwayatObat: riwayatObat ?? this.riwayatObat,
      riwayatKeluarga: riwayatKeluarga ?? this.riwayatKeluarga,
      riwayatAlergi: riwayatAlergi ?? this.riwayatAlergi,
      riwayatDetail: riwayatDetail ?? this.riwayatDetail,
      anamnesa: anamnesa ?? this.anamnesa,
    );
  }
}
