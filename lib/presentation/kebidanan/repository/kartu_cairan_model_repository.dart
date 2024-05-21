class KartuCairanRepository {
  final String cairanMasuk1;
  final String cairanMasuk2;
  final String cairanMasuk3;
  final String cairanMasukNgt;
  final String cairanKeluarNgt;
  final String drainDll;
  final String keterangan;
  KartuCairanRepository({
    required this.cairanMasuk1,
    required this.cairanMasuk2,
    required this.cairanMasuk3,
    required this.cairanMasukNgt,
    required this.cairanKeluarNgt,
    required this.drainDll,
    required this.keterangan,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cairanMasuk1': cairanMasuk1,
      'cairanMasuk2': cairanMasuk2,
      'cairanMasuk3': cairanMasuk3,
      'cairanMasukNgt': cairanMasukNgt,
      'cairanKeluarNgt': cairanKeluarNgt,
      'drainDll': drainDll,
      'keterangan': keterangan,
    };
  }

  factory KartuCairanRepository.fromMap(Map<String, dynamic> map) {
    return KartuCairanRepository(
      cairanMasuk1: map['cairan_masuk1'].toString(),
      cairanMasuk2: map['cairan_masuk2'].toString(),
      cairanMasuk3: map['cairan_masuk3'].toString(),
      cairanMasukNgt: map['cairan_masuk_ngt'].toString(),
      cairanKeluarNgt: map['cairan_keluar_ngt'].toString(),
      drainDll: map['drain_dll'].toString(),
      keterangan: map['keterangan'].toString(),
    );
  }
}
