class AsesmenKeperawatanBidanModel {
  final String kdBagian;
  final String noreg;
  final String info;
  final String caraMasuk;
  final String caraMasukDetail;
  final String asalMasuk;
  final String asalMasukDetail;
  final String bb;
  final String tb;
  final String rwtPenyakit;
  final String obatDetail;
  final String fungsional;
  final String rj1;
  final String rj2;
  final String kajiRj;
  final String kajiRjTindakan;
  final int skalaNyeri;
  final String frekuensiNyeri;
  final String lamaNyeri;
  final String nyeriMenjalar;
  final String menjalarDetail;
  final String kualitasNyeri;
  final String nyeriPemicu;
  final String nyeriPengurang;
  final String kehamilan;
  final String kehamilanGravida;
  final String kehamilanPara;
  final String kehamilanAbortus;
  final String kehamilanHpht;
  final String kehamilanTtp;
  final String kehamilanLeopol1;
  final String kehamilanLeopol2;
  final String kehamilanLeopol3;
  final String kehamilanLeopol4;
  final String kehamilanDjj;
  final String kehamilanVt;
  final String dekubitus1;
  final String dekubitus2;
  final String dekubitus3;
  final String dekubitus4;
  final String dekubitusAnak;
  final String pulangKondisi;
  final String pulangTransportasi;
  final String pendidikan;
  final String pendidikanDetail;

  AsesmenKeperawatanBidanModel({
    required this.kdBagian,
    required this.noreg,
    required this.info,
    required this.caraMasuk,
    required this.caraMasukDetail,
    required this.asalMasuk,
    required this.asalMasukDetail,
    required this.bb,
    required this.tb,
    required this.rwtPenyakit,
    required this.obatDetail,
    required this.fungsional,
    required this.rj1,
    required this.rj2,
    required this.kajiRj,
    required this.kajiRjTindakan,
    required this.skalaNyeri,
    required this.frekuensiNyeri,
    required this.lamaNyeri,
    required this.nyeriMenjalar,
    required this.menjalarDetail,
    required this.kualitasNyeri,
    required this.nyeriPemicu,
    required this.nyeriPengurang,
    required this.kehamilan,
    required this.kehamilanGravida,
    required this.kehamilanPara,
    required this.kehamilanAbortus,
    required this.kehamilanHpht,
    required this.kehamilanTtp,
    required this.kehamilanLeopol1,
    required this.kehamilanLeopol2,
    required this.kehamilanLeopol3,
    required this.kehamilanLeopol4,
    required this.kehamilanDjj,
    required this.kehamilanVt,
    required this.dekubitus1,
    required this.dekubitus2,
    required this.dekubitus3,
    required this.dekubitus4,
    required this.dekubitusAnak,
    required this.pulangKondisi,
    required this.pulangTransportasi,
    required this.pendidikan,
    required this.pendidikanDetail,
  });

  factory AsesmenKeperawatanBidanModel.fromJson(Map<String, dynamic> json) =>
      AsesmenKeperawatanBidanModel(
        kdBagian: json["kdBagian"],
        noreg: json["noreg"],
        info: json["info"],
        caraMasuk: json["cara_masuk"],
        caraMasukDetail: json["cara_masuk_detail"],
        asalMasuk: json["asal_masuk"],
        asalMasukDetail: json["asal_masuk_detail"],
        bb: json["bb"],
        tb: json["tb"],
        // Riwayat Penyakit
        rwtPenyakit: json["rwt_penyakit"],
        obatDetail: json["obat_detail"],
        fungsional: json["fungsional"],
        rj1: json["rj1"],
        rj2: json["rj2"],
        kajiRj: json["kaji_rj"],
        kajiRjTindakan: json["kaji_rj_tindakan"],
        skalaNyeri: json["skala_nyeri"],
        frekuensiNyeri: json["frekuensi_nyeri"],
        lamaNyeri: json["lama_nyeri"],
        nyeriMenjalar: json["nyeri_menjalar"],
        menjalarDetail: json["menjalar_detail"],
        kualitasNyeri: json["kualitas_nyeri"],
        nyeriPemicu: json["nyeri_pemicu"],
        nyeriPengurang: json["nyeri_pengurang"],
        kehamilan: json["kehamilan"],
        kehamilanGravida: json["kehamilan_gravida"],
        kehamilanPara: json["kehamilan_para"],
        kehamilanAbortus: json["kehamilan_abortus"],
        kehamilanHpht: json["kehamilan_hpht"],
        kehamilanTtp: json["kehamilan_ttp"],
        kehamilanLeopol1: json["kehamilan_leopol1"],
        kehamilanLeopol2: json["kehamilan_leopol2"],
        kehamilanLeopol3: json["kehamilan_leopol3"],
        kehamilanLeopol4: json["kehamilan_leopol4"],
        kehamilanDjj: json["kehamilan_djj"],
        kehamilanVt: json["kehamilan_vt"],
        dekubitus1: json["dekubitus1"],
        dekubitus2: json["dekubitus2"],
        dekubitus3: json["dekubitus3"],
        dekubitus4: json["dekubitus4"],
        dekubitusAnak: json["dekubitus_anak"],
        pulangKondisi: json["pulang_kondisi"],
        pulangTransportasi: json["pulang_transportasi"],
        pendidikan: json["pendidikan"],
        pendidikanDetail: json["pendidikan_detail"],
      );

  Map<String, dynamic> toJson() => {
        "kdBagian": kdBagian,
        "noreg": noreg,
        "info": info,
        "cara_masuk": caraMasuk,
        "cara_masuk_detail": caraMasukDetail,
        "asal_masuk": asalMasuk,
        "asal_masuk_detail": asalMasukDetail,
        "bb": bb,
        "tb": tb,
        "rwt_penyakit": rwtPenyakit,
        "obat_detail": obatDetail,
        "fungsional": fungsional,
        "rj1": rj1,
        "rj2": rj2,
        "kaji_rj": kajiRj,
        "kaji_rj_tindakan": kajiRjTindakan,
        "skala_nyeri": skalaNyeri,
        "frekuensi_nyeri": frekuensiNyeri,
        "lama_nyeri": lamaNyeri,
        "nyeri_menjalar": nyeriMenjalar,
        "menjalar_detail": menjalarDetail,
        "kualitas_nyeri": kualitasNyeri,
        "nyeri_pemicu": nyeriPemicu,
        "nyeri_pengurang": nyeriPengurang,
        "kehamilan": kehamilan,
        "kehamilan_gravida": kehamilanGravida,
        "kehamilan_para": kehamilanPara,
        "kehamilan_abortus": kehamilanAbortus,
        "kehamilan_hpht": kehamilanHpht,
        "kehamilan_ttp": kehamilanTtp,
        "kehamilan_leopol1": kehamilanLeopol1,
        "kehamilan_leopol2": kehamilanLeopol2,
        "kehamilan_leopol3": kehamilanLeopol3,
        "kehamilan_leopol4": kehamilanLeopol4,
        "kehamilan_djj": kehamilanDjj,
        "kehamilan_vt": kehamilanVt,
        "dekubitus1": dekubitus1,
        "dekubitus2": dekubitus2,
        "dekubitus3": dekubitus3,
        "dekubitus4": dekubitus4,
        "dekubitus_anak": dekubitusAnak,
        "pulang_kondisi": pulangKondisi,
        "pulang_transportasi": pulangTransportasi,
        "pendidikan": pendidikan,
        "pendidikan_detail": pendidikanDetail,
      };
}
