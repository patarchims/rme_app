class AsesmenKeluhanIgdModel {
  String info;
  String infoDetail;
  String caraMasuk;
  String caraMasukDetail;
  String asalMasuk;
  String asalMasukDetail;
  String beratBedan;
  String tinggiBadan;
  String riwayatPenyakit;
  String riwayatObat;
  String fungsional;
  String resikoJatuh1;
  String resikoJatuh2;
  String hasilKaji;

  AsesmenKeluhanIgdModel({
    required this.info,
    required this.infoDetail,
    required this.caraMasuk,
    required this.caraMasukDetail,
    required this.asalMasuk,
    required this.asalMasukDetail,
    required this.beratBedan,
    required this.tinggiBadan,
    required this.riwayatPenyakit,
    required this.riwayatObat,
    required this.fungsional,
    required this.resikoJatuh1,
    required this.resikoJatuh2,
    required this.hasilKaji,
  });

  factory AsesmenKeluhanIgdModel.fromJson(Map<String, dynamic> json) =>
      AsesmenKeluhanIgdModel(
        info: json["info"],
        infoDetail: json["info_detail"],
        caraMasuk: json["cara_masuk"],
        caraMasukDetail: json["cara_masuk_detail"],
        asalMasuk: json["asal_masuk"],
        asalMasukDetail: json["asal_masuk_detail"],
        beratBedan: json["berat_badan"],
        tinggiBadan: json["tinggi_badan"],
        riwayatPenyakit: json["riwayat_penyakit"],
        riwayatObat: json["riwayat_obat"],
        fungsional: json["fungsional"],
        resikoJatuh1: json["resiko_jatuh1"],
        resikoJatuh2: json["resiko_jatuh2"],
        hasilKaji: json["hasil_kaji"],
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
        "info": info,
        "info_detail": infoDetail,
        "cara_masuk": caraMasuk,
        "cara_masuk_detail": caraMasukDetail,
        "asal_masuk": asalMasuk,
        "asal_masuk_detail": asalMasukDetail,
        "berat_badan": beratBedan,
        "tinggi_badan": tinggiBadan,
        "riwayat_penyakit": riwayatPenyakit,
        "riwayat_obat": riwayatObat,
        "fungsional": fungsional,
        "resiko_jatuh1": resikoJatuh1,
        "resiko_jatuh2": resikoJatuh2,
        "hasil_kaji": hasilKaji,
      };

  AsesmenKeluhanIgdModel copyWith({
    String? info,
    String? infoDetail,
    String? caraMasuk,
    String? caraMasukDetail,
    String? asalMasuk,
    String? asalMasukDetail,
    String? beratBedan,
    String? tinggiBadan,
    String? riwayatPenyakit,
    String? riwayatObat,
    String? fungsional,
    String? resikoJatuh1,
    String? resikoJatuh2,
    String? hasilKaji,
  }) {
    return AsesmenKeluhanIgdModel(
      info: info ?? this.info,
      infoDetail: infoDetail ?? this.infoDetail,
      caraMasuk: caraMasuk ?? this.caraMasuk,
      caraMasukDetail: caraMasukDetail ?? this.caraMasukDetail,
      asalMasuk: asalMasuk ?? this.asalMasuk,
      asalMasukDetail: asalMasukDetail ?? this.asalMasukDetail,
      beratBedan: beratBedan ?? this.beratBedan,
      tinggiBadan: tinggiBadan ?? this.tinggiBadan,
      riwayatPenyakit: riwayatPenyakit ?? this.riwayatPenyakit,
      riwayatObat: riwayatObat ?? this.riwayatObat,
      fungsional: fungsional ?? this.fungsional,
      resikoJatuh1: resikoJatuh1 ?? this.resikoJatuh1,
      resikoJatuh2: resikoJatuh2 ?? this.resikoJatuh2,
      hasilKaji: hasilKaji ?? this.hasilKaji,
    );
  }
}
