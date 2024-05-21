class DoubleCheckRepository {
  final bool pasien;
  final bool obat;
  final bool dosis;
  final bool cara;
  final bool waktu;
  final bool informasi;
  final bool dokumentasi;
  final String keterangan;
  DoubleCheckRepository({
    required this.pasien,
    required this.obat,
    required this.dosis,
    required this.cara,
    required this.waktu,
    required this.informasi,
    required this.dokumentasi,
    required this.keterangan,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pasien': pasien,
      'obat': obat,
      'dosis': dosis,
      'cara': cara,
      'waktu': waktu,
      'informasi': informasi,
      'dokumentasi': dokumentasi,
      'keterangan': keterangan,
    };
  }

  factory DoubleCheckRepository.fromMap(Map<String, dynamic> map) {
    return DoubleCheckRepository(
      pasien: map['pasien_pemberi'] as bool,
      obat: map['obat_pemberi'] as bool,
      dosis: map['dosis_pemberi'] as bool,
      cara: map['cara_pemberi'] as bool,
      waktu: map['waktu_pemberi'] as bool,
      informasi: map['informasi_pemberi'] as bool,
      dokumentasi: map['dokumentasi_pemberi'] as bool,
      keterangan: map['keterangan'].toString(),
    );
  }

  DoubleCheckRepository copyWith({
    bool? pasien,
    bool? obat,
    bool? dosis,
    bool? cara,
    bool? waktu,
    bool? informasi,
    bool? dokumentasi,
    String? keterangan,
  }) {
    return DoubleCheckRepository(
      pasien: pasien ?? this.pasien,
      obat: obat ?? this.obat,
      dosis: dosis ?? this.dosis,
      cara: cara ?? this.cara,
      waktu: waktu ?? this.waktu,
      informasi: informasi ?? this.informasi,
      dokumentasi: dokumentasi ?? this.dokumentasi,
      keterangan: keterangan ?? this.keterangan,
    );
  }
}
