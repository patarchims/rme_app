class KartuObservasiModelRepository {
  final int idObservasi;
  final String t;
  final String n;
  final String p;
  final String s;
  final String cvp;
  final String ekg;
  final String pupilKiri;
  final String pupilKanan;
  final String redaksiKiri;
  final String redaksiKanan;
  final String anggotaBadan;
  final String kesadaran;
  final String sputumWarna;
  final String isiCup;
  final String keterangan;
  final String jam;
  KartuObservasiModelRepository({
    required this.idObservasi,
    required this.t,
    required this.n,
    required this.p,
    required this.s,
    required this.cvp,
    required this.ekg,
    required this.pupilKiri,
    required this.pupilKanan,
    required this.redaksiKiri,
    required this.redaksiKanan,
    required this.anggotaBadan,
    required this.kesadaran,
    required this.sputumWarna,
    required this.isiCup,
    required this.keterangan,
    required this.jam,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      't': t,
      'n': n,
      'p': p,
      's': s,
      'cvp': cvp,
      'ekg': ekg,
      'pupil_kiri': pupilKiri,
      'pupil_kanan': pupilKanan,
      'redaksi_kiri': redaksiKiri,
      'redaksi_kanan': redaksiKanan,
      'anggota_badan': anggotaBadan,
      'kesadaran': kesadaran,
      'sputum_warna': sputumWarna,
      'isiCup': isiCup,
      'keterangan': keterangan,
      "jam": jam
    };
  }

  factory KartuObservasiModelRepository.fromMap(Map<String, dynamic> map) {
    return KartuObservasiModelRepository(
      idObservasi: map["id_observasi"] as int,
      ekg: map["ekg"].toString(),
      jam: map["jam"].toString(),
      t: map['t'].toString(),
      n: map['n'].toString(),
      p: map['p'].toString(),
      s: map['s'].toString(),
      cvp: map['cvp'].toString(),
      pupilKiri: map['pupil_kiri'].toString(),
      pupilKanan: map['pupil_kanan'].toString(),
      redaksiKiri: map['redaksi_kiri'].toString(),
      redaksiKanan: map['redaksi_kanan'].toString(),
      anggotaBadan: map['anggota_badan'].toString(),
      kesadaran: map['kesadaran'].toString(),
      sputumWarna: map['sputum_warna'].toString(),
      isiCup: map['isi_cup'].toString(),
      keterangan: map['keterangan'].toString(),
    );
  }
}
